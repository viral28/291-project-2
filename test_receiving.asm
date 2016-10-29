;--------------------------------------------------------
; File Created by C51
; Version 1.0.0 #1069 (Apr 23 2015) (MSVC)
; This file was generated Fri Mar 25 21:34:35 2016
;--------------------------------------------------------
$name test_receiving
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
	public _getchar1
	public _putchar1
	public _UART1_Init
	public _Timer4ms
	public _Timer2_ISR
	public __c51_external_startup
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
_UART1_Init_sloc0_1_0:
	ds 4
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
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
	; The linker places a 'ret' at the end of segment R_DINIT.
;--------------------------------------------------------
; code
;--------------------------------------------------------
	rseg R_CSEG
;------------------------------------------------------------
;Allocation info for local variables in function '_c51_external_startup'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:29: char _c51_external_startup (void)
;	-----------------------------------------
;	 function _c51_external_startup
;	-----------------------------------------
__c51_external_startup:
	using	0
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:31: PCA0MD&=(~0x40) ;  // DISABLE WDT: clear Watchdog Enable bit
	anl	_PCA0MD,#0xBF
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:32: VDM0CN=0x80;       // Enable VDD monitor
	mov	_VDM0CN,#0x80
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:33: RSTSRC=0x02|0x04;  // Enable reset on missing clock detector and VDD
	mov	_RSTSRC,#0x06
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:41: CLKSEL|=0b_0000_0011; // SYSCLK derived from the Internal High-Frequency Oscillator / 1.
	orl	_CLKSEL,#0x03
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:45: OSCICN |= 0x03; // Configure internal oscillator for its maximum frequency
	orl	_OSCICN,#0x03
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:48: TH1 = 0x10000-((SYSCLK/BAUDRATE)/2L);
	mov	_TH1,#0x30
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:49: CKCON &= ~0x0B;                  // T1M = 1; SCA1:0 = xx
	anl	_CKCON,#0xF4
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:50: CKCON |=  0x08;
	orl	_CKCON,#0x08
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:64: TL1 = TH1;     // Init timer 1
	mov	_TL1,_TH1
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:65: TMOD &= 0x0f;  // Mask out timer 1 bits
	anl	_TMOD,#0x0F
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:66: TMOD |= 0x20;  // TMOD: timer 1 in 8-bit autoreload                     
	orl	_TMOD,#0x20
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:67: TR1 = 1;       // Start timer1
	setb	_TR1
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:68: SCON = 0x52;
	mov	_SCON,#0x52
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:71: P0MDOUT = 0x10;           // Enable Uart TX as push-pull output
	mov	_P0MDOUT,#0x10
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:72: P2MDOUT |= 0b0000_0110;   // Make the LED (P2.2) a push-pull output.  P2.1 used for debuging.
	orl	_P2MDOUT,#0x06
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:73: XBR0 = 0b0000_0101;       // Enable SMBus pins and UART pins P0.4(TX) and P0.5(RX)
	mov	_XBR0,#0x05
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:74: XBR1 = 0x40;              // Enable crossbar and weak pull-ups
	mov	_XBR1,#0x40
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:77: CKCON |= 0x04; // Timer0 clock source = SYSCLK
	orl	_CKCON,#0x04
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:78: TMOD &= 0xf0;  // Mask out timer 1 bits
	anl	_TMOD,#0xF0
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:79: TMOD |= 0x02;  // Timer0 in 8-bit auto-reload mode
	orl	_TMOD,#0x02
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:81: TL0 = TH0 = 256-(SYSCLK/SMB_FREQUENCY/3);
	mov	_TH0,#0x60
	mov	_TL0,#0x60
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:82: TR0 = 1; // Enable timer 0
	setb	_TR0
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:85: SMB0CF = INH | EXTHOLD | SMBTOE | SMBFTE ;
	mov	_SMB0CF,#0x5C
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:86: SMB0CF |= ENSMB;  // Enable SMBus
	orl	_SMB0CF,#0x80
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:88: LED = LED_OFF;
	setb	_P2_2
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:91: TMR2CN=0x00;   // Stop Timer2; Clear TF2;
	mov	_TMR2CN,#0x00
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:92: CKCON|=0b_0001_0000;
	orl	_CKCON,#0x10
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:93: TMR2RL=(-(SYSCLK/(2*48))/(100L)); // Initialize reload value
	mov	_TMR2RL,#0x78
	mov	(_TMR2RL >> 8),#0xEC
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:94: TMR2=0xffff;   // Set to reload immediately
	mov	_TMR2,#0xFF
	mov	(_TMR2 >> 8),#0xFF
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:95: ET2=1;         // Enable Timer2 interrupts
	setb	_ET2
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:96: TR2=1;         // Start Timer2
	setb	_TR2
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:98: EA=1; // Enable interrupts
	setb	_EA
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:100: return 0;
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Timer2_ISR'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:103: void Timer2_ISR (void) interrupt 5
;	-----------------------------------------
;	 function Timer2_ISR
;	-----------------------------------------
_Timer2_ISR:
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:122: }
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
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:125: void Timer4ms(unsigned char ms)
;	-----------------------------------------
;	 function Timer4ms
;	-----------------------------------------
_Timer4ms:
	mov	r2,dpl
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:130: k=SFRPAGE;
	mov	r3,_SFRPAGE
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:131: SFRPAGE=0xf;
	mov	_SFRPAGE,#0x0F
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:133: CKCON1|=0b_0000_0001;
	orl	_CKCON1,#0x01
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:135: TMR4RL = 65536-(SYSCLK/1000L); // Set Timer4 to overflow in 1 ms.
	mov	_TMR4RL,#0x80
	mov	(_TMR4RL >> 8),#0x44
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:136: TMR4 = TMR4RL;                 // Initialize Timer4 for first overflow
	mov	_TMR4,_TMR4RL
	mov	(_TMR4 >> 8),(_TMR4RL >> 8)
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:138: TMR4CN = 0x04;                 // Start Timer4 and clear overflow flag
	mov	_TMR4CN,#0x04
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:139: for (i = 0; i < ms; i++)       // Count <ms> overflows
	mov	r4,#0x00
