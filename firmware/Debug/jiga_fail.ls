   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  15                     	bsct
  16  0000               _buzzer:
  17  0000 01            	dc.b	1
  18  0001               _flag:
  19  0001 01            	dc.b	1
  20  0002               _j:
  21  0002 0000          	dc.w	0
  53                     ; 29  void failInit(void){
  55                     	switch	.text
  56  0000               _failInit:
  60                     ; 31 	 timerSetOverflowValue(2, TIME_BASE_250MS);
  62  0000 ae00fa        	ldw	x,#250
  63  0003 89            	pushw	x
  64  0004 a602          	ld	a,#2
  65  0006 cd0000        	call	_timerSetOverflowValue
  67  0009 85            	popw	x
  68                     ; 32 	 timerSetOverflowValue(3, TIME_BASE_3S   );
  70  000a ae0bb8        	ldw	x,#3000
  71  000d 89            	pushw	x
  72  000e a603          	ld	a,#3
  73  0010 cd0000        	call	_timerSetOverflowValue
  75  0013 85            	popw	x
  76                     ; 33 	 timerSetOverflowValue(4, TIME_BASE_50MS);
  78  0014 ae0032        	ldw	x,#50
  79  0017 89            	pushw	x
  80  0018 a604          	ld	a,#4
  81  001a cd0000        	call	_timerSetOverflowValue
  83  001d 85            	popw	x
  84                     ; 34 	 timerSetOverflowValue(5, TIME_BASE_1S   );
  86  001e ae03e8        	ldw	x,#1000
  87  0021 89            	pushw	x
  88  0022 a605          	ld	a,#5
  89  0024 cd0000        	call	_timerSetOverflowValue
  91  0027 85            	popw	x
  92                     ; 35 	 timerReset           (2);
  94  0028 a602          	ld	a,#2
  95  002a cd0000        	call	_timerReset
  97                     ; 36 	 timerReset           (3);
  99  002d a603          	ld	a,#3
 100  002f cd0000        	call	_timerReset
 102                     ; 37 	 timerReset           (4);
 104  0032 a604          	ld	a,#4
 105  0034 cd0000        	call	_timerReset
 107                     ; 38 	 timerReset           (5);
 109  0037 a605          	ld	a,#5
 110  0039 cd0000        	call	_timerReset
 112                     ; 39 	 timerEnable          (2, ENABLE);
 114  003c ae0201        	ldw	x,#513
 115  003f cd0000        	call	_timerEnable
 117                     ; 40 	 timerEnable          (3, ENABLE);
 119  0042 ae0301        	ldw	x,#769
 120  0045 cd0000        	call	_timerEnable
 122                     ; 41    timerEnable          (4, DISABLE);
 124  0048 ae0400        	ldw	x,#1024
 125  004b cd0000        	call	_timerEnable
 127                     ; 42 	 timerEnable          (5, ENABLE);
 129  004e ae0501        	ldw	x,#1281
 130  0051 cd0000        	call	_timerEnable
 132                     ; 44   }
 135  0054 81            	ret
 178                     ; 54  void failRun(uint8_t fail_status){
 179                     	switch	.text
 180  0055               _failRun:
 182  0055 88            	push	a
 183       00000000      OFST:	set	0
 186                     ; 56    if(fail_status == 0){
 188  0056 4d            	tnz	a
 189  0057 2640          	jrne	L73
 190                     ; 58 		 j = 0;
 192  0059 5f            	clrw	x
 193  005a bf02          	ldw	_j,x
 194                     ; 60 		 GPIO_WriteLow (RLED);
 196  005c 4b02          	push	#2
 197  005e ae5000        	ldw	x,#20480
 198  0061 cd0000        	call	_GPIO_WriteLow
 200  0064 84            	pop	a
 201                     ; 61 		 GPIO_WriteHigh(GLED);
 203  0065 4b04          	push	#4
 204  0067 ae5000        	ldw	x,#20480
 205  006a cd0000        	call	_GPIO_WriteHigh
 207  006d 84            	pop	a
 208                     ; 63 		 flag = TRUE;
 210  006e 35010001      	mov	_flag,#1
 211                     ; 65 		 if(buzzer){
 213  0072 3d00          	tnz	_buzzer
 214  0074 2721          	jreq	L14
 215                     ; 67 			 GPIO_WriteHigh(BUZZER);
 217  0076 4b02          	push	#2
 218  0078 ae500f        	ldw	x,#20495
 219  007b cd0000        	call	_GPIO_WriteHigh
 221  007e 84            	pop	a
 222                     ; 69 			 timerReset(5);
 224  007f a605          	ld	a,#5
 225  0081 cd0000        	call	_timerReset
 228  0084               L54:
 229                     ; 71 			 while(!timerGetOverflow(5));
 231  0084 a605          	ld	a,#5
 232  0086 cd0000        	call	_timerGetOverflow
 234  0089 4d            	tnz	a
 235  008a 27f8          	jreq	L54
 236                     ; 73 			 GPIO_WriteLow(BUZZER);
 238  008c 4b02          	push	#2
 239  008e ae500f        	ldw	x,#20495
 240  0091 cd0000        	call	_GPIO_WriteLow
 242  0094 84            	pop	a
 243                     ; 75 			 buzzer = FALSE;
 245  0095 3f00          	clr	_buzzer
 246  0097               L14:
 247                     ; 79      return;
 250  0097 84            	pop	a
 251  0098 81            	ret
 252  0099               L73:
 253                     ; 83 	 if(fail_status == 18){
 255  0099 7b01          	ld	a,(OFST+1,sp)
 256  009b a112          	cp	a,#18
 257  009d 2643          	jrne	L15
 258                     ; 85 		 j = 0;
 260  009f 5f            	clrw	x
 261  00a0 bf02          	ldw	_j,x
 262                     ; 87 		 buzzer = TRUE;
 264  00a2 35010000      	mov	_buzzer,#1
 265                     ; 89 		 GPIO_WriteLow (RLED);
 267  00a6 4b02          	push	#2
 268  00a8 ae5000        	ldw	x,#20480
 269  00ab cd0000        	call	_GPIO_WriteLow
 271  00ae 84            	pop	a
 272                     ; 91 		 if(flag){
 274  00af 3d01          	tnz	_flag
 275  00b1 2711          	jreq	L35
 276                     ; 93 			 timerEnable(4, ENABLE);
 278  00b3 ae0401        	ldw	x,#1025
 279  00b6 cd0000        	call	_timerEnable
 281                     ; 95 			 GPIO_WriteHigh(GLED);
 283  00b9 4b04          	push	#4
 284  00bb ae5000        	ldw	x,#20480
 285  00be cd0000        	call	_GPIO_WriteHigh
 287  00c1 84            	pop	a
 288                     ; 97 			 flag = FALSE;
 290  00c2 3f01          	clr	_flag
 291  00c4               L35:
 292                     ; 101 		 if(timerGetOverflow(4)){
 294  00c4 a604          	ld	a,#4
 295  00c6 cd0000        	call	_timerGetOverflow
 297  00c9 4d            	tnz	a
 298  00ca 2714          	jreq	L55
 299                     ; 103 			 GPIO_WriteLow(GLED);
 301  00cc 4b04          	push	#4
 302  00ce ae5000        	ldw	x,#20480
 303  00d1 cd0000        	call	_GPIO_WriteLow
 305  00d4 84            	pop	a
 306                     ; 105 			 timerEnable(4, DISABLE);
 308  00d5 ae0400        	ldw	x,#1024
 309  00d8 cd0000        	call	_timerEnable
 311                     ; 106 			 timerReset (4);
 313  00db a604          	ld	a,#4
 314  00dd cd0000        	call	_timerReset
 316  00e0               L55:
 317                     ; 110 		 return;
 320  00e0 84            	pop	a
 321  00e1 81            	ret
 322  00e2               L15:
 323                     ; 114 	 if((fail_status == 16) || (fail_status == 17)){
 325  00e2 7b01          	ld	a,(OFST+1,sp)
 326  00e4 a110          	cp	a,#16
 327  00e6 2706          	jreq	L16
 329  00e8 7b01          	ld	a,(OFST+1,sp)
 330  00ea a111          	cp	a,#17
 331  00ec 2628          	jrne	L75
 332  00ee               L16:
 333                     ; 116 		 j = 0;
 335  00ee 5f            	clrw	x
 336  00ef bf02          	ldw	_j,x
 337                     ; 118 		 buzzer = TRUE;
 339  00f1 35010000      	mov	_buzzer,#1
 340                     ; 119 		 flag   = TRUE;    
 342  00f5 35010001      	mov	_flag,#1
 343                     ; 121 		 GPIO_WriteLow(GLED);
 345  00f9 4b04          	push	#4
 346  00fb ae5000        	ldw	x,#20480
 347  00fe cd0000        	call	_GPIO_WriteLow
 349  0101 84            	pop	a
 350                     ; 122 		 GPIO_WriteLow(RLED);
 352  0102 4b02          	push	#2
 353  0104 ae5000        	ldw	x,#20480
 354  0107 cd0000        	call	_GPIO_WriteLow
 356  010a 84            	pop	a
 357                     ; 123 		 GPIO_WriteLow(BUZZER);
 359  010b 4b02          	push	#2
 360  010d ae500f        	ldw	x,#20495
 361  0110 cd0000        	call	_GPIO_WriteLow
 363  0113 84            	pop	a
 364                     ; 125 		 return;
 367  0114 84            	pop	a
 368  0115 81            	ret
 369  0116               L75:
 370                     ; 129 	 if((j <= (2 * fail_status - 1))&& timerGetOverflow(2)){
 372  0116 9c            	rvf
 373  0117 7b01          	ld	a,(OFST+1,sp)
 374  0119 5f            	clrw	x
 375  011a 97            	ld	xl,a
 376  011b 58            	sllw	x
 377  011c 5a            	decw	x
 378  011d b302          	cpw	x,_j
 379  011f 2f3e          	jrslt	L36
 381  0121 a602          	ld	a,#2
 382  0123 cd0000        	call	_timerGetOverflow
 384  0126 4d            	tnz	a
 385  0127 2736          	jreq	L36
 386                     ; 131 		 GPIO_WriteLow(GLED);
 388  0129 4b04          	push	#4
 389  012b ae5000        	ldw	x,#20480
 390  012e cd0000        	call	_GPIO_WriteLow
 392  0131 84            	pop	a
 393                     ; 133 		 buzzer = TRUE;
 395  0132 35010000      	mov	_buzzer,#1
 396                     ; 134 		 flag   = TRUE;
 398  0136 35010001      	mov	_flag,#1
 399                     ; 136 		 timerReset(2);
 401  013a a602          	ld	a,#2
 402  013c cd0000        	call	_timerReset
 404                     ; 137 		 timerReset(3);
 406  013f a603          	ld	a,#3
 407  0141 cd0000        	call	_timerReset
 409                     ; 139 		 GPIO_WriteReverse(RLED);
 411  0144 4b02          	push	#2
 412  0146 ae5000        	ldw	x,#20480
 413  0149 cd0000        	call	_GPIO_WriteReverse
 415  014c 84            	pop	a
 416                     ; 140 		 GPIO_WriteReverse(BUZZER);
 418  014d 4b02          	push	#2
 419  014f ae500f        	ldw	x,#20495
 420  0152 cd0000        	call	_GPIO_WriteReverse
 422  0155 84            	pop	a
 423                     ; 142 		 j++;		 
 425  0156 be02          	ldw	x,_j
 426  0158 1c0001        	addw	x,#1
 427  015b bf02          	ldw	_j,x
 429  015d 200b          	jra	L56
 430  015f               L36:
 431                     ; 144 	  }else if(timerGetOverflow(3)){
 433  015f a603          	ld	a,#3
 434  0161 cd0000        	call	_timerGetOverflow
 436  0164 4d            	tnz	a
 437  0165 2703          	jreq	L56
 438                     ; 146 		 j = 0;
 440  0167 5f            	clrw	x
 441  0168 bf02          	ldw	_j,x
 442  016a               L56:
 443                     ; 150   }
 446  016a 84            	pop	a
 447  016b 81            	ret
 511                     	xdef	_j
 512                     	xdef	_flag
 513                     	xdef	_buzzer
 514                     	xdef	_failRun
 515                     	xdef	_failInit
 516                     	xref	_timerGetOverflow
 517                     	xref	_timerSetOverflowValue
 518                     	xref	_timerReset
 519                     	xref	_timerEnable
 520                     	xref	_GPIO_WriteReverse
 521                     	xref	_GPIO_WriteLow
 522                     	xref	_GPIO_WriteHigh
 541                     	end
