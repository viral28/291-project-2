;--------------------------------------------------------
; File Created by C51
; Version 1.0.0 #1069 (Apr 23 2015) (MSVC)
; This file was generated Thu Mar 24 17:59:53 2016
;--------------------------------------------------------
$name test_sending
$optc51 --model-small
	R_DSEG    segment data
	R_CSEG    segment code
	R_BSEG    segment bit
	R_XSEG    segment xdata
	R_PSEG    segment xdata
	R_ISEG    segment idata
	R_OSEG    segment data overlay
	BIT_BANK  segment data overlay
	R_HOME    segment code
	R_GSINIT  segment code
	R_IXSEG   segment xdata
	R_CONST   segment code
	R_XINIT   segment code
	R_DINIT   segment code

;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	public _main
	public _nunchuck_getdata
	public _nunchuck_init
	public _getchar1
	public _putchar1
	public _UART1_Init
	public _I2C_stop
	public _I2C_start
	public _I2C_read
	public _I2C_write
	public _Timer4ms
	public _Timer2_ISR
	public __c51_external_startup
	public _nunchuck_init_PARM_1
	public _PWM4
	public _PWM3
	public _PWM2
	public _PWM1
	public _pwm_count
;--------------------------------------------------------
; Special Function Registers
;--------------------------------------------------------
_P0             DATA 0x80
_SP             DATA 0x81
_DPL            DATA 0x82
_DPH            DATA 0x83
_EMI0TC         DATA 0x84
_EMI0CF         DATA 0x85
_OSCLCN         DATA 0x86
_PCON           DATA 0x87
_TCON           DATA 0x88
_TMOD           DATA 0x89
_TL0            DATA 0x8a
_TL1            DATA 0x8b
_TH0            DATA 0x8c
_TH1            DATA 0x8d
_CKCON          DATA 0x8e
_PSCTL          DATA 0x8f
_P1             DATA 0x90
_TMR3CN         DATA 0x91
_TMR4CN         DATA 0x91
_TMR3RLL        DATA 0x92
_TMR4RLL        DATA 0x92
_TMR3RLH        DATA 0x93
_TMR4RLH        DATA 0x93
_TMR3L          DATA 0x94
_TMR4L          DATA 0x94
_TMR3H          DATA 0x95
_TMR4H          DATA 0x95
_USB0ADR        DATA 0x96
_USB0DAT        DATA 0x97
_SCON           DATA 0x98
_SCON0          DATA 0x98
_SBUF           DATA 0x99
_SBUF0          DATA 0x99
_CPT1CN         DATA 0x9a
_CPT0CN         DATA 0x9b
_CPT1MD         DATA 0x9c
_CPT0MD         DATA 0x9d
_CPT1MX         DATA 0x9e
_CPT0MX         DATA 0x9f
_P2             DATA 0xa0
_SPI0CFG        DATA 0xa1
_SPI0CKR        DATA 0xa2
_SPI0DAT        DATA 0xa3
_P0MDOUT        DATA 0xa4
_P1MDOUT        DATA 0xa5
_P2MDOUT        DATA 0xa6
_P3MDOUT        DATA 0xa7
_IE             DATA 0xa8
_CLKSEL         DATA 0xa9
_EMI0CN         DATA 0xaa
__XPAGE         DATA 0xaa
_SBCON1         DATA 0xac
_P4MDOUT        DATA 0xae
_PFE0CN         DATA 0xaf
_P3             DATA 0xb0
_OSCXCN         DATA 0xb1
_OSCICN         DATA 0xb2
_OSCICL         DATA 0xb3
_SBRLL1         DATA 0xb4
_SBRLH1         DATA 0xb5
_FLSCL          DATA 0xb6
_FLKEY          DATA 0xb7
_IP             DATA 0xb8
_CLKMUL         DATA 0xb9
_SMBTC          DATA 0xb9
_AMX0N          DATA 0xba
_AMX0P          DATA 0xbb
_ADC0CF         DATA 0xbc
_ADC0L          DATA 0xbd
_ADC0H          DATA 0xbe
_SFRPAGE        DATA 0xbf
_SMB0CN         DATA 0xc0
_SMB1CN         DATA 0xc0
_SMB0CF         DATA 0xc1
_SMB1CF         DATA 0xc1
_SMB0DAT        DATA 0xc2
_SMB1DAT        DATA 0xc2
_ADC0GTL        DATA 0xc3
_ADC0GTH        DATA 0xc4
_ADC0LTL        DATA 0xc5
_ADC0LTH        DATA 0xc6
_P4             DATA 0xc7
_TMR2CN         DATA 0xc8
_TMR5CN         DATA 0xc8
_REG01CN        DATA 0xc9
_TMR2RLL        DATA 0xca
_TMR5RLL        DATA 0xca
_TMR2RLH        DATA 0xcb
_TMR5RLH        DATA 0xcb
_TMR2L          DATA 0xcc
_TMR5L          DATA 0xcc
_TMR2H          DATA 0xcd
_TMR5H          DATA 0xcd
_SMB0ADM        DATA 0xce
_SMB1ADM        DATA 0xce
_SMB0ADR        DATA 0xcf
_SMB1ADR        DATA 0xcf
_PSW            DATA 0xd0
_REF0CN         DATA 0xd1
_SCON1          DATA 0xd2
_SBUF1          DATA 0xd3
_P0SKIP         DATA 0xd4
_P1SKIP         DATA 0xd5
_P2SKIP         DATA 0xd6
_USB0XCN        DATA 0xd7
_PCA0CN         DATA 0xd8
_PCA0MD         DATA 0xd9
_PCA0CPM0       DATA 0xda
_PCA0CPM1       DATA 0xdb
_PCA0CPM2       DATA 0xdc
_PCA0CPM3       DATA 0xdd
_PCA0CPM4       DATA 0xde
_P3SKIP         DATA 0xdf
_ACC            DATA 0xe0
_XBR0           DATA 0xe1
_XBR1           DATA 0xe2
_XBR2           DATA 0xe3
_IT01CF         DATA 0xe4
_CKCON1         DATA 0xe4
_SMOD1          DATA 0xe5
_EIE1           DATA 0xe6
_EIE2           DATA 0xe7
_ADC0CN         DATA 0xe8
_PCA0CPL1       DATA 0xe9
_PCA0CPH1       DATA 0xea
_PCA0CPL2       DATA 0xeb
_PCA0CPH2       DATA 0xec
_PCA0CPL3       DATA 0xed
_PCA0CPH3       DATA 0xee
_RSTSRC         DATA 0xef
_B              DATA 0xf0
_P0MDIN         DATA 0xf1
_P1MDIN         DATA 0xf2
_P2MDIN         DATA 0xf3
_P3MDIN         DATA 0xf4
_P4MDIN         DATA 0xf5
_EIP1           DATA 0xf6
_EIP2           DATA 0xf7
_SPI0CN         DATA 0xf8
_PCA0L          DATA 0xf9
_PCA0H          DATA 0xfa
_PCA0CPL0       DATA 0xfb
_PCA0CPH0       DATA 0xfc
_PCA0CPL4       DATA 0xfd
_PCA0CPH4       DATA 0xfe
_VDM0CN         DATA 0xff
_DPTR           DATA 0x8382
_TMR2RL         DATA 0xcbca
_TMR3RL         DATA 0x9392
_TMR4RL         DATA 0x9392
_TMR5RL         DATA 0xcbca
_TMR2           DATA 0xcdcc
_TMR3           DATA 0x9594
_TMR4           DATA 0x9594
_TMR5           DATA 0xcdcc
_SBRL1          DATA 0xb5b4
_ADC0           DATA 0xbebd
_ADC0GT         DATA 0xc4c3
_ADC0LT         DATA 0xc6c5
_PCA0           DATA 0xfaf9
_PCA0CP1        DATA 0xeae9
_PCA0CP2        DATA 0xeceb
_PCA0CP3        DATA 0xeeed
_PCA0CP0        DATA 0xfcfb
_PCA0CP4        DATA 0xfefd
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
_P0_0           BIT 0x80
_P0_1           BIT 0x81
_P0_2           BIT 0x82
_P0_3           BIT 0x83
_P0_4           BIT 0x84
_P0_5           BIT 0x85
_P0_6           BIT 0x86
_P0_7           BIT 0x87
_TF1            BIT 0x8f
_TR1            BIT 0x8e
_TF0            BIT 0x8d
_TR0            BIT 0x8c
_IE1            BIT 0x8b
_IT1            BIT 0x8a
_IE0            BIT 0x89
_IT0            BIT 0x88
_P1_0           BIT 0x90
_P1_1           BIT 0x91
_P1_2           BIT 0x92
_P1_3           BIT 0x93
_P1_4           BIT 0x94
_P1_5           BIT 0x95
_P1_6           BIT 0x96
_P1_7           BIT 0x97
_S0MODE         BIT 0x9f
_SCON0_6        BIT 0x9e
_MCE0           BIT 0x9d
_REN0           BIT 0x9c
_TB80           BIT 0x9b
_RB80           BIT 0x9a
_TI0            BIT 0x99
_RI0            BIT 0x98
_SCON_6         BIT 0x9e
_MCE            BIT 0x9d
_REN            BIT 0x9c
_TB8            BIT 0x9b
_RB8            BIT 0x9a
_TI             BIT 0x99
_RI             BIT 0x98
_P2_0           BIT 0xa0
_P2_1           BIT 0xa1
_P2_2           BIT 0xa2
_P2_3           BIT 0xa3
_P2_4           BIT 0xa4
_P2_5           BIT 0xa5
_P2_6           BIT 0xa6
_P2_7           BIT 0xa7
_EA             BIT 0xaf
_ESPI0          BIT 0xae
_ET2            BIT 0xad
_ES0            BIT 0xac
_ET1            BIT 0xab
_EX1            BIT 0xaa
_ET0            BIT 0xa9
_EX0            BIT 0xa8
_P3_0           BIT 0xb0
_P3_1           BIT 0xb1
_P3_2           BIT 0xb2
_P3_3           BIT 0xb3
_P3_4           BIT 0xb4
_P3_5           BIT 0xb5
_P3_6           BIT 0xb6
_P3_7           BIT 0xb7
_IP_7           BIT 0xbf
_PSPI0          BIT 0xbe
_PT2            BIT 0xbd
_PS0            BIT 0xbc
_PT1            BIT 0xbb
_PX1            BIT 0xba
_PT0            BIT 0xb9
_PX0            BIT 0xb8
_MASTER0        BIT 0xc7
_TXMODE0        BIT 0xc6
_STA0           BIT 0xc5
_STO0           BIT 0xc4
_ACKRQ0         BIT 0xc3
_ARBLOST0       BIT 0xc2
_ACK0           BIT 0xc1
_SI0            BIT 0xc0
_MASTER1        BIT 0xc7
_TXMODE1        BIT 0xc6
_STA1           BIT 0xc5
_STO1           BIT 0xc4
_ACKRQ1         BIT 0xc3
_ARBLOST1       BIT 0xc2
_ACK1           BIT 0xc1
_SI1            BIT 0xc0
_TF2            BIT 0xcf
_TF2H           BIT 0xcf
_TF2L           BIT 0xce
_TF2LEN         BIT 0xcd
_TF2CEN         BIT 0xcc
_T2SPLIT        BIT 0xcb
_TR2            BIT 0xca
_T2CSS          BIT 0xc9
_T2XCLK         BIT 0xc8
_TF5H           BIT 0xcf
_TF5L           BIT 0xce
_TF5LEN         BIT 0xcd
_TMR5CN_4       BIT 0xcc
_T5SPLIT        BIT 0xcb
_TR5            BIT 0xca
_TMR5CN_1       BIT 0xc9
_T5XCLK         BIT 0xc8
_CY             BIT 0xd7
_AC             BIT 0xd6
_F0             BIT 0xd5
_RS1            BIT 0xd4
_RS0            BIT 0xd3
_OV             BIT 0xd2
_F1             BIT 0xd1
_PARITY         BIT 0xd0
_CF             BIT 0xdf
_CR             BIT 0xde
_PCA0CN_5       BIT 0xde
_CCF4           BIT 0xdc
_CCF3           BIT 0xdb
_CCF2           BIT 0xda
_CCF1           BIT 0xd9
_CCF0           BIT 0xd8
_ACC_7          BIT 0xe7
_ACC_6          BIT 0xe6
_ACC_5          BIT 0xe5
_ACC_4          BIT 0xe4
_ACC_3          BIT 0xe3
_ACC_2          BIT 0xe2
_ACC_1          BIT 0xe1
_ACC_0          BIT 0xe0
_AD0EN          BIT 0xef
_AD0TM          BIT 0xee
_AD0INT         BIT 0xed
_AD0BUSY        BIT 0xec
_AD0WINT        BIT 0xeb
_AD0CM2         BIT 0xea
_AD0CM1         BIT 0xe9
_AD0CM0         BIT 0xe8
_B_7            BIT 0xf7
_B_6            BIT 0xf6
_B_5            BIT 0xf5
_B_4            BIT 0xf4
_B_3            BIT 0xf3
_B_2            BIT 0xf2
_B_1            BIT 0xf1
_B_0            BIT 0xf0
_SPIF           BIT 0xff
_WCOL           BIT 0xfe
_MODF           BIT 0xfd
_RXOVRN         BIT 0xfc
_NSSMD1         BIT 0xfb
_NSSMD0         BIT 0xfa
_TXBMT          BIT 0xf9
_SPIEN          BIT 0xf8
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	rbank0 segment data overlay
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	rseg R_DSEG
_pwm_count:
	ds 1
