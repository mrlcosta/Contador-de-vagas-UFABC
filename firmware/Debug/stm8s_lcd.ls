   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  15                     	bsct
  16  0000               _n:
  17  0000 0000          	dc.w	0
  52                     .const:	section	.text
  53  0000               L6:
  54  0000 0000c350      	dc.l	50000
  55                     ; 31 void lcdInit(void){
  56                     	scross	off
  57                     	switch	.text
  58  0000               _lcdInit:
  62                     ; 34 	 GPIO_WriteLow(LCD_RS);
  64  0000 4b80          	push	#128
  65  0002 ae500f        	ldw	x,#20495
  66  0005 cd0000        	call	_GPIO_WriteLow
  68  0008 84            	pop	a
  69                     ; 35 	 GPIO_WriteLow(LCD_E);   
  71  0009 4b01          	push	#1
  72  000b ae500f        	ldw	x,#20495
  73  000e cd0000        	call	_GPIO_WriteLow
  75  0011 84            	pop	a
  76                     ; 37 	 for(n = 0; n < 50000; n++){ nop(); }
  78  0012 5f            	clrw	x
  79  0013 bf00          	ldw	_n,x
  80  0015               L12:
  84  0015 9d            nop
  89  0016 be00          	ldw	x,_n
  90  0018 1c0001        	addw	x,#1
  91  001b bf00          	ldw	_n,x
  94  001d 9c            	rvf
  95  001e be00          	ldw	x,_n
  96  0020 cd0000        	call	c_uitolx
  98  0023 ae0000        	ldw	x,#L6
  99  0026 cd0000        	call	c_lcmp
 101  0029 2fea          	jrslt	L12
 102                     ; 38 	 for(n = 0; n < 50000; n++){ nop(); }
 104  002b 5f            	clrw	x
 105  002c bf00          	ldw	_n,x
 106  002e               L72:
 110  002e 9d            nop
 115  002f be00          	ldw	x,_n
 116  0031 1c0001        	addw	x,#1
 117  0034 bf00          	ldw	_n,x
 120  0036 9c            	rvf
 121  0037 be00          	ldw	x,_n
 122  0039 cd0000        	call	c_uitolx
 124  003c ae0000        	ldw	x,#L6
 125  003f cd0000        	call	c_lcmp
 127  0042 2fea          	jrslt	L72
 128                     ; 40    lcdWriteNibble(0x03, FALSE);	 
 130  0044 ae0300        	ldw	x,#768
 131  0047 ad7b          	call	_lcdWriteNibble
 133                     ; 41    lcdWriteNibble(0x03, FALSE); 
 135  0049 ae0300        	ldw	x,#768
 136  004c ad76          	call	_lcdWriteNibble
 138                     ; 43    lcdWrite(0x02, FALSE); //set to 4 bit interface, 1 line and 5*7 font
 140  004e ae0200        	ldw	x,#512
 141  0051 ad49          	call	_lcdWrite
 143                     ; 44    lcdWrite(0x28, FALSE); //set to 4 bit interface, 2 line and 5*10 font
 145  0053 ae2800        	ldw	x,#10240
 146  0056 ad44          	call	_lcdWrite
 148                     ; 45    lcdWrite(0x0C, FALSE); //set to 4 bit interface, 2 line and 5*7 font
 150  0058 ae0c00        	ldw	x,#3072
 151  005b ad3f          	call	_lcdWrite
 153                     ; 46    lcdWrite(0x01, FALSE); //clear display
 155  005d ae0100        	ldw	x,#256
 156  0060 ad3a          	call	_lcdWrite
 158                     ; 47    lcdWrite(0x06, FALSE); //move cursor right after write
 160  0062 ae0600        	ldw	x,#1536
 161  0065 ad35          	call	_lcdWrite
 163                     ; 49   }
 166  0067 81            	ret
 201                     ; 60 void lcdSetLine(uint8_t line){
 202                     	switch	.text
 203  0068               _lcdSetLine:
 207                     ; 62    switch(line){
 210                     ; 82 		 break;
 211  0068 4a            	dec	a
 212  0069 2710          	jreq	L53
 213  006b 4a            	dec	a
 214  006c 2714          	jreq	L73
 215  006e 4a            	dec	a
 216  006f 2718          	jreq	L14
 217  0071 4a            	dec	a
 218  0072 271c          	jreq	L34
 219  0074               L54:
 220                     ; 80 		 default:
 220                     ; 81 		 lcdWrite(LINE_1, FALSE);
 222  0074 ae8000        	ldw	x,#32768
 223  0077 ad23          	call	_lcdWrite
 225                     ; 82 		 break;
 227  0079 201a          	jra	L76
 228  007b               L53:
 229                     ; 64 		 case 1:
 229                     ; 65      lcdWrite(LINE_1, FALSE);
 231  007b ae8000        	ldw	x,#32768
 232  007e ad1c          	call	_lcdWrite
 234                     ; 66      break;
 236  0080 2013          	jra	L76
 237  0082               L73:
 238                     ; 68      case 2:
 238                     ; 69      lcdWrite(LINE_2, FALSE);
 240  0082 aec000        	ldw	x,#49152
 241  0085 ad15          	call	_lcdWrite
 243                     ; 70      break;
 245  0087 200c          	jra	L76
 246  0089               L14:
 247                     ; 72      case 3:
 247                     ; 73      lcdWrite(LINE_3, FALSE);
 249  0089 ae9000        	ldw	x,#36864
 250  008c ad0e          	call	_lcdWrite
 252                     ; 74      break;
 254  008e 2005          	jra	L76
 255  0090               L34:
 256                     ; 76      case 4:
 256                     ; 77      lcdWrite(LINE_4, FALSE);
 258  0090 aed000        	ldw	x,#53248
 259  0093 ad07          	call	_lcdWrite
 261                     ; 78      break;
 263  0095               L76:
 264                     ; 85   }
 267  0095 81            	ret
 291                     ; 96 void lcdClear(void){
 292                     	switch	.text
 293  0096               _lcdClear:
 297                     ; 98 	 lcdWrite(0x01, FALSE);
 299  0096 ae0100        	ldw	x,#256
 300  0099 ad01          	call	_lcdWrite
 302                     ; 100   }
 305  009b 81            	ret
 351                     ; 112 void lcdWrite(uint8_t data, uint8_t type){
 352                     	switch	.text
 353  009c               _lcdWrite:
 355  009c 89            	pushw	x
 356       00000000      OFST:	set	0
 359                     ; 114    for(n = 0; n < 600; n++){ nop(); }
 361  009d 5f            	clrw	x
 362  009e bf00          	ldw	_n,x
 363  00a0               L321:
 367  00a0 9d            nop
 372  00a1 be00          	ldw	x,_n
 373  00a3 1c0001        	addw	x,#1
 374  00a6 bf00          	ldw	_n,x
 377  00a8 be00          	ldw	x,_n
 378  00aa a30258        	cpw	x,#600
 379  00ad 25f1          	jrult	L321
 380                     ; 116    lcdWriteNibble(data >> 4, type); //WRITE THE UPPER NIBBLE
 382  00af 7b02          	ld	a,(OFST+2,sp)
 383  00b1 97            	ld	xl,a
 384  00b2 7b01          	ld	a,(OFST+1,sp)
 385  00b4 4e            	swap	a
 386  00b5 a40f          	and	a,#15
 387  00b7 95            	ld	xh,a
 388  00b8 ad0a          	call	_lcdWriteNibble
 390                     ; 117 	 lcdWriteNibble(data,      type); //WRITE THE LOWER NIBBLE
 392  00ba 7b02          	ld	a,(OFST+2,sp)
 393  00bc 97            	ld	xl,a
 394  00bd 7b01          	ld	a,(OFST+1,sp)
 395  00bf 95            	ld	xh,a
 396  00c0 ad02          	call	_lcdWriteNibble
 398                     ; 119   }
 401  00c2 85            	popw	x
 402  00c3 81            	ret
 448                     ; 131 void lcdWriteNibble(uint8_t data, uint8_t type){
 449                     	switch	.text
 450  00c4               _lcdWriteNibble:
 452  00c4 89            	pushw	x
 453       00000000      OFST:	set	0
 456                     ; 133    GPIO_Write(LCD_PORT, (data << 2) & 0x3C);
 458  00c5 9e            	ld	a,xh
 459  00c6 48            	sll	a
 460  00c7 48            	sll	a
 461  00c8 a43c          	and	a,#60
 462  00ca 88            	push	a
 463  00cb ae500f        	ldw	x,#20495
 464  00ce cd0000        	call	_GPIO_Write
 466  00d1 84            	pop	a
 467                     ; 135 	 if(type == 0){ 
 469  00d2 0d02          	tnz	(OFST+2,sp)
 470  00d4 260b          	jrne	L351
 471                     ; 137 		 GPIO_WriteLow(LCD_RS);
 473  00d6 4b80          	push	#128
 474  00d8 ae500f        	ldw	x,#20495
 475  00db cd0000        	call	_GPIO_WriteLow
 477  00de 84            	pop	a
 479  00df 2009          	jra	L551
 480  00e1               L351:
 481                     ; 141 		 GPIO_WriteHigh(LCD_RS);
 483  00e1 4b80          	push	#128
 484  00e3 ae500f        	ldw	x,#20495
 485  00e6 cd0000        	call	_GPIO_WriteHigh
 487  00e9 84            	pop	a
 488  00ea               L551:
 489                     ; 145     GPIO_WriteHigh(LCD_E);    
 491  00ea 4b01          	push	#1
 492  00ec ae500f        	ldw	x,#20495
 493  00ef cd0000        	call	_GPIO_WriteHigh
 495  00f2 84            	pop	a
 496                     ; 146 		GPIO_WriteLow (LCD_E);
 498  00f3 4b01          	push	#1
 499  00f5 ae500f        	ldw	x,#20495
 500  00f8 cd0000        	call	_GPIO_WriteLow
 502  00fb 84            	pop	a
 503                     ; 148   }
 506  00fc 85            	popw	x
 507  00fd 81            	ret
 543                     ; 159  void lcdWriteString(const uint8_t *string){
 544                     	switch	.text
 545  00fe               _lcdWriteString:
 547  00fe 89            	pushw	x
 548       00000000      OFST:	set	0
 551  00ff 2011          	jra	L771
 552  0101               L571:
 553                     ; 163 		 lcdWrite(*string++, TRUE);
 555  0101 1e01          	ldw	x,(OFST+1,sp)
 556  0103 1c0001        	addw	x,#1
 557  0106 1f01          	ldw	(OFST+1,sp),x
 558  0108 1d0001        	subw	x,#1
 559  010b f6            	ld	a,(x)
 560  010c ae0001        	ldw	x,#1
 561  010f 95            	ld	xh,a
 562  0110 ad8a          	call	_lcdWrite
 564  0112               L771:
 565                     ; 161 	 while(*string){
 567  0112 1e01          	ldw	x,(OFST+1,sp)
 568  0114 7d            	tnz	(x)
 569  0115 26ea          	jrne	L571
 570                     ; 167   }
 573  0117 85            	popw	x
 574  0118 81            	ret
 598                     	xdef	_n
 599                     	xdef	_lcdWriteString
 600                     	xdef	_lcdWriteNibble
 601                     	xdef	_lcdWrite
 602                     	xdef	_lcdClear
 603                     	xdef	_lcdSetLine
 604                     	xdef	_lcdInit
 605                     	xref	_GPIO_WriteLow
 606                     	xref	_GPIO_WriteHigh
 607                     	xref	_GPIO_Write
 626                     	xref	c_lcmp
 627                     	xref	c_uitolx
 628                     	end
