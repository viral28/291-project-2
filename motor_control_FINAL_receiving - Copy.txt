// F38x_I2C_Nunchuck.c: Reads the WII nunchuck using the hardware I2C port
// available in the C8051F38x and sends them using the serial port.  The best
// information so far about the nunchuck is at:
//
// http://wiibrew.org/wiki/Wiimote/Extension_Controllers
// http://wiibrew.org/wiki/Wiimote/Extension_Controllers/Nunchuck
//
// Some good information was found also here:
//
// http://forum.arduino.cc/index.php/topic,45924.0.html
//
// By:  Jesus Calvino-Fraga (c) 2010-2016
//
// The next line clears the "C51 command line options:" field when compiling with CrossIDE
//  ~C51~  

#include <C8051F38x.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#define  SYSCLK         48000000L // System clock frequency in Hz
#define  BAUDRATE       115200L
#define  SMB_FREQUENCY  100000L   // I2C SCL clock rate (10kHz to 100kHz)

#define  LED        P2_2
#define  LED_ON     0
#define  LED_OFF    1

#define OUT0 P2_0
#define OUT1 P2_1
#define OUT2 P2_2
#define OUT3 P2_3

volatile unsigned char pwm_count=0;
volatile int PWM1 = 0;
volatile int PWM2 = 0;
volatile int PWM3 = 0;
volatile int PWM4 = 0;

char _c51_external_startup (void)
{
	PCA0MD&=(~0x40) ;  // DISABLE WDT: clear Watchdog Enable bit
	VDM0CN=0x80;       // Enable VDD monitor
	RSTSRC=0x02|0x04;  // Enable reset on missing clock detector and VDD

	// CLKSEL&=0b_1111_1000; // Not needed because CLKSEL==0 after reset
	#if (SYSCLK == 12000000L)
		//CLKSEL|=0b_0000_0000;  // SYSCLK derived from the Internal High-Frequency Oscillator / 4 
	#elif (SYSCLK == 24000000L)
		CLKSEL|=0b_0000_0010; // SYSCLK derived from the Internal High-Frequency Oscillator / 2.
	#elif (SYSCLK == 48000000L)
		CLKSEL|=0b_0000_0011; // SYSCLK derived from the Internal High-Frequency Oscillator / 1.
	#else
		#error SYSCLK must be either 12000000L, 24000000L, or 48000000L
	#endif
	OSCICN |= 0x03; // Configure internal oscillator for its maximum frequency
	
	#if (SYSCLK/BAUDRATE/2L/256L < 1)
		TH1 = 0x10000-((SYSCLK/BAUDRATE)/2L);
		CKCON &= ~0x0B;                  // T1M = 1; SCA1:0 = xx
		CKCON |=  0x08;
	#elif (SYSCLK/BAUDRATE/2L/256L < 4)
		TH1 = 0x10000-(SYSCLK/BAUDRATE/2L/4L);
		CKCON &= ~0x0B; // T1M = 0; SCA1:0 = 01                  
		CKCON |=  0x01;
	#elif (SYSCLK/BAUDRATE/2L/256L < 12)
		TH1 = 0x10000-(SYSCLK/BAUDRATE/2L/12L);
		CKCON &= ~0x0B; // T1M = 0; SCA1:0 = 00
	#else
		TH1 = 0x10000-(SYSCLK/BAUDRATE/2/48);
		CKCON &= ~0x0B; // T1M = 0; SCA1:0 = 10
		CKCON |=  0x02;
	#endif
	
	TL1 = TH1;     // Init timer 1
	TMOD &= 0x0f;  // Mask out timer 1 bits
	TMOD |= 0x20;  // TMOD: timer 1 in 8-bit autoreload                     
	TR1 = 1;       // Start timer1
	SCON = 0x52;

	// Initialize Crossbar and GPIO
	P0MDOUT = 0x10;           // Enable Uart TX as push-pull output
	P2MDOUT |= 0b0000_0110;   // Make the LED (P2.2) a push-pull output.  P2.1 used for debuging.
	XBR0 = 0b0000_0101;       // Enable SMBus pins and UART pins P0.4(TX) and P0.5(RX)
	XBR1 = 0x40;              // Enable crossbar and weak pull-ups
	
	// Configure Timer 0 as the I2C clock source
	CKCON |= 0x04; // Timer0 clock source = SYSCLK
	TMOD &= 0xf0;  // Mask out timer 1 bits
	TMOD |= 0x02;  // Timer0 in 8-bit auto-reload mode
	// Timer 0 configured to overflow at 1/3 the rate defined by SMB_FREQUENCY
	TL0 = TH0 = 256-(SYSCLK/SMB_FREQUENCY/3);
	TR0 = 1; // Enable timer 0
	
	// Configure and enable SMBus
	SMB0CF = INH | EXTHOLD | SMBTOE | SMBFTE ;
	SMB0CF |= ENSMB;  // Enable SMBus

	LED = LED_OFF;
	
	// Initialize timer 2 for periodic interrupts
	TMR2CN=0x00;   // Stop Timer2; Clear TF2;
	CKCON|=0b_0001_0000;
	TMR2RL=(-(SYSCLK/(2*48))/(100L)); // Initialize reload value
	TMR2=0xffff;   // Set to reload immediately
	ET2=1;         // Enable Timer2 interrupts
	TR2=1;         // Start Timer2

	EA=1; // Enable interrupts
	
	return 0;
}