_PWM1:
	ds 2
_PWM2:
	ds 2
_PWM3:
	ds 2
_PWM4:
	ds 2
_UART1_Init_sloc0_1_0:
	ds 4
_nunchuck_init_buf_1_91:
	ds 6
_nunchuck_init_sloc0_1_0:
	ds 2
_nunchuck_init_sloc1_1_0:
	ds 2
_nunchuck_init_sloc2_1_0:
	ds 2
_main_rbuf_1_98:
	ds 6
_main_joy_x_1_98:
	ds 2
_main_joy_y_1_98:
	ds 2
_main_off_x_1_98:
	ds 2
_main_off_y_1_98:
	ds 2
_main_acc_y_1_98:
	ds 2
_main_acc_z_1_98:
	ds 2
_main_sloc0_1_0:
	ds 1
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	rseg	R_OSEG
	rseg	R_OSEG
	rseg	R_OSEG
	rseg	R_OSEG
	rseg	R_OSEG
;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	rseg R_ISEG
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	DSEG
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	rseg R_BSEG
_nunchuck_init_PARM_1:
	DBIT	1
_main_but1_1_98:
	DBIT	1
_main_but2_1_98:
	DBIT	1
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	rseg R_PSEG
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	rseg R_XSEG
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	XSEG
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	rseg R_IXSEG
	rseg R_HOME
	rseg R_GSINIT
	rseg R_CSEG
