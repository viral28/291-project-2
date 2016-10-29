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
	
	return 0;
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

void I2C_write (unsigned char output_data)
{
	SMB0DAT = output_data; // Put data into buffer
	SI0 = 0;
	while (!SI0); // Wait until done with send
}

unsigned char I2C_read (void)
{
	unsigned char input_data;

	SI0 = 0;
	while (!SI0); // Wait until we have data to read
	input_data = SMB0DAT; // Read the data

	return input_data;
}
 
void I2C_start (void)
{
	ACK0 = 1;
	STA0 = 1;     // Send I2C start
	STO0 = 0;
	SI0 = 0;
	while (!SI0); // Wait until start sent
	STA0 = 0;     // Reset I2C start
}

void I2C_stop(void)
{
	STO0 = 1;  	// Perform I2C stop
	SI0 = 0;	// Clear SI
	//while (!SI0);	   // Wait until stop complete (Doesn't work???)
}

void nunchuck_init(bit print_extension_type)
{
	unsigned char i, buf[6];
	
	// Older initialization format that works only for older nunchucks
	//I2C_start();
	//I2C_write(0xA4);
	//I2C_write(0x40);
	//I2C_write(0x00);
	//I2C_stop();
	
	// Newer initialization format that works for all nunchucks
	I2C_start();
	I2C_write(0xA4);
	I2C_write(0xF0);
	I2C_write(0x55);
	I2C_stop();
	Timer4ms(1);
	 
	I2C_start();
	I2C_write(0xA4);
	I2C_write(0xFB);
	I2C_write(0x00);
	I2C_stop();
	Timer4ms(1);

	// Read the extension type from the register block.  For the original Nunchuk it should be
	// 00 00 a4 20 00 00.
	I2C_start();
	I2C_write(0xA4);
	I2C_write(0xFA); // extension type register
	I2C_stop();
	Timer4ms(3); // 3 ms required to complete acquisition

	I2C_start();
	I2C_write(0xA5);
	
	// Receive values
	for(i=0; i<6; i++)
	{
		buf[i]=I2C_read();
	}
	ACK0=0;
	I2C_stop();
	Timer4ms(3);
	
	if(print_extension_type)
	{
		printf("Extension type: %02x  %02x  %02x  %02x  %02x  %02x\n", 
			buf[0],  buf[1], buf[2], buf[3], buf[4], buf[5]);
	}

	// Send the crypto key (zeros), in 3 blocks of 6, 6 & 4.

	I2C_start();
	I2C_write(0xA4);
	I2C_write(0xF0);
	I2C_write(0xAA);
	I2C_stop();
	Timer4ms(1);

	I2C_start();
	I2C_write(0xA4);
	I2C_write(0x40);
	I2C_write(0x00);
	I2C_write(0x00);
	I2C_write(0x00);
	I2C_write(0x00);
	I2C_write(0x00);
	I2C_write(0x00);
	I2C_stop();
	Timer4ms(1);

	I2C_start();
	I2C_write(0xA4);
	I2C_write(0x40);
	I2C_write(0x00);
	I2C_write(0x00);
	I2C_write(0x00);
	I2C_write(0x00);
	I2C_write(0x00);
	I2C_write(0x00);
	I2C_stop();
	Timer4ms(1);

	I2C_start();
	I2C_write(0xA4);
	I2C_write(0x40);
	I2C_write(0x00);
	I2C_write(0x00);
	I2C_write(0x00);
	I2C_write(0x00);
	I2C_stop();
	Timer4ms(1);
	
}

void nunchuck_getdata(unsigned char * s)
{
	unsigned char i;

	// Start measurement
	I2C_start();
	I2C_write(0xA4);
	I2C_write(0x00);
	I2C_stop();
	Timer4ms(3); 	// 3 ms required to complete acquisition

	// Request values
	I2C_start();
	I2C_write(0xA5);
	
	// Receive values
	for(i=0; i<6; i++)
	{
		s[i]=(I2C_read()^0x17)+0x17; // Read and decrypt
	}
	ACK0=0;
	I2C_stop();
}

void UART1_Init (unsigned long baudrate)
{
	SMOD1 = 0x0C; // no parity, 8 data bits, 1 stop bit
	SCON1 = 0x20;
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
	printf("1\r");
	if (c == '\n' )
	{	
		while (!(SCON1 & 0x02));
		SCON1 &= ~0x02;
		SBUF1 = '\r' ;
	}
	printf("2\r");
	while (!(SCON1 & 0x02));
	SCON1 &= ~0x02;
	SBUF1 = c;
	printf("3\r");
}

char getchar1 (void)
{
	char c;
	while (!(SCON1 & 0x01));
	SCON1 &= ~0x01;
	c = SBUF1;
	return (c);
}