L004004?:
	clr	c
	mov	a,r4
	subb	a,r2
	jnc	L004007?
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:141: while (!(TMR4CN & 0x80));  // Wait for overflow
L004001?:
	mov	a,_TMR4CN
	jnb	acc.7,L004001?
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:142: TMR4CN &= ~(0x80);         // Clear overflow indicator
	anl	_TMR4CN,#0x7F
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:139: for (i = 0; i < ms; i++)       // Count <ms> overflows
	inc	r4
	sjmp	L004004?
L004007?:
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:144: TMR4CN = 0 ;                   // Stop Timer4 and clear overflow flag
	mov	_TMR4CN,#0x00
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:145: SFRPAGE=k;	
	mov	_SFRPAGE,r3
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'UART1_Init'
;------------------------------------------------------------
;baudrate                  Allocated to registers r2 r3 r4 r5 
;sloc0                     Allocated with name '_UART1_Init_sloc0_1_0'
;------------------------------------------------------------
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:148: void UART1_Init (unsigned long baudrate)
;	-----------------------------------------
;	 function UART1_Init
;	-----------------------------------------
_UART1_Init:
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:150: SMOD1 = 0x0C; // no parity, 8 data bits, 1 stop bit
	mov	_SMOD1,#0x0C
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:151: SCON1 = 0x10;
	mov	_SCON1,#0x10
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:152: if (((SYSCLK/baudrate)/2L)/0xFFFFL < 1){
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
	jnc	L005008?
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:153: SBRL1 = 0x10000L-((SYSCLK/baudrate)/2L);
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
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:154: SBCON1 |= 0x03; // set prescaler to 1
	orl	_SBCON1,#0x03
	ljmp	L005009?
L005008?:
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:156: else if (((SYSCLK/baudrate)/2L)/0xFFFFL < 4){
	clr	c
	mov	a,r6
	subb	a,#0x04
	mov	a,r7
	subb	a,#0x00
	mov	a,r0
	subb	a,#0x00
	mov	a,r1
	subb	a,#0x00
	jnc	L005005?
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:157: SBRL1 = 0x10000L-(((SYSCLK/baudrate)/2L)/4L);
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
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:158: SBCON1 &= ~0x03;
	anl	_SBCON1,#0xFC
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:159: SBCON1 |= 0x01; // set prescaler to 4
	orl	_SBCON1,#0x01
	ljmp	L005009?
L005005?:
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:161: else if (((SYSCLK/baudrate)/2L)/0xFFFFL < 12){
	clr	c
	mov	a,r6
	subb	a,#0x0C
	mov	a,r7
	subb	a,#0x00
	mov	a,r0
	subb	a,#0x00
	mov	a,r1
	subb	a,#0x00
	jnc	L005002?
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:162: SBRL1 = 0x10000L-(((SYSCLK/baudrate)/2L)/12L);
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
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:163: SBCON1 &= ~0x03; // set prescaler to 12
	anl	_SBCON1,#0xFC
	sjmp	L005009?
L005002?:
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:166: SBRL1 = 0x10000L-(((SYSCLK/baudrate)/2L)/48L);
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
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:167: SBCON1 &= ~0x03;
	anl	_SBCON1,#0xFC
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:168: SBCON1 |= 0x02; // set prescaler to ?
	orl	_SBCON1,#0x02
L005009?:
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:170: SCON1 |= 0x02; // indicate ready for TX
	orl	_SCON1,#0x02
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:171: SBCON1 |= 0x40; // enable baud rate generator
	orl	_SBCON1,#0x40
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:173: XBR2=0x01; // Enable UART1 on P0.0(TX1) and P0.1(RX1)
	mov	_XBR2,#0x01
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:174: XBR1=0x40; // Enable crossbar and weak pull-ups
	mov	_XBR1,#0x40
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'putchar1'
;------------------------------------------------------------
;c                         Allocated to registers r2 
;------------------------------------------------------------
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:177: void putchar1 (char c)
;	-----------------------------------------
;	 function putchar1
;	-----------------------------------------
_putchar1:
	mov	r2,dpl
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:179: if (c == '\n' )
	cjne	r2,#0x0A,L006006?
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:181: while (!(SCON1 & 0x02));
L006001?:
	mov	a,_SCON1
	jnb	acc.1,L006001?
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:182: SCON1 &= ~0x02;
	anl	_SCON1,#0xFD
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:183: SBUF1 = '\r' ;
	mov	_SBUF1,#0x0D
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:185: while (!(SCON1 & 0x02));
L006006?:
	mov	a,_SCON1
	jnb	acc.1,L006006?
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:186: SCON1 &= ~0x02;
	anl	_SCON1,#0xFD
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:187: SBUF1 = c;
	mov	_SBUF1,r2
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'getchar1'
;------------------------------------------------------------
;c                         Allocated to registers 
;------------------------------------------------------------
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:190: char getchar1 (void)
;	-----------------------------------------
;	 function getchar1
;	-----------------------------------------
_getchar1:
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:193: printf("12  ");
	mov	a,#__str_0
	push	acc
	mov	a,#(__str_0 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:194: while (!(SCON1 & 0x01));
L007001?:
	mov	a,_SCON1
	jnb	acc.0,L007001?
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:195: printf("13  ");
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
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:196: SCON1 &= ~0x01;
	anl	_SCON1,#0xFE
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:197: c = SBUF1;
	mov	dpl,_SBUF1
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:198: return (c);
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:202: void main (void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:204: UART1_Init(BAUDRATE);
	mov	dptr,#0xC200
	mov	b,#0x01
	clr	a
	lcall	_UART1_Init
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:207: while(1)
L008002?:
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:209: SCON1 |= 0x01;
	orl	_SCON1,#0x01
;	C:\Users\viral\Documents\uni stuff\291\project 2\test_receiving.c:210: printf("Received: %c\n",getchar1());
	lcall	_getchar1
	mov	a,dpl
	mov	r2,a
	rlc	a
	subb	a,acc
	mov	r3,a
	push	ar2
	push	ar3
	mov	a,#__str_2
	push	acc
	mov	a,#(__str_2 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
	sjmp	L008002?
	rseg R_CSEG

	rseg R_XINIT

	rseg R_CONST
__str_0:
	db '12  '
	db 0x00
__str_1:
	db '13  '
	db 0x00
__str_2:
	db 'Received: %c'
	db 0x0A
	db 0x00

	CSEG

end