;--------------------------------------------------------
; Reset entry point and interrupt vectors
;--------------------------------------------------------
	CSEG at 0x0000
	ljmp	_crt0
	CSEG at 0x002b
	ljmp	_Timer2_ISR
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	rseg R_HOME
	rseg R_GSINIT
	rseg R_GSINIT
;--------------------------------------------------------
; data variables initialization
;--------------------------------------------------------
	rseg R_DINIT
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:34: volatile unsigned char pwm_count=0;
	mov	_pwm_count,#0x00
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:35: volatile int PWM1 = 0;
	clr	a
	mov	_PWM1,a
	mov	(_PWM1 + 1),a
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:36: volatile int PWM2 = 0;
	clr	a
	mov	_PWM2,a
	mov	(_PWM2 + 1),a
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:37: volatile int PWM3 = 0;
	clr	a
	mov	_PWM3,a
	mov	(_PWM3 + 1),a
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:38: volatile int PWM4 = 0;
	clr	a
	mov	_PWM4,a
	mov	(_PWM4 + 1),a
	; The linker places a 'ret' at the end of segment R_DINIT.
;--------------------------------------------------------
; code
;--------------------------------------------------------
	rseg R_CSEG
;------------------------------------------------------------
;Allocation info for local variables in function '_c51_external_startup'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:40: char _c51_external_startup (void)
;	-----------------------------------------
;	 function _c51_external_startup
;	-----------------------------------------
__c51_external_startup:
	using	0
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:42: PCA0MD&=(~0x40) ;  // DISABLE WDT: clear Watchdog Enable bit
	anl	_PCA0MD,#0xBF
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:43: VDM0CN=0x80;       // Enable VDD monitor
	mov	_VDM0CN,#0x80
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:44: RSTSRC=0x02|0x04;  // Enable reset on missing clock detector and VDD
	mov	_RSTSRC,#0x06
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:52: CLKSEL|=0b_0000_0011; // SYSCLK derived from the Internal High-Frequency Oscillator / 1.
	orl	_CLKSEL,#0x03
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:56: OSCICN |= 0x03; // Configure internal oscillator for its maximum frequency
	orl	_OSCICN,#0x03
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:59: TH1 = 0x10000-((SYSCLK/BAUDRATE)/2L);
	mov	_TH1,#0x30
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:60: CKCON &= ~0x0B;                  // T1M = 1; SCA1:0 = xx
	anl	_CKCON,#0xF4
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:61: CKCON |=  0x08;
	orl	_CKCON,#0x08
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:75: TL1 = TH1;     // Init timer 1
	mov	_TL1,_TH1
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:76: TMOD &= 0x0f;  // Mask out timer 1 bits
	anl	_TMOD,#0x0F
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:77: TMOD |= 0x20;  // TMOD: timer 1 in 8-bit autoreload                     
	orl	_TMOD,#0x20
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:78: TR1 = 1;       // Start timer1
	setb	_TR1
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:79: SCON = 0x52;
	mov	_SCON,#0x52
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:82: P0MDOUT = 0x10;           // Enable Uart TX as push-pull output
	mov	_P0MDOUT,#0x10
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:83: P2MDOUT |= 0b0000_0110;   // Make the LED (P2.2) a push-pull output.  P2.1 used for debuging.
	orl	_P2MDOUT,#0x06
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:84: XBR0 = 0b0000_0101;       // Enable SMBus pins and UART pins P0.4(TX) and P0.5(RX)
	mov	_XBR0,#0x05
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:85: XBR1 = 0x40;              // Enable crossbar and weak pull-ups
	mov	_XBR1,#0x40
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:88: CKCON |= 0x04; // Timer0 clock source = SYSCLK
	orl	_CKCON,#0x04
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:89: TMOD &= 0xf0;  // Mask out timer 1 bits
	anl	_TMOD,#0xF0
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:90: TMOD |= 0x02;  // Timer0 in 8-bit auto-reload mode
	orl	_TMOD,#0x02
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:92: TL0 = TH0 = 256-(SYSCLK/SMB_FREQUENCY/3);
	mov	_TH0,#0x60
	mov	_TL0,#0x60
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:93: TR0 = 1; // Enable timer 0
	setb	_TR0
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:96: SMB0CF = INH | EXTHOLD | SMBTOE | SMBFTE ;
	mov	_SMB0CF,#0x5C
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:97: SMB0CF |= ENSMB;  // Enable SMBus
	orl	_SMB0CF,#0x80
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:99: LED = LED_OFF;
	setb	_P2_2
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:102: TMR2CN=0x00;   // Stop Timer2; Clear TF2;
	mov	_TMR2CN,#0x00
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:103: CKCON|=0b_0001_0000;
	orl	_CKCON,#0x10
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:104: TMR2RL=(-(SYSCLK/(2*48))/(100L)); // Initialize reload value
	mov	_TMR2RL,#0x78
	mov	(_TMR2RL >> 8),#0xEC
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:105: TMR2=0xffff;   // Set to reload immediately
	mov	_TMR2,#0xFF
	mov	(_TMR2 >> 8),#0xFF
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:106: ET2=1;         // Enable Timer2 interrupts
	setb	_ET2
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:107: TR2=1;         // Start Timer2
	setb	_TR2
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:109: EA=1; // Enable interrupts
	setb	_EA
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:111: return 0;
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Timer2_ISR'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:114: void Timer2_ISR (void) interrupt 5
;	-----------------------------------------
;	 function Timer2_ISR
;	-----------------------------------------
_Timer2_ISR:
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:133: }
	reti
