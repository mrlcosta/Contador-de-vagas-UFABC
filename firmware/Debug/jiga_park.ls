   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  15                     	bsct
  16  0000               _fail_status:
  17  0000 11            	dc.b	17
  18  0001               _test_state:
  19  0001 00            	dc.b	0
  20  0002               _pgrm_state:
  21  0002 00            	dc.b	0
  22  0003               _tilt_state:
  23  0003 00            	dc.b	0
  24  0004               _conf_state:
  25  0004 00            	dc.b	0
  26  0005               _stack:
  27  0005 00            	dc.b	0
  28  0006               _deboucing:
  29  0006 00            	dc.b	0
  30  0007               _px:
  31  0007 00            	dc.b	0
  32  0008               _rx:
  33  0008 00            	dc.b	0
  34  0009               _delay:
  35  0009 0000          	dc.w	0
  36  000b               _aux:
  37  000b 0000          	dc.w	0
  38  000d               _pulse:
  39  000d 0000          	dc.w	0
  40  000f               _p_input:
  41  000f 0000          	dc.w	0
  42  0011               _input_addr:
  43  0011 0000          	dc.w	0
  44  0013               _time:
  45  0013 00000000      	dc.l	0
  88                     ; 44  void testSetInputAddress(uint16_t * inputAddr){
  90                     	switch	.text
  91  0000               _testSetInputAddress:
  95                     ; 46 	 input_addr = inputAddr;
  97  0000 bf11          	ldw	_input_addr,x
  98                     ; 48   }
 101  0002 81            	ret
 153                     .const:	section	.text
 154  0000               L01:
 155  0000 0003a980      	dc.l	240000
 156  0004               L21:
 157  0004 0006b6c1      	dc.l	440001
 158  0008               L61:
 159  0008 0014          	dc.w	L72
 160  000a 0091          	dc.w	L13
 161  000c 0157          	dc.w	L14
 162  000e 026c          	dc.w	L54
 163  0010 01cb          	dc.w	L34
 164  0012 039b          	dc.w	L15
 165  0014 0485          	dc.w	L35
 166  0016 0ae9          	dc.w	L741
 167  0018 032f          	dc.w	L74
 168  001a 055f          	dc.w	L55
 169  001c 09c5          	dc.w	L121
 170  001e 0606          	dc.w	L17
 171  0020 0667          	dc.w	L37
 172  0022 06c2          	dc.w	L57
 173  0024 071d          	dc.w	L77
 174  0026 0778          	dc.w	L101
 175  0028 07d3          	dc.w	L301
 176  002a 082e          	dc.w	L501
 177  002c 08a8          	dc.w	L701
 178  002e 090c          	dc.w	L111
 179  0030 0a72          	dc.w	L131
 180  0032 0ade          	dc.w	L331
 181                     ; 57  void testRun(){
 182                     	switch	.text
 183  0003               _testRun:
 187                     ; 59 	 switch (test_state){
 189  0003 b601          	ld	a,_test_state
 191                     ; 958 		 break;
 192  0005 a116          	cp	a,#22
 193  0007 2407          	jruge	L41
 194  0009 5f            	clrw	x
 195  000a 97            	ld	xl,a
 196  000b 58            	sllw	x
 197  000c de0008        	ldw	x,(L61,x)
 198  000f fc            	jp	(x)
 199  0010               L41:
 200  0010 ace90ae9      	jpf	L741
 201  0014               L72:
 202                     ; 62 		 case TEST_IDLE:
 202                     ; 63 			
 202                     ; 64 		 if(*(input_addr + PCI_ADDR) > 1000){
 204  0014 be11          	ldw	x,_input_addr
 205  0016 9093          	ldw	y,x
 206  0018 90ee10        	ldw	y,(16,y)
 207  001b 90a303e9      	cpw	y,#1001
 208  001f 2505          	jrult	L151
 209                     ; 66 			 fail_status = PCI_FAIL;
 211  0021 35110000      	mov	_fail_status,#17
 212                     ; 68 			 return;
 215  0025 81            	ret
 216  0026               L151:
 217                     ; 72 		 if(GPIO_ReadInputPin(BOTAO_START) == FALSE){
 219  0026 4b20          	push	#32
 220  0028 ae5000        	ldw	x,#20480
 221  002b cd0000        	call	_GPIO_ReadInputPin
 223  002e 5b01          	addw	sp,#1
 224  0030 4d            	tnz	a
 225  0031 2642          	jrne	L351
 226                     ; 74 			 if(!deboucing){
 228  0033 3d06          	tnz	_deboucing
 229  0035 261a          	jrne	L551
 230                     ; 76 				 timerReset           (1);
 232  0037 a601          	ld	a,#1
 233  0039 cd0000        	call	_timerReset
 235                     ; 77 		     timerSetOverflowValue(1, TIME_BASE_DEBOUCING);
 237  003c ae0064        	ldw	x,#100
 238  003f 89            	pushw	x
 239  0040 a601          	ld	a,#1
 240  0042 cd0000        	call	_timerSetOverflowValue
 242  0045 85            	popw	x
 243                     ; 78 		     timerEnable          (1, ENABLE); 
 245  0046 ae0101        	ldw	x,#257
 246  0049 cd0000        	call	_timerEnable
 248                     ; 80 				 deboucing = TRUE;
 250  004c 35010006      	mov	_deboucing,#1
 251                     ; 82 			   return;		
 254  0050 81            	ret
 255  0051               L551:
 256                     ; 86 				if(timerGetOverflow(1)){
 258  0051 a601          	ld	a,#1
 259  0053 cd0000        	call	_timerGetOverflow
 261  0056 4d            	tnz	a
 262  0057 2603          	jrne	L02
 263  0059 cc0ae9        	jp	L741
 264  005c               L02:
 265                     ; 88 				 timerEnable(1,DISABLE);
 267  005c ae0100        	ldw	x,#256
 268  005f cd0000        	call	_timerEnable
 270                     ; 89 			   timerReset (1);
 272  0062 a601          	ld	a,#1
 273  0064 cd0000        	call	_timerReset
 275                     ; 91 				 deboucing   = FALSE;
 277  0067 3f06          	clr	_deboucing
 278                     ; 93 				 test_state  = TEST_CONFIG_AC;
 280  0069 35020001      	mov	_test_state,#2
 281                     ; 95 				 fail_status = TESTING;
 283  006d 35100000      	mov	_fail_status,#16
 284  0071 ace90ae9      	jpf	L741
 285  0075               L351:
 286                     ; 101 			 if(timerGetOverflow(1)){
 288  0075 a601          	ld	a,#1
 289  0077 cd0000        	call	_timerGetOverflow
 291  007a 4d            	tnz	a
 292  007b 2603          	jrne	L22
 293  007d cc0ae9        	jp	L741
 294  0080               L22:
 295                     ; 103 				 timerEnable(1,DISABLE);
 297  0080 ae0100        	ldw	x,#256
 298  0083 cd0000        	call	_timerEnable
 300                     ; 104 			   timerReset (1);
 302  0086 a601          	ld	a,#1
 303  0088 cd0000        	call	_timerReset
 305                     ; 106 				 deboucing = FALSE;
 307  008b 3f06          	clr	_deboucing
 308  008d ace90ae9      	jpf	L741
 309  0091               L13:
 310                     ; 113 		 case TEST_DOWNLOAD: 
 310                     ; 114 		 
 310                     ; 115 		 fail_status = TESTING;
 312  0091 35100000      	mov	_fail_status,#16
 313                     ; 117 		 switch(pgrm_state){
 315  0095 b602          	ld	a,_pgrm_state
 317                     ; 192 			 break;
 318  0097 4d            	tnz	a
 319  0098 270a          	jreq	L33
 320  009a 4a            	dec	a
 321  009b 272d          	jreq	L53
 322  009d 4a            	dec	a
 323  009e 2769          	jreq	L73
 324  00a0 ace90ae9      	jpf	L741
 325  00a4               L33:
 326                     ; 119 			 case PGRM_IDLE:
 326                     ; 120 			 
 326                     ; 121 			 jumperEnable(1, ENABLE);
 328  00a4 ae0101        	ldw	x,#257
 329  00a7 cd0daa        	call	_jumperEnable
 331                     ; 122 		   jumperEnable(2, ENABLE);
 333  00aa ae0201        	ldw	x,#513
 334  00ad cd0daa        	call	_jumperEnable
 336                     ; 124 			 GPIO_WriteHigh(L30);			 
 338  00b0 4b10          	push	#16
 339  00b2 ae5000        	ldw	x,#20480
 340  00b5 cd0000        	call	_GPIO_WriteHigh
 342  00b8 84            	pop	a
 343                     ; 125 			 GPIO_WriteHigh(GRAVADOR);
 345  00b9 4b08          	push	#8
 346  00bb ae500f        	ldw	x,#20495
 347  00be cd0000        	call	_GPIO_WriteHigh
 349  00c1 84            	pop	a
 350                     ; 127 			 pgrm_state = PGRM_DOWNLOADING;
 352  00c2 35010002      	mov	_pgrm_state,#1
 353                     ; 129 			 break;
 355  00c6 ace90ae9      	jpf	L741
 356  00ca               L53:
 357                     ; 131 			 case PGRM_DOWNLOADING:
 357                     ; 132 			 
 357                     ; 133 			 if(timerDelay(TIME_BASE_5S)){
 359  00ca ae1388        	ldw	x,#5000
 360  00cd cd0000        	call	_timerDelay
 362  00d0 4d            	tnz	a
 363  00d1 2603          	jrne	L42
 364  00d3 cc0ae9        	jp	L741
 365  00d6               L42:
 366                     ; 135 				 if(GPIO_ReadInputPin(GRAVADOR_STATUS) == FALSE){
 368  00d6 4b40          	push	#64
 369  00d8 ae500f        	ldw	x,#20495
 370  00db cd0000        	call	_GPIO_ReadInputPin
 372  00de 5b01          	addw	sp,#1
 373  00e0 4d            	tnz	a
 374  00e1 2608          	jrne	L371
 375                     ; 137 					 pgrm_state = PGRM_FINISH;
 377  00e3 35020002      	mov	_pgrm_state,#2
 379  00e7 ace90ae9      	jpf	L741
 380  00eb               L371:
 381                     ; 141 					 pgrm_state  = PGRM_IDLE;
 383  00eb 3f02          	clr	_pgrm_state
 384                     ; 142 					 test_state  = TEST_IDLE;           
 386  00ed 3f01          	clr	_test_state
 387                     ; 143 					 fail_status = DOWNLOAD_FAIL;
 389  00ef 35010000      	mov	_fail_status,#1
 390                     ; 145            GPIO_WriteLow(L30);
 392  00f3 4b10          	push	#16
 393  00f5 ae5000        	ldw	x,#20480
 394  00f8 cd0000        	call	_GPIO_WriteLow
 396  00fb 84            	pop	a
 397                     ; 146 					 GPIO_WriteLow(GRAVADOR);
 399  00fc 4b08          	push	#8
 400  00fe ae500f        	ldw	x,#20495
 401  0101 cd0000        	call	_GPIO_WriteLow
 403  0104 84            	pop	a
 404  0105 ace90ae9      	jpf	L741
 405  0109               L73:
 406                     ; 154 			 case PGRM_FINISH:
 406                     ; 155 			 
 406                     ; 156 			 if(timerDelay(TIME_BASE_5S)){
 408  0109 ae1388        	ldw	x,#5000
 409  010c cd0000        	call	_timerDelay
 411  010f 4d            	tnz	a
 412  0110 2603          	jrne	L62
 413  0112 cc0ae9        	jp	L741
 414  0115               L62:
 415                     ; 158 				 if(GPIO_ReadInputPin(GRAVADOR_STATUS) == FALSE){
 417  0115 4b40          	push	#64
 418  0117 ae500f        	ldw	x,#20495
 419  011a cd0000        	call	_GPIO_ReadInputPin
 421  011d 5b01          	addw	sp,#1
 422  011f 4d            	tnz	a
 423  0120 2608          	jrne	L102
 424                     ; 160 					 fail_status = DOWNLOAD_FAIL;					 
 426  0122 35010000      	mov	_fail_status,#1
 427                     ; 161 					 test_state  = TEST_IDLE; 
 429  0126 3f01          	clr	_test_state
 431  0128 2011          	jra	L302
 432  012a               L102:
 433                     ; 176 					 delay       = TIME_BASE_1S;
 435  012a ae03e8        	ldw	x,#1000
 436  012d bf09          	ldw	_delay,x
 437                     ; 177 					 stack       = TEST_CONFIG_AC;
 439  012f 35020005      	mov	_stack,#2
 440                     ; 178 					 test_state  = WAIT;				 
 442  0133 35150001      	mov	_test_state,#21
 443                     ; 179 					 fail_status = APROVED;	
 445  0137 35120000      	mov	_fail_status,#18
 446  013b               L302:
 447                     ; 185 					pgrm_state = PGRM_IDLE;
 449  013b 3f02          	clr	_pgrm_state
 450                     ; 187 					GPIO_WriteLow(L30);
 452  013d 4b10          	push	#16
 453  013f ae5000        	ldw	x,#20480
 454  0142 cd0000        	call	_GPIO_WriteLow
 456  0145 84            	pop	a
 457                     ; 188 					GPIO_WriteLow(GRAVADOR);
 459  0146 4b08          	push	#8
 460  0148 ae500f        	ldw	x,#20495
 461  014b cd0000        	call	_GPIO_WriteLow
 463  014e 84            	pop	a
 464  014f ace90ae9      	jpf	L741
 465  0153               L761:
 466                     ; 196 			break;
 468  0153 ace90ae9      	jpf	L741
 469  0157               L14:
 470                     ; 200 		 case TEST_CONFIG_AC:
 470                     ; 201 		 
 470                     ; 202 		 jumperEnable(1, ENABLE);
 472  0157 ae0101        	ldw	x,#257
 473  015a cd0daa        	call	_jumperEnable
 475                     ; 203 		 jumperEnable(2, ENABLE);
 477  015d ae0201        	ldw	x,#513
 478  0160 cd0daa        	call	_jumperEnable
 480                     ; 205 		 GPIO_WriteLow (OPEN_P);
 482  0163 4b08          	push	#8
 483  0165 ae500a        	ldw	x,#20490
 484  0168 cd0000        	call	_GPIO_WriteLow
 486  016b 84            	pop	a
 487                     ; 206 		 GPIO_WriteLow (CLOSE_P);		 
 489  016c 4b20          	push	#32
 490  016e ae500a        	ldw	x,#20490
 491  0171 cd0000        	call	_GPIO_WriteLow
 493  0174 84            	pop	a
 494                     ; 207 		 GPIO_WriteHigh(CMD_UP);	
 496  0175 4b01          	push	#1
 497  0177 ae500f        	ldw	x,#20495
 498  017a cd0000        	call	_GPIO_WriteHigh
 500  017d 84            	pop	a
 501                     ; 208 		 GPIO_WriteHigh(OPEN_N);
 503  017e 4b02          	push	#2
 504  0180 ae501e        	ldw	x,#20510
 505  0183 cd0000        	call	_GPIO_WriteHigh
 507  0186 84            	pop	a
 508                     ; 209 		 GPIO_WriteHigh(CLOSE_N);
 510  0187 4b01          	push	#1
 511  0189 ae501e        	ldw	x,#20510
 512  018c cd0000        	call	_GPIO_WriteHigh
 514  018f 84            	pop	a
 515                     ; 210 		 GPIO_WriteHigh(L30);
 517  0190 4b10          	push	#16
 518  0192 ae5000        	ldw	x,#20480
 519  0195 cd0000        	call	_GPIO_WriteHigh
 521  0198 84            	pop	a
 522                     ; 212 		 if(*(input_addr + PK5_6_ADDR) > 4000){
 524  0199 be11          	ldw	x,_input_addr
 525  019b 9093          	ldw	y,x
 526  019d 90ee0c        	ldw	y,(12,y)
 527  01a0 90a30fa1      	cpw	y,#4001
 528  01a4 250b          	jrult	L502
 529                     ; 214 			 GPIO_WriteHigh(CMD_DOWN);
 531  01a6 4b04          	push	#4
 532  01a8 ae500f        	ldw	x,#20495
 533  01ab cd0000        	call	_GPIO_WriteHigh
 535  01ae 84            	pop	a
 537  01af 2009          	jra	L702
 538  01b1               L502:
 539                     ; 218 			 GPIO_WriteLow(CMD_DOWN);	
 541  01b1 4b04          	push	#4
 542  01b3 ae500f        	ldw	x,#20495
 543  01b6 cd0000        	call	_GPIO_WriteLow
 545  01b9 84            	pop	a
 546  01ba               L702:
 547                     ; 222 		 delay      = TIME_BASE_5S;
 549  01ba ae1388        	ldw	x,#5000
 550  01bd bf09          	ldw	_delay,x
 551                     ; 223 		 stack      = TEST_CMD_CLOSE;
 553  01bf 35040005      	mov	_stack,#4
 554                     ; 224 		 test_state = WAIT;
 556  01c3 35150001      	mov	_test_state,#21
 557                     ; 226 		 break;
 559  01c7 ace90ae9      	jpf	L741
 560  01cb               L34:
 561                     ; 228 		 case TEST_CMD_CLOSE:
 561                     ; 229 		 
 561                     ; 230 		 fail_status = TESTING;
 563  01cb 35100000      	mov	_fail_status,#16
 564                     ; 232 		 GPIO_WriteLow (CLOSE_N);	
 566  01cf 4b01          	push	#1
 567  01d1 ae501e        	ldw	x,#20510
 568  01d4 cd0000        	call	_GPIO_WriteLow
 570  01d7 84            	pop	a
 571                     ; 233 		 GPIO_WriteHigh(CLOSE_P);
 573  01d8 4b20          	push	#32
 574  01da ae500a        	ldw	x,#20490
 575  01dd cd0000        	call	_GPIO_WriteHigh
 577  01e0 84            	pop	a
 578                     ; 235 		 if(timerDelay(TIME_BASE_2S)){
 580  01e1 ae07d0        	ldw	x,#2000
 581  01e4 cd0000        	call	_timerDelay
 583  01e7 4d            	tnz	a
 584  01e8 2603          	jrne	L03
 585  01ea cc0ae9        	jp	L741
 586  01ed               L03:
 587                     ; 237 			 if((*(input_addr + NOPC_ADDR) < 4500) || 
 587                     ; 238 			    (*(input_addr + NCPO_ADDR) > 1000) ||
 587                     ; 239 					(*(input_addr + OUTN_ADDR) < 1000) ||
 587                     ; 240 					(*(input_addr + TEMP_ADDR) > 4500)){
 589  01ed be11          	ldw	x,_input_addr
 590  01ef 9093          	ldw	y,x
 591  01f1 90ee12        	ldw	y,(18,y)
 592  01f4 90a31194      	cpw	y,#4500
 593  01f8 2526          	jrult	L512
 595  01fa be11          	ldw	x,_input_addr
 596  01fc 9093          	ldw	y,x
 597  01fe 90fe          	ldw	y,(y)
 598  0200 90a303e9      	cpw	y,#1001
 599  0204 241a          	jruge	L512
 601  0206 be11          	ldw	x,_input_addr
 602  0208 9093          	ldw	y,x
 603  020a 90ee08        	ldw	y,(8,y)
 604  020d 90a303e8      	cpw	y,#1000
 605  0211 250d          	jrult	L512
 607  0213 be11          	ldw	x,_input_addr
 608  0215 9093          	ldw	y,x
 609  0217 90ee04        	ldw	y,(4,y)
 610  021a 90a31195      	cpw	y,#4501
 611  021e 2525          	jrult	L312
 612  0220               L512:
 613                     ; 242 				 fail_status = CMD_CLOSE_FAIL;				 
 615  0220 35020000      	mov	_fail_status,#2
 616                     ; 243 				 test_state  = TEST_IDLE;
 618  0224 3f01          	clr	_test_state
 619                     ; 245 				 GPIO_WriteLow (L30);
 621  0226 4b10          	push	#16
 622  0228 ae5000        	ldw	x,#20480
 623  022b cd0000        	call	_GPIO_WriteLow
 625  022e 84            	pop	a
 626                     ; 246 				 GPIO_WriteLow (CLOSE_P);
 628  022f 4b20          	push	#32
 629  0231 ae500a        	ldw	x,#20490
 630  0234 cd0000        	call	_GPIO_WriteLow
 632  0237 84            	pop	a
 633                     ; 247 		     GPIO_WriteHigh(CLOSE_N);		
 635  0238 4b01          	push	#1
 636  023a ae501e        	ldw	x,#20510
 637  023d cd0000        	call	_GPIO_WriteHigh
 639  0240 84            	pop	a
 641  0241 ace90ae9      	jpf	L741
 642  0245               L312:
 643                     ; 251 				 GPIO_WriteLow (CLOSE_P);
 645  0245 4b20          	push	#32
 646  0247 ae500a        	ldw	x,#20490
 647  024a cd0000        	call	_GPIO_WriteLow
 649  024d 84            	pop	a
 650                     ; 252 		     GPIO_WriteHigh(CLOSE_N);		
 652  024e 4b01          	push	#1
 653  0250 ae501e        	ldw	x,#20510
 654  0253 cd0000        	call	_GPIO_WriteHigh
 656  0256 84            	pop	a
 657                     ; 254 				 delay       = TIME_BASE_2S;
 659  0257 ae07d0        	ldw	x,#2000
 660  025a bf09          	ldw	_delay,x
 661                     ; 255 				 stack       = TEST_CMD_OPEN;
 663  025c 35030005      	mov	_stack,#3
 664                     ; 256 				 test_state  = WAIT;
 666  0260 35150001      	mov	_test_state,#21
 667                     ; 257 				 fail_status = APROVED;
 669  0264 35120000      	mov	_fail_status,#18
 670  0268 ace90ae9      	jpf	L741
 671  026c               L54:
 672                     ; 265 		 case TEST_CMD_OPEN:
 672                     ; 266 		 
 672                     ; 267 		 fail_status = TESTING;
 674  026c 35100000      	mov	_fail_status,#16
 675                     ; 269 		 GPIO_WriteLow (OPEN_N);
 677  0270 4b02          	push	#2
 678  0272 ae501e        	ldw	x,#20510
 679  0275 cd0000        	call	_GPIO_WriteLow
 681  0278 84            	pop	a
 682                     ; 270 		 GPIO_WriteHigh(OPEN_P);
 684  0279 4b08          	push	#8
 685  027b ae500a        	ldw	x,#20490
 686  027e cd0000        	call	_GPIO_WriteHigh
 688  0281 84            	pop	a
 689                     ; 272 		 if(timerDelay(TIME_BASE_2S)){
 691  0282 ae07d0        	ldw	x,#2000
 692  0285 cd0000        	call	_timerDelay
 694  0288 4d            	tnz	a
 695  0289 2603          	jrne	L23
 696  028b cc0ae9        	jp	L741
 697  028e               L23:
 698                     ; 274 			 if((*(input_addr + NOPC_ADDR) > 1000) ||
 698                     ; 275    			  (*(input_addr + NCPO_ADDR) < 4500) ||
 698                     ; 276 					(*(input_addr + OUTN_ADDR) < 1000) ||
 698                     ; 277 					(*(input_addr + TEMP_ADDR) > 4500)){
 700  028e be11          	ldw	x,_input_addr
 701  0290 9093          	ldw	y,x
 702  0292 90ee12        	ldw	y,(18,y)
 703  0295 90a303e9      	cpw	y,#1001
 704  0299 2426          	jruge	L132
 706  029b be11          	ldw	x,_input_addr
 707  029d 9093          	ldw	y,x
 708  029f 90fe          	ldw	y,(y)
 709  02a1 90a31194      	cpw	y,#4500
 710  02a5 251a          	jrult	L132
 712  02a7 be11          	ldw	x,_input_addr
 713  02a9 9093          	ldw	y,x
 714  02ab 90ee08        	ldw	y,(8,y)
 715  02ae 90a303e8      	cpw	y,#1000
 716  02b2 250d          	jrult	L132
 718  02b4 be11          	ldw	x,_input_addr
 719  02b6 9093          	ldw	y,x
 720  02b8 90ee04        	ldw	y,(4,y)
 721  02bb 90a31195      	cpw	y,#4501
 722  02bf 2525          	jrult	L722
 723  02c1               L132:
 724                     ; 279 				 fail_status = CMD_OPEN_FAIL;				 
 726  02c1 35030000      	mov	_fail_status,#3
 727                     ; 280 				 test_state  = TEST_IDLE;
 729  02c5 3f01          	clr	_test_state
 730                     ; 282 				 GPIO_WriteLow(L30);
 732  02c7 4b10          	push	#16
 733  02c9 ae5000        	ldw	x,#20480
 734  02cc cd0000        	call	_GPIO_WriteLow
 736  02cf 84            	pop	a
 737                     ; 283 				 GPIO_WriteLow (OPEN_P);
 739  02d0 4b08          	push	#8
 740  02d2 ae500a        	ldw	x,#20490
 741  02d5 cd0000        	call	_GPIO_WriteLow
 743  02d8 84            	pop	a
 744                     ; 284 		     GPIO_WriteHigh(OPEN_N);
 746  02d9 4b02          	push	#2
 747  02db ae501e        	ldw	x,#20510
 748  02de cd0000        	call	_GPIO_WriteHigh
 750  02e1 84            	pop	a
 752  02e2 ace90ae9      	jpf	L741
 753  02e6               L722:
 754                     ; 288 					GPIO_WriteLow (OPEN_P);
 756  02e6 4b08          	push	#8
 757  02e8 ae500a        	ldw	x,#20490
 758  02eb cd0000        	call	_GPIO_WriteLow
 760  02ee 84            	pop	a
 761                     ; 289 		      GPIO_WriteHigh(OPEN_N);
 763  02ef 4b02          	push	#2
 764  02f1 ae501e        	ldw	x,#20510
 765  02f4 cd0000        	call	_GPIO_WriteHigh
 767  02f7 84            	pop	a
 768                     ; 290 					GPIO_WriteHigh(CMD_DOWN);
 770  02f8 4b04          	push	#4
 771  02fa ae500f        	ldw	x,#20495
 772  02fd cd0000        	call	_GPIO_WriteHigh
 774  0300 84            	pop	a
 775                     ; 292 					delay       = TIME_BASE_2S;
 777  0301 ae07d0        	ldw	x,#2000
 778  0304 bf09          	ldw	_delay,x
 779                     ; 293 					stack       = TEST_CMD_UP;
 781  0306 35050005      	mov	_stack,#5
 782                     ; 294 					test_state  = WAIT;
 784  030a 35150001      	mov	_test_state,#21
 785                     ; 295 					fail_status = APROVED;
 787  030e 35120000      	mov	_fail_status,#18
 788                     ; 298          if(*(input_addr + PK5_6_ADDR) > 4000){
 790  0312 be11          	ldw	x,_input_addr
 791  0314 9093          	ldw	y,x
 792  0316 90ee0c        	ldw	y,(12,y)
 793  0319 90a30fa1      	cpw	y,#4001
 794  031d 2403          	jruge	L43
 795  031f cc0ae9        	jp	L741
 796  0322               L43:
 797                     ; 300 					 GPIO_WriteLow(CMD_UP);
 799  0322 4b01          	push	#1
 800  0324 ae500f        	ldw	x,#20495
 801  0327 cd0000        	call	_GPIO_WriteLow
 803  032a 84            	pop	a
 804  032b ace90ae9      	jpf	L741
 805  032f               L74:
 806                     ; 311      case TEST_IGN:
 806                     ; 312 		 
 806                     ; 313 		 fail_status = TESTING;
 808  032f 35100000      	mov	_fail_status,#16
 809                     ; 315 		 GPIO_WriteHigh(IGN);
 811  0333 4b08          	push	#8
 812  0335 ae5000        	ldw	x,#20480
 813  0338 cd0000        	call	_GPIO_WriteHigh
 815  033b 84            	pop	a
 816                     ; 317 		 if(timerDelay(TIME_BASE_2S)){
 818  033c ae07d0        	ldw	x,#2000
 819  033f cd0000        	call	_timerDelay
 821  0342 4d            	tnz	a
 822  0343 2603          	jrne	L63
 823  0345 cc0ae9        	jp	L741
 824  0348               L63:
 825                     ; 319 			 if((*(input_addr + NOPC_ADDR) > 500) || (*(input_addr + NCPO_ADDR) < 4500)){
 827  0348 be11          	ldw	x,_input_addr
 828  034a 9093          	ldw	y,x
 829  034c 90ee12        	ldw	y,(18,y)
 830  034f 90a301f5      	cpw	y,#501
 831  0353 240c          	jruge	L742
 833  0355 be11          	ldw	x,_input_addr
 834  0357 9093          	ldw	y,x
 835  0359 90fe          	ldw	y,(y)
 836  035b 90a31194      	cpw	y,#4500
 837  035f 241c          	jruge	L542
 838  0361               L742:
 839                     ; 321 			   fail_status = IGN_FAIL; 				 
 841  0361 35040000      	mov	_fail_status,#4
 842                     ; 322 				 test_state  = TEST_IDLE;
 844  0365 3f01          	clr	_test_state
 845                     ; 324 				 GPIO_WriteLow (IGN);
 847  0367 4b08          	push	#8
 848  0369 ae5000        	ldw	x,#20480
 849  036c cd0000        	call	_GPIO_WriteLow
 851  036f 84            	pop	a
 852                     ; 325 		     GPIO_WriteLow(L30);
 854  0370 4b10          	push	#16
 855  0372 ae5000        	ldw	x,#20480
 856  0375 cd0000        	call	_GPIO_WriteLow
 858  0378 84            	pop	a
 860  0379 ace90ae9      	jpf	L741
 861  037d               L542:
 862                     ; 329 				 GPIO_WriteLow (IGN);
 864  037d 4b08          	push	#8
 865  037f ae5000        	ldw	x,#20480
 866  0382 cd0000        	call	_GPIO_WriteLow
 868  0385 84            	pop	a
 869                     ; 331          delay       = TIME_BASE_2S;
 871  0386 ae07d0        	ldw	x,#2000
 872  0389 bf09          	ldw	_delay,x
 873                     ; 332 				 stack       = TEST_CONFIG_PARK;
 875  038b 35090005      	mov	_stack,#9
 876                     ; 333 				 test_state  = WAIT;
 878  038f 35150001      	mov	_test_state,#21
 879                     ; 334          fail_status = APROVED;				 
 881  0393 35120000      	mov	_fail_status,#18
 882  0397 ace90ae9      	jpf	L741
 883  039b               L15:
 884                     ; 341 		 case TEST_CMD_UP:
 884                     ; 342 		 
 884                     ; 343 		 fail_status = TESTING;
 886  039b 35100000      	mov	_fail_status,#16
 887                     ; 345 		 GPIO_WriteLow (BLINK_N);
 889  039f 4b08          	push	#8
 890  03a1 ae5014        	ldw	x,#20500
 891  03a4 cd0000        	call	_GPIO_WriteLow
 893  03a7 84            	pop	a
 894                     ; 346 		 GPIO_WriteHigh(BLINK_P);
 896  03a8 4b20          	push	#32
 897  03aa ae5014        	ldw	x,#20500
 898  03ad cd0000        	call	_GPIO_WriteHigh
 900  03b0 84            	pop	a
 901                     ; 348 		 if(*(input_addr + PK5_6_ADDR) > 4000){
 903  03b1 be11          	ldw	x,_input_addr
 904  03b3 9093          	ldw	y,x
 905  03b5 90ee0c        	ldw	y,(12,y)
 906  03b8 90a30fa1      	cpw	y,#4001
 907  03bc 250b          	jrult	L352
 908                     ; 350 			 GPIO_WriteHigh(CMD_UP);
 910  03be 4b01          	push	#1
 911  03c0 ae500f        	ldw	x,#20495
 912  03c3 cd0000        	call	_GPIO_WriteHigh
 914  03c6 84            	pop	a
 916  03c7 2009          	jra	L552
 917  03c9               L352:
 918                     ; 354        GPIO_WriteLow(CMD_UP);
 920  03c9 4b01          	push	#1
 921  03cb ae500f        	ldw	x,#20495
 922  03ce cd0000        	call	_GPIO_WriteLow
 924  03d1 84            	pop	a
 925  03d2               L552:
 926                     ; 358 		 if(timerDelay(TIME_BASE_2S)){
 928  03d2 ae07d0        	ldw	x,#2000
 929  03d5 cd0000        	call	_timerDelay
 931  03d8 4d            	tnz	a
 932  03d9 2603          	jrne	L04
 933  03db cc0ae9        	jp	L741
 934  03de               L04:
 935                     ; 360 			 if((*(input_addr + NOPC_ADDR) < 4500) ||
 935                     ; 361 			    (*(input_addr + NCPO_ADDR) > 1000) ||
 935                     ; 362 					(*(input_addr + OUTN_ADDR) > 1000) ||
 935                     ; 363 					(*(input_addr + TEMP_ADDR) < 4500)){
 937  03de be11          	ldw	x,_input_addr
 938  03e0 9093          	ldw	y,x
 939  03e2 90ee12        	ldw	y,(18,y)
 940  03e5 90a31194      	cpw	y,#4500
 941  03e9 2526          	jrult	L362
 943  03eb be11          	ldw	x,_input_addr
 944  03ed 9093          	ldw	y,x
 945  03ef 90fe          	ldw	y,(y)
 946  03f1 90a303e9      	cpw	y,#1001
 947  03f5 241a          	jruge	L362
 949  03f7 be11          	ldw	x,_input_addr
 950  03f9 9093          	ldw	y,x
 951  03fb 90ee08        	ldw	y,(8,y)
 952  03fe 90a303e9      	cpw	y,#1001
 953  0402 240d          	jruge	L362
 955  0404 be11          	ldw	x,_input_addr
 956  0406 9093          	ldw	y,x
 957  0408 90ee04        	ldw	y,(4,y)
 958  040b 90a31194      	cpw	y,#4500
 959  040f 242e          	jruge	L162
 960  0411               L362:
 961                     ; 365 				 fail_status = CMD_UP_FAIL;					
 963  0411 35050000      	mov	_fail_status,#5
 964                     ; 366 				 test_state  = TEST_IDLE;
 966  0415 3f01          	clr	_test_state
 967                     ; 368 				 GPIO_WriteLow (CMD_UP);
 969  0417 4b01          	push	#1
 970  0419 ae500f        	ldw	x,#20495
 971  041c cd0000        	call	_GPIO_WriteLow
 973  041f 84            	pop	a
 974                     ; 369 				 GPIO_WriteLow (L30);
 976  0420 4b10          	push	#16
 977  0422 ae5000        	ldw	x,#20480
 978  0425 cd0000        	call	_GPIO_WriteLow
 980  0428 84            	pop	a
 981                     ; 370 				 GPIO_WriteLow (BLINK_P);
 983  0429 4b20          	push	#32
 984  042b ae5014        	ldw	x,#20500
 985  042e cd0000        	call	_GPIO_WriteLow
 987  0431 84            	pop	a
 988                     ; 371 		     GPIO_WriteHigh(BLINK_N);
 990  0432 4b08          	push	#8
 991  0434 ae5014        	ldw	x,#20500
 992  0437 cd0000        	call	_GPIO_WriteHigh
 994  043a 84            	pop	a
 996  043b ace90ae9      	jpf	L741
 997  043f               L162:
 998                     ; 375 				 GPIO_WriteHigh(CMD_UP);				 
1000  043f 4b01          	push	#1
1001  0441 ae500f        	ldw	x,#20495
1002  0444 cd0000        	call	_GPIO_WriteHigh
1004  0447 84            	pop	a
1005                     ; 376 				 GPIO_WriteLow (BLINK_P);
1007  0448 4b20          	push	#32
1008  044a ae5014        	ldw	x,#20500
1009  044d cd0000        	call	_GPIO_WriteLow
1011  0450 84            	pop	a
1012                     ; 377 		     GPIO_WriteHigh(BLINK_N);
1014  0451 4b08          	push	#8
1015  0453 ae5014        	ldw	x,#20500
1016  0456 cd0000        	call	_GPIO_WriteHigh
1018  0459 84            	pop	a
1019                     ; 379 				 if(*(input_addr + PK5_6_ADDR) < 4000){
1021  045a be11          	ldw	x,_input_addr
1022  045c 9093          	ldw	y,x
1023  045e 90ee0c        	ldw	y,(12,y)
1024  0461 90a30fa0      	cpw	y,#4000
1025  0465 2409          	jruge	L372
1026                     ; 381 					 GPIO_WriteLow(CMD_DOWN);
1028  0467 4b04          	push	#4
1029  0469 ae500f        	ldw	x,#20495
1030  046c cd0000        	call	_GPIO_WriteLow
1032  046f 84            	pop	a
1033  0470               L372:
1034                     ; 385 				 delay       = TIME_BASE_2S;
1036  0470 ae07d0        	ldw	x,#2000
1037  0473 bf09          	ldw	_delay,x
1038                     ; 386 		     stack       = TEST_CMD_DOWN;
1040  0475 35060005      	mov	_stack,#6
1041                     ; 387 				 test_state  = WAIT;
1043  0479 35150001      	mov	_test_state,#21
1044                     ; 388 				 fail_status = APROVED;	
1046  047d 35120000      	mov	_fail_status,#18
1047  0481 ace90ae9      	jpf	L741
1048  0485               L35:
1049                     ; 397 		 case TEST_CMD_DOWN:
1049                     ; 398 		 
1049                     ; 399 		 fail_status = TESTING;		 
1051  0485 35100000      	mov	_fail_status,#16
1052                     ; 401 		 GPIO_WriteLow (BLINK_N);
1054  0489 4b08          	push	#8
1055  048b ae5014        	ldw	x,#20500
1056  048e cd0000        	call	_GPIO_WriteLow
1058  0491 84            	pop	a
1059                     ; 402 		 GPIO_WriteHigh(BLINK_P);
1061  0492 4b20          	push	#32
1062  0494 ae5014        	ldw	x,#20500
1063  0497 cd0000        	call	_GPIO_WriteHigh
1065  049a 84            	pop	a
1066                     ; 404 		 if(*(input_addr + PK5_6_ADDR) > 4000){
1068  049b be11          	ldw	x,_input_addr
1069  049d 9093          	ldw	y,x
1070  049f 90ee0c        	ldw	y,(12,y)
1071  04a2 90a30fa1      	cpw	y,#4001
1072  04a6 250b          	jrult	L572
1073                     ; 406 			 GPIO_WriteLow(CMD_DOWN);
1075  04a8 4b04          	push	#4
1076  04aa ae500f        	ldw	x,#20495
1077  04ad cd0000        	call	_GPIO_WriteLow
1079  04b0 84            	pop	a
1081  04b1 2009          	jra	L772
1082  04b3               L572:
1083                     ; 410 		   GPIO_WriteHigh(CMD_DOWN);
1085  04b3 4b04          	push	#4
1086  04b5 ae500f        	ldw	x,#20495
1087  04b8 cd0000        	call	_GPIO_WriteHigh
1089  04bb 84            	pop	a
1090  04bc               L772:
1091                     ; 414 		 if(timerDelay(TIME_BASE_2S)){
1093  04bc ae07d0        	ldw	x,#2000
1094  04bf cd0000        	call	_timerDelay
1096  04c2 4d            	tnz	a
1097  04c3 2603          	jrne	L24
1098  04c5 cc0ae9        	jp	L741
1099  04c8               L24:
1100                     ; 416 			 if((*(input_addr + NOPC_ADDR) > 1000) ||
1100                     ; 417 			    (*(input_addr + NCPO_ADDR) < 4500) ||
1100                     ; 418 					(*(input_addr + OUTN_ADDR) < 1000) ||
1100                     ; 419 					(*(input_addr + TEMP_ADDR) < 4500)){
1102  04c8 be11          	ldw	x,_input_addr
1103  04ca 9093          	ldw	y,x
1104  04cc 90ee12        	ldw	y,(18,y)
1105  04cf 90a303e9      	cpw	y,#1001
1106  04d3 2426          	jruge	L503
1108  04d5 be11          	ldw	x,_input_addr
1109  04d7 9093          	ldw	y,x
1110  04d9 90fe          	ldw	y,(y)
1111  04db 90a31194      	cpw	y,#4500
1112  04df 251a          	jrult	L503
1114  04e1 be11          	ldw	x,_input_addr
1115  04e3 9093          	ldw	y,x
1116  04e5 90ee08        	ldw	y,(8,y)
1117  04e8 90a303e8      	cpw	y,#1000
1118  04ec 250d          	jrult	L503
1120  04ee be11          	ldw	x,_input_addr
1121  04f0 9093          	ldw	y,x
1122  04f2 90ee04        	ldw	y,(4,y)
1123  04f5 90a31194      	cpw	y,#4500
1124  04f9 242e          	jruge	L303
1125  04fb               L503:
1126                     ; 421 				 fail_status = CMD_DOWN_FAIL;					
1128  04fb 35060000      	mov	_fail_status,#6
1129                     ; 422 				 test_state  = TEST_IDLE;
1131  04ff 3f01          	clr	_test_state
1132                     ; 424 				 GPIO_WriteLow (BLINK_P);				 
1134  0501 4b20          	push	#32
1135  0503 ae5014        	ldw	x,#20500
1136  0506 cd0000        	call	_GPIO_WriteLow
1138  0509 84            	pop	a
1139                     ; 425 				 GPIO_WriteLow (BLINK_N);
1141  050a 4b08          	push	#8
1142  050c ae5014        	ldw	x,#20500
1143  050f cd0000        	call	_GPIO_WriteLow
1145  0512 84            	pop	a
1146                     ; 426 		     GPIO_WriteLow (CMD_DOWN);
1148  0513 4b04          	push	#4
1149  0515 ae500f        	ldw	x,#20495
1150  0518 cd0000        	call	_GPIO_WriteLow
1152  051b 84            	pop	a
1153                     ; 427 				 GPIO_WriteLow (L30);				 
1155  051c 4b10          	push	#16
1156  051e ae5000        	ldw	x,#20480
1157  0521 cd0000        	call	_GPIO_WriteLow
1159  0524 84            	pop	a
1161  0525 ace90ae9      	jpf	L741
1162  0529               L303:
1163                     ; 431 				 GPIO_WriteLow (BLINK_P);
1165  0529 4b20          	push	#32
1166  052b ae5014        	ldw	x,#20500
1167  052e cd0000        	call	_GPIO_WriteLow
1169  0531 84            	pop	a
1170                     ; 432 				 GPIO_WriteHigh(BLINK_N);
1172  0532 4b08          	push	#8
1173  0534 ae5014        	ldw	x,#20500
1174  0537 cd0000        	call	_GPIO_WriteHigh
1176  053a 84            	pop	a
1177                     ; 433 				 GPIO_WriteHigh(CMD_DOWN);
1179  053b 4b04          	push	#4
1180  053d ae500f        	ldw	x,#20495
1181  0540 cd0000        	call	_GPIO_WriteHigh
1183  0543 84            	pop	a
1184                     ; 435 				 jumperEnable(1, DISABLE);		 
1186  0544 ae0100        	ldw	x,#256
1187  0547 cd0daa        	call	_jumperEnable
1189                     ; 438 				 delay       = TIME_BASE_2S;
1191  054a ae07d0        	ldw	x,#2000
1192  054d bf09          	ldw	_delay,x
1193                     ; 439 		     stack       = TEST_IGN;
1195  054f 35080005      	mov	_stack,#8
1196                     ; 440 				 test_state  = WAIT;
1198  0553 35150001      	mov	_test_state,#21
1199                     ; 441 				 fail_status = APROVED;		
1201  0557 35120000      	mov	_fail_status,#18
1202  055b ace90ae9      	jpf	L741
1203  055f               L55:
1204                     ; 450 		 case TEST_CONFIG_PARK:
1204                     ; 451 		 
1204                     ; 452 		 switch (conf_state){
1206  055f b604          	ld	a,_conf_state
1208                     ; 524 			 break;
1209  0561 4d            	tnz	a
1210  0562 2710          	jreq	L75
1211  0564 4a            	dec	a
1212  0565 272c          	jreq	L16
1213  0567 4a            	dec	a
1214  0568 2747          	jreq	L36
1215  056a 4a            	dec	a
1216  056b 275f          	jreq	L56
1217  056d 4a            	dec	a
1218  056e 2775          	jreq	L76
1219  0570 ace90ae9      	jpf	L741
1220  0574               L75:
1221                     ; 454 			 case CONF_IDLE:
1221                     ; 455 			 
1221                     ; 456 			 repouso(NEGATIVO);
1223  0574 4f            	clr	a
1224  0575 cd0aed        	call	_repouso
1226                     ; 458 			 jumperEnable(2, ENABLE);
1228  0578 ae0201        	ldw	x,#513
1229  057b cd0daa        	call	_jumperEnable
1231                     ; 471 			 delay      = TIME_BASE_100MS;
1233  057e ae0064        	ldw	x,#100
1234  0581 bf09          	ldw	_delay,x
1235                     ; 472 			 stack      = TEST_CONFIG_PARK;
1237  0583 35090005      	mov	_stack,#9
1238                     ; 473 			 test_state = WAIT;
1240  0587 35150001      	mov	_test_state,#21
1241                     ; 474 			 conf_state = CONF_JP;
1243  058b 35020004      	mov	_conf_state,#2
1244                     ; 478 			 break;
1246  058f ace90ae9      	jpf	L741
1247  0593               L16:
1248                     ; 480 			 case CONF_L30:
1248                     ; 481 			 
1248                     ; 482 			 GPIO_WriteHigh(L30);
1250  0593 4b10          	push	#16
1251  0595 ae5000        	ldw	x,#20480
1252  0598 cd0000        	call	_GPIO_WriteHigh
1254  059b 84            	pop	a
1255                     ; 484 			 delay      = TIME_BASE_5S;
1257  059c ae1388        	ldw	x,#5000
1258  059f bf09          	ldw	_delay,x
1259                     ; 485 			 stack      = TEST_CONFIG_PARK;
1261  05a1 35090005      	mov	_stack,#9
1262                     ; 486 			 test_state = WAIT;
1264  05a5 35150001      	mov	_test_state,#21
1265                     ; 487 			 conf_state = CONF_JP;
1267  05a9 35020004      	mov	_conf_state,#2
1268                     ; 489 			 break;
1270  05ad ace90ae9      	jpf	L741
1271  05b1               L36:
1272                     ; 491 			 case CONF_JP:
1272                     ; 492 			 
1272                     ; 493 			 jumperEnable(2, DISABLE);
1274  05b1 ae0200        	ldw	x,#512
1275  05b4 cd0daa        	call	_jumperEnable
1277                     ; 495 			 delay      = TIME_BASE_500MS;
1279  05b7 ae01f4        	ldw	x,#500
1280  05ba bf09          	ldw	_delay,x
1281                     ; 496 			 stack      = TEST_CONFIG_PARK;
1283  05bc 35090005      	mov	_stack,#9
1284                     ; 497 			 test_state = WAIT;
1286  05c0 35150001      	mov	_test_state,#21
1287                     ; 498 			 conf_state = CONF_DOWN;
1289  05c4 35030004      	mov	_conf_state,#3
1290                     ; 500 			 break;
1292  05c8 ace90ae9      	jpf	L741
1293  05cc               L56:
1294                     ; 502 			 case CONF_DOWN:
1294                     ; 503 			 
1294                     ; 504 			 down(P1);
1296  05cc 4f            	clr	a
1297  05cd cd0ba1        	call	_down
1299                     ; 506 			 delay      = TIME_BASE_500MS;
1301  05d0 ae01f4        	ldw	x,#500
1302  05d3 bf09          	ldw	_delay,x
1303                     ; 507 			 stack      = TEST_CONFIG_PARK;
1305  05d5 35090005      	mov	_stack,#9
1306                     ; 508 			 test_state = WAIT;
1308  05d9 35150001      	mov	_test_state,#21
1309                     ; 509 			 conf_state = CONF_FINISH;
1311  05dd 35040004      	mov	_conf_state,#4
1312                     ; 511 			 break;
1314  05e1 ace90ae9      	jpf	L741
1315  05e5               L76:
1316                     ; 513 			 case CONF_FINISH:
1316                     ; 514 			 
1316                     ; 515 			 repouso(NEGATIVO);
1318  05e5 4f            	clr	a
1319  05e6 cd0aed        	call	_repouso
1321                     ; 517 		   jumperEnable(2, ENABLE);
1323  05e9 ae0201        	ldw	x,#513
1324  05ec cd0daa        	call	_jumperEnable
1326                     ; 519 			 delay      = TIME_BASE_500MS;
1328  05ef ae01f4        	ldw	x,#500
1329  05f2 bf09          	ldw	_delay,x
1330                     ; 520 			 stack      = TEST_M1_P;
1332  05f4 350b0005      	mov	_stack,#11
1333                     ; 521 			 test_state = WAIT;
1335  05f8 35150001      	mov	_test_state,#21
1336                     ; 522 			 conf_state = CONF_IDLE;
1338  05fc 3f04          	clr	_conf_state
1339                     ; 524 			 break;
1341  05fe ace90ae9      	jpf	L741
1342  0602               L713:
1343                     ; 528 		 break;
1345  0602 ace90ae9      	jpf	L741
1346  0606               L17:
1347                     ; 530 		 case TEST_M1_P:
1347                     ; 531 		 
1347                     ; 532 		 fail_status = TESTING;
1349  0606 35100000      	mov	_fail_status,#16
1350                     ; 534 		 set_high(SW1);
1352  060a 4f            	clr	a
1353  060b cd0cd8        	call	_set_high
1355                     ; 535 		 set_open(SW2);
1357  060e a601          	ld	a,#1
1358  0610 cd0d1e        	call	_set_open
1360                     ; 536 		 set_open(SW3);
1362  0613 a602          	ld	a,#2
1363  0615 cd0d1e        	call	_set_open
1365                     ; 538 		 if(timerDelay(TIME_BASE_500MS)){
1367  0618 ae01f4        	ldw	x,#500
1368  061b cd0000        	call	_timerDelay
1370  061e 4d            	tnz	a
1371  061f 2603          	jrne	L44
1372  0621 cc0ae9        	jp	L741
1373  0624               L44:
1374                     ; 540 			 aux = *(input_addr + M1_ADDR);
1376  0624 be11          	ldw	x,_input_addr
1377  0626 ee06          	ldw	x,(6,x)
1378  0628 bf0b          	ldw	_aux,x
1379                     ; 542 			 if(*(input_addr + M1_ADDR) < 4500){
1381  062a be11          	ldw	x,_input_addr
1382  062c 9093          	ldw	y,x
1383  062e 90ee06        	ldw	y,(6,y)
1384  0631 90a31194      	cpw	y,#4500
1385  0635 2417          	jruge	L323
1386                     ; 544 				 repouso(NEGATIVO);
1388  0637 4f            	clr	a
1389  0638 cd0aed        	call	_repouso
1391                     ; 546 				 fail_status = M1_P_FAIL;
1393  063b 35070000      	mov	_fail_status,#7
1394                     ; 547 				 test_state  = TEST_IDLE;
1396  063f 3f01          	clr	_test_state
1397                     ; 549 				 GPIO_WriteLow(L30);
1399  0641 4b10          	push	#16
1400  0643 ae5000        	ldw	x,#20480
1401  0646 cd0000        	call	_GPIO_WriteLow
1403  0649 84            	pop	a
1405  064a ace90ae9      	jpf	L741
1406  064e               L323:
1407                     ; 553 				 delay       = TIME_BASE_100MS;
1409  064e ae0064        	ldw	x,#100
1410  0651 bf09          	ldw	_delay,x
1411                     ; 554 				 stack       = TEST_M2_P;
1413  0653 350c0005      	mov	_stack,#12
1414                     ; 555          test_state  = WAIT;				 
1416  0657 35150001      	mov	_test_state,#21
1417                     ; 556 				 fail_status = APROVED;
1419  065b 35120000      	mov	_fail_status,#18
1420                     ; 558 				 repouso(NEGATIVO);
1422  065f 4f            	clr	a
1423  0660 cd0aed        	call	_repouso
1425  0663 ace90ae9      	jpf	L741
1426  0667               L37:
1427                     ; 565 		 case TEST_M2_P:
1427                     ; 566 		 
1427                     ; 567 		 fail_status = TESTING;
1429  0667 35100000      	mov	_fail_status,#16
1430                     ; 569 		 set_open(SW1);
1432  066b 4f            	clr	a
1433  066c cd0d1e        	call	_set_open
1435                     ; 570 		 set_high(SW2);
1437  066f a601          	ld	a,#1
1438  0671 cd0cd8        	call	_set_high
1440                     ; 571 		 set_open(SW3);
1442  0674 a602          	ld	a,#2
1443  0676 cd0d1e        	call	_set_open
1445                     ; 573 		 if(timerDelay(TIME_BASE_500MS)){
1447  0679 ae01f4        	ldw	x,#500
1448  067c cd0000        	call	_timerDelay
1450  067f 4d            	tnz	a
1451  0680 2603          	jrne	L64
1452  0682 cc0ae9        	jp	L741
1453  0685               L64:
1454                     ; 575 			 if(*(input_addr + M2_ADDR) < 4500){
1456  0685 be11          	ldw	x,_input_addr
1457  0687 9093          	ldw	y,x
1458  0689 90ee0a        	ldw	y,(10,y)
1459  068c 90a31194      	cpw	y,#4500
1460  0690 2417          	jruge	L133
1461                     ; 577 				 repouso(NEGATIVO);
1463  0692 4f            	clr	a
1464  0693 cd0aed        	call	_repouso
1466                     ; 579 				 fail_status = M2_P_FAIL;
1468  0696 35080000      	mov	_fail_status,#8
1469                     ; 580 				 test_state  = TEST_IDLE;
1471  069a 3f01          	clr	_test_state
1472                     ; 582 				 GPIO_WriteLow (L30);						 
1474  069c 4b10          	push	#16
1475  069e ae5000        	ldw	x,#20480
1476  06a1 cd0000        	call	_GPIO_WriteLow
1478  06a4 84            	pop	a
1480  06a5 ace90ae9      	jpf	L741
1481  06a9               L133:
1482                     ; 586 				 delay       = TIME_BASE_100MS;
1484  06a9 ae0064        	ldw	x,#100
1485  06ac bf09          	ldw	_delay,x
1486                     ; 587 				 stack       = TEST_M3_P;		
1488  06ae 350d0005      	mov	_stack,#13
1489                     ; 588 				 test_state  = WAIT;	 
1491  06b2 35150001      	mov	_test_state,#21
1492                     ; 589 				 fail_status = APROVED;
1494  06b6 35120000      	mov	_fail_status,#18
1495                     ; 591 				 repouso(NEGATIVO);
1497  06ba 4f            	clr	a
1498  06bb cd0aed        	call	_repouso
1500  06be ace90ae9      	jpf	L741
1501  06c2               L57:
1502                     ; 598 		 case TEST_M3_P:
1502                     ; 599 		 
1502                     ; 600 		 fail_status = TESTING;
1504  06c2 35100000      	mov	_fail_status,#16
1505                     ; 602 		 set_open(SW1);
1507  06c6 4f            	clr	a
1508  06c7 cd0d1e        	call	_set_open
1510                     ; 603 		 set_open(SW2);
1512  06ca a601          	ld	a,#1
1513  06cc cd0d1e        	call	_set_open
1515                     ; 604 		 set_high(SW3);
1517  06cf a602          	ld	a,#2
1518  06d1 cd0cd8        	call	_set_high
1520                     ; 606 		 if(timerDelay(TIME_BASE_500MS)){
1522  06d4 ae01f4        	ldw	x,#500
1523  06d7 cd0000        	call	_timerDelay
1525  06da 4d            	tnz	a
1526  06db 2603          	jrne	L05
1527  06dd cc0ae9        	jp	L741
1528  06e0               L05:
1529                     ; 608 			 if(*(input_addr + M3_ADDR) < 4500){
1531  06e0 be11          	ldw	x,_input_addr
1532  06e2 9093          	ldw	y,x
1533  06e4 90ee0e        	ldw	y,(14,y)
1534  06e7 90a31194      	cpw	y,#4500
1535  06eb 2417          	jruge	L733
1536                     ; 610 				 repouso(NEGATIVO);
1538  06ed 4f            	clr	a
1539  06ee cd0aed        	call	_repouso
1541                     ; 612 				 fail_status = M3_P_FAIL;
1543  06f1 35090000      	mov	_fail_status,#9
1544                     ; 613 				 test_state  = TEST_IDLE;
1546  06f5 3f01          	clr	_test_state
1547                     ; 615 				 GPIO_WriteLow (L30);				 
1549  06f7 4b10          	push	#16
1550  06f9 ae5000        	ldw	x,#20480
1551  06fc cd0000        	call	_GPIO_WriteLow
1553  06ff 84            	pop	a
1555  0700 ace90ae9      	jpf	L741
1556  0704               L733:
1557                     ; 619 				 delay       = TIME_BASE_100MS;
1559  0704 ae0064        	ldw	x,#100
1560  0707 bf09          	ldw	_delay,x
1561                     ; 620 				 stack       = TEST_M1_N;
1563  0709 350e0005      	mov	_stack,#14
1564                     ; 621 				 test_state  = WAIT;				 
1566  070d 35150001      	mov	_test_state,#21
1567                     ; 622 				 fail_status = APROVED;
1569  0711 35120000      	mov	_fail_status,#18
1570                     ; 624 				 repouso(NEGATIVO);
1572  0715 4f            	clr	a
1573  0716 cd0aed        	call	_repouso
1575  0719 ace90ae9      	jpf	L741
1576  071d               L77:
1577                     ; 631 		 case TEST_M1_N:
1577                     ; 632 		 
1577                     ; 633 		 fail_status = TESTING;
1579  071d 35100000      	mov	_fail_status,#16
1580                     ; 635 		 set_low (SW1);
1582  0721 4f            	clr	a
1583  0722 cd0d64        	call	_set_low
1585                     ; 636 		 set_open(SW2);
1587  0725 a601          	ld	a,#1
1588  0727 cd0d1e        	call	_set_open
1590                     ; 637 		 set_open(SW3);
1592  072a a602          	ld	a,#2
1593  072c cd0d1e        	call	_set_open
1595                     ; 639 		 if(timerDelay(TIME_BASE_500MS)){
1597  072f ae01f4        	ldw	x,#500
1598  0732 cd0000        	call	_timerDelay
1600  0735 4d            	tnz	a
1601  0736 2603          	jrne	L25
1602  0738 cc0ae9        	jp	L741
1603  073b               L25:
1604                     ; 641 			 if(*(input_addr + M1_ADDR) > 500){
1606  073b be11          	ldw	x,_input_addr
1607  073d 9093          	ldw	y,x
1608  073f 90ee06        	ldw	y,(6,y)
1609  0742 90a301f5      	cpw	y,#501
1610  0746 2517          	jrult	L543
1611                     ; 643 				 repouso(NEGATIVO);
1613  0748 4f            	clr	a
1614  0749 cd0aed        	call	_repouso
1616                     ; 645 				 fail_status = M1_N_FAIL;
1618  074c 350a0000      	mov	_fail_status,#10
1619                     ; 646 				 test_state  = TEST_IDLE;
1621  0750 3f01          	clr	_test_state
1622                     ; 648 				 GPIO_WriteLow (L30);				  
1624  0752 4b10          	push	#16
1625  0754 ae5000        	ldw	x,#20480
1626  0757 cd0000        	call	_GPIO_WriteLow
1628  075a 84            	pop	a
1630  075b ace90ae9      	jpf	L741
1631  075f               L543:
1632                     ; 652 				 delay       = TIME_BASE_100MS;
1634  075f ae0064        	ldw	x,#100
1635  0762 bf09          	ldw	_delay,x
1636                     ; 653 				 stack       = TEST_M2_N;
1638  0764 350f0005      	mov	_stack,#15
1639                     ; 654 				 test_state  = WAIT;				 
1641  0768 35150001      	mov	_test_state,#21
1642                     ; 655 				 fail_status = APROVED;
1644  076c 35120000      	mov	_fail_status,#18
1645                     ; 657 				 repouso(NEGATIVO);
1647  0770 4f            	clr	a
1648  0771 cd0aed        	call	_repouso
1650  0774 ace90ae9      	jpf	L741
1651  0778               L101:
1652                     ; 665 		 case TEST_M2_N:
1652                     ; 666 		 
1652                     ; 667 		 fail_status = TESTING;
1654  0778 35100000      	mov	_fail_status,#16
1655                     ; 669 		 set_open(SW1);
1657  077c 4f            	clr	a
1658  077d cd0d1e        	call	_set_open
1660                     ; 670 		 set_low (SW2);
1662  0780 a601          	ld	a,#1
1663  0782 cd0d64        	call	_set_low
1665                     ; 671 		 set_open(SW3);
1667  0785 a602          	ld	a,#2
1668  0787 cd0d1e        	call	_set_open
1670                     ; 673 		 if(timerDelay(TIME_BASE_500MS)){
1672  078a ae01f4        	ldw	x,#500
1673  078d cd0000        	call	_timerDelay
1675  0790 4d            	tnz	a
1676  0791 2603          	jrne	L45
1677  0793 cc0ae9        	jp	L741
1678  0796               L45:
1679                     ; 675 			 if(*(input_addr + M2_ADDR) > 500){
1681  0796 be11          	ldw	x,_input_addr
1682  0798 9093          	ldw	y,x
1683  079a 90ee0a        	ldw	y,(10,y)
1684  079d 90a301f5      	cpw	y,#501
1685  07a1 2517          	jrult	L353
1686                     ; 677 				 repouso(NEGATIVO);
1688  07a3 4f            	clr	a
1689  07a4 cd0aed        	call	_repouso
1691                     ; 679 				 fail_status = M2_N_FAIL;
1693  07a7 350b0000      	mov	_fail_status,#11
1694                     ; 680 				 test_state  = TEST_IDLE;
1696  07ab 3f01          	clr	_test_state
1697                     ; 682 				 GPIO_WriteLow (L30);
1699  07ad 4b10          	push	#16
1700  07af ae5000        	ldw	x,#20480
1701  07b2 cd0000        	call	_GPIO_WriteLow
1703  07b5 84            	pop	a
1705  07b6 ace90ae9      	jpf	L741
1706  07ba               L353:
1707                     ; 686 				 delay       = TIME_BASE_100MS;
1709  07ba ae0064        	ldw	x,#100
1710  07bd bf09          	ldw	_delay,x
1711                     ; 687 				 stack       = TEST_M3_N;
1713  07bf 35100005      	mov	_stack,#16
1714                     ; 688 				 test_state  = WAIT;
1716  07c3 35150001      	mov	_test_state,#21
1717                     ; 689 				 fail_status = APROVED;
1719  07c7 35120000      	mov	_fail_status,#18
1720                     ; 691 				 repouso(NEGATIVO);
1722  07cb 4f            	clr	a
1723  07cc cd0aed        	call	_repouso
1725  07cf ace90ae9      	jpf	L741
1726  07d3               L301:
1727                     ; 698 		 case TEST_M3_N:
1727                     ; 699 		 
1727                     ; 700 		 fail_status = TESTING;
1729  07d3 35100000      	mov	_fail_status,#16
1730                     ; 702 		 set_open(SW1);
1732  07d7 4f            	clr	a
1733  07d8 cd0d1e        	call	_set_open
1735                     ; 703 		 set_open(SW2);
1737  07db a601          	ld	a,#1
1738  07dd cd0d1e        	call	_set_open
1740                     ; 704 		 set_low (SW3);
1742  07e0 a602          	ld	a,#2
1743  07e2 cd0d64        	call	_set_low
1745                     ; 706 		 if(timerDelay(TIME_BASE_500MS)){
1747  07e5 ae01f4        	ldw	x,#500
1748  07e8 cd0000        	call	_timerDelay
1750  07eb 4d            	tnz	a
1751  07ec 2603          	jrne	L65
1752  07ee cc0ae9        	jp	L741
1753  07f1               L65:
1754                     ; 708 			 if(*(input_addr + M3_ADDR) > 500){
1756  07f1 be11          	ldw	x,_input_addr
1757  07f3 9093          	ldw	y,x
1758  07f5 90ee0e        	ldw	y,(14,y)
1759  07f8 90a301f5      	cpw	y,#501
1760  07fc 2517          	jrult	L163
1761                     ; 710 				 repouso(NEGATIVO);
1763  07fe 4f            	clr	a
1764  07ff cd0aed        	call	_repouso
1766                     ; 712 				 fail_status = M3_N_FAIL;
1768  0802 350c0000      	mov	_fail_status,#12
1769                     ; 713 				 test_state  = TEST_IDLE;
1771  0806 3f01          	clr	_test_state
1772                     ; 715 				 GPIO_WriteLow (L30);				 
1774  0808 4b10          	push	#16
1775  080a ae5000        	ldw	x,#20480
1776  080d cd0000        	call	_GPIO_WriteLow
1778  0810 84            	pop	a
1780  0811 ace90ae9      	jpf	L741
1781  0815               L163:
1782                     ; 719 				 delay       = TIME_BASE_100MS;
1784  0815 ae0064        	ldw	x,#100
1785  0818 bf09          	ldw	_delay,x
1786                     ; 720 				 stack       = TEST_OPEN;
1788  081a 35110005      	mov	_stack,#17
1789                     ; 721 				 test_state  = WAIT;				 
1791  081e 35150001      	mov	_test_state,#21
1792                     ; 722 				 fail_status = APROVED;
1794  0822 35120000      	mov	_fail_status,#18
1795                     ; 724 				 repouso(NEGATIVO);
1797  0826 4f            	clr	a
1798  0827 cd0aed        	call	_repouso
1800  082a ace90ae9      	jpf	L741
1801  082e               L501:
1802                     ; 731 		 case TEST_OPEN:
1802                     ; 732 		 
1802                     ; 733 		 fail_status = TESTING;
1804  082e 35100000      	mov	_fail_status,#16
1805                     ; 735 		 set_open(SW1);
1807  0832 4f            	clr	a
1808  0833 cd0d1e        	call	_set_open
1810                     ; 736 		 set_open(SW2);
1812  0836 a601          	ld	a,#1
1813  0838 cd0d1e        	call	_set_open
1815                     ; 737 		 set_open(SW3);
1817  083b a602          	ld	a,#2
1818  083d cd0d1e        	call	_set_open
1820                     ; 739 		 if(timerDelay(TIME_BASE_1S)){
1822  0840 ae03e8        	ldw	x,#1000
1823  0843 cd0000        	call	_timerDelay
1825  0846 4d            	tnz	a
1826  0847 2603          	jrne	L06
1827  0849 cc0ae9        	jp	L741
1828  084c               L06:
1829                     ; 741 			 aux = *(input_addr + M1_ADDR) + 
1829                     ; 742 			       *(input_addr + M2_ADDR) + 
1829                     ; 743 						 *(input_addr + M3_ADDR);
1831  084c be11          	ldw	x,_input_addr
1832  084e ee0a          	ldw	x,(10,x)
1833  0850 90be11        	ldw	y,_input_addr
1834  0853 01            	rrwa	x,a
1835  0854 90eb07        	add	a,(7,y)
1836  0857 01            	rrwa	x,a
1837  0858 90e906        	adc	a,(6,y)
1838  085b 01            	rrwa	x,a
1839  085c 90be11        	ldw	y,_input_addr
1840  085f 01            	rrwa	x,a
1841  0860 90eb0f        	add	a,(15,y)
1842  0863 01            	rrwa	x,a
1843  0864 90e90e        	adc	a,(14,y)
1844  0867 01            	rrwa	x,a
1845  0868 bf0b          	ldw	_aux,x
1846                     ; 745 			 if((aux < 6000)||(aux > 12000)){
1848  086a be0b          	ldw	x,_aux
1849  086c a31770        	cpw	x,#6000
1850  086f 2507          	jrult	L173
1852  0871 be0b          	ldw	x,_aux
1853  0873 a32ee1        	cpw	x,#12001
1854  0876 2517          	jrult	L763
1855  0878               L173:
1856                     ; 747 				 repouso(NEGATIVO);
1858  0878 4f            	clr	a
1859  0879 cd0aed        	call	_repouso
1861                     ; 749 				 fail_status = M_OPEN_FAIL;
1863  087c 350d0000      	mov	_fail_status,#13
1864                     ; 750 				 test_state  = TEST_IDLE;
1866  0880 3f01          	clr	_test_state
1867                     ; 752 				 GPIO_WriteLow (L30);				 
1869  0882 4b10          	push	#16
1870  0884 ae5000        	ldw	x,#20480
1871  0887 cd0000        	call	_GPIO_WriteLow
1873  088a 84            	pop	a
1875  088b ace90ae9      	jpf	L741
1876  088f               L763:
1877                     ; 756 				 delay       = TIME_BASE_500MS;
1879  088f ae01f4        	ldw	x,#500
1880  0892 bf09          	ldw	_delay,x
1881                     ; 757 				 stack       = TEST_DOWN;
1883  0894 35120005      	mov	_stack,#18
1884                     ; 758 				 test_state  = WAIT;				 
1886  0898 35150001      	mov	_test_state,#21
1887                     ; 759 				 fail_status = APROVED;
1889  089c 35120000      	mov	_fail_status,#18
1890                     ; 761 				 repouso(NEGATIVO);
1892  08a0 4f            	clr	a
1893  08a1 cd0aed        	call	_repouso
1895  08a4 ace90ae9      	jpf	L741
1896  08a8               L701:
1897                     ; 768 		 case TEST_DOWN:
1897                     ; 769 		 
1897                     ; 770 		 fail_status = TESTING;
1899  08a8 35100000      	mov	_fail_status,#16
1900                     ; 772 		 GPIO_WriteLow (BACK_N);
1902  08ac 4b80          	push	#128
1903  08ae ae500a        	ldw	x,#20490
1904  08b1 cd0000        	call	_GPIO_WriteLow
1906  08b4 84            	pop	a
1907                     ; 773 		 GPIO_WriteHigh(BACK_P);		 
1909  08b5 4b02          	push	#2
1910  08b7 ae500a        	ldw	x,#20490
1911  08ba cd0000        	call	_GPIO_WriteHigh
1913  08bd 84            	pop	a
1914                     ; 775 		 if(timerDelay(TIME_BASE_1S)){
1916  08be ae03e8        	ldw	x,#1000
1917  08c1 cd0000        	call	_timerDelay
1919  08c4 4d            	tnz	a
1920  08c5 2603          	jrne	L26
1921  08c7 cc0ae9        	jp	L741
1922  08ca               L26:
1923                     ; 777 			 if(*(input_addr + SENSOR_ADDR) > 1500){
1925  08ca be11          	ldw	x,_input_addr
1926  08cc 9093          	ldw	y,x
1927  08ce 90ee02        	ldw	y,(2,y)
1928  08d1 90a305dd      	cpw	y,#1501
1929  08d5 2520          	jrult	L773
1930                     ; 779 				 repouso(NEGATIVO);
1932  08d7 4f            	clr	a
1933  08d8 cd0aed        	call	_repouso
1935                     ; 781 	       fail_status = LED_FAIL;
1937  08db 350e0000      	mov	_fail_status,#14
1938                     ; 782 				 test_state  = TEST_IDLE;
1940  08df 3f01          	clr	_test_state
1941                     ; 784 				 GPIO_WriteLow(BACK_P);	
1943  08e1 4b02          	push	#2
1944  08e3 ae500a        	ldw	x,#20490
1945  08e6 cd0000        	call	_GPIO_WriteLow
1947  08e9 84            	pop	a
1948                     ; 785 			   GPIO_WriteLow(L30);
1950  08ea 4b10          	push	#16
1951  08ec ae5000        	ldw	x,#20480
1952  08ef cd0000        	call	_GPIO_WriteLow
1954  08f2 84            	pop	a
1956  08f3 ace90ae9      	jpf	L741
1957  08f7               L773:
1958                     ; 790 					delay       = TIME_BASE_2S;				
1960  08f7 ae07d0        	ldw	x,#2000
1961  08fa bf09          	ldw	_delay,x
1962                     ; 791 					stack       = TEST_UP;
1964  08fc 35130005      	mov	_stack,#19
1965                     ; 792           test_state  = WAIT;						
1967  0900 35150001      	mov	_test_state,#21
1968                     ; 793 					fail_status = APROVED;
1970  0904 35120000      	mov	_fail_status,#18
1971  0908 ace90ae9      	jpf	L741
1972  090c               L111:
1973                     ; 800 		 case TEST_UP:
1973                     ; 801 		 
1973                     ; 802 		 fail_status = TESTING;
1975  090c 35100000      	mov	_fail_status,#16
1976                     ; 804 		 switch(tilt_state){
1978  0910 b603          	ld	a,_tilt_state
1980                     ; 855 			 break;
1981  0912 4d            	tnz	a
1982  0913 270a          	jreq	L311
1983  0915 4a            	dec	a
1984  0916 272e          	jreq	L511
1985  0918 4a            	dec	a
1986  0919 2736          	jreq	L711
1987  091b ace90ae9      	jpf	L741
1988  091f               L311:
1989                     ; 806 			 case TILT_IDLE:
1989                     ; 807 			 
1989                     ; 808 			 GPIO_WriteLow (BACK_P);
1991  091f 4b02          	push	#2
1992  0921 ae500a        	ldw	x,#20490
1993  0924 cd0000        	call	_GPIO_WriteLow
1995  0927 84            	pop	a
1996                     ; 809 			 GPIO_WriteHigh(BACK_N);
1998  0928 4b80          	push	#128
1999  092a ae500a        	ldw	x,#20490
2000  092d cd0000        	call	_GPIO_WriteHigh
2002  0930 84            	pop	a
2003                     ; 811 			 delay      = TIME_BASE_3S;
2005  0931 ae0bb8        	ldw	x,#3000
2006  0934 bf09          	ldw	_delay,x
2007                     ; 812 			 stack      = TEST_UP;
2009  0936 35130005      	mov	_stack,#19
2010                     ; 813 			 test_state = WAIT;
2012  093a 35150001      	mov	_test_state,#21
2013                     ; 814 			 tilt_state = TILT_ENABLE;
2015  093e 35010003      	mov	_tilt_state,#1
2016                     ; 816 			 break;
2018  0942 ace90ae9      	jpf	L741
2019  0946               L511:
2020                     ; 818 			 case TILT_ENABLE:
2020                     ; 819 			 
2020                     ; 820 			 counterEnable();
2022  0946 cd0000        	call	_counterEnable
2024                     ; 822 			 tilt_state = TILT_UP;
2026  0949 35020003      	mov	_tilt_state,#2
2027                     ; 824 			 break;
2029  094d ace90ae9      	jpf	L741
2030  0951               L711:
2031                     ; 826 			 case TILT_UP:
2031                     ; 827 			 
2031                     ; 828 			 if(timerDelay(TIME_BASE_5S)){
2033  0951 ae1388        	ldw	x,#5000
2034  0954 cd0000        	call	_timerDelay
2036  0957 4d            	tnz	a
2037  0958 2603          	jrne	L46
2038  095a cc0ae9        	jp	L741
2039  095d               L46:
2040                     ; 830 				 pulse = counterGetCount();
2042  095d cd0000        	call	_counterGetCount
2044  0960 bf0d          	ldw	_pulse,x
2045                     ; 831 				 time  = counterGetTime ();
2047  0962 cd0000        	call	_counterGetTime
2049  0965 ae0013        	ldw	x,#_time
2050  0968 cd0000        	call	c_rtol
2052                     ; 833 				 if((pulse < PULSE_DEFAULT - 10)||(pulse > PULSE_DEFAULT + 10)||(time < TIME_MIN)||(time > TIME_MAX)){
2054  096b be0d          	ldw	x,_pulse
2055  096d a30250        	cpw	x,#592
2056  0970 2523          	jrult	L314
2058  0972 be0d          	ldw	x,_pulse
2059  0974 a30265        	cpw	x,#613
2060  0977 241c          	jruge	L314
2062  0979 ae0013        	ldw	x,#_time
2063  097c cd0000        	call	c_ltor
2065  097f ae0000        	ldw	x,#L01
2066  0982 cd0000        	call	c_lcmp
2068  0985 250e          	jrult	L314
2070  0987 ae0013        	ldw	x,#_time
2071  098a cd0000        	call	c_ltor
2073  098d ae0004        	ldw	x,#L21
2074  0990 cd0000        	call	c_lcmp
2076  0993 2519          	jrult	L114
2077  0995               L314:
2078                     ; 835 					 repouso(NEGATIVO);
2080  0995 4f            	clr	a
2081  0996 cd0aed        	call	_repouso
2083                     ; 837 					 fail_status = PULSE_FAIL;					 
2085  0999 350f0000      	mov	_fail_status,#15
2086                     ; 838 				   test_state  = TEST_IDLE;
2088  099d 3f01          	clr	_test_state
2089                     ; 840 				   GPIO_WriteLow (L30);					 
2091  099f 4b10          	push	#16
2092  09a1 ae5000        	ldw	x,#20480
2093  09a4 cd0000        	call	_GPIO_WriteLow
2095  09a7 84            	pop	a
2097  09a8               L124:
2098                     ; 851 			   tilt_state = TILT_IDLE;					
2100  09a8 3f03          	clr	_tilt_state
2101  09aa ace90ae9      	jpf	L741
2102  09ae               L114:
2103                     ; 844 					 delay       = TIME_BASE_1S;
2105  09ae ae03e8        	ldw	x,#1000
2106  09b1 bf09          	ldw	_delay,x
2107                     ; 845 					 stack       = TEST_FINISH;	
2109  09b3 35140005      	mov	_stack,#20
2110                     ; 846 					 test_state  = WAIT;				 
2112  09b7 35150001      	mov	_test_state,#21
2113                     ; 847 					 fail_status = APROVED;
2115  09bb 35120000      	mov	_fail_status,#18
2116  09bf 20e7          	jra	L124
2117  09c1               L504:
2118                     ; 859 		 break;		
2120  09c1 ace90ae9      	jpf	L741
2121  09c5               L121:
2122                     ; 861 		 case TEST_LEARN:	 
2122                     ; 862 		 
2122                     ; 863 		 fail_status = TESTING;
2124  09c5 35100000      	mov	_fail_status,#16
2125                     ; 865 		 switch(pgrm_state){
2127  09c9 b602          	ld	a,_pgrm_state
2129                     ; 923 			 break;
2130  09cb 4d            	tnz	a
2131  09cc 270a          	jreq	L321
2132  09ce 4a            	dec	a
2133  09cf 2718          	jreq	L521
2134  09d1 4a            	dec	a
2135  09d2 2754          	jreq	L721
2136  09d4 ace90ae9      	jpf	L741
2137  09d8               L321:
2138                     ; 867 			 case PGRM_IDLE:
2138                     ; 868 			  
2138                     ; 869 			 GPIO_WriteHigh(GRAVADOR);
2140  09d8 4b08          	push	#8
2141  09da ae500f        	ldw	x,#20495
2142  09dd cd0000        	call	_GPIO_WriteHigh
2144  09e0 84            	pop	a
2145                     ; 871 			 pgrm_state = PGRM_DOWNLOADING;
2147  09e1 35010002      	mov	_pgrm_state,#1
2148                     ; 873 			 break;
2150  09e5 ace90ae9      	jpf	L741
2151  09e9               L521:
2152                     ; 875 			 case PGRM_DOWNLOADING:
2152                     ; 876 			 
2152                     ; 877 			 if(timerDelay(TIME_BASE_5S)){
2154  09e9 ae1388        	ldw	x,#5000
2155  09ec cd0000        	call	_timerDelay
2157  09ef 4d            	tnz	a
2158  09f0 2603          	jrne	L66
2159  09f2 cc0ae9        	jp	L741
2160  09f5               L66:
2161                     ; 879 				 if(GPIO_ReadInputPin(GRAVADOR_STATUS) == FALSE){
2163  09f5 4b40          	push	#64
2164  09f7 ae500f        	ldw	x,#20495
2165  09fa cd0000        	call	_GPIO_ReadInputPin
2167  09fd 5b01          	addw	sp,#1
2168  09ff 4d            	tnz	a
2169  0a00 2608          	jrne	L134
2170                     ; 881 					 pgrm_state = PGRM_FINISH;
2172  0a02 35020002      	mov	_pgrm_state,#2
2174  0a06 ace90ae9      	jpf	L741
2175  0a0a               L134:
2176                     ; 885 					 pgrm_state  = PGRM_IDLE;
2178  0a0a 3f02          	clr	_pgrm_state
2179                     ; 886 					 test_state  = TEST_IDLE;           
2181  0a0c 3f01          	clr	_test_state
2182                     ; 887 					 fail_status = DOWNLOAD_FAIL;
2184  0a0e 35010000      	mov	_fail_status,#1
2185                     ; 889            GPIO_WriteLow(L30);
2187  0a12 4b10          	push	#16
2188  0a14 ae5000        	ldw	x,#20480
2189  0a17 cd0000        	call	_GPIO_WriteLow
2191  0a1a 84            	pop	a
2192                     ; 890 					 GPIO_WriteLow(GRAVADOR);
2194  0a1b 4b08          	push	#8
2195  0a1d ae500f        	ldw	x,#20495
2196  0a20 cd0000        	call	_GPIO_WriteLow
2198  0a23 84            	pop	a
2199  0a24 ace90ae9      	jpf	L741
2200  0a28               L721:
2201                     ; 898 			 case PGRM_FINISH:
2201                     ; 899 			 
2201                     ; 900 			 if(timerDelay(TIME_BASE_5S)){
2203  0a28 ae1388        	ldw	x,#5000
2204  0a2b cd0000        	call	_timerDelay
2206  0a2e 4d            	tnz	a
2207  0a2f 2603          	jrne	L07
2208  0a31 cc0ae9        	jp	L741
2209  0a34               L07:
2210                     ; 902 				 if(GPIO_ReadInputPin(GRAVADOR_STATUS) == FALSE){
2212  0a34 4b40          	push	#64
2213  0a36 ae500f        	ldw	x,#20495
2214  0a39 cd0000        	call	_GPIO_ReadInputPin
2216  0a3c 5b01          	addw	sp,#1
2217  0a3e 4d            	tnz	a
2218  0a3f 2608          	jrne	L734
2219                     ; 904 					 fail_status = DOWNLOAD_FAIL;					 
2221  0a41 35010000      	mov	_fail_status,#1
2222                     ; 905 					 test_state  = TEST_IDLE; 
2224  0a45 3f01          	clr	_test_state
2226  0a47 2011          	jra	L144
2227  0a49               L734:
2228                     ; 909 					 delay       = TIME_BASE_100MS;
2230  0a49 ae0064        	ldw	x,#100
2231  0a4c bf09          	ldw	_delay,x
2232                     ; 910 					 stack       = TEST_FINISH;
2234  0a4e 35140005      	mov	_stack,#20
2235                     ; 911 					 test_state  = WAIT;				 
2237  0a52 35150001      	mov	_test_state,#21
2238                     ; 912 					 fail_status = APROVED;	
2240  0a56 35120000      	mov	_fail_status,#18
2241  0a5a               L144:
2242                     ; 916 					pgrm_state = PGRM_IDLE;
2244  0a5a 3f02          	clr	_pgrm_state
2245                     ; 918 					GPIO_WriteLow(L30);
2247  0a5c 4b10          	push	#16
2248  0a5e ae5000        	ldw	x,#20480
2249  0a61 cd0000        	call	_GPIO_WriteLow
2251  0a64 84            	pop	a
2252                     ; 919 					GPIO_WriteLow(GRAVADOR);
2254  0a65 4b08          	push	#8
2255  0a67 ae500f        	ldw	x,#20495
2256  0a6a cd0000        	call	_GPIO_WriteLow
2258  0a6d 84            	pop	a
2259  0a6e 2079          	jra	L741
2260  0a70               L524:
2261                     ; 927      break;
2263  0a70 2077          	jra	L741
2264  0a72               L131:
2265                     ; 929 		 case TEST_FINISH:
2265                     ; 930 		 
2265                     ; 931 		 GPIO_WriteLow(L30);
2267  0a72 4b10          	push	#16
2268  0a74 ae5000        	ldw	x,#20480
2269  0a77 cd0000        	call	_GPIO_WriteLow
2271  0a7a 84            	pop	a
2272                     ; 932 		 GPIO_WriteLow(IGN);
2274  0a7b 4b08          	push	#8
2275  0a7d ae5000        	ldw	x,#20480
2276  0a80 cd0000        	call	_GPIO_WriteLow
2278  0a83 84            	pop	a
2279                     ; 933 		 GPIO_WriteLow(SW1_P);
2281  0a84 4b04          	push	#4
2282  0a86 ae500a        	ldw	x,#20490
2283  0a89 cd0000        	call	_GPIO_WriteLow
2285  0a8c 84            	pop	a
2286                     ; 934 		 GPIO_WriteLow(SW2_P);
2288  0a8d 4b10          	push	#16
2289  0a8f ae500a        	ldw	x,#20490
2290  0a92 cd0000        	call	_GPIO_WriteLow
2292  0a95 84            	pop	a
2293                     ; 935 		 GPIO_WriteLow(SW3_P);
2295  0a96 4b40          	push	#64
2296  0a98 ae500a        	ldw	x,#20490
2297  0a9b cd0000        	call	_GPIO_WriteLow
2299  0a9e 84            	pop	a
2300                     ; 936 		 GPIO_WriteLow(SW1_N);
2302  0a9f 4b04          	push	#4
2303  0aa1 ae5014        	ldw	x,#20500
2304  0aa4 cd0000        	call	_GPIO_WriteLow
2306  0aa7 84            	pop	a
2307                     ; 937 		 GPIO_WriteLow(SW2_N);
2309  0aa8 4b02          	push	#2
2310  0aaa ae5014        	ldw	x,#20500
2311  0aad cd0000        	call	_GPIO_WriteLow
2313  0ab0 84            	pop	a
2314                     ; 938 		 GPIO_WriteLow(SW3_N);
2316  0ab1 4b01          	push	#1
2317  0ab3 ae5014        	ldw	x,#20500
2318  0ab6 cd0000        	call	_GPIO_WriteLow
2320  0ab9 84            	pop	a
2321                     ; 939 		 GPIO_WriteLow(CMD_UP);
2323  0aba 4b01          	push	#1
2324  0abc ae500f        	ldw	x,#20495
2325  0abf cd0000        	call	_GPIO_WriteLow
2327  0ac2 84            	pop	a
2328                     ; 940 		 GPIO_WriteLow(CMD_DOWN);
2330  0ac3 4b04          	push	#4
2331  0ac5 ae500f        	ldw	x,#20495
2332  0ac8 cd0000        	call	_GPIO_WriteLow
2334  0acb 84            	pop	a
2335                     ; 942 		 jumperEnable(1, ENABLE);
2337  0acc ae0101        	ldw	x,#257
2338  0acf cd0daa        	call	_jumperEnable
2340                     ; 943 		 jumperEnable(2, ENABLE);
2342  0ad2 ae0201        	ldw	x,#513
2343  0ad5 cd0daa        	call	_jumperEnable
2345                     ; 945 		 fail_status = OK;
2347  0ad8 3f00          	clr	_fail_status
2348                     ; 946 		 test_state  = TEST_IDLE;		 
2350  0ada 3f01          	clr	_test_state
2351                     ; 948 		 break;
2353  0adc 200b          	jra	L741
2354  0ade               L331:
2355                     ; 950 		 case WAIT:
2355                     ; 951 		 
2355                     ; 952 		 if(timerDelay(delay)){
2357  0ade be09          	ldw	x,_delay
2358  0ae0 cd0000        	call	_timerDelay
2360  0ae3 4d            	tnz	a
2361  0ae4 2703          	jreq	L741
2362                     ; 954 			 test_state = stack; 
2364  0ae6 450501        	mov	_test_state,_stack
2365  0ae9               L741:
2366                     ; 962   }
2369  0ae9 81            	ret
2393                     ; 971  uint8_t testGetStatus(void){
2394                     	switch	.text
2395  0aea               _testGetStatus:
2399                     ; 973 	 return fail_status;	 
2401  0aea b600          	ld	a,_fail_status
2404  0aec 81            	ret
2440                     ; 984 void repouso(uint8_t repouso_x){
2441                     	switch	.text
2442  0aed               _repouso:
2446                     ; 986 	switch(repouso_x){
2449                     ; 1019 		break;
2450  0aed 4d            	tnz	a
2451  0aee 270a          	jreq	L554
2452  0af0 4a            	dec	a
2453  0af1 273f          	jreq	L754
2454  0af3 4a            	dec	a
2455  0af4 2774          	jreq	L164
2456  0af6 aca00ba0      	jpf	L305
2457  0afa               L554:
2458                     ; 988 		case NEGATIVO:
2458                     ; 989 		
2458                     ; 990 	  GPIO_WriteLow (SW1_P);
2460  0afa 4b04          	push	#4
2461  0afc ae500a        	ldw	x,#20490
2462  0aff cd0000        	call	_GPIO_WriteLow
2464  0b02 84            	pop	a
2465                     ; 991 		GPIO_WriteLow (SW2_P);
2467  0b03 4b10          	push	#16
2468  0b05 ae500a        	ldw	x,#20490
2469  0b08 cd0000        	call	_GPIO_WriteLow
2471  0b0b 84            	pop	a
2472                     ; 992 		GPIO_WriteLow (SW3_P);
2474  0b0c 4b40          	push	#64
2475  0b0e ae500a        	ldw	x,#20490
2476  0b11 cd0000        	call	_GPIO_WriteLow
2478  0b14 84            	pop	a
2479                     ; 993 		GPIO_WriteHigh(SW1_N);
2481  0b15 4b04          	push	#4
2482  0b17 ae5014        	ldw	x,#20500
2483  0b1a cd0000        	call	_GPIO_WriteHigh
2485  0b1d 84            	pop	a
2486                     ; 994 		GPIO_WriteHigh(SW2_N);
2488  0b1e 4b02          	push	#2
2489  0b20 ae5014        	ldw	x,#20500
2490  0b23 cd0000        	call	_GPIO_WriteHigh
2492  0b26 84            	pop	a
2493                     ; 995 		GPIO_WriteHigh(SW3_N);
2495  0b27 4b01          	push	#1
2496  0b29 ae5014        	ldw	x,#20500
2497  0b2c cd0000        	call	_GPIO_WriteHigh
2499  0b2f 84            	pop	a
2500                     ; 997 		break;
2502  0b30 206e          	jra	L305
2503  0b32               L754:
2504                     ; 999 		case POSITIVO:
2504                     ; 1000 		
2504                     ; 1001 		GPIO_WriteLow (SW1_N);
2506  0b32 4b04          	push	#4
2507  0b34 ae5014        	ldw	x,#20500
2508  0b37 cd0000        	call	_GPIO_WriteLow
2510  0b3a 84            	pop	a
2511                     ; 1002 		GPIO_WriteLow (SW2_N);
2513  0b3b 4b02          	push	#2
2514  0b3d ae5014        	ldw	x,#20500
2515  0b40 cd0000        	call	_GPIO_WriteLow
2517  0b43 84            	pop	a
2518                     ; 1003 		GPIO_WriteLow (SW3_N);
2520  0b44 4b01          	push	#1
2521  0b46 ae5014        	ldw	x,#20500
2522  0b49 cd0000        	call	_GPIO_WriteLow
2524  0b4c 84            	pop	a
2525                     ; 1004 		GPIO_WriteHigh(SW1_P);
2527  0b4d 4b04          	push	#4
2528  0b4f ae500a        	ldw	x,#20490
2529  0b52 cd0000        	call	_GPIO_WriteHigh
2531  0b55 84            	pop	a
2532                     ; 1005 		GPIO_WriteHigh(SW2_P);
2534  0b56 4b10          	push	#16
2535  0b58 ae500a        	ldw	x,#20490
2536  0b5b cd0000        	call	_GPIO_WriteHigh
2538  0b5e 84            	pop	a
2539                     ; 1006 		GPIO_WriteHigh(SW3_P);
2541  0b5f 4b40          	push	#64
2542  0b61 ae500a        	ldw	x,#20490
2543  0b64 cd0000        	call	_GPIO_WriteHigh
2545  0b67 84            	pop	a
2546                     ; 1008 		break;
2548  0b68 2036          	jra	L305
2549  0b6a               L164:
2550                     ; 1010 		case ABERTO:
2550                     ; 1011 		
2550                     ; 1012 		GPIO_WriteLow(SW1_N);
2552  0b6a 4b04          	push	#4
2553  0b6c ae5014        	ldw	x,#20500
2554  0b6f cd0000        	call	_GPIO_WriteLow
2556  0b72 84            	pop	a
2557                     ; 1013 		GPIO_WriteLow(SW2_N);
2559  0b73 4b02          	push	#2
2560  0b75 ae5014        	ldw	x,#20500
2561  0b78 cd0000        	call	_GPIO_WriteLow
2563  0b7b 84            	pop	a
2564                     ; 1014 		GPIO_WriteLow(SW3_N);
2566  0b7c 4b01          	push	#1
2567  0b7e ae5014        	ldw	x,#20500
2568  0b81 cd0000        	call	_GPIO_WriteLow
2570  0b84 84            	pop	a
2571                     ; 1015 		GPIO_WriteLow(SW1_P);
2573  0b85 4b04          	push	#4
2574  0b87 ae500a        	ldw	x,#20490
2575  0b8a cd0000        	call	_GPIO_WriteLow
2577  0b8d 84            	pop	a
2578                     ; 1016 		GPIO_WriteLow(SW2_P);
2580  0b8e 4b10          	push	#16
2581  0b90 ae500a        	ldw	x,#20490
2582  0b93 cd0000        	call	_GPIO_WriteLow
2584  0b96 84            	pop	a
2585                     ; 1017 		GPIO_WriteLow(SW3_P);
2587  0b97 4b40          	push	#64
2588  0b99 ae500a        	ldw	x,#20490
2589  0b9c cd0000        	call	_GPIO_WriteLow
2591  0b9f 84            	pop	a
2592                     ; 1019 		break;
2594  0ba0               L305:
2595                     ; 1022 }
2598  0ba0 81            	ret
2634                     ; 1031 void down(uint8_t down_x){
2635                     	switch	.text
2636  0ba1               _down:
2640                     ; 1033 	switch(down_x){
2643                     ; 1089 		break;
2644  0ba1 4d            	tnz	a
2645  0ba2 2719          	jreq	L505
2646  0ba4 4a            	dec	a
2647  0ba5 2750          	jreq	L705
2648  0ba7 4a            	dec	a
2649  0ba8 2603cc0c31    	jreq	L115
2650  0bad 4a            	dec	a
2651  0bae 2603          	jrne	L001
2652  0bb0 cc0c69        	jp	L315
2653  0bb3               L001:
2654  0bb3 4a            	dec	a
2655  0bb4 2603          	jrne	L201
2656  0bb6 cc0ca1        	jp	L515
2657  0bb9               L201:
2658  0bb9 acd70cd7      	jpf	L735
2659  0bbd               L505:
2660                     ; 1035 		case P1:
2660                     ; 1036 		
2660                     ; 1037 		GPIO_WriteLow (SW1_P);
2662  0bbd 4b04          	push	#4
2663  0bbf ae500a        	ldw	x,#20490
2664  0bc2 cd0000        	call	_GPIO_WriteLow
2666  0bc5 84            	pop	a
2667                     ; 1038 		GPIO_WriteHigh(SW1_N);		
2669  0bc6 4b04          	push	#4
2670  0bc8 ae5014        	ldw	x,#20500
2671  0bcb cd0000        	call	_GPIO_WriteHigh
2673  0bce 84            	pop	a
2674                     ; 1039 		GPIO_WriteLow (SW2_N);
2676  0bcf 4b02          	push	#2
2677  0bd1 ae5014        	ldw	x,#20500
2678  0bd4 cd0000        	call	_GPIO_WriteLow
2680  0bd7 84            	pop	a
2681                     ; 1040 		GPIO_WriteHigh(SW2_P);
2683  0bd8 4b10          	push	#16
2684  0bda ae500a        	ldw	x,#20490
2685  0bdd cd0000        	call	_GPIO_WriteHigh
2687  0be0 84            	pop	a
2688                     ; 1041 		GPIO_WriteLow (SW3_P);
2690  0be1 4b40          	push	#64
2691  0be3 ae500a        	ldw	x,#20490
2692  0be6 cd0000        	call	_GPIO_WriteLow
2694  0be9 84            	pop	a
2695                     ; 1042 		GPIO_WriteHigh(SW3_N);
2697  0bea 4b01          	push	#1
2698  0bec ae5014        	ldw	x,#20500
2699  0bef cd0000        	call	_GPIO_WriteHigh
2701  0bf2 84            	pop	a
2702                     ; 1045 		break;
2704  0bf3 acd70cd7      	jpf	L735
2705  0bf7               L705:
2706                     ; 1047 		case P2:
2706                     ; 1048 		
2706                     ; 1049 		GPIO_WriteLow (SW1_P);
2708  0bf7 4b04          	push	#4
2709  0bf9 ae500a        	ldw	x,#20490
2710  0bfc cd0000        	call	_GPIO_WriteLow
2712  0bff 84            	pop	a
2713                     ; 1050 		GPIO_WriteHigh(SW1_N);		
2715  0c00 4b04          	push	#4
2716  0c02 ae5014        	ldw	x,#20500
2717  0c05 cd0000        	call	_GPIO_WriteHigh
2719  0c08 84            	pop	a
2720                     ; 1051 		GPIO_WriteLow (SW2_N);
2722  0c09 4b02          	push	#2
2723  0c0b ae5014        	ldw	x,#20500
2724  0c0e cd0000        	call	_GPIO_WriteLow
2726  0c11 84            	pop	a
2727                     ; 1052 		GPIO_WriteHigh(SW2_P);
2729  0c12 4b10          	push	#16
2730  0c14 ae500a        	ldw	x,#20490
2731  0c17 cd0000        	call	_GPIO_WriteHigh
2733  0c1a 84            	pop	a
2734                     ; 1053 		GPIO_WriteLow (SW3_P);
2736  0c1b 4b40          	push	#64
2737  0c1d ae500a        	ldw	x,#20490
2738  0c20 cd0000        	call	_GPIO_WriteLow
2740  0c23 84            	pop	a
2741                     ; 1054 		GPIO_WriteHigh(SW3_N);
2743  0c24 4b01          	push	#1
2744  0c26 ae5014        	ldw	x,#20500
2745  0c29 cd0000        	call	_GPIO_WriteHigh
2747  0c2c 84            	pop	a
2748                     ; 1056 		break;
2750  0c2d acd70cd7      	jpf	L735
2751  0c31               L115:
2752                     ; 1058 		case P3:
2752                     ; 1059 		
2752                     ; 1060 		GPIO_WriteLow (SW1_P);
2754  0c31 4b04          	push	#4
2755  0c33 ae500a        	ldw	x,#20490
2756  0c36 cd0000        	call	_GPIO_WriteLow
2758  0c39 84            	pop	a
2759                     ; 1061 		GPIO_WriteHigh(SW1_N);		
2761  0c3a 4b04          	push	#4
2762  0c3c ae5014        	ldw	x,#20500
2763  0c3f cd0000        	call	_GPIO_WriteHigh
2765  0c42 84            	pop	a
2766                     ; 1062 		GPIO_WriteLow (SW2_N);
2768  0c43 4b02          	push	#2
2769  0c45 ae5014        	ldw	x,#20500
2770  0c48 cd0000        	call	_GPIO_WriteLow
2772  0c4b 84            	pop	a
2773                     ; 1063 		GPIO_WriteHigh(SW2_P);
2775  0c4c 4b10          	push	#16
2776  0c4e ae500a        	ldw	x,#20490
2777  0c51 cd0000        	call	_GPIO_WriteHigh
2779  0c54 84            	pop	a
2780                     ; 1064 		GPIO_WriteLow (SW3_N);
2782  0c55 4b01          	push	#1
2783  0c57 ae5014        	ldw	x,#20500
2784  0c5a cd0000        	call	_GPIO_WriteLow
2786  0c5d 84            	pop	a
2787                     ; 1065 		GPIO_WriteHigh(SW3_P);
2789  0c5e 4b40          	push	#64
2790  0c60 ae500a        	ldw	x,#20490
2791  0c63 cd0000        	call	_GPIO_WriteHigh
2793  0c66 84            	pop	a
2794                     ; 1067 		break;
2796  0c67 206e          	jra	L735
2797  0c69               L315:
2798                     ; 1069 		case P4:
2798                     ; 1070 		
2798                     ; 1071 		GPIO_WriteLow (SW1_P);
2800  0c69 4b04          	push	#4
2801  0c6b ae500a        	ldw	x,#20490
2802  0c6e cd0000        	call	_GPIO_WriteLow
2804  0c71 84            	pop	a
2805                     ; 1072 		GPIO_WriteHigh(SW1_N);		
2807  0c72 4b04          	push	#4
2808  0c74 ae5014        	ldw	x,#20500
2809  0c77 cd0000        	call	_GPIO_WriteHigh
2811  0c7a 84            	pop	a
2812                     ; 1073 		GPIO_WriteLow (SW2_N);
2814  0c7b 4b02          	push	#2
2815  0c7d ae5014        	ldw	x,#20500
2816  0c80 cd0000        	call	_GPIO_WriteLow
2818  0c83 84            	pop	a
2819                     ; 1074 		GPIO_WriteHigh(SW2_P);
2821  0c84 4b10          	push	#16
2822  0c86 ae500a        	ldw	x,#20490
2823  0c89 cd0000        	call	_GPIO_WriteHigh
2825  0c8c 84            	pop	a
2826                     ; 1075 		GPIO_WriteLow (SW3_N);
2828  0c8d 4b01          	push	#1
2829  0c8f ae5014        	ldw	x,#20500
2830  0c92 cd0000        	call	_GPIO_WriteLow
2832  0c95 84            	pop	a
2833                     ; 1076 		GPIO_WriteLow (SW3_P);
2835  0c96 4b40          	push	#64
2836  0c98 ae500a        	ldw	x,#20490
2837  0c9b cd0000        	call	_GPIO_WriteLow
2839  0c9e 84            	pop	a
2840                     ; 1078 		break;
2842  0c9f 2036          	jra	L735
2843  0ca1               L515:
2844                     ; 1080 		case P5:
2844                     ; 1081    
2844                     ; 1082 		GPIO_WriteLow (SW1_P);
2846  0ca1 4b04          	push	#4
2847  0ca3 ae500a        	ldw	x,#20490
2848  0ca6 cd0000        	call	_GPIO_WriteLow
2850  0ca9 84            	pop	a
2851                     ; 1083 		GPIO_WriteHigh(SW1_N);		
2853  0caa 4b04          	push	#4
2854  0cac ae5014        	ldw	x,#20500
2855  0caf cd0000        	call	_GPIO_WriteHigh
2857  0cb2 84            	pop	a
2858                     ; 1084 		GPIO_WriteLow (SW2_N);
2860  0cb3 4b02          	push	#2
2861  0cb5 ae5014        	ldw	x,#20500
2862  0cb8 cd0000        	call	_GPIO_WriteLow
2864  0cbb 84            	pop	a
2865                     ; 1085 		GPIO_WriteHigh(SW2_P);
2867  0cbc 4b10          	push	#16
2868  0cbe ae500a        	ldw	x,#20490
2869  0cc1 cd0000        	call	_GPIO_WriteHigh
2871  0cc4 84            	pop	a
2872                     ; 1086 		GPIO_WriteLow (SW3_N);
2874  0cc5 4b01          	push	#1
2875  0cc7 ae5014        	ldw	x,#20500
2876  0cca cd0000        	call	_GPIO_WriteLow
2878  0ccd 84            	pop	a
2879                     ; 1087 		GPIO_WriteLow (SW3_P);
2881  0cce 4b40          	push	#64
2882  0cd0 ae500a        	ldw	x,#20490
2883  0cd3 cd0000        	call	_GPIO_WriteLow
2885  0cd6 84            	pop	a
2886                     ; 1089 		break;
2888  0cd7               L735:
2889                     ; 1092 }
2892  0cd7 81            	ret
2928                     ; 1101 void set_high(uint8_t sw_x){
2929                     	switch	.text
2930  0cd8               _set_high:
2934                     ; 1103 	switch (sw_x){
2937                     ; 1124 		break;
2938  0cd8 4d            	tnz	a
2939  0cd9 2708          	jreq	L145
2940  0cdb 4a            	dec	a
2941  0cdc 2719          	jreq	L345
2942  0cde 4a            	dec	a
2943  0cdf 272a          	jreq	L545
2944  0ce1 203a          	jra	L765
2945  0ce3               L145:
2946                     ; 1105 		case SW1:
2946                     ; 1106 		
2946                     ; 1107 		GPIO_WriteLow (SW1_N);
2948  0ce3 4b04          	push	#4
2949  0ce5 ae5014        	ldw	x,#20500
2950  0ce8 cd0000        	call	_GPIO_WriteLow
2952  0ceb 84            	pop	a
2953                     ; 1108 		GPIO_WriteHigh(SW1_P);
2955  0cec 4b04          	push	#4
2956  0cee ae500a        	ldw	x,#20490
2957  0cf1 cd0000        	call	_GPIO_WriteHigh
2959  0cf4 84            	pop	a
2960                     ; 1110 		break;
2962  0cf5 2026          	jra	L765
2963  0cf7               L345:
2964                     ; 1112 		case SW2:
2964                     ; 1113 		
2964                     ; 1114 		GPIO_WriteLow (SW2_N);
2966  0cf7 4b02          	push	#2
2967  0cf9 ae5014        	ldw	x,#20500
2968  0cfc cd0000        	call	_GPIO_WriteLow
2970  0cff 84            	pop	a
2971                     ; 1115 		GPIO_WriteHigh(SW2_P);
2973  0d00 4b10          	push	#16
2974  0d02 ae500a        	ldw	x,#20490
2975  0d05 cd0000        	call	_GPIO_WriteHigh
2977  0d08 84            	pop	a
2978                     ; 1117 		break;
2980  0d09 2012          	jra	L765
2981  0d0b               L545:
2982                     ; 1119 		case SW3:
2982                     ; 1120 		
2982                     ; 1121 		GPIO_WriteLow (SW3_N);
2984  0d0b 4b01          	push	#1
2985  0d0d ae5014        	ldw	x,#20500
2986  0d10 cd0000        	call	_GPIO_WriteLow
2988  0d13 84            	pop	a
2989                     ; 1122 		GPIO_WriteHigh(SW3_P);
2991  0d14 4b40          	push	#64
2992  0d16 ae500a        	ldw	x,#20490
2993  0d19 cd0000        	call	_GPIO_WriteHigh
2995  0d1c 84            	pop	a
2996                     ; 1124 		break;
2998  0d1d               L765:
2999                     ; 1129 }
3002  0d1d 81            	ret
3037                     ; 1138 void set_open(uint8_t sw_x){
3038                     	switch	.text
3039  0d1e               _set_open:
3043                     ; 1140 	switch (sw_x){
3046                     ; 1161 		break;
3047  0d1e 4d            	tnz	a
3048  0d1f 2708          	jreq	L175
3049  0d21 4a            	dec	a
3050  0d22 2719          	jreq	L375
3051  0d24 4a            	dec	a
3052  0d25 272a          	jreq	L575
3053  0d27 203a          	jra	L716
3054  0d29               L175:
3055                     ; 1142 		case SW1:
3055                     ; 1143 		
3055                     ; 1144 		GPIO_WriteLow(SW1_N);
3057  0d29 4b04          	push	#4
3058  0d2b ae5014        	ldw	x,#20500
3059  0d2e cd0000        	call	_GPIO_WriteLow
3061  0d31 84            	pop	a
3062                     ; 1145 		GPIO_WriteLow(SW1_P);
3064  0d32 4b04          	push	#4
3065  0d34 ae500a        	ldw	x,#20490
3066  0d37 cd0000        	call	_GPIO_WriteLow
3068  0d3a 84            	pop	a
3069                     ; 1147 		break;
3071  0d3b 2026          	jra	L716
3072  0d3d               L375:
3073                     ; 1149 		case SW2:
3073                     ; 1150 		
3073                     ; 1151 		GPIO_WriteLow(SW2_N);
3075  0d3d 4b02          	push	#2
3076  0d3f ae5014        	ldw	x,#20500
3077  0d42 cd0000        	call	_GPIO_WriteLow
3079  0d45 84            	pop	a
3080                     ; 1152 		GPIO_WriteLow(SW2_P);
3082  0d46 4b10          	push	#16
3083  0d48 ae500a        	ldw	x,#20490
3084  0d4b cd0000        	call	_GPIO_WriteLow
3086  0d4e 84            	pop	a
3087                     ; 1154 		break;
3089  0d4f 2012          	jra	L716
3090  0d51               L575:
3091                     ; 1156 		case SW3:
3091                     ; 1157 		
3091                     ; 1158 		GPIO_WriteLow(SW3_N);
3093  0d51 4b01          	push	#1
3094  0d53 ae5014        	ldw	x,#20500
3095  0d56 cd0000        	call	_GPIO_WriteLow
3097  0d59 84            	pop	a
3098                     ; 1159 		GPIO_WriteLow(SW3_P);
3100  0d5a 4b40          	push	#64
3101  0d5c ae500a        	ldw	x,#20490
3102  0d5f cd0000        	call	_GPIO_WriteLow
3104  0d62 84            	pop	a
3105                     ; 1161 		break;
3107  0d63               L716:
3108                     ; 1166 }
3111  0d63 81            	ret
3147                     ; 1175 void set_low(uint8_t sw_x){
3148                     	switch	.text
3149  0d64               _set_low:
3153                     ; 1177 	switch (sw_x){
3156                     ; 1198 		break;
3157  0d64 4d            	tnz	a
3158  0d65 2708          	jreq	L126
3159  0d67 4a            	dec	a
3160  0d68 2719          	jreq	L326
3161  0d6a 4a            	dec	a
3162  0d6b 272a          	jreq	L526
3163  0d6d 203a          	jra	L746
3164  0d6f               L126:
3165                     ; 1179 		case SW1:
3165                     ; 1180 		
3165                     ; 1181 		GPIO_WriteLow (SW1_P);
3167  0d6f 4b04          	push	#4
3168  0d71 ae500a        	ldw	x,#20490
3169  0d74 cd0000        	call	_GPIO_WriteLow
3171  0d77 84            	pop	a
3172                     ; 1182 		GPIO_WriteHigh(SW1_N);
3174  0d78 4b04          	push	#4
3175  0d7a ae5014        	ldw	x,#20500
3176  0d7d cd0000        	call	_GPIO_WriteHigh
3178  0d80 84            	pop	a
3179                     ; 1184 		break;
3181  0d81 2026          	jra	L746
3182  0d83               L326:
3183                     ; 1186 		case SW2:
3183                     ; 1187 		
3183                     ; 1188 		GPIO_WriteLow (SW2_P);
3185  0d83 4b10          	push	#16
3186  0d85 ae500a        	ldw	x,#20490
3187  0d88 cd0000        	call	_GPIO_WriteLow
3189  0d8b 84            	pop	a
3190                     ; 1189 		GPIO_WriteHigh(SW2_N);
3192  0d8c 4b02          	push	#2
3193  0d8e ae5014        	ldw	x,#20500
3194  0d91 cd0000        	call	_GPIO_WriteHigh
3196  0d94 84            	pop	a
3197                     ; 1191 		break;
3199  0d95 2012          	jra	L746
3200  0d97               L526:
3201                     ; 1193 		case SW3:
3201                     ; 1194 		
3201                     ; 1195 		GPIO_WriteLow (SW3_P);
3203  0d97 4b40          	push	#64
3204  0d99 ae500a        	ldw	x,#20490
3205  0d9c cd0000        	call	_GPIO_WriteLow
3207  0d9f 84            	pop	a
3208                     ; 1196 		GPIO_WriteHigh(SW3_N);
3210  0da0 4b01          	push	#1
3211  0da2 ae5014        	ldw	x,#20500
3212  0da5 cd0000        	call	_GPIO_WriteHigh
3214  0da8 84            	pop	a
3215                     ; 1198 		break;
3217  0da9               L746:
3218                     ; 1203 }
3221  0da9 81            	ret
3287                     ; 1212 void jumperEnable(uint8_t jp_x, bool status){
3288                     	switch	.text
3289  0daa               _jumperEnable:
3291  0daa 89            	pushw	x
3292       00000000      OFST:	set	0
3295                     ; 1230 	if(jp_x == 1){
3297  0dab 9e            	ld	a,xh
3298  0dac a101          	cp	a,#1
3299  0dae 2618          	jrne	L307
3300                     ; 1232 		if(status){
3302  0db0 9f            	ld	a,xl
3303  0db1 4d            	tnz	a
3304  0db2 270b          	jreq	L507
3305                     ; 1234 		 GPIO_WriteLow(JP1);
3307  0db4 4b20          	push	#32
3308  0db6 ae500f        	ldw	x,#20495
3309  0db9 cd0000        	call	_GPIO_WriteLow
3311  0dbc 84            	pop	a
3313  0dbd 2009          	jra	L307
3314  0dbf               L507:
3315                     ; 1238 		 GPIO_WriteHigh(JP1);	
3317  0dbf 4b20          	push	#32
3318  0dc1 ae500f        	ldw	x,#20495
3319  0dc4 cd0000        	call	_GPIO_WriteHigh
3321  0dc7 84            	pop	a
3322  0dc8               L307:
3323                     ; 1244 	if(jp_x == 2){
3325  0dc8 7b01          	ld	a,(OFST+1,sp)
3326  0dca a102          	cp	a,#2
3327  0dcc 2618          	jrne	L117
3328                     ; 1246 	 if(status){
3330  0dce 0d02          	tnz	(OFST+2,sp)
3331  0dd0 270b          	jreq	L317
3332                     ; 1248 		 GPIO_WriteLow(JP2);
3334  0dd2 4b10          	push	#16
3335  0dd4 ae500f        	ldw	x,#20495
3336  0dd7 cd0000        	call	_GPIO_WriteLow
3338  0dda 84            	pop	a
3340  0ddb 2009          	jra	L117
3341  0ddd               L317:
3342                     ; 1252 		 GPIO_WriteHigh(JP2);	
3344  0ddd 4b10          	push	#16
3345  0ddf ae500f        	ldw	x,#20495
3346  0de2 cd0000        	call	_GPIO_WriteHigh
3348  0de5 84            	pop	a
3349  0de6               L117:
3350                     ; 1259 }
3353  0de6 85            	popw	x
3354  0de7 81            	ret
3505                     	xdef	_time
3506                     	xdef	_input_addr
3507                     	xdef	_p_input
3508                     	xdef	_pulse
3509                     	xdef	_aux
3510                     	xdef	_delay
3511                     	xdef	_rx
3512                     	xdef	_px
3513                     	xdef	_deboucing
3514                     	xdef	_stack
3515                     	xdef	_conf_state
3516                     	xdef	_tilt_state
3517                     	xdef	_pgrm_state
3518                     	xdef	_test_state
3519                     	xdef	_fail_status
3520                     	xdef	_jumperEnable
3521                     	xdef	_testGetStatus
3522                     	xdef	_set_low
3523                     	xdef	_set_open
3524                     	xdef	_set_high
3525                     	xdef	_down
3526                     	xdef	_repouso
3527                     	xdef	_testRun
3528                     	xdef	_testSetInputAddress
3529                     	xref	_counterEnable
3530                     	xref	_counterGetTime
3531                     	xref	_counterGetCount
3532                     	xref	_timerDelay
3533                     	xref	_timerGetOverflow
3534                     	xref	_timerSetOverflowValue
3535                     	xref	_timerReset
3536                     	xref	_timerEnable
3537                     	xref	_GPIO_ReadInputPin
3538                     	xref	_GPIO_WriteLow
3539                     	xref	_GPIO_WriteHigh
3558                     	xref	c_lcmp
3559                     	xref	c_ltor
3560                     	xref	c_rtol
3561                     	end