void Timer2_ISR (void) interrupt 5
{
	unsigned char temp_fix;
	
	temp_fix = SFRPAGE;
	
	SFRPAGE = 0;
	
	TF2H = 0; // Clear Timer2 interrupt flag
	
	pwm_count++;
	if(pwm_count>100) pwm_count=0;
	
	OUT0=pwm_count>PWM1?0:1;
	OUT1=pwm_count>PWM2?0:1;
	OUT2=pwm_count>PWM3?0:1;
	OUT3=pwm_count>PWM4?0:1;
	
	SFRPAGE = temp_fix;
}

// Uses Timer4 to delay <ms> mili-seconds. 
void Timer4ms(unsigned char ms)
{
	unsigned char i;// usec counter
	unsigned char k;
	
	k=SFRPAGE;
	SFRPAGE=0xf;
	// The input for Timer 4 is selected as SYSCLK by setting bit 0 of CKCON1:
	CKCON1|=0b_0000_0001;
	
	TMR4RL = 65536-(SYSCLK/1000L); // Set Timer4 to overflow in 1 ms.
	TMR4 = TMR4RL;                 // Initialize Timer4 for first overflow
	
	TMR4CN = 0x04;                 // Start Timer4 and clear overflow flag
	for (i = 0; i < ms; i++)       // Count <ms> overflows
	{
		while (!(TMR4CN & 0x80));  // Wait for overflow
		TMR4CN &= ~(0x80);         // Clear overflow indicator
	}
	TMR4CN = 0 ;                   // Stop Timer4 and clear overflow flag
	SFRPAGE=k;	
}

void UART1_Init (unsigned long baudrate)
{
	SMOD1 = 0x0C; // no parity, 8 data bits, 1 stop bit
	SCON1 = 0x10;
	if (((SYSCLK/baudrate)/2L)/0xFFFFL < 1){
		SBRL1 = 0x10000L-((SYSCLK/baudrate)/2L);
		SBCON1 |= 0x03; // set prescaler to 1
	}
	else if (((SYSCLK/baudrate)/2L)/0xFFFFL < 4){
		SBRL1 = 0x10000L-(((SYSCLK/baudrate)/2L)/4L);
		SBCON1 &= ~0x03;
		SBCON1 |= 0x01; // set prescaler to 4
	}
	else if (((SYSCLK/baudrate)/2L)/0xFFFFL < 12){
		SBRL1 = 0x10000L-(((SYSCLK/baudrate)/2L)/12L);
		SBCON1 &= ~0x03; // set prescaler to 12
	}
	else{
		SBRL1 = 0x10000L-(((SYSCLK/baudrate)/2L)/48L);
		SBCON1 &= ~0x03;
		SBCON1 |= 0x02; // set prescaler to ?
	}
	SCON1 |= 0x02; // indicate ready for TX
	SBCON1 |= 0x40; // enable baud rate generator
	
	XBR2=0x01; // Enable UART1 on P0.0(TX1) and P0.1(RX1)
	XBR1=0x40; // Enable crossbar and weak pull-ups
}

void putchar1 (char c)
{
	if (c == '\n' )
	{
		while (!(SCON1 & 0x02));
		SCON1 &= ~0x02;
		SBUF1 = '\r' ;
	}
	while (!(SCON1 & 0x02));
	SCON1 &= ~0x02;
	SBUF1 = c;
}

char getchar1 (void)
{
	char c;
	printf("12  ");
	while (!(SCON1 & 0x01));
	printf("13  ");
	SCON1 &= ~0x01;
	c = SBUF1;
	return (c);
}

void main (void)
{
	char direction;
	UART1_Init(BAUDRATE);
	
	while(1)
	{
		direction = getchar1();
		SCON1 |= 0x01;
		printf("Received: %c\n",direction);

		
		 if(direction=='u'){
			PWM2 = 100;
			PWM4 = 100;
			PWM1 = 0;
			PWM3 = 0;
		}
		else if(direction=='d'){
			PWM1 = 100;
			PWM3 = 100;
			PWM2 = 0;
			PWM4 = 0;
		}
		
		else if (direction=='r'){
			PWM1 = 100;
			PWM4 = 100;
			PWM2 = 0;
			PWM3 = 0;
			
		}
		else if(direction=='l'){
			PWM2 = 100;
			PWM3 = 100;
			PWM1 = 0;
			PWM4 = 0;
		}	
		else {
			PWM2 = 0;
			PWM3 = 0;
			PWM1 = 0;
			PWM4 = 0;
		}
		//gyroscope
		// if (acc_z>=493){
			// PWM1 = (int)((acc_z-493)*100/(493-285));
			// PWM2 = 0;
		// }else{
			// PWM2 = (int)(100-((acc_z-285)*100/((493-285))));
			// PWM1 = 0;
		// }
		
		printf("%d %d %d %d\r", PWM1, PWM2, PWM3, PWM4);
		
		Timer4ms(100);

   }
}