;	eliminated unneeded push/pop psw
;	eliminated unneeded push/pop dpl
;	eliminated unneeded push/pop dph
;	eliminated unneeded push/pop b
;	eliminated unneeded push/pop acc
;------------------------------------------------------------
;Allocation info for local variables in function 'Timer4ms'
;------------------------------------------------------------
;ms                        Allocated to registers r2 
;i                         Allocated to registers r4 
;k                         Allocated to registers r3 
;------------------------------------------------------------
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:136: void Timer4ms(unsigned char ms)
;	-----------------------------------------
;	 function Timer4ms
;	-----------------------------------------
_Timer4ms:
	mov	r2,dpl
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:141: k=SFRPAGE;
	mov	r3,_SFRPAGE
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:142: SFRPAGE=0xf;
	mov	_SFRPAGE,#0x0F
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:144: CKCON1|=0b_0000_0001;
	orl	_CKCON1,#0x01
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:146: TMR4RL = 65536-(SYSCLK/1000L); // Set Timer4 to overflow in 1 ms.
	mov	_TMR4RL,#0x80
	mov	(_TMR4RL >> 8),#0x44
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:147: TMR4 = TMR4RL;                 // Initialize Timer4 for first overflow
	mov	_TMR4,_TMR4RL
	mov	(_TMR4 >> 8),(_TMR4RL >> 8)
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:149: TMR4CN = 0x04;                 // Start Timer4 and clear overflow flag
	mov	_TMR4CN,#0x04
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:150: for (i = 0; i < ms; i++)       // Count <ms> overflows
	mov	r4,#0x00
L004004?:
	clr	c
	mov	a,r4
	subb	a,r2
	jnc	L004007?
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:152: while (!(TMR4CN & 0x80));  // Wait for overflow
L004001?:
	mov	a,_TMR4CN
	jnb	acc.7,L004001?
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:153: TMR4CN &= ~(0x80);         // Clear overflow indicator
	anl	_TMR4CN,#0x7F
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:150: for (i = 0; i < ms; i++)       // Count <ms> overflows
	inc	r4
	sjmp	L004004?