void main (void)
{
	unsigned char rbuf[6];
 	int joy_x, joy_y, off_x, off_y, acc_x, acc_y, acc_z;
 	bit but1, but2;
 	char direction = 's';
	
	UART1_Init(BAUDRATE);
   
	Timer4ms(200);
	nunchuck_init(1);
	Timer4ms(100);

	nunchuck_getdata(rbuf);

	off_x=(int)rbuf[0]-128;
	off_y=(int)rbuf[1]-128;
	printf("Offset_X:%4d Offset_Y:%4d\n\n", off_x, off_y);

	while(1)
	{
		nunchuck_getdata(rbuf);

		joy_x=(int)rbuf[0]-128-off_x;
		joy_y=(int)rbuf[1]-128-off_y;
		acc_x=rbuf[2]*4; 
		acc_y=rbuf[3]*4;
		acc_z=rbuf[4]*4;

		but1=(rbuf[5] & 0x01)?1:0;
		but2=(rbuf[5] & 0x02)?1:0;
		if (rbuf[5] & 0x04) acc_x+=2;
		if (rbuf[5] & 0x08) acc_x+=1;
		if (rbuf[5] & 0x10) acc_y+=2;
		if (rbuf[5] & 0x20) acc_y+=1;
		if (rbuf[5] & 0x40) acc_z+=2;
		if (rbuf[5] & 0x80) acc_z+=1;
		
		printf("Buttons(Z:%c, C:%c) Joystick(%4d, %4d) Accelerometer(%3d, %3d, %3d)\x1b[0J\r",
			   but1?'1':'0', but2?'1':'0', joy_x, joy_y, acc_x, acc_y, acc_z);
		
		//joystick old code
		// if (joy_x>=0){
			// PWM1 = (int)(joy_x*100/127);
			// PWM2 = 0;
		// }else{
			// PWM2 = (int)(-joy_x*100/127);
			// PWM1 = 0;
		// }
		
		//joystick new code
		
		/*****PWM3,4 = RIGHT*****/
		/*****PWM1,2 = LEFT******/
		
		// if (joy_y>=0){ //forwards
			// if (joy_x>0){ //right
				// PWM1 = (int)((joy_y*100/127)*(1/100)*(100-(joy_x*100/127)));
				// PWM3 = (int)(joy_y*100/127);
				// PWM3 = (int)(sqrtf(joy_y*joy_y +joy_x*joy_x)*100.0/179.0);// not devide my 179 but by magnitude maybe
				// PWM1= (int)((1-joy_x/127.0)*100.0);
				// PWM1 = (int)((joy_x+joy_y)*100/127);
				// PWM3 = (int)((joy_y-joy_x)*100/127);
				
			// }else if (joy_x<0){ //left
				//PWM1 = (int)(joy_y*100/127);
				//PWM3 = (int)((joy_y*100/127)*(1/100)*(100+(joy_x*100/127)));
			// PWM1 = (int)((joy_x-joy_y)*100/127);
			// PWM3 = (int)((joy_x+joy_y)*100/127);
			// }else{ //straight
				// PWM1 = (int)(joy_y*100/127);
				// PWM3 = (int)(joy_y*100/127);
				
			// }
			// PWM2 = 0;
			// PWM4 = 0;
		// }
		// else{ //backwards
			// if (joy_x>0){ //right
				// PWM2 = (int)(-joy_y*100/127)-(int)(joy_x*100/127);
				// PWM4 = (int)(-joy_y*100/127);
			// }else if (joy_x<0){ //left
				// PWM2 = (int)(-joy_y*100/127);
				// PWM4 = (int)(-joy_y*100/127)+(int)(joy_x*100/127);
			// }else{ //straight
				// PWM2 = (int)(-joy_y*100/127);
				// PWM4 = (int)(-joy_y*100/127);
			// }
			// PWM1 = 0;
			// PWM3 = 0;
		// }
		
		if(joy_y==127){
			direction = 'u';
		}
		else if(joy_y==-128){
			direction = 'd';
		}
		
		else if (joy_x==128){
			direction = 'r';
		}
		else if(joy_x==-127){
			direction = 'l';
		}
		else{
			direction = 's';
		}		
		printf(" %c\r",direction); 
		//gyroscope
		// if (acc_z>=493){
			// PWM1 = (int)((acc_z-493)*100/(493-285));
			// PWM2 = 0;
		// }else{
			// PWM2 = (int)(100-((acc_z-285)*100/((493-285))));
			// PWM1 = 0;
		// }
		
		SCON1 |= 0x02;
		putchar1(direction);
		
		Timer4ms(100);

   }
}