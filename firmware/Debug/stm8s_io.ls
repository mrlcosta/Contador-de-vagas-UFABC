   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.3 - 27 Jul 2015
   3                     ; Generator (Limited) V4.4.2 - 04 Jun 2015
  48                     ; 25  void ioInit(void){	 
  50                     	switch	.text
  51  0000               _ioInit:
  55                     ; 27 	 GPIO_Init(SENSOR,   GPIO_MODE_IN_FL_NO_IT);
  57  0000 4b00          	push	#0
  58  0002 4b80          	push	#128
  59  0004 ae5014        	ldw	x,#20500
  60  0007 cd0000        	call	_GPIO_Init
  62  000a 85            	popw	x
  63                     ; 28 	 GPIO_Init(SW_SELECT,GPIO_MODE_IN_FL_NO_IT);
  65  000b 4b00          	push	#0
  66  000d 4b10          	push	#16
  67  000f ae5005        	ldw	x,#20485
  68  0012 cd0000        	call	_GPIO_Init
  70  0015 85            	popw	x
  71                     ; 29 	 GPIO_Init(SW_MENU,  GPIO_MODE_IN_FL_NO_IT);
  73  0016 4b00          	push	#0
  74  0018 4b08          	push	#8
  75  001a ae5005        	ldw	x,#20485
  76  001d cd0000        	call	_GPIO_Init
  78  0020 85            	popw	x
  79                     ; 31 	 GPIO_Init(DOOR,     GPIO_MODE_OUT_PP_LOW_SLOW);
  81  0021 4bc0          	push	#192
  82  0023 4b02          	push	#2
  83  0025 ae5000        	ldw	x,#20480
  84  0028 cd0000        	call	_GPIO_Init
  86  002b 85            	popw	x
  87                     ; 32 	 GPIO_Init(CMD_UP,   GPIO_MODE_OUT_PP_LOW_SLOW);
  89  002c 4bc0          	push	#192
  90  002e 4b40          	push	#64
  91  0030 ae5000        	ldw	x,#20480
  92  0033 cd0000        	call	_GPIO_Init
  94  0036 85            	popw	x
  95                     ; 33 	 GPIO_Init(CMD_DN,   GPIO_MODE_OUT_PP_LOW_SLOW);
  97  0037 4bc0          	push	#192
  98  0039 4b04          	push	#4
  99  003b ae5000        	ldw	x,#20480
 100  003e cd0000        	call	_GPIO_Init
 102  0041 85            	popw	x
 103                     ; 34 	 GPIO_Init(SETA,     GPIO_MODE_OUT_PP_LOW_SLOW);
 105  0042 4bc0          	push	#192
 106  0044 4b02          	push	#2
 107  0046 ae500a        	ldw	x,#20490
 108  0049 cd0000        	call	_GPIO_Init
 110  004c 85            	popw	x
 111                     ; 35 	 GPIO_Init(IGN,      GPIO_MODE_OUT_PP_LOW_SLOW);
 113  004d 4bc0          	push	#192
 114  004f 4b08          	push	#8
 115  0051 ae500a        	ldw	x,#20490
 116  0054 cd0000        	call	_GPIO_Init
 118  0057 85            	popw	x
 119                     ; 36 	 GPIO_Init(SW_P,     GPIO_MODE_OUT_PP_LOW_SLOW);
 121  0058 4bc0          	push	#192
 122  005a 4b20          	push	#32
 123  005c ae500a        	ldw	x,#20490
 124  005f cd0000        	call	_GPIO_Init
 126  0062 85            	popw	x
 127                     ; 37 	 GPIO_Init(SW_N,     GPIO_MODE_OUT_PP_LOW_SLOW);
 129  0063 4bc0          	push	#192
 130  0065 4b01          	push	#1
 131  0067 ae501e        	ldw	x,#20510
 132  006a cd0000        	call	_GPIO_Init
 134  006d 85            	popw	x
 135                     ; 38 	 GPIO_Init(LCD_E,    GPIO_MODE_OUT_PP_LOW_SLOW);
 137  006e 4bc0          	push	#192
 138  0070 4b01          	push	#1
 139  0072 ae500f        	ldw	x,#20495
 140  0075 cd0000        	call	_GPIO_Init
 142  0078 85            	popw	x
 143                     ; 39 	 GPIO_Init(LCD_RS,   GPIO_MODE_OUT_PP_LOW_SLOW);
 145  0079 4bc0          	push	#192
 146  007b 4b80          	push	#128
 147  007d ae500f        	ldw	x,#20495
 148  0080 cd0000        	call	_GPIO_Init
 150  0083 85            	popw	x
 151                     ; 40 	 GPIO_Init(LCD_DB4,  GPIO_MODE_OUT_PP_LOW_SLOW);
 153  0084 4bc0          	push	#192
 154  0086 4b04          	push	#4
 155  0088 ae500f        	ldw	x,#20495
 156  008b cd0000        	call	_GPIO_Init
 158  008e 85            	popw	x
 159                     ; 41 	 GPIO_Init(LCD_DB5,  GPIO_MODE_OUT_PP_LOW_SLOW);
 161  008f 4bc0          	push	#192
 162  0091 4b08          	push	#8
 163  0093 ae500f        	ldw	x,#20495
 164  0096 cd0000        	call	_GPIO_Init
 166  0099 85            	popw	x
 167                     ; 42 	 GPIO_Init(LCD_DB6,  GPIO_MODE_OUT_PP_LOW_SLOW);
 169  009a 4bc0          	push	#192
 170  009c 4b10          	push	#16
 171  009e ae500f        	ldw	x,#20495
 172  00a1 cd0000        	call	_GPIO_Init
 174  00a4 85            	popw	x
 175                     ; 43 	 GPIO_Init(LCD_DB7,  GPIO_MODE_OUT_PP_LOW_SLOW);
 177  00a5 4bc0          	push	#192
 178  00a7 4b20          	push	#32
 179  00a9 ae500f        	ldw	x,#20495
 180  00ac cd0000        	call	_GPIO_Init
 182  00af 85            	popw	x
 183                     ; 44    GPIO_Init(CH1,      GPIO_MODE_OUT_PP_LOW_SLOW); 
 185  00b0 4bc0          	push	#192
 186  00b2 4b40          	push	#64
 187  00b4 ae500a        	ldw	x,#20490
 188  00b7 cd0000        	call	_GPIO_Init
 190  00ba 85            	popw	x
 191                     ; 45    GPIO_Init(CH2,      GPIO_MODE_OUT_PP_LOW_SLOW); 
 193  00bb 4bc0          	push	#192
 194  00bd 4b10          	push	#16
 195  00bf ae500a        	ldw	x,#20490
 196  00c2 cd0000        	call	_GPIO_Init
 198  00c5 85            	popw	x
 199                     ; 46    GPIO_Init(CH3,      GPIO_MODE_OUT_PP_LOW_SLOW); 
 201  00c6 4bc0          	push	#192
 202  00c8 4b04          	push	#4
 203  00ca ae500a        	ldw	x,#20490
 204  00cd cd0000        	call	_GPIO_Init
 206  00d0 85            	popw	x
 207                     ; 47    GPIO_Init(CH4,      GPIO_MODE_OUT_PP_LOW_SLOW);
 209  00d1 4bc0          	push	#192
 210  00d3 4b20          	push	#32
 211  00d5 ae5014        	ldw	x,#20500
 212  00d8 cd0000        	call	_GPIO_Init
 214  00db 85            	popw	x
 215                     ; 48    GPIO_Init(I_MOT,    GPIO_MODE_OUT_PP_LOW_SLOW);	 
 217  00dc 4bc0          	push	#192
 218  00de 4b08          	push	#8
 219  00e0 ae5000        	ldw	x,#20480
 220  00e3 cd0000        	call	_GPIO_Init
 222  00e6 85            	popw	x
 223                     ; 49 	 GPIO_Init(BUZZER,   GPIO_MODE_OUT_PP_LOW_SLOW);
 225  00e7 4bc0          	push	#192
 226  00e9 4b40          	push	#64
 227  00eb ae500f        	ldw	x,#20495
 228  00ee cd0000        	call	_GPIO_Init
 230  00f1 85            	popw	x
 231                     ; 51 	 GPIO_Init(GPIOE, GPIO_PIN_1, GPIO_MODE_OUT_PP_LOW_SLOW);
 233  00f2 4bc0          	push	#192
 234  00f4 4b02          	push	#2
 235  00f6 ae5014        	ldw	x,#20500
 236  00f9 cd0000        	call	_GPIO_Init
 238  00fc 85            	popw	x
 239                     ; 52    GPIO_Init(GPIOE, GPIO_PIN_2, GPIO_MODE_OUT_PP_LOW_SLOW);
 241  00fd 4bc0          	push	#192
 242  00ff 4b04          	push	#4
 243  0101 ae5014        	ldw	x,#20500
 244  0104 cd0000        	call	_GPIO_Init
 246  0107 85            	popw	x
 247                     ; 54 	 GPIO_WriteLow(GPIOE, GPIO_PIN_1);
 249  0108 4b02          	push	#2
 250  010a ae5014        	ldw	x,#20500
 251  010d cd0000        	call	_GPIO_WriteLow
 253  0110 84            	pop	a
 254                     ; 55 	 GPIO_WriteLow(GPIOE, GPIO_PIN_2);
 256  0111 4b04          	push	#4
 257  0113 ae5014        	ldw	x,#20500
 258  0116 cd0000        	call	_GPIO_WriteLow
 260  0119 84            	pop	a
 261                     ; 57 	  EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOA, EXTI_SENSITIVITY_FALL_ONLY);
 263  011a ae0002        	ldw	x,#2
 264  011d cd0000        	call	_EXTI_SetExtIntSensitivity
 266                     ; 58     EXTI_SetTLISensitivity   (EXTI_TLISENSITIVITY_FALL_ONLY);
 268  0120 4f            	clr	a
 269  0121 cd0000        	call	_EXTI_SetTLISensitivity
 271                     ; 60 		ioCommSetDir(INPUT);
 273  0124 a601          	ld	a,#1
 274  0126 ad01          	call	_ioCommSetDir
 276                     ; 62 	}
 279  0128 81            	ret
 335                     ; 71 void ioCommSetDir(bool direction){
 336                     	switch	.text
 337  0129               _ioCommSetDir:
 341                     ; 73 	 if(direction){
 343  0129 4d            	tnz	a
 344  012a 270d          	jreq	L74
 345                     ; 75 		 GPIO_Init(COMM, GPIO_MODE_IN_FL_IT);	
 347  012c 4b20          	push	#32
 348  012e 4b20          	push	#32
 349  0130 ae5000        	ldw	x,#20480
 350  0133 cd0000        	call	_GPIO_Init
 352  0136 85            	popw	x
 354  0137 200b          	jra	L15
 355  0139               L74:
 356                     ; 79 		 GPIO_Init(COMM, GPIO_MODE_OUT_PP_LOW_SLOW);	
 358  0139 4bc0          	push	#192
 359  013b 4b20          	push	#32
 360  013d ae5000        	ldw	x,#20480
 361  0140 cd0000        	call	_GPIO_Init
 363  0143 85            	popw	x
 364  0144               L15:
 365                     ; 83   }
 368  0144 81            	ret
 381                     	xdef	_ioCommSetDir
 382                     	xdef	_ioInit
 383                     	xref	_GPIO_WriteLow
 384                     	xref	_GPIO_Init
 385                     	xref	_EXTI_SetTLISensitivity
 386                     	xref	_EXTI_SetExtIntSensitivity
 405                     	end