L004007?:
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:155: TMR4CN = 0 ;                   // Stop Timer4 and clear overflow flag
	mov	_TMR4CN,#0x00
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:156: SFRPAGE=k;	
	mov	_SFRPAGE,r3
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'I2C_write'
;------------------------------------------------------------
;output_data               Allocated to registers 
;------------------------------------------------------------
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:159: void I2C_write (unsigned char output_data)
;	-----------------------------------------
;	 function I2C_write
;	-----------------------------------------
_I2C_write:
	mov	_SMB0DAT,dpl
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:162: SI0 = 0;
	clr	_SI0
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:163: while (!SI0); // Wait until done with send
L005001?:
	jnb	_SI0,L005001?
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'I2C_read'
;------------------------------------------------------------
;input_data                Allocated to registers 
;------------------------------------------------------------
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:166: unsigned char I2C_read (void)
;	-----------------------------------------
;	 function I2C_read
;	-----------------------------------------
_I2C_read:
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:170: SI0 = 0;
	clr	_SI0
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:171: while (!SI0); // Wait until we have data to read
L006001?:
	jnb	_SI0,L006001?
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:172: input_data = SMB0DAT; // Read the data
	mov	dpl,_SMB0DAT
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:174: return input_data;
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'I2C_start'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:177: void I2C_start (void)
;	-----------------------------------------
;	 function I2C_start
;	-----------------------------------------
_I2C_start:
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:179: ACK0 = 1;
	setb	_ACK0
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:180: STA0 = 1;     // Send I2C start
	setb	_STA0
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:181: STO0 = 0;
	clr	_STO0
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:182: SI0 = 0;
	clr	_SI0
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:183: while (!SI0); // Wait until start sent
L007001?:
	jnb	_SI0,L007001?
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:184: STA0 = 0;     // Reset I2C start
	clr	_STA0
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'I2C_stop'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:187: void I2C_stop(void)
;	-----------------------------------------
;	 function I2C_stop
;	-----------------------------------------
_I2C_stop:
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:189: STO0 = 1;  	// Perform I2C stop
	setb	_STO0
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:190: SI0 = 0;	// Clear SI
	clr	_SI0
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'UART1_Init'
;------------------------------------------------------------
;baudrate                  Allocated to registers r2 r3 r4 r5 
;sloc0                     Allocated with name '_UART1_Init_sloc0_1_0'
;------------------------------------------------------------
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:194: void UART1_Init (unsigned long baudrate)
;	-----------------------------------------
;	 function UART1_Init
;	-----------------------------------------
_UART1_Init:
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:196: SMOD1 = 0x0C; // no parity, 8 data bits, 1 stop bit
	mov	_SMOD1,#0x0C
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:197: SCON1 = 0x10;
	mov	_SCON1,#0x10
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:198: if (((SYSCLK/baudrate)/2L)/0xFFFFL < 1){
	mov	__divulong_PARM_2,r2
	mov	(__divulong_PARM_2 + 1),r3
	mov	(__divulong_PARM_2 + 2),r4
	mov	(__divulong_PARM_2 + 3),r5
	mov	dptr,#0x6C00
	mov	b,#0xDC
	mov	a,#0x02
	lcall	__divulong
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	clr	c
	rrc	a
	mov	(_UART1_Init_sloc0_1_0 + 3),a
	mov	a,r4
	rrc	a
	mov	(_UART1_Init_sloc0_1_0 + 2),a
	mov	a,r3
	rrc	a
	mov	(_UART1_Init_sloc0_1_0 + 1),a
	mov	a,r2
	rrc	a
	mov	_UART1_Init_sloc0_1_0,a
	mov	__divulong_PARM_2,#0xFF
	mov	(__divulong_PARM_2 + 1),#0xFF
	mov	(__divulong_PARM_2 + 2),#0x00
	mov	(__divulong_PARM_2 + 3),#0x00
	mov	dpl,_UART1_Init_sloc0_1_0
	mov	dph,(_UART1_Init_sloc0_1_0 + 1)
	mov	b,(_UART1_Init_sloc0_1_0 + 2)
	mov	a,(_UART1_Init_sloc0_1_0 + 3)
	lcall	__divulong
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	clr	c
	mov	a,r6
	subb	a,#0x01
	mov	a,r7
	subb	a,#0x00
	mov	a,r0
	subb	a,#0x00
	mov	a,r1
	subb	a,#0x00
	jnc	L009008?
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:199: SBRL1 = 0x10000L-((SYSCLK/baudrate)/2L);
	clr	a
	clr	c
	subb	a,_UART1_Init_sloc0_1_0
	mov	r2,a
	clr	a
	subb	a,(_UART1_Init_sloc0_1_0 + 1)
	mov	r3,a
	mov	a,#0x01
	subb	a,(_UART1_Init_sloc0_1_0 + 2)
	mov	r4,a
	clr	a
	subb	a,(_UART1_Init_sloc0_1_0 + 3)
	mov	r5,a
	mov	_SBRL1,r2
	mov	(_SBRL1 >> 8),r3
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:200: SBCON1 |= 0x03; // set prescaler to 1
	orl	_SBCON1,#0x03
	ljmp	L009009?
L009008?:
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:202: else if (((SYSCLK/baudrate)/2L)/0xFFFFL < 4){
	clr	c
	mov	a,r6
	subb	a,#0x04
	mov	a,r7
	subb	a,#0x00
	mov	a,r0
	subb	a,#0x00
	mov	a,r1
	subb	a,#0x00
	jnc	L009005?
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:203: SBRL1 = 0x10000L-(((SYSCLK/baudrate)/2L)/4L);
	mov	a,(_UART1_Init_sloc0_1_0 + 3)
	clr	c
	rrc	a
	mov	r5,a
	mov	a,(_UART1_Init_sloc0_1_0 + 2)
	rrc	a
	mov	r4,a
	mov	a,(_UART1_Init_sloc0_1_0 + 1)
	rrc	a
	mov	r3,a
	mov	a,_UART1_Init_sloc0_1_0
	rrc	a
	mov	r2,a
	mov	a,r5
	clr	c
	rrc	a
	mov	r5,a
	mov	a,r4
	rrc	a
	mov	r4,a
	mov	a,r3
	rrc	a
	mov	r3,a
	mov	a,r2
	rrc	a
	mov	r2,a
	clr	a
	clr	c
	subb	a,r2
	mov	r2,a
	clr	a
	subb	a,r3
	mov	r3,a
	mov	a,#0x01
	subb	a,r4
	mov	r4,a
	clr	a
	subb	a,r5
	mov	r5,a
	mov	_SBRL1,r2
	mov	(_SBRL1 >> 8),r3
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:204: SBCON1 &= ~0x03;
	anl	_SBCON1,#0xFC
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:205: SBCON1 |= 0x01; // set prescaler to 4
	orl	_SBCON1,#0x01
	ljmp	L009009?
L009005?:
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:207: else if (((SYSCLK/baudrate)/2L)/0xFFFFL < 12){
	clr	c
	mov	a,r6
	subb	a,#0x0C
	mov	a,r7
	subb	a,#0x00
	mov	a,r0
	subb	a,#0x00
	mov	a,r1
	subb	a,#0x00
	jnc	L009002?
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:208: SBRL1 = 0x10000L-(((SYSCLK/baudrate)/2L)/12L);
	mov	__divulong_PARM_2,#0x0C
	clr	a
	mov	(__divulong_PARM_2 + 1),a
	mov	(__divulong_PARM_2 + 2),a
	mov	(__divulong_PARM_2 + 3),a
	mov	dpl,_UART1_Init_sloc0_1_0
	mov	dph,(_UART1_Init_sloc0_1_0 + 1)
	mov	b,(_UART1_Init_sloc0_1_0 + 2)
	mov	a,(_UART1_Init_sloc0_1_0 + 3)
	lcall	__divulong
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	clr	a
	clr	c
	subb	a,r2
	mov	r2,a
	clr	a
	subb	a,r3
	mov	r3,a
	mov	a,#0x01
	subb	a,r4
	mov	r4,a
	clr	a
	subb	a,r5
	mov	r5,a
	mov	_SBRL1,r2
	mov	(_SBRL1 >> 8),r3
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:209: SBCON1 &= ~0x03; // set prescaler to 12
	anl	_SBCON1,#0xFC
	sjmp	L009009?
L009002?:
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:212: SBRL1 = 0x10000L-(((SYSCLK/baudrate)/2L)/48L);
	mov	__divulong_PARM_2,#0x30
	clr	a
	mov	(__divulong_PARM_2 + 1),a
	mov	(__divulong_PARM_2 + 2),a
	mov	(__divulong_PARM_2 + 3),a
	mov	dpl,_UART1_Init_sloc0_1_0
	mov	dph,(_UART1_Init_sloc0_1_0 + 1)
	mov	b,(_UART1_Init_sloc0_1_0 + 2)
	mov	a,(_UART1_Init_sloc0_1_0 + 3)
	lcall	__divulong
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	clr	a
	clr	c
	subb	a,r2
	mov	r2,a
	clr	a
	subb	a,r3
	mov	r3,a
	mov	a,#0x01
	subb	a,r4
	mov	r4,a
	clr	a
	subb	a,r5
	mov	r5,a
	mov	_SBRL1,r2
	mov	(_SBRL1 >> 8),r3
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:213: SBCON1 &= ~0x03;
	anl	_SBCON1,#0xFC
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:214: SBCON1 |= 0x02; // set prescaler to ?
	orl	_SBCON1,#0x02
L009009?:
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:216: SCON1 |= 0x02; // indicate ready for TX
	orl	_SCON1,#0x02
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:217: SBCON1 |= 0x40; // enable baud rate generator
	orl	_SBCON1,#0x40
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'putchar1'
;------------------------------------------------------------
;c                         Allocated to registers r2 
;------------------------------------------------------------
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:220: void putchar1 (char c)
;	-----------------------------------------
;	 function putchar1
;	-----------------------------------------
_putchar1:
	mov	r2,dpl
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:222: if (c == '\n' )
	cjne	r2,#0x0A,L010006?
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:224: while (!(SCON1 & 0x02));
L010001?:
	mov	a,_SCON1
	jnb	acc.1,L010001?
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:225: SCON1 &= ~0x02;
	anl	_SCON1,#0xFD
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:226: SBUF1 = '\r' ;
	mov	_SBUF1,#0x0D
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:228: while (!(SCON1 & 0x02));
L010006?:
	mov	a,_SCON1
	jnb	acc.1,L010006?
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:229: SCON1 &= ~0x02;
	anl	_SCON1,#0xFD
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:230: SBUF1 = c;
	mov	_SBUF1,r2
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'getchar1'
;------------------------------------------------------------
;c                         Allocated to registers 
;------------------------------------------------------------
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:233: char getchar1 (void)
;	-----------------------------------------
;	 function getchar1
;	-----------------------------------------
_getchar1:
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:236: while (!(SCON1 & 0x01));
L011001?:
	mov	a,_SCON1
	jnb	acc.0,L011001?
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:237: SCON1 &= ~0x01;
	anl	_SCON1,#0xFE
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:238: c = SBUF1;
	mov	dpl,_SBUF1
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:239: return (c);
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'nunchuck_init'
;------------------------------------------------------------
;i                         Allocated to registers r2 
;buf                       Allocated with name '_nunchuck_init_buf_1_91'
;sloc0                     Allocated with name '_nunchuck_init_sloc0_1_0'
;sloc1                     Allocated with name '_nunchuck_init_sloc1_1_0'
;sloc2                     Allocated with name '_nunchuck_init_sloc2_1_0'
;------------------------------------------------------------
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:243: void nunchuck_init(bit print_extension_type)
;	-----------------------------------------
;	 function nunchuck_init
;	-----------------------------------------
_nunchuck_init:
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:255: I2C_start();
	lcall	_I2C_start
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:256: I2C_write(0xA4);
	mov	dpl,#0xA4
	lcall	_I2C_write
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:257: I2C_write(0xF0);
	mov	dpl,#0xF0
	lcall	_I2C_write
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:258: I2C_write(0x55);
	mov	dpl,#0x55
	lcall	_I2C_write
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:259: I2C_stop();
	lcall	_I2C_stop
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:260: Timer4ms(1);
	mov	dpl,#0x01
	lcall	_Timer4ms
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:262: I2C_start();
	lcall	_I2C_start
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:263: I2C_write(0xA4);
	mov	dpl,#0xA4
	lcall	_I2C_write
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:264: I2C_write(0xFB);
	mov	dpl,#0xFB
	lcall	_I2C_write
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:265: I2C_write(0x00);
	mov	dpl,#0x00
	lcall	_I2C_write
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:266: I2C_stop();
	lcall	_I2C_stop
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:267: Timer4ms(1);
	mov	dpl,#0x01
	lcall	_Timer4ms
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:271: I2C_start();
	lcall	_I2C_start
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:272: I2C_write(0xA4);
	mov	dpl,#0xA4
	lcall	_I2C_write
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:273: I2C_write(0xFA); // extension type register
	mov	dpl,#0xFA
	lcall	_I2C_write
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:274: I2C_stop();
	lcall	_I2C_stop
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:275: Timer4ms(3); // 3 ms required to complete acquisition
	mov	dpl,#0x03
	lcall	_Timer4ms
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:277: I2C_start();
	lcall	_I2C_start
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:278: I2C_write(0xA5);
	mov	dpl,#0xA5
	lcall	_I2C_write
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:281: for(i=0; i<6; i++)
	mov	r2,#0x00
L012003?:
	cjne	r2,#0x06,L012013?
L012013?:
	jnc	L012006?
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:283: buf[i]=I2C_read();
	mov	a,r2
	add	a,#_nunchuck_init_buf_1_91
	mov	r0,a
	push	ar2
	push	ar0
	lcall	_I2C_read
	mov	a,dpl
	pop	ar0
	pop	ar2
	mov	@r0,a
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:281: for(i=0; i<6; i++)
	inc	r2
	sjmp	L012003?
L012006?:
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:285: ACK0=0;
	clr	_ACK0
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:286: I2C_stop();
	lcall	_I2C_stop
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:287: Timer4ms(3);
	mov	dpl,#0x03
	lcall	_Timer4ms
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:289: if(print_extension_type)
	jnb	_nunchuck_init_PARM_1,L012002?
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:292: buf[0],  buf[1], buf[2], buf[3], buf[4], buf[5]);
	mov	r2,(_nunchuck_init_buf_1_91 + 0x0005)
	mov	r3,#0x00
	mov	r4,(_nunchuck_init_buf_1_91 + 0x0004)
	mov	r5,#0x00
	mov	_nunchuck_init_sloc0_1_0,(_nunchuck_init_buf_1_91 + 0x0003)
	mov	(_nunchuck_init_sloc0_1_0 + 1),#0x00
	mov	_nunchuck_init_sloc1_1_0,(_nunchuck_init_buf_1_91 + 0x0002)
	mov	(_nunchuck_init_sloc1_1_0 + 1),#0x00
	mov	_nunchuck_init_sloc2_1_0,(_nunchuck_init_buf_1_91 + 0x0001)
	mov	(_nunchuck_init_sloc2_1_0 + 1),#0x00
	mov	r6,_nunchuck_init_buf_1_91
	mov	r7,#0x00
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:291: printf("Extension type: %02x  %02x  %02x  %02x  %02x  %02x\n", 
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	_nunchuck_init_sloc0_1_0
	push	(_nunchuck_init_sloc0_1_0 + 1)
	push	_nunchuck_init_sloc1_1_0
	push	(_nunchuck_init_sloc1_1_0 + 1)
	push	_nunchuck_init_sloc2_1_0
	push	(_nunchuck_init_sloc2_1_0 + 1)
	push	ar6
	push	ar7
	mov	a,#__str_0
	push	acc
	mov	a,#(__str_0 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf1
	mov	sp,a
L012002?:
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:297: I2C_start();
	lcall	_I2C_start
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:298: I2C_write(0xA4);
	mov	dpl,#0xA4
	lcall	_I2C_write
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:299: I2C_write(0xF0);
	mov	dpl,#0xF0
	lcall	_I2C_write
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:300: I2C_write(0xAA);
	mov	dpl,#0xAA
	lcall	_I2C_write
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:301: I2C_stop();
	lcall	_I2C_stop
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:302: Timer4ms(1);
	mov	dpl,#0x01
	lcall	_Timer4ms
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:304: I2C_start();
	lcall	_I2C_start
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:305: I2C_write(0xA4);
	mov	dpl,#0xA4
	lcall	_I2C_write
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:306: I2C_write(0x40);
	mov	dpl,#0x40
	lcall	_I2C_write
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:307: I2C_write(0x00);
	mov	dpl,#0x00
	lcall	_I2C_write
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:308: I2C_write(0x00);
	mov	dpl,#0x00
	lcall	_I2C_write
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:309: I2C_write(0x00);
	mov	dpl,#0x00
	lcall	_I2C_write
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:310: I2C_write(0x00);
	mov	dpl,#0x00
	lcall	_I2C_write
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:311: I2C_write(0x00);
	mov	dpl,#0x00
	lcall	_I2C_write
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:312: I2C_write(0x00);
	mov	dpl,#0x00
	lcall	_I2C_write
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:313: I2C_stop();
	lcall	_I2C_stop
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:314: Timer4ms(1);
	mov	dpl,#0x01
	lcall	_Timer4ms
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:316: I2C_start();
	lcall	_I2C_start
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:317: I2C_write(0xA4);
	mov	dpl,#0xA4
	lcall	_I2C_write
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:318: I2C_write(0x40);
	mov	dpl,#0x40
	lcall	_I2C_write
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:319: I2C_write(0x00);
	mov	dpl,#0x00
	lcall	_I2C_write
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:320: I2C_write(0x00);
	mov	dpl,#0x00
	lcall	_I2C_write
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:321: I2C_write(0x00);
	mov	dpl,#0x00
	lcall	_I2C_write
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:322: I2C_write(0x00);
	mov	dpl,#0x00
	lcall	_I2C_write
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:323: I2C_write(0x00);
	mov	dpl,#0x00
	lcall	_I2C_write
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:324: I2C_write(0x00);
	mov	dpl,#0x00
	lcall	_I2C_write
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:325: I2C_stop();
	lcall	_I2C_stop
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:326: Timer4ms(1);
	mov	dpl,#0x01
	lcall	_Timer4ms
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:328: I2C_start();
	lcall	_I2C_start
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:329: I2C_write(0xA4);
	mov	dpl,#0xA4
	lcall	_I2C_write
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:330: I2C_write(0x40);
	mov	dpl,#0x40
	lcall	_I2C_write
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:331: I2C_write(0x00);
	mov	dpl,#0x00
	lcall	_I2C_write
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:332: I2C_write(0x00);
	mov	dpl,#0x00
	lcall	_I2C_write
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:333: I2C_write(0x00);
	mov	dpl,#0x00
	lcall	_I2C_write
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:334: I2C_write(0x00);
	mov	dpl,#0x00
	lcall	_I2C_write
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:335: I2C_stop();
	lcall	_I2C_stop
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:336: Timer4ms(1);
	mov	dpl,#0x01
	ljmp	_Timer4ms
;------------------------------------------------------------
;Allocation info for local variables in function 'nunchuck_getdata'
;------------------------------------------------------------
;s                         Allocated to registers r2 r3 r4 
;i                         Allocated to registers r5 
;------------------------------------------------------------
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:340: void nunchuck_getdata(unsigned char * s)
;	-----------------------------------------
;	 function nunchuck_getdata
;	-----------------------------------------
_nunchuck_getdata:
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:345: I2C_start();
	push	ar2
	push	ar3
	push	ar4
	lcall	_I2C_start
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:346: I2C_write(0xA4);
	mov	dpl,#0xA4
	lcall	_I2C_write
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:347: I2C_write(0x00);
	mov	dpl,#0x00
	lcall	_I2C_write
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:348: I2C_stop();
	lcall	_I2C_stop
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:349: Timer4ms(3); 	// 3 ms required to complete acquisition
	mov	dpl,#0x03
	lcall	_Timer4ms
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:352: I2C_start();
	lcall	_I2C_start
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:353: I2C_write(0xA5);
	mov	dpl,#0xA5
	lcall	_I2C_write
	pop	ar4
	pop	ar3
	pop	ar2
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:356: for(i=0; i<6; i++)
	mov	r5,#0x00
L013001?:
	cjne	r5,#0x06,L013010?
L013010?:
	jnc	L013004?
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:358: s[i]=(I2C_read()^0x17)+0x17; // Read and decrypt
	mov	a,r5
	add	a,r2
	mov	r6,a
	clr	a
	addc	a,r3
	mov	r7,a
	mov	ar0,r4
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	push	ar7
	push	ar0
	lcall	_I2C_read
	mov	a,dpl
	pop	ar0
	pop	ar7
	pop	ar6
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	xrl	a,#0x17
	add	a,#0x17
	mov	r1,a
	mov	dpl,r6
	mov	dph,r7
	mov	b,r0
	lcall	__gptrput
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:356: for(i=0; i<6; i++)
	inc	r5
	sjmp	L013001?
L013004?:
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:360: ACK0=0;
	clr	_ACK0
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:361: I2C_stop();
	ljmp	_I2C_stop
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;rbuf                      Allocated with name '_main_rbuf_1_98'
;joy_x                     Allocated with name '_main_joy_x_1_98'
;joy_y                     Allocated with name '_main_joy_y_1_98'
;off_x                     Allocated with name '_main_off_x_1_98'
;off_y                     Allocated with name '_main_off_y_1_98'
;acc_x                     Allocated to registers r4 r5 
;acc_y                     Allocated with name '_main_acc_y_1_98'
;acc_z                     Allocated with name '_main_acc_z_1_98'
;sloc0                     Allocated with name '_main_sloc0_1_0'
;------------------------------------------------------------
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:364: void main (void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:370: UART1_Init(BAUDRATE);
	mov	dptr,#0xC200
	mov	b,#0x01
	clr	a
	lcall	_UART1_Init
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:372: printf("\x1b[2J"); // Clear screen using ANSI escape sequence.
	mov	a,#__str_1
	push	acc
	mov	a,#(__str_1 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:374: "Check pins P2.0 and P2.1 with the oscilloscope.\r\n");
	mov	a,#__str_2
	push	acc
	mov	a,#(__str_2 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:384: printf("\x1b[2J\x1b[1;1H"); // Clear screen using ANSI escape sequence.
	mov	a,#__str_3
	push	acc
	mov	a,#(__str_3 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:385: printf("\n\nWII Nunchuck I2C Reader\n");
	mov	a,#__str_4
	push	acc
	mov	a,#(__str_4 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:387: Timer4ms(200);
	mov	dpl,#0xC8
	lcall	_Timer4ms
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:388: nunchuck_init(1);
	setb	_nunchuck_init_PARM_1
	lcall	_nunchuck_init
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:389: Timer4ms(100);
	mov	dpl,#0x64
	lcall	_Timer4ms
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:391: nunchuck_getdata(rbuf);
	mov	dptr,#_main_rbuf_1_98
	mov	b,#0x40
	lcall	_nunchuck_getdata
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:393: off_x=(int)rbuf[0]-128;
	mov	r2,_main_rbuf_1_98
	mov	r3,#0x00
	mov	a,r2
	add	a,#0x80
	mov	_main_off_x_1_98,a
	mov	a,r3
	addc	a,#0xff
	mov	(_main_off_x_1_98 + 1),a
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:394: off_y=(int)rbuf[1]-128;
	mov	r4,(_main_rbuf_1_98 + 0x0001)
	mov	r5,#0x00
	mov	a,r4
	add	a,#0x80
	mov	_main_off_y_1_98,a
	mov	a,r5
	addc	a,#0xff
	mov	(_main_off_y_1_98 + 1),a
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:395: printf("Offset_X:%4d Offset_Y:%4d\n\n", off_x, off_y);
	push	_main_off_y_1_98
	push	(_main_off_y_1_98 + 1)
	push	_main_off_x_1_98
	push	(_main_off_x_1_98 + 1)
	mov	a,#__str_5
	push	acc
	mov	a,#(__str_5 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:397: while(1)
L014014?:
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:399: nunchuck_getdata(rbuf);
	mov	dptr,#_main_rbuf_1_98
	mov	b,#0x40
	lcall	_nunchuck_getdata
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:401: joy_x=(int)rbuf[0]-128-off_x;
	mov	r6,_main_rbuf_1_98
	mov	r7,#0x00
	mov	a,r6
	add	a,#0x80
	mov	r6,a
	mov	a,r7
	addc	a,#0xff
	mov	r7,a
	mov	a,r6
	clr	c
	subb	a,_main_off_x_1_98
	mov	_main_joy_x_1_98,a
	mov	a,r7
	subb	a,(_main_off_x_1_98 + 1)
	mov	(_main_joy_x_1_98 + 1),a
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:402: joy_y=(int)rbuf[1]-128-off_y;
	mov	r4,(_main_rbuf_1_98 + 0x0001)
	mov	r5,#0x00
	mov	a,r4
	add	a,#0x80
	mov	r4,a
	mov	a,r5
	addc	a,#0xff
	mov	r5,a
	mov	a,r4
	clr	c
	subb	a,_main_off_y_1_98
	mov	_main_joy_y_1_98,a
	mov	a,r5
	subb	a,(_main_off_y_1_98 + 1)
	mov	(_main_joy_y_1_98 + 1),a
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:403: acc_x=rbuf[2]*4; 
	mov	a,(_main_rbuf_1_98 + 0x0002)
	mov	b,#0x04
	mul	ab
	mov	r4,a
	mov	r5,b
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:404: acc_y=rbuf[3]*4;
	mov	a,(_main_rbuf_1_98 + 0x0003)
	mov	b,#0x04
	mul	ab
	mov	_main_acc_y_1_98,a
	mov	(_main_acc_y_1_98 + 1),b
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:405: acc_z=rbuf[4]*4;
	mov	a,(_main_rbuf_1_98 + 0x0004)
	mov	b,#0x04
	mul	ab
	mov	_main_acc_z_1_98,a
	mov	(_main_acc_z_1_98 + 1),b
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:407: but1=(rbuf[5] & 0x01)?1:0;
	mov	a,(_main_rbuf_1_98 + 0x0005)
	rrc	a
	mov	_main_but1_1_98,c
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:408: but2=(rbuf[5] & 0x02)?1:0;
	mov	a,(_main_rbuf_1_98 + 0x0005)
	mov	c,acc.1
	mov	_main_but2_1_98,c
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:409: if (rbuf[5] & 0x04) acc_x+=2;
	mov	a,(_main_rbuf_1_98 + 0x0005)
	jnb	acc.2,L014002?
	mov	a,#0x02
	add	a,r4
	mov	r4,a
	clr	a
	addc	a,r5
	mov	r5,a
L014002?:
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:410: if (rbuf[5] & 0x08) acc_x+=1;
	mov	a,(_main_rbuf_1_98 + 0x0005)
	jnb	acc.3,L014004?
	inc	r4
	cjne	r4,#0x00,L014033?
	inc	r5
L014033?:
L014004?:
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:411: if (rbuf[5] & 0x10) acc_y+=2;
	mov	a,(_main_rbuf_1_98 + 0x0005)
	jnb	acc.4,L014006?
	mov	a,#0x02
	add	a,_main_acc_y_1_98
	mov	_main_acc_y_1_98,a
	clr	a
	addc	a,(_main_acc_y_1_98 + 1)
	mov	(_main_acc_y_1_98 + 1),a
L014006?:
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:412: if (rbuf[5] & 0x20) acc_y+=1;
	mov	a,(_main_rbuf_1_98 + 0x0005)
	jnb	acc.5,L014008?
	inc	_main_acc_y_1_98
	clr	a
	cjne	a,_main_acc_y_1_98,L014036?
	inc	(_main_acc_y_1_98 + 1)
L014036?:
L014008?:
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:413: if (rbuf[5] & 0x40) acc_z+=2;
	mov	a,(_main_rbuf_1_98 + 0x0005)
	jnb	acc.6,L014010?
	mov	a,#0x02
	add	a,_main_acc_z_1_98
	mov	_main_acc_z_1_98,a
	clr	a
	addc	a,(_main_acc_z_1_98 + 1)
	mov	(_main_acc_z_1_98 + 1),a
L014010?:
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:414: if (rbuf[5] & 0x80) acc_z+=1;
	mov	a,(_main_rbuf_1_98 + 0x0005)
	jnb	acc.7,L014012?
	inc	_main_acc_z_1_98
	clr	a
	cjne	a,_main_acc_z_1_98,L014039?
	inc	(_main_acc_z_1_98 + 1)
L014039?:
L014012?:
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:417: but1?'1':'0', but2?'1':'0', joy_x, joy_y, acc_x, acc_y, acc_z);
	jnb	_main_but2_1_98,L014018?
	mov	r6,#0x31
	sjmp	L014019?
L014018?:
	mov	r6,#0x30
L014019?:
	mov	a,r6
	rlc	a
	subb	a,acc
	mov	r7,a
	jnb	_main_but1_1_98,L014020?
	mov	_main_sloc0_1_0,#0x31
	sjmp	L014021?
L014020?:
	mov	_main_sloc0_1_0,#0x30
L014021?:
	mov	a,_main_sloc0_1_0
	mov	r2,a
	rlc	a
	subb	a,acc
	mov	r3,a
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:416: printf("Buttons(Z:%c, C:%c) Joystick(%4d, %4d) Accelerometer(%3d, %3d, %3d)\x1b[0J\r",
	push	_main_acc_z_1_98
	push	(_main_acc_z_1_98 + 1)
	push	_main_acc_y_1_98
	push	(_main_acc_y_1_98 + 1)
	push	ar4
	push	ar5
	push	_main_joy_y_1_98
	push	(_main_joy_y_1_98 + 1)
	push	_main_joy_x_1_98
	push	(_main_joy_x_1_98 + 1)
	push	ar6
	push	ar7
	push	ar2
	push	ar3
	mov	a,#__str_6
	push	acc
	mov	a,#(__str_6 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xef
	mov	sp,a
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:419: putchar1((char)joy_x);
	mov	dpl,_main_joy_x_1_98
	lcall	_putchar1
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_sending.c:421: Timer4ms(100);
	mov	dpl,#0x64
	lcall	_Timer4ms
	ljmp	L014014?
	rseg R_CSEG

	rseg R_XINIT

	rseg R_CONST
__str_0:
	db 'Extension type: %02x  %02x  %02x  %02x  %02x  %02x'
	db 0x0A
	db 0x00
__str_1:
	db 0x1B
	db '[2J'
	db 0x00
__str_2:
	db 'Square wave generator for the F38x.'
	db 0x0D
	db 0x0A
	db 'Check pins P2.0 and P2.'
	db '1 with the oscilloscope.'
	db 0x0D
	db 0x0A
	db 0x00
__str_3:
	db 0x1B
	db '[2J'
	db 0x1B
	db '[1;1H'
	db 0x00
__str_4:
	db 0x0A
	db 0x0A
	db 'WII Nunchuck I2C Reader'
	db 0x0A
	db 0x00
__str_5:
	db 'Offset_X:%4d Offset_Y:%4d'
	db 0x0A
	db 0x0A
	db 0x00
__str_6:
	db 'Buttons(Z:%c, C:%c) Joystick(%4d, %4d) Accelerometer(%3d, %3'
	db 'd, %3d)'
	db 0x1B
	db '[0J'
	db 0x0D
	db 0x00

	CSEG

end
