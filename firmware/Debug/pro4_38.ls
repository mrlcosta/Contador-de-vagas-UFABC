   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.3 - 27 Jul 2015
   3                     ; Generator (Limited) V4.4.2 - 04 Jun 2015
  15                     	bsct
  16  0000               _state:
  17  0000 00            	dc.b	0
  18  0001               _stack:
  19  0001 00            	dc.b	0
  20  0002               _delay:
  21  0002 00            	dc.b	0
  22  0003               _model_out:
  23  0003 00            	dc.b	0
  24  0004               _model_in:
  25  0004 00            	dc.b	0
  26  0005               _buffer:
  27  0005 0000          	dc.w	0
  28  0007               _deboucing:
  29  0007 00            	dc.b	0
  30  0008               _ack:
  31  0008 00            	dc.b	0
  32  0009               _buzzer:
  33  0009 00            	dc.b	0
  34  000a               _blink:
  35  000a 00            	dc.b	0
  36  000b               _menu:
  37  000b 00            	dc.b	0
  38  000c               _start:
  39  000c 01            	dc.b	1
  99                     .const:	section	.text
 100  0000               L01:
 101  0000 012b          	dc.w	L3
 102  0002 0163          	dc.w	L5
 103  0004 01c9          	dc.w	L7
 104  0006 0250          	dc.w	L11
 105  0008 0293          	dc.w	L31
 106  000a 02d6          	dc.w	L51
 107  000c 0322          	dc.w	L71
 108  000e 036e          	dc.w	L12
 109  0010 03ba          	dc.w	L32
 110  0012 0406          	dc.w	L52
 111  0014 0452          	dc.w	L72
 112  0016 049e          	dc.w	L13
 113  0018 04ea          	dc.w	L33
 114  001a 0536          	dc.w	L53
 115  001c 0582          	dc.w	L73
 116  001e 05ce          	dc.w	L14
 117  0020 0638          	dc.w	L34
 118  0022 067b          	dc.w	L54
 119  0024 06be          	dc.w	L74
 120  0026 0701          	dc.w	L15
 121  0028 0744          	dc.w	L35
 122  002a 0787          	dc.w	L55
 123  002c 07d3          	dc.w	L75
 124  002e 0834          	dc.w	L16
 125  0030 0877          	dc.w	L36
 126  0032 08ba          	dc.w	L56
 127  0034 08fd          	dc.w	L76
 128  0036 0940          	dc.w	L17
 129  0038 0983          	dc.w	L37
 130  003a 09c6          	dc.w	L57
 131  003c 0a09          	dc.w	L77
 132  003e 0a4c          	dc.w	L101
 133  0040 0ac8          	dc.w	L301
 134  0042 0b39          	dc.w	L501
 135  0044 0b7c          	dc.w	L701
 136  0046 0bbf          	dc.w	L111
 137  0048 0c14          	dc.w	L311
 138  004a 0c85          	dc.w	L511
 139  004c 0cc8          	dc.w	L711
 140  004e 0d0b          	dc.w	L121
 141  0050 0d65          	dc.w	L321
 142  0052 0dd6          	dc.w	L521
 143  0054 0e1e          	dc.w	L721
 144  0056 0e66          	dc.w	L131
 145  0058 0ec0          	dc.w	L331
 146  005a 0f63          	dc.w	L531
 147  005c 0fa6          	dc.w	L731
 148  005e 0fe9          	dc.w	L141
 149  0060 1070          	dc.w	L341
 150  0062 10fd          	dc.w	L541
 151  0064 115c          	dc.w	L741
 152  0066 11bb          	dc.w	L151
 153  0068 122c          	dc.w	L351
 154  006a 12b9          	dc.w	L551
 155  006c 1318          	dc.w	L751
 156  006e 1377          	dc.w	L161
 157  0070 13e8          	dc.w	L361
 158  0072 1475          	dc.w	L561
 159  0074 14d4          	dc.w	L761
 160  0076 1533          	dc.w	L171
 161  0078 15a4          	dc.w	L371
 162  007a 1631          	dc.w	L571
 163  007c 168b          	dc.w	L771
 164  007e 16e5          	dc.w	L102
 165  0080 1751          	dc.w	L302
 166  0082 17de          	dc.w	L502
 167  0084 1838          	dc.w	L702
 168  0086 1892          	dc.w	L112
 169  0088 18fe          	dc.w	L312
 170  008a 198b          	dc.w	L512
 171  008c 19e5          	dc.w	L712
 172  008e 1a3f          	dc.w	L122
 173  0090 1aab          	dc.w	L322
 174  0092 1b38          	dc.w	L522
 175  0094 1b92          	dc.w	L722
 176  0096 1bec          	dc.w	L132
 177  0098 1c58          	dc.w	L332
 178  009a 1cc6          	dc.w	L532
 179  009c 1d0a          	dc.w	L732
 180  009e 1d4e          	dc.w	L142
 181  00a0 1d9b          	dc.w	L342
 182  00a2 1e2b          	dc.w	L542
 183                     ; 50 void test(uint8_t *control){
 184                     	scross	off
 185                     	switch	.text
 186  0000               _test:
 188  0000 89            	pushw	x
 189       00000000      OFST:	set	0
 192                     ; 52 	 if(((*buffer > 500)&&(*buffer < 4500))||(*(buffer + 2) < 3500)){
 194  0001 be05          	ldw	x,_buffer
 195  0003 9093          	ldw	y,x
 196  0005 90fe          	ldw	y,(y)
 197  0007 90a301f5      	cpw	y,#501
 198  000b 250c          	jrult	L772
 200  000d be05          	ldw	x,_buffer
 201  000f 9093          	ldw	y,x
 202  0011 90fe          	ldw	y,(y)
 203  0013 90a31194      	cpw	y,#4500
 204  0017 250d          	jrult	L572
 205  0019               L772:
 207  0019 be05          	ldw	x,_buffer
 208  001b 9093          	ldw	y,x
 209  001d 90ee04        	ldw	y,(4,y)
 210  0020 90a30dac      	cpw	y,#3500
 211  0024 2419          	jruge	L372
 212  0026               L572:
 213                     ; 54 		 *control  = 0;
 215  0026 1e01          	ldw	x,(OFST+1,sp)
 216  0028 7f            	clr	(x)
 217                     ; 55 		  state    = 0;
 219  0029 3f00          	clr	_state
 220                     ; 56 			ack      = FALSE;
 222  002b 3f08          	clr	_ack
 223                     ; 58 		 timerEnable(2, DISABLE);
 225  002d ae0200        	ldw	x,#512
 226  0030 cd0000        	call	_timerEnable
 228                     ; 59 		 timerReset (2);
 230  0033 a602          	ld	a,#2
 231  0035 cd0000        	call	_timerReset
 233                     ; 61 		 ioCommSetDir(INPUT);
 235  0038 a601          	ld	a,#1
 236  003a cd0000        	call	_ioCommSetDir
 238                     ; 63 		 return;
 240  003d 2021          	jra	L21
 241  003f               L372:
 242                     ; 67 		 if((state == 0)&&(*control < 3)){
 244  003f 3d00          	tnz	_state
 245  0041 260c          	jrne	L103
 247  0043 1e01          	ldw	x,(OFST+1,sp)
 248  0045 f6            	ld	a,(x)
 249  0046 a103          	cp	a,#3
 250  0048 2405          	jruge	L103
 251                     ; 69 			 *control = 1;
 253  004a 1e01          	ldw	x,(OFST+1,sp)
 254  004c a601          	ld	a,#1
 255  004e f7            	ld	(x),a
 256  004f               L103:
 257                     ; 75 	 if(*buffer > 4500){
 259  004f be05          	ldw	x,_buffer
 260  0051 9093          	ldw	y,x
 261  0053 90fe          	ldw	y,(y)
 262  0055 90a31195      	cpw	y,#4501
 263  0059 2507          	jrult	L503
 264                     ; 77 		 *control = 4;
 266  005b 1e01          	ldw	x,(OFST+1,sp)
 267  005d a604          	ld	a,#4
 268  005f f7            	ld	(x),a
 269                     ; 79 		 return;
 270  0060               L21:
 273  0060 85            	popw	x
 274  0061 81            	ret
 275  0062               L503:
 276                     ; 83 		if((state == 0)&&(*control >= 3)){
 278  0062 3d00          	tnz	_state
 279  0064 2703          	jreq	L43
 280  0066 cc00f6        	jp	L703
 281  0069               L43:
 283  0069 1e01          	ldw	x,(OFST+1,sp)
 284  006b f6            	ld	a,(x)
 285  006c a103          	cp	a,#3
 286  006e 25f6          	jrult	L703
 287                     ; 85 		 if(buzzer){
 289  0070 3d09          	tnz	_buzzer
 290  0072 2743          	jreq	L113
 291                     ; 87 			 buzzer = FALSE;
 293  0074 3f09          	clr	_buzzer
 294                     ; 89 			 if(*control == 3){
 296  0076 1e01          	ldw	x,(OFST+1,sp)
 297  0078 f6            	ld	a,(x)
 298  0079 a103          	cp	a,#3
 299  007b 2620          	jrne	L313
 300                     ; 91 				 timerSetOverflowValue(3, 1000);
 302  007d ae03e8        	ldw	x,#1000
 303  0080 89            	pushw	x
 304  0081 ae0000        	ldw	x,#0
 305  0084 89            	pushw	x
 306  0085 a603          	ld	a,#3
 307  0087 cd0000        	call	_timerSetOverflowValue
 309  008a 5b04          	addw	sp,#4
 310                     ; 92 				 timerReset           (3);
 312  008c a603          	ld	a,#3
 313  008e cd0000        	call	_timerReset
 315                     ; 93 				 timerEnable          (3, ENABLE);
 317  0091 ae0301        	ldw	x,#769
 318  0094 cd0000        	call	_timerEnable
 320                     ; 95 				 blink = TRUE;
 322  0097 3501000a      	mov	_blink,#1
 324  009b 201a          	jra	L113
 325  009d               L313:
 326                     ; 99 				 timerSetOverflowValue(1, 500);
 328  009d ae01f4        	ldw	x,#500
 329  00a0 89            	pushw	x
 330  00a1 ae0000        	ldw	x,#0
 331  00a4 89            	pushw	x
 332  00a5 a601          	ld	a,#1
 333  00a7 cd0000        	call	_timerSetOverflowValue
 335  00aa 5b04          	addw	sp,#4
 336                     ; 100 				 timerReset           (1);
 338  00ac a601          	ld	a,#1
 339  00ae cd0000        	call	_timerReset
 341                     ; 101 				 timerEnable          (1, ENABLE);	
 343  00b1 ae0101        	ldw	x,#257
 344  00b4 cd0000        	call	_timerEnable
 346  00b7               L113:
 347                     ; 107 		 if(timerGetOverflow(1)){
 349  00b7 a601          	ld	a,#1
 350  00b9 cd0000        	call	_timerGetOverflow
 352  00bc 4d            	tnz	a
 353  00bd 2711          	jreq	L713
 354                     ; 109 			 timerReset(1);
 356  00bf a601          	ld	a,#1
 357  00c1 cd0000        	call	_timerReset
 359                     ; 111 			 if(blink){
 361  00c4 3d0a          	tnz	_blink
 362  00c6 2704          	jreq	L123
 363                     ; 113 				 blink = FALSE;
 365  00c8 3f0a          	clr	_blink
 367  00ca 2004          	jra	L713
 368  00cc               L123:
 369                     ; 117 				 blink = TRUE;	
 371  00cc 3501000a      	mov	_blink,#1
 372  00d0               L713:
 373                     ; 123 		 if(!timerGetOverflow(3) && blink){
 375  00d0 a603          	ld	a,#3
 376  00d2 cd0000        	call	_timerGetOverflow
 378  00d5 4d            	tnz	a
 379  00d6 2615          	jrne	L523
 381  00d8 3d0a          	tnz	_blink
 382  00da 2711          	jreq	L523
 383                     ; 125 			 if(timeBase210us()){
 385  00dc cd0000        	call	_timeBase210us
 387  00df 4d            	tnz	a
 388  00e0 2714          	jreq	L703
 389                     ; 127 				 GPIO_WriteReverse(BUZZER);
 391  00e2 4b40          	push	#64
 392  00e4 ae500f        	ldw	x,#20495
 393  00e7 cd0000        	call	_GPIO_WriteReverse
 395  00ea 84            	pop	a
 396  00eb 2009          	jra	L703
 397  00ed               L523:
 398                     ; 133 			 GPIO_WriteLow(BUZZER);	
 400  00ed 4b40          	push	#64
 401  00ef ae500f        	ldw	x,#20495
 402  00f2 cd0000        	call	_GPIO_WriteLow
 404  00f5 84            	pop	a
 405  00f6               L703:
 406                     ; 139 	 if(timerGetOverflow(2)){
 408  00f6 a602          	ld	a,#2
 409  00f8 cd0000        	call	_timerGetOverflow
 411  00fb 4d            	tnz	a
 412  00fc 271c          	jreq	L333
 413                     ; 141 		 if(!GPIO_ReadInputPin(COMM)){
 415  00fe 4b20          	push	#32
 416  0100 ae5000        	ldw	x,#20480
 417  0103 cd0000        	call	_GPIO_ReadInputPin
 419  0106 5b01          	addw	sp,#1
 420  0108 4d            	tnz	a
 421  0109 2604          	jrne	L533
 422                     ; 143 			 ack = TRUE;
 424  010b 35010008      	mov	_ack,#1
 425  010f               L533:
 426                     ; 147 		 timerEnable(2, DISABLE);	
 428  010f ae0200        	ldw	x,#512
 429  0112 cd0000        	call	_timerEnable
 431                     ; 148 		 timerReset (2);	 
 433  0115 a602          	ld	a,#2
 434  0117 cd0000        	call	_timerReset
 436  011a               L333:
 437                     ; 152    switch(state){
 439  011a b600          	ld	a,_state
 441                     ; 3071 		 break;
 442  011c a152          	cp	a,#82
 443  011e 2407          	jruge	L6
 444  0120 5f            	clrw	x
 445  0121 97            	ld	xl,a
 446  0122 58            	sllw	x
 447  0123 de0000        	ldw	x,(L01,x)
 448  0126 fc            	jp	(x)
 449  0127               L6:
 450  0127 ac5a1e5a      	jpf	L143
 451  012b               L3:
 452                     ; 154 		 case 0:	 
 452                     ; 155 			 
 452                     ; 156 			 if(ack){				 
 454  012b 3d08          	tnz	_ack
 455  012d 2603          	jrne	L63
 456  012f cc1e5a        	jp	L143
 457  0132               L63:
 458                     ; 159 				 *control = 2;
 460  0132 1e01          	ldw	x,(OFST+1,sp)
 461  0134 a602          	ld	a,#2
 462  0136 f7            	ld	(x),a
 463                     ; 160 				  ack     = FALSE;
 465  0137 3f08          	clr	_ack
 466                     ; 161 				  buzzer  = TRUE;
 468  0139 35010009      	mov	_buzzer,#1
 469                     ; 162 				  state   = 1;			 
 471  013d 35010000      	mov	_state,#1
 472                     ; 164 			   timerSetOverflowValue(3, 30);			     
 474  0141 ae001e        	ldw	x,#30
 475  0144 89            	pushw	x
 476  0145 ae0000        	ldw	x,#0
 477  0148 89            	pushw	x
 478  0149 a603          	ld	a,#3
 479  014b cd0000        	call	_timerSetOverflowValue
 481  014e 5b04          	addw	sp,#4
 482                     ; 165 			   timerReset           (3);			     			 
 484  0150 a603          	ld	a,#3
 485  0152 cd0000        	call	_timerReset
 487                     ; 166 				 timerEnable          (3, ENABLE);	
 489  0155 ae0301        	ldw	x,#769
 490  0158 cd0000        	call	_timerEnable
 492                     ; 168 				 ioCommSetDir(OUTPUT);
 494  015b 4f            	clr	a
 495  015c cd0000        	call	_ioCommSetDir
 497  015f ac5a1e5a      	jpf	L143
 498  0163               L5:
 499                     ; 174      case 1:      
 499                     ; 175 			 
 499                     ; 176 			 if(timerGetOverflow(3)){
 501  0163 a603          	ld	a,#3
 502  0165 cd0000        	call	_timerGetOverflow
 504  0168 4d            	tnz	a
 505  0169 2603          	jrne	L04
 506  016b cc1e5a        	jp	L143
 507  016e               L04:
 508                     ; 178 				 model_in++;
 510  016e 3c04          	inc	_model_in
 511                     ; 180 				 if(model_in <= (2 * model_out)){
 513  0170 9c            	rvf
 514  0171 b603          	ld	a,_model_out
 515  0173 5f            	clrw	x
 516  0174 97            	ld	xl,a
 517  0175 58            	sllw	x
 518  0176 b604          	ld	a,_model_in
 519  0178 905f          	clrw	y
 520  017a 9097          	ld	yl,a
 521  017c 90bf00        	ldw	c_y,y
 522  017f b300          	cpw	x,c_y
 523  0181 2f2c          	jrslt	L743
 524                     ; 182 					 GPIO_WriteReverse(COMM);
 526  0183 4b20          	push	#32
 527  0185 ae5000        	ldw	x,#20480
 528  0188 cd0000        	call	_GPIO_WriteReverse
 530  018b 84            	pop	a
 531                     ; 184 					 timerSetOverflowValue(1, 1500);
 533  018c ae05dc        	ldw	x,#1500
 534  018f 89            	pushw	x
 535  0190 ae0000        	ldw	x,#0
 536  0193 89            	pushw	x
 537  0194 a601          	ld	a,#1
 538  0196 cd0000        	call	_timerSetOverflowValue
 540  0199 5b04          	addw	sp,#4
 541                     ; 185 				   timerReset           (1);
 543  019b a601          	ld	a,#1
 544  019d cd0000        	call	_timerReset
 546                     ; 186 				   timerEnable          (1, ENABLE);
 548  01a0 ae0101        	ldw	x,#257
 549  01a3 cd0000        	call	_timerEnable
 551                     ; 188 				   timerReset           (3);
 553  01a6 a603          	ld	a,#3
 554  01a8 cd0000        	call	_timerReset
 557  01ab ac5a1e5a      	jpf	L143
 558  01af               L743:
 559                     ; 192 					 model_in = 0;					 
 561  01af 3f04          	clr	_model_in
 562                     ; 193 					 state = 2;
 564  01b1 35020000      	mov	_state,#2
 565                     ; 195 					 timerEnable(1, DISABLE);
 567  01b5 ae0100        	ldw	x,#256
 568  01b8 cd0000        	call	_timerEnable
 570                     ; 196 					 timerReset (1);
 572  01bb a601          	ld	a,#1
 573  01bd cd0000        	call	_timerReset
 575                     ; 198 					 ioCommSetDir(INPUT);
 577  01c0 a601          	ld	a,#1
 578  01c2 cd0000        	call	_ioCommSetDir
 580  01c5 ac5a1e5a      	jpf	L143
 581  01c9               L7:
 582                     ; 209      case 2:
 582                     ; 210 		   
 582                     ; 211 			 if(ack){
 584  01c9 3d08          	tnz	_ack
 585  01cb 2729          	jreq	L353
 586                     ; 213 				 ack = FALSE;
 588  01cd 3f08          	clr	_ack
 589                     ; 215 				 if(model_in == 0){
 591  01cf 3d04          	tnz	_model_in
 592  01d1 261c          	jrne	L553
 593                     ; 217 					 timerSetOverflowValue(1, 50);
 595  01d3 ae0032        	ldw	x,#50
 596  01d6 89            	pushw	x
 597  01d7 ae0000        	ldw	x,#0
 598  01da 89            	pushw	x
 599  01db a601          	ld	a,#1
 600  01dd cd0000        	call	_timerSetOverflowValue
 602  01e0 5b04          	addw	sp,#4
 603                     ; 218 					 timerReset           (1);
 605  01e2 a601          	ld	a,#1
 606  01e4 cd0000        	call	_timerReset
 608                     ; 219 					 timerEnable          (1, ENABLE);
 610  01e7 ae0101        	ldw	x,#257
 611  01ea cd0000        	call	_timerEnable
 614  01ed 2005          	jra	L753
 615  01ef               L553:
 616                     ; 223 					 timerReset(1);
 618  01ef a601          	ld	a,#1
 619  01f1 cd0000        	call	_timerReset
 621  01f4               L753:
 622                     ; 227 				 model_in++;
 624  01f4 3c04          	inc	_model_in
 625  01f6               L353:
 626                     ; 231 			 if(timerGetOverflow(1)){
 628  01f6 a601          	ld	a,#1
 629  01f8 cd0000        	call	_timerGetOverflow
 631  01fb 4d            	tnz	a
 632  01fc 2603          	jrne	L24
 633  01fe cc1e5a        	jp	L143
 634  0201               L24:
 635                     ; 233 				 if(model_in == model_out){
 637  0201 b604          	ld	a,_model_in
 638  0203 b103          	cp	a,_model_out
 639  0205 263a          	jrne	L363
 640                     ; 235 					  buzzer  = TRUE;
 642  0207 35010009      	mov	_buzzer,#1
 643                     ; 236 					  state   = DELAY;
 645  020b 35510000      	mov	_state,#81
 646                     ; 237 					  stack   = 3;
 648  020f 35030001      	mov	_stack,#3
 649                     ; 239 				   timerReset (1);
 651  0213 a601          	ld	a,#1
 652  0215 cd0000        	call	_timerReset
 654                     ; 241 					 timerSetOverflowValue(3, 15);	
 656  0218 ae000f        	ldw	x,#15
 657  021b 89            	pushw	x
 658  021c ae0000        	ldw	x,#0
 659  021f 89            	pushw	x
 660  0220 a603          	ld	a,#3
 661  0222 cd0000        	call	_timerSetOverflowValue
 663  0225 5b04          	addw	sp,#4
 664                     ; 242 				   timerReset           (3);			     			 
 666  0227 a603          	ld	a,#3
 667  0229 cd0000        	call	_timerReset
 669                     ; 243 				   timerEnable          (3, ENABLE);
 671  022c ae0301        	ldw	x,#769
 672  022f cd0000        	call	_timerEnable
 674                     ; 245 				   ioCommSetDir(OUTPUT);
 676  0232 4f            	clr	a
 677  0233 cd0000        	call	_ioCommSetDir
 679                     ; 247 				   GPIO_WriteHigh(COMM);					 
 681  0236 4b20          	push	#32
 682  0238 ae5000        	ldw	x,#20480
 683  023b cd0000        	call	_GPIO_WriteHigh
 685  023e 84            	pop	a
 687  023f 2009          	jra	L563
 688  0241               L363:
 689                     ; 251 					 *control = 5;
 691  0241 1e01          	ldw	x,(OFST+1,sp)
 692  0243 a605          	ld	a,#5
 693  0245 f7            	ld	(x),a
 694                     ; 252 				    state   = FINISH;
 696  0246 35500000      	mov	_state,#80
 697  024a               L563:
 698                     ; 256 				 model_in = 0;
 700  024a 3f04          	clr	_model_in
 701  024c ac5a1e5a      	jpf	L143
 702  0250               L11:
 703                     ; 262 		 case 3:
 703                     ; 263 		    
 703                     ; 264 			 if(ack){
 705  0250 3d08          	tnz	_ack
 706  0252 2727          	jreq	L763
 707                     ; 266 				 ack   = FALSE;
 709  0254 3f08          	clr	_ack
 710                     ; 267 				 state = DELAY;
 712  0256 35510000      	mov	_state,#81
 713                     ; 268 				 stack = 4;
 715  025a 35040001      	mov	_stack,#4
 716                     ; 270 				 timerReset (1);
 718  025e a601          	ld	a,#1
 719  0260 cd0000        	call	_timerReset
 721                     ; 272 				 timerReset (3);
 723  0263 a603          	ld	a,#3
 724  0265 cd0000        	call	_timerReset
 726                     ; 273 				 timerEnable(3, ENABLE);
 728  0268 ae0301        	ldw	x,#769
 729  026b cd0000        	call	_timerEnable
 731                     ; 275 				 ioCommSetDir(OUTPUT);
 733  026e 4f            	clr	a
 734  026f cd0000        	call	_ioCommSetDir
 736                     ; 277 				 GPIO_WriteHigh(COMM);			 
 738  0272 4b20          	push	#32
 739  0274 ae5000        	ldw	x,#20480
 740  0277 cd0000        	call	_GPIO_WriteHigh
 742  027a 84            	pop	a
 743  027b               L763:
 744                     ; 281 			 if(timerGetOverflow(1)){
 746  027b a601          	ld	a,#1
 747  027d cd0000        	call	_timerGetOverflow
 749  0280 4d            	tnz	a
 750  0281 2603          	jrne	L44
 751  0283 cc1e5a        	jp	L143
 752  0286               L44:
 753                     ; 283 				 *control =  6;
 755  0286 1e01          	ldw	x,(OFST+1,sp)
 756  0288 a606          	ld	a,#6
 757  028a f7            	ld	(x),a
 758                     ; 284 				  state   = FINISH;
 760  028b 35500000      	mov	_state,#80
 761  028f ac5a1e5a      	jpf	L143
 762  0293               L31:
 763                     ; 290 		 case 4:
 763                     ; 291 		    
 763                     ; 292 			 if(ack){
 765  0293 3d08          	tnz	_ack
 766  0295 2727          	jreq	L373
 767                     ; 294 				 ack   = FALSE;
 769  0297 3f08          	clr	_ack
 770                     ; 295 				 state = DELAY;
 772  0299 35510000      	mov	_state,#81
 773                     ; 296 				 stack = 5;
 775  029d 35050001      	mov	_stack,#5
 776                     ; 298 				 timerReset (1);
 778  02a1 a601          	ld	a,#1
 779  02a3 cd0000        	call	_timerReset
 781                     ; 300 				 timerReset (3);
 783  02a6 a603          	ld	a,#3
 784  02a8 cd0000        	call	_timerReset
 786                     ; 301 				 timerEnable(3, ENABLE);	
 788  02ab ae0301        	ldw	x,#769
 789  02ae cd0000        	call	_timerEnable
 791                     ; 303 				 ioCommSetDir(OUTPUT);
 793  02b1 4f            	clr	a
 794  02b2 cd0000        	call	_ioCommSetDir
 796                     ; 305 				 GPIO_WriteHigh(COMM);
 798  02b5 4b20          	push	#32
 799  02b7 ae5000        	ldw	x,#20480
 800  02ba cd0000        	call	_GPIO_WriteHigh
 802  02bd 84            	pop	a
 803  02be               L373:
 804                     ; 309 			 if(timerGetOverflow(1)){
 806  02be a601          	ld	a,#1
 807  02c0 cd0000        	call	_timerGetOverflow
 809  02c3 4d            	tnz	a
 810  02c4 2603          	jrne	L64
 811  02c6 cc1e5a        	jp	L143
 812  02c9               L64:
 813                     ; 311 				 *control =  6;
 815  02c9 1e01          	ldw	x,(OFST+1,sp)
 816  02cb a606          	ld	a,#6
 817  02cd f7            	ld	(x),a
 818                     ; 312 				  state   = FINISH;
 820  02ce 35500000      	mov	_state,#80
 821  02d2 ac5a1e5a      	jpf	L143
 822  02d6               L51:
 823                     ; 318 		 case 5:
 823                     ; 319 		    
 823                     ; 320 			 if(ack){
 825  02d6 3d08          	tnz	_ack
 826  02d8 2730          	jreq	L773
 827                     ; 322 				 ack   = FALSE;;
 829  02da 3f08          	clr	_ack
 830                     ; 323 				 state = DELAY;
 833  02dc 35510000      	mov	_state,#81
 834                     ; 324 				 stack = 6;
 836  02e0 35060001      	mov	_stack,#6
 837                     ; 326 				 timerReset (1);
 839  02e4 a601          	ld	a,#1
 840  02e6 cd0000        	call	_timerReset
 842                     ; 328 				 timerReset (3);
 844  02e9 a603          	ld	a,#3
 845  02eb cd0000        	call	_timerReset
 847                     ; 329 				 timerEnable(3, ENABLE);	
 849  02ee ae0301        	ldw	x,#769
 850  02f1 cd0000        	call	_timerEnable
 852                     ; 331 				 GPIO_WriteHigh(SETA);
 854  02f4 4b02          	push	#2
 855  02f6 ae500a        	ldw	x,#20490
 856  02f9 cd0000        	call	_GPIO_WriteHigh
 858  02fc 84            	pop	a
 859                     ; 333 				 ioCommSetDir(OUTPUT);
 861  02fd 4f            	clr	a
 862  02fe cd0000        	call	_ioCommSetDir
 864                     ; 335 				 GPIO_WriteHigh(COMM);
 866  0301 4b20          	push	#32
 867  0303 ae5000        	ldw	x,#20480
 868  0306 cd0000        	call	_GPIO_WriteHigh
 870  0309 84            	pop	a
 871  030a               L773:
 872                     ; 339 			 if(timerGetOverflow(1)){
 874  030a a601          	ld	a,#1
 875  030c cd0000        	call	_timerGetOverflow
 877  030f 4d            	tnz	a
 878  0310 2603          	jrne	L05
 879  0312 cc1e5a        	jp	L143
 880  0315               L05:
 881                     ; 341 				 *control =  7;
 883  0315 1e01          	ldw	x,(OFST+1,sp)
 884  0317 a607          	ld	a,#7
 885  0319 f7            	ld	(x),a
 886                     ; 342 				  state   = FINISH;
 888  031a 35500000      	mov	_state,#80
 889  031e ac5a1e5a      	jpf	L143
 890  0322               L71:
 891                     ; 348 		 case 6:
 891                     ; 349 		    
 891                     ; 350 			 if(ack){
 893  0322 3d08          	tnz	_ack
 894  0324 2730          	jreq	L304
 895                     ; 352 				 ack   = FALSE;
 897  0326 3f08          	clr	_ack
 898                     ; 353 				 state = DELAY;
 900  0328 35510000      	mov	_state,#81
 901                     ; 354 				 stack = 7;
 903  032c 35070001      	mov	_stack,#7
 904                     ; 356 				 timerReset (1);
 906  0330 a601          	ld	a,#1
 907  0332 cd0000        	call	_timerReset
 909                     ; 358 				 timerReset (3);
 911  0335 a603          	ld	a,#3
 912  0337 cd0000        	call	_timerReset
 914                     ; 359 				 timerEnable(3, ENABLE);	
 916  033a ae0301        	ldw	x,#769
 917  033d cd0000        	call	_timerEnable
 919                     ; 361 				 GPIO_WriteLow(SETA);
 921  0340 4b02          	push	#2
 922  0342 ae500a        	ldw	x,#20490
 923  0345 cd0000        	call	_GPIO_WriteLow
 925  0348 84            	pop	a
 926                     ; 363 				 ioCommSetDir(OUTPUT);
 928  0349 4f            	clr	a
 929  034a cd0000        	call	_ioCommSetDir
 931                     ; 365 				 GPIO_WriteHigh(COMM);
 933  034d 4b20          	push	#32
 934  034f ae5000        	ldw	x,#20480
 935  0352 cd0000        	call	_GPIO_WriteHigh
 937  0355 84            	pop	a
 938  0356               L304:
 939                     ; 369 			 if(timerGetOverflow(1)){
 941  0356 a601          	ld	a,#1
 942  0358 cd0000        	call	_timerGetOverflow
 944  035b 4d            	tnz	a
 945  035c 2603          	jrne	L25
 946  035e cc1e5a        	jp	L143
 947  0361               L25:
 948                     ; 371 				 *control =  7;
 950  0361 1e01          	ldw	x,(OFST+1,sp)
 951  0363 a607          	ld	a,#7
 952  0365 f7            	ld	(x),a
 953                     ; 372 				  state   = FINISH;
 955  0366 35500000      	mov	_state,#80
 956  036a ac5a1e5a      	jpf	L143
 957  036e               L12:
 958                     ; 378 		 case 7:
 958                     ; 379 		    
 958                     ; 380 			 if(ack){
 960  036e 3d08          	tnz	_ack
 961  0370 2730          	jreq	L704
 962                     ; 382 				 ack   = FALSE;
 964  0372 3f08          	clr	_ack
 965                     ; 383 				 state = DELAY;
 967  0374 35510000      	mov	_state,#81
 968                     ; 384 				 stack = 8;
 970  0378 35080001      	mov	_stack,#8
 971                     ; 386 				 timerReset (1);
 973  037c a601          	ld	a,#1
 974  037e cd0000        	call	_timerReset
 976                     ; 388 				 timerReset (3);
 978  0381 a603          	ld	a,#3
 979  0383 cd0000        	call	_timerReset
 981                     ; 389 				 timerEnable(3, ENABLE);		
 983  0386 ae0301        	ldw	x,#769
 984  0389 cd0000        	call	_timerEnable
 986                     ; 391 				 GPIO_WriteHigh(IGN);
 988  038c 4b08          	push	#8
 989  038e ae500a        	ldw	x,#20490
 990  0391 cd0000        	call	_GPIO_WriteHigh
 992  0394 84            	pop	a
 993                     ; 393 				 ioCommSetDir(OUTPUT);
 995  0395 4f            	clr	a
 996  0396 cd0000        	call	_ioCommSetDir
 998                     ; 395 				 GPIO_WriteHigh(COMM);
1000  0399 4b20          	push	#32
1001  039b ae5000        	ldw	x,#20480
1002  039e cd0000        	call	_GPIO_WriteHigh
1004  03a1 84            	pop	a
1005  03a2               L704:
1006                     ; 399 			 if(timerGetOverflow(1)){
1008  03a2 a601          	ld	a,#1
1009  03a4 cd0000        	call	_timerGetOverflow
1011  03a7 4d            	tnz	a
1012  03a8 2603          	jrne	L45
1013  03aa cc1e5a        	jp	L143
1014  03ad               L45:
1015                     ; 401 				 *control =  8;
1017  03ad 1e01          	ldw	x,(OFST+1,sp)
1018  03af a608          	ld	a,#8
1019  03b1 f7            	ld	(x),a
1020                     ; 402 				  state   = FINISH;
1022  03b2 35500000      	mov	_state,#80
1023  03b6 ac5a1e5a      	jpf	L143
1024  03ba               L32:
1025                     ; 408 		 case 8:
1025                     ; 409 		    
1025                     ; 410 			 if(ack){
1027  03ba 3d08          	tnz	_ack
1028  03bc 2730          	jreq	L314
1029                     ; 412 				 ack      = FALSE;	
1031  03be 3f08          	clr	_ack
1032                     ; 413 				 state    = DELAY;
1034  03c0 35510000      	mov	_state,#81
1035                     ; 414 				 stack    = 9;
1037  03c4 35090001      	mov	_stack,#9
1038                     ; 416 				 timerReset (1);
1040  03c8 a601          	ld	a,#1
1041  03ca cd0000        	call	_timerReset
1043                     ; 418 				 timerReset (3);
1045  03cd a603          	ld	a,#3
1046  03cf cd0000        	call	_timerReset
1048                     ; 419 				 timerEnable(3, ENABLE);		
1050  03d2 ae0301        	ldw	x,#769
1051  03d5 cd0000        	call	_timerEnable
1053                     ; 421 				 GPIO_WriteLow(IGN);
1055  03d8 4b08          	push	#8
1056  03da ae500a        	ldw	x,#20490
1057  03dd cd0000        	call	_GPIO_WriteLow
1059  03e0 84            	pop	a
1060                     ; 423 				 ioCommSetDir(OUTPUT);
1062  03e1 4f            	clr	a
1063  03e2 cd0000        	call	_ioCommSetDir
1065                     ; 425 				 GPIO_WriteHigh(COMM);
1067  03e5 4b20          	push	#32
1068  03e7 ae5000        	ldw	x,#20480
1069  03ea cd0000        	call	_GPIO_WriteHigh
1071  03ed 84            	pop	a
1072  03ee               L314:
1073                     ; 429 			 if(timerGetOverflow(1)){
1075  03ee a601          	ld	a,#1
1076  03f0 cd0000        	call	_timerGetOverflow
1078  03f3 4d            	tnz	a
1079  03f4 2603          	jrne	L65
1080  03f6 cc1e5a        	jp	L143
1081  03f9               L65:
1082                     ; 431 				 *control =  8;
1084  03f9 1e01          	ldw	x,(OFST+1,sp)
1085  03fb a608          	ld	a,#8
1086  03fd f7            	ld	(x),a
1087                     ; 432 				  state   = FINISH;
1089  03fe 35500000      	mov	_state,#80
1090  0402 ac5a1e5a      	jpf	L143
1091  0406               L52:
1092                     ; 438 		 case 9:
1092                     ; 439 		    
1092                     ; 440 			 if(ack){
1094  0406 3d08          	tnz	_ack
1095  0408 2730          	jreq	L714
1096                     ; 442 				 ack   = FALSE;
1098  040a 3f08          	clr	_ack
1099                     ; 443 				 state = DELAY;
1101  040c 35510000      	mov	_state,#81
1102                     ; 444 				 stack = 10;
1104  0410 350a0001      	mov	_stack,#10
1105                     ; 446 				 timerReset (1);
1107  0414 a601          	ld	a,#1
1108  0416 cd0000        	call	_timerReset
1110                     ; 448 				 timerReset (3);
1112  0419 a603          	ld	a,#3
1113  041b cd0000        	call	_timerReset
1115                     ; 449 				 timerEnable(3, ENABLE);	
1117  041e ae0301        	ldw	x,#769
1118  0421 cd0000        	call	_timerEnable
1120                     ; 451 				 GPIO_WriteHigh(CMD_UP);
1122  0424 4b40          	push	#64
1123  0426 ae5000        	ldw	x,#20480
1124  0429 cd0000        	call	_GPIO_WriteHigh
1126  042c 84            	pop	a
1127                     ; 453 				 ioCommSetDir(OUTPUT);
1129  042d 4f            	clr	a
1130  042e cd0000        	call	_ioCommSetDir
1132                     ; 455 				 GPIO_WriteHigh(COMM);
1134  0431 4b20          	push	#32
1135  0433 ae5000        	ldw	x,#20480
1136  0436 cd0000        	call	_GPIO_WriteHigh
1138  0439 84            	pop	a
1139  043a               L714:
1140                     ; 459 			 if(timerGetOverflow(1)){
1142  043a a601          	ld	a,#1
1143  043c cd0000        	call	_timerGetOverflow
1145  043f 4d            	tnz	a
1146  0440 2603          	jrne	L06
1147  0442 cc1e5a        	jp	L143
1148  0445               L06:
1149                     ; 461 				 *control =  9;
1151  0445 1e01          	ldw	x,(OFST+1,sp)
1152  0447 a609          	ld	a,#9
1153  0449 f7            	ld	(x),a
1154                     ; 462 				  state   = FINISH;
1156  044a 35500000      	mov	_state,#80
1157  044e ac5a1e5a      	jpf	L143
1158  0452               L72:
1159                     ; 468 		 case 10:
1159                     ; 469 		    
1159                     ; 470 			 if(ack){
1161  0452 3d08          	tnz	_ack
1162  0454 2730          	jreq	L324
1163                     ; 472 				 ack   = FALSE;
1165  0456 3f08          	clr	_ack
1166                     ; 473 				 state = DELAY;
1168  0458 35510000      	mov	_state,#81
1169                     ; 474 				 stack = 11;
1171  045c 350b0001      	mov	_stack,#11
1172                     ; 476 				 timerReset (1);
1174  0460 a601          	ld	a,#1
1175  0462 cd0000        	call	_timerReset
1177                     ; 478 				 timerReset (3);
1179  0465 a603          	ld	a,#3
1180  0467 cd0000        	call	_timerReset
1182                     ; 479 				 timerEnable(3, ENABLE);	
1184  046a ae0301        	ldw	x,#769
1185  046d cd0000        	call	_timerEnable
1187                     ; 481 				 GPIO_WriteLow(CMD_UP);
1189  0470 4b40          	push	#64
1190  0472 ae5000        	ldw	x,#20480
1191  0475 cd0000        	call	_GPIO_WriteLow
1193  0478 84            	pop	a
1194                     ; 483 				 ioCommSetDir(OUTPUT);
1196  0479 4f            	clr	a
1197  047a cd0000        	call	_ioCommSetDir
1199                     ; 485 				 GPIO_WriteHigh(COMM);
1201  047d 4b20          	push	#32
1202  047f ae5000        	ldw	x,#20480
1203  0482 cd0000        	call	_GPIO_WriteHigh
1205  0485 84            	pop	a
1206  0486               L324:
1207                     ; 489 			 if(timerGetOverflow(1)){
1209  0486 a601          	ld	a,#1
1210  0488 cd0000        	call	_timerGetOverflow
1212  048b 4d            	tnz	a
1213  048c 2603          	jrne	L26
1214  048e cc1e5a        	jp	L143
1215  0491               L26:
1216                     ; 491 				 *control =  9;
1218  0491 1e01          	ldw	x,(OFST+1,sp)
1219  0493 a609          	ld	a,#9
1220  0495 f7            	ld	(x),a
1221                     ; 492 				  state   = FINISH;
1223  0496 35500000      	mov	_state,#80
1224  049a ac5a1e5a      	jpf	L143
1225  049e               L13:
1226                     ; 498 		 case 11:
1226                     ; 499 		    
1226                     ; 500 			 if(ack){
1228  049e 3d08          	tnz	_ack
1229  04a0 2730          	jreq	L724
1230                     ; 502 				 ack   = FALSE;	
1232  04a2 3f08          	clr	_ack
1233                     ; 503 				 state = DELAY;
1235  04a4 35510000      	mov	_state,#81
1236                     ; 504 				 stack = 12;
1238  04a8 350c0001      	mov	_stack,#12
1239                     ; 506 				 timerReset (1);
1241  04ac a601          	ld	a,#1
1242  04ae cd0000        	call	_timerReset
1244                     ; 508 				 timerReset (3);
1246  04b1 a603          	ld	a,#3
1247  04b3 cd0000        	call	_timerReset
1249                     ; 509 				 timerEnable(3, ENABLE);
1251  04b6 ae0301        	ldw	x,#769
1252  04b9 cd0000        	call	_timerEnable
1254                     ; 511 				 GPIO_WriteHigh(CMD_DN);
1256  04bc 4b04          	push	#4
1257  04be ae5000        	ldw	x,#20480
1258  04c1 cd0000        	call	_GPIO_WriteHigh
1260  04c4 84            	pop	a
1261                     ; 513 				 ioCommSetDir(OUTPUT);
1263  04c5 4f            	clr	a
1264  04c6 cd0000        	call	_ioCommSetDir
1266                     ; 515 				 GPIO_WriteHigh(COMM);
1268  04c9 4b20          	push	#32
1269  04cb ae5000        	ldw	x,#20480
1270  04ce cd0000        	call	_GPIO_WriteHigh
1272  04d1 84            	pop	a
1273  04d2               L724:
1274                     ; 519 			 if(timerGetOverflow(1)){
1276  04d2 a601          	ld	a,#1
1277  04d4 cd0000        	call	_timerGetOverflow
1279  04d7 4d            	tnz	a
1280  04d8 2603          	jrne	L46
1281  04da cc1e5a        	jp	L143
1282  04dd               L46:
1283                     ; 521 				 *control =  10;
1285  04dd 1e01          	ldw	x,(OFST+1,sp)
1286  04df a60a          	ld	a,#10
1287  04e1 f7            	ld	(x),a
1288                     ; 522 				  state   = FINISH;
1290  04e2 35500000      	mov	_state,#80
1291  04e6 ac5a1e5a      	jpf	L143
1292  04ea               L33:
1293                     ; 528 		 case 12:
1293                     ; 529 		    
1293                     ; 530 			 if(ack){
1295  04ea 3d08          	tnz	_ack
1296  04ec 2730          	jreq	L334
1297                     ; 532 				 ack   = FALSE;	
1299  04ee 3f08          	clr	_ack
1300                     ; 533 				 state = DELAY;
1302  04f0 35510000      	mov	_state,#81
1303                     ; 534 				 stack = 13;
1305  04f4 350d0001      	mov	_stack,#13
1306                     ; 536 				 timerReset (1);
1308  04f8 a601          	ld	a,#1
1309  04fa cd0000        	call	_timerReset
1311                     ; 538 				 timerReset (3);
1313  04fd a603          	ld	a,#3
1314  04ff cd0000        	call	_timerReset
1316                     ; 539 				 timerEnable(3, ENABLE);		
1318  0502 ae0301        	ldw	x,#769
1319  0505 cd0000        	call	_timerEnable
1321                     ; 541 				 GPIO_WriteLow(CMD_DN);
1323  0508 4b04          	push	#4
1324  050a ae5000        	ldw	x,#20480
1325  050d cd0000        	call	_GPIO_WriteLow
1327  0510 84            	pop	a
1328                     ; 543 				 ioCommSetDir(OUTPUT);
1330  0511 4f            	clr	a
1331  0512 cd0000        	call	_ioCommSetDir
1333                     ; 545 				 GPIO_WriteHigh(COMM);
1335  0515 4b20          	push	#32
1336  0517 ae5000        	ldw	x,#20480
1337  051a cd0000        	call	_GPIO_WriteHigh
1339  051d 84            	pop	a
1340  051e               L334:
1341                     ; 549 			 if(timerGetOverflow(1)){
1343  051e a601          	ld	a,#1
1344  0520 cd0000        	call	_timerGetOverflow
1346  0523 4d            	tnz	a
1347  0524 2603          	jrne	L66
1348  0526 cc1e5a        	jp	L143
1349  0529               L66:
1350                     ; 551 				 *control =  10;
1352  0529 1e01          	ldw	x,(OFST+1,sp)
1353  052b a60a          	ld	a,#10
1354  052d f7            	ld	(x),a
1355                     ; 552 				  state   = FINISH;
1357  052e 35500000      	mov	_state,#80
1358  0532 ac5a1e5a      	jpf	L143
1359  0536               L53:
1360                     ; 558 		 case 13:
1360                     ; 559 		    
1360                     ; 560 			 if(ack){
1362  0536 3d08          	tnz	_ack
1363  0538 2730          	jreq	L734
1364                     ; 562 				 ack   = FALSE;
1366  053a 3f08          	clr	_ack
1367                     ; 563 				 state = DELAY;
1369  053c 35510000      	mov	_state,#81
1370                     ; 564 				 stack = 14;
1372  0540 350e0001      	mov	_stack,#14
1373                     ; 566  				 timerReset (1);
1375  0544 a601          	ld	a,#1
1376  0546 cd0000        	call	_timerReset
1378                     ; 568 				 timerReset (3);
1380  0549 a603          	ld	a,#3
1381  054b cd0000        	call	_timerReset
1383                     ; 569 				 timerEnable(3, ENABLE);
1385  054e ae0301        	ldw	x,#769
1386  0551 cd0000        	call	_timerEnable
1388                     ; 571 				 GPIO_WriteHigh(DOOR);
1390  0554 4b02          	push	#2
1391  0556 ae5000        	ldw	x,#20480
1392  0559 cd0000        	call	_GPIO_WriteHigh
1394  055c 84            	pop	a
1395                     ; 573 				 ioCommSetDir(OUTPUT);
1397  055d 4f            	clr	a
1398  055e cd0000        	call	_ioCommSetDir
1400                     ; 575 				 GPIO_WriteHigh(COMM);
1402  0561 4b20          	push	#32
1403  0563 ae5000        	ldw	x,#20480
1404  0566 cd0000        	call	_GPIO_WriteHigh
1406  0569 84            	pop	a
1407  056a               L734:
1408                     ; 579 			 if(timerGetOverflow(1)){
1410  056a a601          	ld	a,#1
1411  056c cd0000        	call	_timerGetOverflow
1413  056f 4d            	tnz	a
1414  0570 2603          	jrne	L07
1415  0572 cc1e5a        	jp	L143
1416  0575               L07:
1417                     ; 581 				 *control = 11;
1419  0575 1e01          	ldw	x,(OFST+1,sp)
1420  0577 a60b          	ld	a,#11
1421  0579 f7            	ld	(x),a
1422                     ; 582 				  state   = FINISH;
1424  057a 35500000      	mov	_state,#80
1425  057e ac5a1e5a      	jpf	L143
1426  0582               L73:
1427                     ; 588 		 case 14:
1427                     ; 589 		    
1427                     ; 590 			 if(ack){
1429  0582 3d08          	tnz	_ack
1430  0584 2730          	jreq	L344
1431                     ; 592 				 ack   = FALSE;
1433  0586 3f08          	clr	_ack
1434                     ; 593 				 state = DELAY;
1436  0588 35510000      	mov	_state,#81
1437                     ; 594 				 stack = 15;
1439  058c 350f0001      	mov	_stack,#15
1440                     ; 596 				 timerReset (1);
1442  0590 a601          	ld	a,#1
1443  0592 cd0000        	call	_timerReset
1445                     ; 598 				 timerReset (3);
1447  0595 a603          	ld	a,#3
1448  0597 cd0000        	call	_timerReset
1450                     ; 599 				 timerEnable(3, ENABLE);	
1452  059a ae0301        	ldw	x,#769
1453  059d cd0000        	call	_timerEnable
1455                     ; 601 				 GPIO_WriteLow(DOOR);
1457  05a0 4b02          	push	#2
1458  05a2 ae5000        	ldw	x,#20480
1459  05a5 cd0000        	call	_GPIO_WriteLow
1461  05a8 84            	pop	a
1462                     ; 603 				 ioCommSetDir(OUTPUT);
1464  05a9 4f            	clr	a
1465  05aa cd0000        	call	_ioCommSetDir
1467                     ; 605 				 GPIO_WriteHigh(COMM);
1469  05ad 4b20          	push	#32
1470  05af ae5000        	ldw	x,#20480
1471  05b2 cd0000        	call	_GPIO_WriteHigh
1473  05b5 84            	pop	a
1474  05b6               L344:
1475                     ; 609 			 if(timerGetOverflow(1)){
1477  05b6 a601          	ld	a,#1
1478  05b8 cd0000        	call	_timerGetOverflow
1480  05bb 4d            	tnz	a
1481  05bc 2603          	jrne	L27
1482  05be cc1e5a        	jp	L143
1483  05c1               L27:
1484                     ; 611 				 *control = 11;
1486  05c1 1e01          	ldw	x,(OFST+1,sp)
1487  05c3 a60b          	ld	a,#11
1488  05c5 f7            	ld	(x),a
1489                     ; 612 				  state   = FINISH;
1491  05c6 35500000      	mov	_state,#80
1492  05ca ac5a1e5a      	jpf	L143
1493  05ce               L14:
1494                     ; 618 		 case 15:
1494                     ; 619 		    
1494                     ; 620 			 if(ack){
1496  05ce 3d08          	tnz	_ack
1497  05d0 2730          	jreq	L744
1498                     ; 622 				 ack   = FALSE;
1500  05d2 3f08          	clr	_ack
1501                     ; 623 				 state = DELAY;
1503  05d4 35510000      	mov	_state,#81
1504                     ; 624 				 stack = 22;
1506  05d8 35160001      	mov	_stack,#22
1507                     ; 626 				 timerReset (1);
1509  05dc a601          	ld	a,#1
1510  05de cd0000        	call	_timerReset
1512                     ; 628 				 timerReset (3);
1514  05e1 a603          	ld	a,#3
1515  05e3 cd0000        	call	_timerReset
1517                     ; 629 				 timerEnable(3, ENABLE);	
1519  05e6 ae0301        	ldw	x,#769
1520  05e9 cd0000        	call	_timerEnable
1522                     ; 631 				 GPIO_WriteHigh(SW_P);
1524  05ec 4b20          	push	#32
1525  05ee ae500a        	ldw	x,#20490
1526  05f1 cd0000        	call	_GPIO_WriteHigh
1528  05f4 84            	pop	a
1529                     ; 633 				 ioCommSetDir(OUTPUT);
1531  05f5 4f            	clr	a
1532  05f6 cd0000        	call	_ioCommSetDir
1534                     ; 635 				 GPIO_WriteHigh(COMM);
1536  05f9 4b20          	push	#32
1537  05fb ae5000        	ldw	x,#20480
1538  05fe cd0000        	call	_GPIO_WriteHigh
1540  0601 84            	pop	a
1541  0602               L744:
1542                     ; 639 			 if(timerGetOverflow(1)){
1544  0602 a601          	ld	a,#1
1545  0604 cd0000        	call	_timerGetOverflow
1547  0607 4d            	tnz	a
1548  0608 2603          	jrne	L47
1549  060a cc1e5a        	jp	L143
1550  060d               L47:
1551                     ; 641 				 ack   = FALSE;
1553  060d 3f08          	clr	_ack
1554                     ; 642 				 state = DELAY;
1556  060f 35510000      	mov	_state,#81
1557                     ; 643 				 stack = 16;
1559  0613 35100001      	mov	_stack,#16
1560                     ; 645 				 timerReset (1);
1562  0617 a601          	ld	a,#1
1563  0619 cd0000        	call	_timerReset
1565                     ; 647 				 timerReset (3);
1567  061c a603          	ld	a,#3
1568  061e cd0000        	call	_timerReset
1570                     ; 648 				 timerEnable(3, ENABLE);
1572  0621 ae0301        	ldw	x,#769
1573  0624 cd0000        	call	_timerEnable
1575                     ; 650 				 ioCommSetDir(OUTPUT);
1577  0627 4f            	clr	a
1578  0628 cd0000        	call	_ioCommSetDir
1580                     ; 652 				 GPIO_WriteHigh(COMM);
1582  062b 4b20          	push	#32
1583  062d ae5000        	ldw	x,#20480
1584  0630 cd0000        	call	_GPIO_WriteHigh
1586  0633 84            	pop	a
1587  0634 ac5a1e5a      	jpf	L143
1588  0638               L34:
1589                     ; 658 		 case 16:
1589                     ; 659 		    
1589                     ; 660 			 if(ack){
1591  0638 3d08          	tnz	_ack
1592  063a 2727          	jreq	L354
1593                     ; 662 				 ack   = FALSE;
1595  063c 3f08          	clr	_ack
1596                     ; 663 				 state = DELAY;
1598  063e 35510000      	mov	_state,#81
1599                     ; 664 				 stack = 17;
1601  0642 35110001      	mov	_stack,#17
1602                     ; 666 				 timerReset (1);
1604  0646 a601          	ld	a,#1
1605  0648 cd0000        	call	_timerReset
1607                     ; 668 				 timerReset (3);
1609  064b a603          	ld	a,#3
1610  064d cd0000        	call	_timerReset
1612                     ; 669 				 timerEnable(3, ENABLE); 
1614  0650 ae0301        	ldw	x,#769
1615  0653 cd0000        	call	_timerEnable
1617                     ; 671 				 ioCommSetDir(OUTPUT);
1619  0656 4f            	clr	a
1620  0657 cd0000        	call	_ioCommSetDir
1622                     ; 673 				 GPIO_WriteHigh(COMM);
1624  065a 4b20          	push	#32
1625  065c ae5000        	ldw	x,#20480
1626  065f cd0000        	call	_GPIO_WriteHigh
1628  0662 84            	pop	a
1629  0663               L354:
1630                     ; 677 			 if(timerGetOverflow(1)){
1632  0663 a601          	ld	a,#1
1633  0665 cd0000        	call	_timerGetOverflow
1635  0668 4d            	tnz	a
1636  0669 2603          	jrne	L67
1637  066b cc1e5a        	jp	L143
1638  066e               L67:
1639                     ; 679 				 *control = 12;
1641  066e 1e01          	ldw	x,(OFST+1,sp)
1642  0670 a60c          	ld	a,#12
1643  0672 f7            	ld	(x),a
1644                     ; 680 				  state   = FINISH;
1646  0673 35500000      	mov	_state,#80
1647  0677 ac5a1e5a      	jpf	L143
1648  067b               L54:
1649                     ; 686 		 case 17:
1649                     ; 687 		    
1649                     ; 688 			 if(ack){
1651  067b 3d08          	tnz	_ack
1652  067d 2727          	jreq	L754
1653                     ; 690 				 ack   = FALSE;
1655  067f 3f08          	clr	_ack
1656                     ; 691 				 state = DELAY;
1658  0681 35510000      	mov	_state,#81
1659                     ; 692 				 stack = 18;
1661  0685 35120001      	mov	_stack,#18
1662                     ; 694 				 timerReset (1);
1664  0689 a601          	ld	a,#1
1665  068b cd0000        	call	_timerReset
1667                     ; 696 				 timerReset (3);
1669  068e a603          	ld	a,#3
1670  0690 cd0000        	call	_timerReset
1672                     ; 697 				 timerEnable(3, ENABLE);	
1674  0693 ae0301        	ldw	x,#769
1675  0696 cd0000        	call	_timerEnable
1677                     ; 699 				 ioCommSetDir(OUTPUT);
1679  0699 4f            	clr	a
1680  069a cd0000        	call	_ioCommSetDir
1682                     ; 701 				 GPIO_WriteHigh(COMM);
1684  069d 4b20          	push	#32
1685  069f ae5000        	ldw	x,#20480
1686  06a2 cd0000        	call	_GPIO_WriteHigh
1688  06a5 84            	pop	a
1689  06a6               L754:
1690                     ; 705 			 if(timerGetOverflow(1)){
1692  06a6 a601          	ld	a,#1
1693  06a8 cd0000        	call	_timerGetOverflow
1695  06ab 4d            	tnz	a
1696  06ac 2603          	jrne	L001
1697  06ae cc1e5a        	jp	L143
1698  06b1               L001:
1699                     ; 707 				 *control = 13;
1701  06b1 1e01          	ldw	x,(OFST+1,sp)
1702  06b3 a60d          	ld	a,#13
1703  06b5 f7            	ld	(x),a
1704                     ; 708 				  state   = FINISH;
1706  06b6 35500000      	mov	_state,#80
1707  06ba ac5a1e5a      	jpf	L143
1708  06be               L74:
1709                     ; 714 		 case 18:
1709                     ; 715 		    
1709                     ; 716 			 if(ack){
1711  06be 3d08          	tnz	_ack
1712  06c0 2727          	jreq	L364
1713                     ; 718 				 ack   = FALSE;
1715  06c2 3f08          	clr	_ack
1716                     ; 719 				 state = DELAY;
1718  06c4 35510000      	mov	_state,#81
1719                     ; 720 				 stack = 19;
1721  06c8 35130001      	mov	_stack,#19
1722                     ; 722 				 timerReset (1);
1724  06cc a601          	ld	a,#1
1725  06ce cd0000        	call	_timerReset
1727                     ; 724 				 timerReset (3);
1729  06d1 a603          	ld	a,#3
1730  06d3 cd0000        	call	_timerReset
1732                     ; 725 				 timerEnable(3, ENABLE);
1734  06d6 ae0301        	ldw	x,#769
1735  06d9 cd0000        	call	_timerEnable
1737                     ; 727 				 ioCommSetDir(OUTPUT);
1739  06dc 4f            	clr	a
1740  06dd cd0000        	call	_ioCommSetDir
1742                     ; 729 				 GPIO_WriteHigh(COMM);
1744  06e0 4b20          	push	#32
1745  06e2 ae5000        	ldw	x,#20480
1746  06e5 cd0000        	call	_GPIO_WriteHigh
1748  06e8 84            	pop	a
1749  06e9               L364:
1750                     ; 733 			 if(timerGetOverflow(1)){
1752  06e9 a601          	ld	a,#1
1753  06eb cd0000        	call	_timerGetOverflow
1755  06ee 4d            	tnz	a
1756  06ef 2603          	jrne	L201
1757  06f1 cc1e5a        	jp	L143
1758  06f4               L201:
1759                     ; 735 				 *control = 14;
1761  06f4 1e01          	ldw	x,(OFST+1,sp)
1762  06f6 a60e          	ld	a,#14
1763  06f8 f7            	ld	(x),a
1764                     ; 736 				  state   = FINISH;
1766  06f9 35500000      	mov	_state,#80
1767  06fd ac5a1e5a      	jpf	L143
1768  0701               L15:
1769                     ; 742 		 case 19:
1769                     ; 743 		    
1769                     ; 744 			 if(ack){
1771  0701 3d08          	tnz	_ack
1772  0703 2727          	jreq	L764
1773                     ; 746 				 ack   = FALSE;
1775  0705 3f08          	clr	_ack
1776                     ; 747 				 state = DELAY;
1778  0707 35510000      	mov	_state,#81
1779                     ; 748 				 stack = 20;
1781  070b 35140001      	mov	_stack,#20
1782                     ; 750 				 timerReset (1);
1784  070f a601          	ld	a,#1
1785  0711 cd0000        	call	_timerReset
1787                     ; 752 				 timerReset (3);
1789  0714 a603          	ld	a,#3
1790  0716 cd0000        	call	_timerReset
1792                     ; 753 				 timerEnable(3, ENABLE);	
1794  0719 ae0301        	ldw	x,#769
1795  071c cd0000        	call	_timerEnable
1797                     ; 755 				 ioCommSetDir(OUTPUT);
1799  071f 4f            	clr	a
1800  0720 cd0000        	call	_ioCommSetDir
1802                     ; 757 				 GPIO_WriteHigh(COMM);
1804  0723 4b20          	push	#32
1805  0725 ae5000        	ldw	x,#20480
1806  0728 cd0000        	call	_GPIO_WriteHigh
1808  072b 84            	pop	a
1809  072c               L764:
1810                     ; 761 			 if(timerGetOverflow(1)){
1812  072c a601          	ld	a,#1
1813  072e cd0000        	call	_timerGetOverflow
1815  0731 4d            	tnz	a
1816  0732 2603          	jrne	L401
1817  0734 cc1e5a        	jp	L143
1818  0737               L401:
1819                     ; 763 				 *control = 15;
1821  0737 1e01          	ldw	x,(OFST+1,sp)
1822  0739 a60f          	ld	a,#15
1823  073b f7            	ld	(x),a
1824                     ; 764 				  state   = FINISH;
1826  073c 35500000      	mov	_state,#80
1827  0740 ac5a1e5a      	jpf	L143
1828  0744               L35:
1829                     ; 770 		 case 20:
1829                     ; 771 		    
1829                     ; 772 			 if(ack){
1831  0744 3d08          	tnz	_ack
1832  0746 2727          	jreq	L374
1833                     ; 774 				 ack   = FALSE;
1835  0748 3f08          	clr	_ack
1836                     ; 775 				 state = DELAY;
1838  074a 35510000      	mov	_state,#81
1839                     ; 776 				 stack = 21;
1841  074e 35150001      	mov	_stack,#21
1842                     ; 778 				 timerReset (1);
1844  0752 a601          	ld	a,#1
1845  0754 cd0000        	call	_timerReset
1847                     ; 780 				 timerReset (3);
1849  0757 a603          	ld	a,#3
1850  0759 cd0000        	call	_timerReset
1852                     ; 781 				 timerEnable(3, ENABLE);
1854  075c ae0301        	ldw	x,#769
1855  075f cd0000        	call	_timerEnable
1857                     ; 783 				 ioCommSetDir(OUTPUT);
1859  0762 4f            	clr	a
1860  0763 cd0000        	call	_ioCommSetDir
1862                     ; 785 				 GPIO_WriteHigh(COMM);
1864  0766 4b20          	push	#32
1865  0768 ae5000        	ldw	x,#20480
1866  076b cd0000        	call	_GPIO_WriteHigh
1868  076e 84            	pop	a
1869  076f               L374:
1870                     ; 789 			 if(timerGetOverflow(1)){
1872  076f a601          	ld	a,#1
1873  0771 cd0000        	call	_timerGetOverflow
1875  0774 4d            	tnz	a
1876  0775 2603          	jrne	L601
1877  0777 cc1e5a        	jp	L143
1878  077a               L601:
1879                     ; 791 				 *control = 16;
1881  077a 1e01          	ldw	x,(OFST+1,sp)
1882  077c a610          	ld	a,#16
1883  077e f7            	ld	(x),a
1884                     ; 792 				  state   = FINISH;
1886  077f 35500000      	mov	_state,#80
1887  0783 ac5a1e5a      	jpf	L143
1888  0787               L55:
1889                     ; 798 		 case 21:
1889                     ; 799 		    
1889                     ; 800 			 if(ack){
1891  0787 3d08          	tnz	_ack
1892  0789 2730          	jreq	L774
1893                     ; 802 				 ack   = FALSE;
1895  078b 3f08          	clr	_ack
1896                     ; 803 				 state = DELAY;
1898  078d 35510000      	mov	_state,#81
1899                     ; 804 				 stack = 22;
1901  0791 35160001      	mov	_stack,#22
1902                     ; 806 				 timerReset (1);
1904  0795 a601          	ld	a,#1
1905  0797 cd0000        	call	_timerReset
1907                     ; 808 				 timerReset (3);
1909  079a a603          	ld	a,#3
1910  079c cd0000        	call	_timerReset
1912                     ; 809 				 timerEnable(3, ENABLE);
1914  079f ae0301        	ldw	x,#769
1915  07a2 cd0000        	call	_timerEnable
1917                     ; 811 				 GPIO_WriteHigh(SW_P);
1919  07a5 4b20          	push	#32
1920  07a7 ae500a        	ldw	x,#20490
1921  07aa cd0000        	call	_GPIO_WriteHigh
1923  07ad 84            	pop	a
1924                     ; 813 				 ioCommSetDir(OUTPUT);
1926  07ae 4f            	clr	a
1927  07af cd0000        	call	_ioCommSetDir
1929                     ; 815 				 GPIO_WriteHigh(COMM);
1931  07b2 4b20          	push	#32
1932  07b4 ae5000        	ldw	x,#20480
1933  07b7 cd0000        	call	_GPIO_WriteHigh
1935  07ba 84            	pop	a
1936  07bb               L774:
1937                     ; 819 			 if(timerGetOverflow(1)){
1939  07bb a601          	ld	a,#1
1940  07bd cd0000        	call	_timerGetOverflow
1942  07c0 4d            	tnz	a
1943  07c1 2603          	jrne	L011
1944  07c3 cc1e5a        	jp	L143
1945  07c6               L011:
1946                     ; 821 				 *control = 17;
1948  07c6 1e01          	ldw	x,(OFST+1,sp)
1949  07c8 a611          	ld	a,#17
1950  07ca f7            	ld	(x),a
1951                     ; 822 				  state   = FINISH;
1953  07cb 35500000      	mov	_state,#80
1954  07cf ac5a1e5a      	jpf	L143
1955  07d3               L75:
1956                     ; 828 		 case 22:
1956                     ; 829 		    
1956                     ; 830 			 if(ack){
1958  07d3 3d08          	tnz	_ack
1959  07d5 2727          	jreq	L305
1960                     ; 832 				 ack   = FALSE;	
1962  07d7 3f08          	clr	_ack
1963                     ; 833 				 state = DELAY;
1965  07d9 35510000      	mov	_state,#81
1966                     ; 834 				 stack = 29;
1968  07dd 351d0001      	mov	_stack,#29
1969                     ; 836 				 timerReset (1);
1971  07e1 a601          	ld	a,#1
1972  07e3 cd0000        	call	_timerReset
1974                     ; 838 				 timerReset (3);
1976  07e6 a603          	ld	a,#3
1977  07e8 cd0000        	call	_timerReset
1979                     ; 839 				 timerEnable(3, ENABLE);
1981  07eb ae0301        	ldw	x,#769
1982  07ee cd0000        	call	_timerEnable
1984                     ; 841 				 ioCommSetDir(OUTPUT);
1986  07f1 4f            	clr	a
1987  07f2 cd0000        	call	_ioCommSetDir
1989                     ; 843 				 GPIO_WriteHigh(COMM);
1991  07f5 4b20          	push	#32
1992  07f7 ae5000        	ldw	x,#20480
1993  07fa cd0000        	call	_GPIO_WriteHigh
1995  07fd 84            	pop	a
1996  07fe               L305:
1997                     ; 847 			 if(timerGetOverflow(1)){
1999  07fe a601          	ld	a,#1
2000  0800 cd0000        	call	_timerGetOverflow
2002  0803 4d            	tnz	a
2003  0804 2603          	jrne	L211
2004  0806 cc1e5a        	jp	L143
2005  0809               L211:
2006                     ; 849 				 ack   = FALSE;
2008  0809 3f08          	clr	_ack
2009                     ; 850 				 state = DELAY;
2011  080b 35510000      	mov	_state,#81
2012                     ; 851 				 stack = 23;
2014  080f 35170001      	mov	_stack,#23
2015                     ; 853 				 timerReset (1);
2017  0813 a601          	ld	a,#1
2018  0815 cd0000        	call	_timerReset
2020                     ; 855 				 timerReset (3);
2022  0818 a603          	ld	a,#3
2023  081a cd0000        	call	_timerReset
2025                     ; 856 				 timerEnable(3, ENABLE);
2027  081d ae0301        	ldw	x,#769
2028  0820 cd0000        	call	_timerEnable
2030                     ; 858 				 ioCommSetDir(OUTPUT);
2032  0823 4f            	clr	a
2033  0824 cd0000        	call	_ioCommSetDir
2035                     ; 860 				 GPIO_WriteHigh(COMM);
2037  0827 4b20          	push	#32
2038  0829 ae5000        	ldw	x,#20480
2039  082c cd0000        	call	_GPIO_WriteHigh
2041  082f 84            	pop	a
2042  0830 ac5a1e5a      	jpf	L143
2043  0834               L16:
2044                     ; 866 		 case 23:
2044                     ; 867 		    
2044                     ; 868 			 if(ack){
2046  0834 3d08          	tnz	_ack
2047  0836 2727          	jreq	L705
2048                     ; 870 				 ack   = FALSE;
2050  0838 3f08          	clr	_ack
2051                     ; 871 				 state = DELAY;
2053  083a 35510000      	mov	_state,#81
2054                     ; 872 				 stack = 24;
2056  083e 35180001      	mov	_stack,#24
2057                     ; 874 				 timerReset (1);
2059  0842 a601          	ld	a,#1
2060  0844 cd0000        	call	_timerReset
2062                     ; 876 				 timerReset (3);
2064  0847 a603          	ld	a,#3
2065  0849 cd0000        	call	_timerReset
2067                     ; 877 				 timerEnable(3, ENABLE);	
2069  084c ae0301        	ldw	x,#769
2070  084f cd0000        	call	_timerEnable
2072                     ; 879 				 ioCommSetDir(OUTPUT);
2074  0852 4f            	clr	a
2075  0853 cd0000        	call	_ioCommSetDir
2077                     ; 881 				 GPIO_WriteHigh(COMM);
2079  0856 4b20          	push	#32
2080  0858 ae5000        	ldw	x,#20480
2081  085b cd0000        	call	_GPIO_WriteHigh
2083  085e 84            	pop	a
2084  085f               L705:
2085                     ; 885 			 if(timerGetOverflow(1)){
2087  085f a601          	ld	a,#1
2088  0861 cd0000        	call	_timerGetOverflow
2090  0864 4d            	tnz	a
2091  0865 2603          	jrne	L411
2092  0867 cc1e5a        	jp	L143
2093  086a               L411:
2094                     ; 887 				 *control = 12;
2096  086a 1e01          	ldw	x,(OFST+1,sp)
2097  086c a60c          	ld	a,#12
2098  086e f7            	ld	(x),a
2099                     ; 888 				  state   = FINISH;
2101  086f 35500000      	mov	_state,#80
2102  0873 ac5a1e5a      	jpf	L143
2103  0877               L36:
2104                     ; 894 		 case 24:
2104                     ; 895 		    
2104                     ; 896 			 if(ack){
2106  0877 3d08          	tnz	_ack
2107  0879 2727          	jreq	L315
2108                     ; 898 				 ack   = FALSE;
2110  087b 3f08          	clr	_ack
2111                     ; 899 				 state = DELAY;
2113  087d 35510000      	mov	_state,#81
2114                     ; 900 				 stack = 25;
2116  0881 35190001      	mov	_stack,#25
2117                     ; 902 				 timerReset (1);
2119  0885 a601          	ld	a,#1
2120  0887 cd0000        	call	_timerReset
2122                     ; 904 				 timerReset (3);
2124  088a a603          	ld	a,#3
2125  088c cd0000        	call	_timerReset
2127                     ; 905 				 timerEnable(3, ENABLE);
2129  088f ae0301        	ldw	x,#769
2130  0892 cd0000        	call	_timerEnable
2132                     ; 907 				 ioCommSetDir(OUTPUT);
2134  0895 4f            	clr	a
2135  0896 cd0000        	call	_ioCommSetDir
2137                     ; 909 				 GPIO_WriteHigh(COMM);
2139  0899 4b20          	push	#32
2140  089b ae5000        	ldw	x,#20480
2141  089e cd0000        	call	_GPIO_WriteHigh
2143  08a1 84            	pop	a
2144  08a2               L315:
2145                     ; 913 			 if(timerGetOverflow(1)){
2147  08a2 a601          	ld	a,#1
2148  08a4 cd0000        	call	_timerGetOverflow
2150  08a7 4d            	tnz	a
2151  08a8 2603          	jrne	L611
2152  08aa cc1e5a        	jp	L143
2153  08ad               L611:
2154                     ; 915 				 *control = 13;
2156  08ad 1e01          	ldw	x,(OFST+1,sp)
2157  08af a60d          	ld	a,#13
2158  08b1 f7            	ld	(x),a
2159                     ; 916 				  state   = FINISH;
2161  08b2 35500000      	mov	_state,#80
2162  08b6 ac5a1e5a      	jpf	L143
2163  08ba               L56:
2164                     ; 922 		 case 25:
2164                     ; 923 		    
2164                     ; 924 			 if(ack){
2166  08ba 3d08          	tnz	_ack
2167  08bc 2727          	jreq	L715
2168                     ; 926 				 ack   = FALSE;
2170  08be 3f08          	clr	_ack
2171                     ; 927 				 state = DELAY;
2173  08c0 35510000      	mov	_state,#81
2174                     ; 928 				 stack = 26;
2176  08c4 351a0001      	mov	_stack,#26
2177                     ; 930 				 timerReset (1);
2179  08c8 a601          	ld	a,#1
2180  08ca cd0000        	call	_timerReset
2182                     ; 932 				 timerReset (3);
2184  08cd a603          	ld	a,#3
2185  08cf cd0000        	call	_timerReset
2187                     ; 933 				 timerEnable(3, ENABLE);
2189  08d2 ae0301        	ldw	x,#769
2190  08d5 cd0000        	call	_timerEnable
2192                     ; 935 				 ioCommSetDir(OUTPUT);
2194  08d8 4f            	clr	a
2195  08d9 cd0000        	call	_ioCommSetDir
2197                     ; 937 				 GPIO_WriteHigh(COMM);
2199  08dc 4b20          	push	#32
2200  08de ae5000        	ldw	x,#20480
2201  08e1 cd0000        	call	_GPIO_WriteHigh
2203  08e4 84            	pop	a
2204  08e5               L715:
2205                     ; 941 			 if(timerGetOverflow(1)){
2207  08e5 a601          	ld	a,#1
2208  08e7 cd0000        	call	_timerGetOverflow
2210  08ea 4d            	tnz	a
2211  08eb 2603          	jrne	L021
2212  08ed cc1e5a        	jp	L143
2213  08f0               L021:
2214                     ; 943 				 *control = 14;
2216  08f0 1e01          	ldw	x,(OFST+1,sp)
2217  08f2 a60e          	ld	a,#14
2218  08f4 f7            	ld	(x),a
2219                     ; 944 				  state   = FINISH;
2221  08f5 35500000      	mov	_state,#80
2222  08f9 ac5a1e5a      	jpf	L143
2223  08fd               L76:
2224                     ; 950 		 case 26:
2224                     ; 951 		    
2224                     ; 952 			 if(ack){
2226  08fd 3d08          	tnz	_ack
2227  08ff 2727          	jreq	L325
2228                     ; 954 				 ack   = FALSE;
2230  0901 3f08          	clr	_ack
2231                     ; 955 				 state = DELAY;
2233  0903 35510000      	mov	_state,#81
2234                     ; 956 				 stack = 27;
2236  0907 351b0001      	mov	_stack,#27
2237                     ; 958 				 timerReset (1);
2239  090b a601          	ld	a,#1
2240  090d cd0000        	call	_timerReset
2242                     ; 960 				 timerReset (3);
2244  0910 a603          	ld	a,#3
2245  0912 cd0000        	call	_timerReset
2247                     ; 961 				 timerEnable(3, ENABLE);
2249  0915 ae0301        	ldw	x,#769
2250  0918 cd0000        	call	_timerEnable
2252                     ; 963 				 ioCommSetDir(OUTPUT);
2254  091b 4f            	clr	a
2255  091c cd0000        	call	_ioCommSetDir
2257                     ; 965 				 GPIO_WriteHigh(COMM);
2259  091f 4b20          	push	#32
2260  0921 ae5000        	ldw	x,#20480
2261  0924 cd0000        	call	_GPIO_WriteHigh
2263  0927 84            	pop	a
2264  0928               L325:
2265                     ; 969 			 if(timerGetOverflow(1)){
2267  0928 a601          	ld	a,#1
2268  092a cd0000        	call	_timerGetOverflow
2270  092d 4d            	tnz	a
2271  092e 2603          	jrne	L221
2272  0930 cc1e5a        	jp	L143
2273  0933               L221:
2274                     ; 971 				 *control = 15;
2276  0933 1e01          	ldw	x,(OFST+1,sp)
2277  0935 a60f          	ld	a,#15
2278  0937 f7            	ld	(x),a
2279                     ; 972 				  state   = FINISH;
2281  0938 35500000      	mov	_state,#80
2282  093c ac5a1e5a      	jpf	L143
2283  0940               L17:
2284                     ; 978 		 case 27:
2284                     ; 979 		    
2284                     ; 980 			 if(ack){
2286  0940 3d08          	tnz	_ack
2287  0942 2727          	jreq	L725
2288                     ; 982 				 ack      = FALSE;
2290  0944 3f08          	clr	_ack
2291                     ; 983 				 state    = DELAY;
2293  0946 35510000      	mov	_state,#81
2294                     ; 984 				 stack    = 28;
2296  094a 351c0001      	mov	_stack,#28
2297                     ; 986 				 timerReset (1);
2299  094e a601          	ld	a,#1
2300  0950 cd0000        	call	_timerReset
2302                     ; 988 				 timerReset (3);
2304  0953 a603          	ld	a,#3
2305  0955 cd0000        	call	_timerReset
2307                     ; 989 				 timerEnable(3, ENABLE);
2309  0958 ae0301        	ldw	x,#769
2310  095b cd0000        	call	_timerEnable
2312                     ; 991 				 ioCommSetDir(OUTPUT);
2314  095e 4f            	clr	a
2315  095f cd0000        	call	_ioCommSetDir
2317                     ; 993 				 GPIO_WriteHigh(COMM);
2319  0962 4b20          	push	#32
2320  0964 ae5000        	ldw	x,#20480
2321  0967 cd0000        	call	_GPIO_WriteHigh
2323  096a 84            	pop	a
2324  096b               L725:
2325                     ; 997 			 if(timerGetOverflow(1)){
2327  096b a601          	ld	a,#1
2328  096d cd0000        	call	_timerGetOverflow
2330  0970 4d            	tnz	a
2331  0971 2603          	jrne	L421
2332  0973 cc1e5a        	jp	L143
2333  0976               L421:
2334                     ; 999 				 *control = 16;
2336  0976 1e01          	ldw	x,(OFST+1,sp)
2337  0978 a610          	ld	a,#16
2338  097a f7            	ld	(x),a
2339                     ; 1000 				  state   = FINISH;
2341  097b 35500000      	mov	_state,#80
2342  097f ac5a1e5a      	jpf	L143
2343  0983               L37:
2344                     ; 1006 		 case 28:
2344                     ; 1007 		    
2344                     ; 1008 			 if(ack){
2346  0983 3d08          	tnz	_ack
2347  0985 2727          	jreq	L335
2348                     ; 1010 				 ack   = FALSE;	
2350  0987 3f08          	clr	_ack
2351                     ; 1011 				 state = DELAY;
2353  0989 35510000      	mov	_state,#81
2354                     ; 1012 				 stack = 29;
2356  098d 351d0001      	mov	_stack,#29
2357                     ; 1014 				 timerReset (1);
2359  0991 a601          	ld	a,#1
2360  0993 cd0000        	call	_timerReset
2362                     ; 1016 				 timerReset (3);
2364  0996 a603          	ld	a,#3
2365  0998 cd0000        	call	_timerReset
2367                     ; 1017 				 timerEnable(3, ENABLE);
2369  099b ae0301        	ldw	x,#769
2370  099e cd0000        	call	_timerEnable
2372                     ; 1019 				 ioCommSetDir(OUTPUT);
2374  09a1 4f            	clr	a
2375  09a2 cd0000        	call	_ioCommSetDir
2377                     ; 1021 				 GPIO_WriteHigh(COMM);
2379  09a5 4b20          	push	#32
2380  09a7 ae5000        	ldw	x,#20480
2381  09aa cd0000        	call	_GPIO_WriteHigh
2383  09ad 84            	pop	a
2384  09ae               L335:
2385                     ; 1025 			 if(timerGetOverflow(1)){
2387  09ae a601          	ld	a,#1
2388  09b0 cd0000        	call	_timerGetOverflow
2390  09b3 4d            	tnz	a
2391  09b4 2603          	jrne	L621
2392  09b6 cc1e5a        	jp	L143
2393  09b9               L621:
2394                     ; 1027 				 *control = 17;
2396  09b9 1e01          	ldw	x,(OFST+1,sp)
2397  09bb a611          	ld	a,#17
2398  09bd f7            	ld	(x),a
2399                     ; 1028 				  state   = FINISH;
2401  09be 35500000      	mov	_state,#80
2402  09c2 ac5a1e5a      	jpf	L143
2403  09c6               L57:
2404                     ; 1034 		 case 29:
2404                     ; 1035 		    
2404                     ; 1036 			 if(ack){
2406  09c6 3d08          	tnz	_ack
2407  09c8 2727          	jreq	L735
2408                     ; 1038 				 ack   = FALSE;	
2410  09ca 3f08          	clr	_ack
2411                     ; 1039 				 state = DELAY;
2413  09cc 35510000      	mov	_state,#81
2414                     ; 1040 				 stack = 30;
2416  09d0 351e0001      	mov	_stack,#30
2417                     ; 1042 				 timerReset (1);
2419  09d4 a601          	ld	a,#1
2420  09d6 cd0000        	call	_timerReset
2422                     ; 1044 				 timerReset (3);
2424  09d9 a603          	ld	a,#3
2425  09db cd0000        	call	_timerReset
2427                     ; 1045 				 timerEnable(3, ENABLE);
2429  09de ae0301        	ldw	x,#769
2430  09e1 cd0000        	call	_timerEnable
2432                     ; 1047 				 ioCommSetDir(OUTPUT);
2434  09e4 4f            	clr	a
2435  09e5 cd0000        	call	_ioCommSetDir
2437                     ; 1049 				 GPIO_WriteHigh(COMM);
2439  09e8 4b20          	push	#32
2440  09ea ae5000        	ldw	x,#20480
2441  09ed cd0000        	call	_GPIO_WriteHigh
2443  09f0 84            	pop	a
2444  09f1               L735:
2445                     ; 1053 			 if(timerGetOverflow(1)){
2447  09f1 a601          	ld	a,#1
2448  09f3 cd0000        	call	_timerGetOverflow
2450  09f6 4d            	tnz	a
2451  09f7 2603          	jrne	L031
2452  09f9 cc1e5a        	jp	L143
2453  09fc               L031:
2454                     ; 1055 				 *control = 18;
2456  09fc 1e01          	ldw	x,(OFST+1,sp)
2457  09fe a612          	ld	a,#18
2458  0a00 f7            	ld	(x),a
2459                     ; 1056 				  state   = FINISH;
2461  0a01 35500000      	mov	_state,#80
2462  0a05 ac5a1e5a      	jpf	L143
2463  0a09               L77:
2464                     ; 1062 		 case 30:
2464                     ; 1063 		    
2464                     ; 1064 			 if(ack){
2466  0a09 3d08          	tnz	_ack
2467  0a0b 2727          	jreq	L345
2468                     ; 1066 				 ack   = FALSE;
2470  0a0d 3f08          	clr	_ack
2471                     ; 1067 				 state = DELAY;
2473  0a0f 35510000      	mov	_state,#81
2474                     ; 1068 				 stack = 31;
2476  0a13 351f0001      	mov	_stack,#31
2477                     ; 1070 				 timerReset (1);
2479  0a17 a601          	ld	a,#1
2480  0a19 cd0000        	call	_timerReset
2482                     ; 1072 				 timerReset (3);
2484  0a1c a603          	ld	a,#3
2485  0a1e cd0000        	call	_timerReset
2487                     ; 1073 				 timerEnable(3, ENABLE);	
2489  0a21 ae0301        	ldw	x,#769
2490  0a24 cd0000        	call	_timerEnable
2492                     ; 1075 				 ioCommSetDir(OUTPUT);
2494  0a27 4f            	clr	a
2495  0a28 cd0000        	call	_ioCommSetDir
2497                     ; 1077 				 GPIO_WriteHigh(COMM);
2499  0a2b 4b20          	push	#32
2500  0a2d ae5000        	ldw	x,#20480
2501  0a30 cd0000        	call	_GPIO_WriteHigh
2503  0a33 84            	pop	a
2504  0a34               L345:
2505                     ; 1081 			 if(timerGetOverflow(1)){
2507  0a34 a601          	ld	a,#1
2508  0a36 cd0000        	call	_timerGetOverflow
2510  0a39 4d            	tnz	a
2511  0a3a 2603          	jrne	L231
2512  0a3c cc1e5a        	jp	L143
2513  0a3f               L231:
2514                     ; 1083 				 *control = 19;
2516  0a3f 1e01          	ldw	x,(OFST+1,sp)
2517  0a41 a613          	ld	a,#19
2518  0a43 f7            	ld	(x),a
2519                     ; 1084 				  state   = FINISH;
2521  0a44 35500000      	mov	_state,#80
2522  0a48 ac5a1e5a      	jpf	L143
2523  0a4c               L101:
2524                     ; 1090 		 case 31:
2524                     ; 1091 		    
2524                     ; 1092 			 if(ack){
2526  0a4c 3d08          	tnz	_ack
2527  0a4e 2760          	jreq	L745
2528                     ; 1094 				 ack   = FALSE;
2530  0a50 3f08          	clr	_ack
2531                     ; 1095 				 state = DELAY;
2533  0a52 35510000      	mov	_state,#81
2534                     ; 1096 				 stack = 32;
2536  0a56 35200001      	mov	_stack,#32
2537                     ; 1098 				 timerReset           (1);
2539  0a5a a601          	ld	a,#1
2540  0a5c cd0000        	call	_timerReset
2542                     ; 1099 				 timerSetOverflowValue(1, 200);
2544  0a5f ae00c8        	ldw	x,#200
2545  0a62 89            	pushw	x
2546  0a63 ae0000        	ldw	x,#0
2547  0a66 89            	pushw	x
2548  0a67 a601          	ld	a,#1
2549  0a69 cd0000        	call	_timerSetOverflowValue
2551  0a6c 5b04          	addw	sp,#4
2552                     ; 1101 				 timerReset           (3);				 
2554  0a6e a603          	ld	a,#3
2555  0a70 cd0000        	call	_timerReset
2557                     ; 1102 				 timerSetOverflowValue(3, 100);
2559  0a73 ae0064        	ldw	x,#100
2560  0a76 89            	pushw	x
2561  0a77 ae0000        	ldw	x,#0
2562  0a7a 89            	pushw	x
2563  0a7b a603          	ld	a,#3
2564  0a7d cd0000        	call	_timerSetOverflowValue
2566  0a80 5b04          	addw	sp,#4
2567                     ; 1103 				 timerEnable          (3, ENABLE);
2569  0a82 ae0301        	ldw	x,#769
2570  0a85 cd0000        	call	_timerEnable
2572                     ; 1105 				 GPIO_WriteLow (SW_P);
2574  0a88 4b20          	push	#32
2575  0a8a ae500a        	ldw	x,#20490
2576  0a8d cd0000        	call	_GPIO_WriteLow
2578  0a90 84            	pop	a
2579                     ; 1106          GPIO_WriteHigh(CH1);   				 
2581  0a91 4b40          	push	#64
2582  0a93 ae500a        	ldw	x,#20490
2583  0a96 cd0000        	call	_GPIO_WriteHigh
2585  0a99 84            	pop	a
2586                     ; 1107 				 GPIO_WriteHigh(I_MOT);
2588  0a9a 4b08          	push	#8
2589  0a9c ae5000        	ldw	x,#20480
2590  0a9f cd0000        	call	_GPIO_WriteHigh
2592  0aa2 84            	pop	a
2593                     ; 1109 				 ioCommSetDir(OUTPUT);
2595  0aa3 4f            	clr	a
2596  0aa4 cd0000        	call	_ioCommSetDir
2598                     ; 1111 				 GPIO_WriteHigh(COMM);
2600  0aa7 4b20          	push	#32
2601  0aa9 ae5000        	ldw	x,#20480
2602  0aac cd0000        	call	_GPIO_WriteHigh
2604  0aaf 84            	pop	a
2605  0ab0               L745:
2606                     ; 1115 			 if(timerGetOverflow(1)){
2608  0ab0 a601          	ld	a,#1
2609  0ab2 cd0000        	call	_timerGetOverflow
2611  0ab5 4d            	tnz	a
2612  0ab6 2603          	jrne	L431
2613  0ab8 cc1e5a        	jp	L143
2614  0abb               L431:
2615                     ; 1117 				 *control = 20;
2617  0abb 1e01          	ldw	x,(OFST+1,sp)
2618  0abd a614          	ld	a,#20
2619  0abf f7            	ld	(x),a
2620                     ; 1118 				  state   = FINISH;
2622  0ac0 35500000      	mov	_state,#80
2623  0ac4 ac5a1e5a      	jpf	L143
2624  0ac8               L301:
2625                     ; 1124 		 case 32:
2625                     ; 1125 		    
2625                     ; 1126 			 if(ack){
2627  0ac8 3d08          	tnz	_ack
2628  0aca 2739          	jreq	L355
2629                     ; 1128 				 ack   = FALSE;	
2631  0acc 3f08          	clr	_ack
2632                     ; 1129 				 state = DELAY;
2634  0ace 35510000      	mov	_state,#81
2635                     ; 1130 				 stack = 36;
2637  0ad2 35240001      	mov	_stack,#36
2638                     ; 1132 				 timerReset (1);
2640  0ad6 a601          	ld	a,#1
2641  0ad8 cd0000        	call	_timerReset
2643                     ; 1134 				 timerReset (3);
2645  0adb a603          	ld	a,#3
2646  0add cd0000        	call	_timerReset
2648                     ; 1135 				 timerEnable(3, ENABLE);
2650  0ae0 ae0301        	ldw	x,#769
2651  0ae3 cd0000        	call	_timerEnable
2653                     ; 1137 				 GPIO_WriteLow (CH1);
2655  0ae6 4b40          	push	#64
2656  0ae8 ae500a        	ldw	x,#20490
2657  0aeb cd0000        	call	_GPIO_WriteLow
2659  0aee 84            	pop	a
2660                     ; 1138 				 GPIO_WriteHigh(CH2);
2662  0aef 4b10          	push	#16
2663  0af1 ae500a        	ldw	x,#20490
2664  0af4 cd0000        	call	_GPIO_WriteHigh
2666  0af7 84            	pop	a
2667                     ; 1140 				 ioCommSetDir(OUTPUT);
2669  0af8 4f            	clr	a
2670  0af9 cd0000        	call	_ioCommSetDir
2672                     ; 1142 				 GPIO_WriteHigh(COMM);	 				 
2674  0afc 4b20          	push	#32
2675  0afe ae5000        	ldw	x,#20480
2676  0b01 cd0000        	call	_GPIO_WriteHigh
2678  0b04 84            	pop	a
2679  0b05               L355:
2680                     ; 1146 			 if(timerGetOverflow(1)){
2682  0b05 a601          	ld	a,#1
2683  0b07 cd0000        	call	_timerGetOverflow
2685  0b0a 4d            	tnz	a
2686  0b0b 2603          	jrne	L631
2687  0b0d cc1e5a        	jp	L143
2688  0b10               L631:
2689                     ; 1148 				 state = DELAY;
2691  0b10 35510000      	mov	_state,#81
2692                     ; 1149 				 stack = 33;
2694  0b14 35210001      	mov	_stack,#33
2695                     ; 1151 				 timerReset (1);
2697  0b18 a601          	ld	a,#1
2698  0b1a cd0000        	call	_timerReset
2700                     ; 1153 				 timerReset (3);
2702  0b1d a603          	ld	a,#3
2703  0b1f cd0000        	call	_timerReset
2705                     ; 1154 				 timerEnable(3, ENABLE);
2707  0b22 ae0301        	ldw	x,#769
2708  0b25 cd0000        	call	_timerEnable
2710                     ; 1156 				 ioCommSetDir(OUTPUT);
2712  0b28 4f            	clr	a
2713  0b29 cd0000        	call	_ioCommSetDir
2715                     ; 1158 				 GPIO_WriteHigh(COMM);
2717  0b2c 4b20          	push	#32
2718  0b2e ae5000        	ldw	x,#20480
2719  0b31 cd0000        	call	_GPIO_WriteHigh
2721  0b34 84            	pop	a
2722  0b35 ac5a1e5a      	jpf	L143
2723  0b39               L501:
2724                     ; 1164 		 case 33:
2724                     ; 1165 		    
2724                     ; 1166 			 if(ack){
2726  0b39 3d08          	tnz	_ack
2727  0b3b 2727          	jreq	L755
2728                     ; 1168 				 ack   = FALSE;	
2730  0b3d 3f08          	clr	_ack
2731                     ; 1169 				 state = DELAY;
2733  0b3f 35510000      	mov	_state,#81
2734                     ; 1170 				 stack = 34;
2736  0b43 35220001      	mov	_stack,#34
2737                     ; 1172 				 timerReset (1);
2739  0b47 a601          	ld	a,#1
2740  0b49 cd0000        	call	_timerReset
2742                     ; 1174 				 timerReset (3);
2744  0b4c a603          	ld	a,#3
2745  0b4e cd0000        	call	_timerReset
2747                     ; 1175 				 timerEnable(3, ENABLE);
2749  0b51 ae0301        	ldw	x,#769
2750  0b54 cd0000        	call	_timerEnable
2752                     ; 1177 				 ioCommSetDir(OUTPUT);
2754  0b57 4f            	clr	a
2755  0b58 cd0000        	call	_ioCommSetDir
2757                     ; 1179 				 GPIO_WriteHigh(COMM);	 				 
2759  0b5b 4b20          	push	#32
2760  0b5d ae5000        	ldw	x,#20480
2761  0b60 cd0000        	call	_GPIO_WriteHigh
2763  0b63 84            	pop	a
2764  0b64               L755:
2765                     ; 1183 			 if(timerGetOverflow(1)){
2767  0b64 a601          	ld	a,#1
2768  0b66 cd0000        	call	_timerGetOverflow
2770  0b69 4d            	tnz	a
2771  0b6a 2603          	jrne	L041
2772  0b6c cc1e5a        	jp	L143
2773  0b6f               L041:
2774                     ; 1185 				 *control = 21;
2776  0b6f 1e01          	ldw	x,(OFST+1,sp)
2777  0b71 a615          	ld	a,#21
2778  0b73 f7            	ld	(x),a
2779                     ; 1186 				 state    = FINISH;
2781  0b74 35500000      	mov	_state,#80
2782  0b78 ac5a1e5a      	jpf	L143
2783  0b7c               L701:
2784                     ; 1192 		 case 34:
2784                     ; 1193 		    
2784                     ; 1194 			 if(ack){
2786  0b7c 3d08          	tnz	_ack
2787  0b7e 2727          	jreq	L365
2788                     ; 1196 				 ack   = FALSE;	
2790  0b80 3f08          	clr	_ack
2791                     ; 1197 				 state = DELAY;
2793  0b82 35510000      	mov	_state,#81
2794                     ; 1198 				 stack = 35;
2796  0b86 35230001      	mov	_stack,#35
2797                     ; 1200 				 timerReset (1);
2799  0b8a a601          	ld	a,#1
2800  0b8c cd0000        	call	_timerReset
2802                     ; 1202 				 timerReset (3);
2804  0b8f a603          	ld	a,#3
2805  0b91 cd0000        	call	_timerReset
2807                     ; 1203 				 timerEnable(3, ENABLE);
2809  0b94 ae0301        	ldw	x,#769
2810  0b97 cd0000        	call	_timerEnable
2812                     ; 1205 				 ioCommSetDir(OUTPUT);
2814  0b9a 4f            	clr	a
2815  0b9b cd0000        	call	_ioCommSetDir
2817                     ; 1207 				 GPIO_WriteHigh(COMM);	 				 
2819  0b9e 4b20          	push	#32
2820  0ba0 ae5000        	ldw	x,#20480
2821  0ba3 cd0000        	call	_GPIO_WriteHigh
2823  0ba6 84            	pop	a
2824  0ba7               L365:
2825                     ; 1211 			 if(timerGetOverflow(1)){
2827  0ba7 a601          	ld	a,#1
2828  0ba9 cd0000        	call	_timerGetOverflow
2830  0bac 4d            	tnz	a
2831  0bad 2603          	jrne	L241
2832  0baf cc1e5a        	jp	L143
2833  0bb2               L241:
2834                     ; 1213 				 *control = 21;
2836  0bb2 1e01          	ldw	x,(OFST+1,sp)
2837  0bb4 a615          	ld	a,#21
2838  0bb6 f7            	ld	(x),a
2839                     ; 1214 				 state    = FINISH;
2841  0bb7 35500000      	mov	_state,#80
2842  0bbb ac5a1e5a      	jpf	L143
2843  0bbf               L111:
2844                     ; 1220      case 35:
2844                     ; 1221 		    
2844                     ; 1222 			 if(ack){
2846  0bbf 3d08          	tnz	_ack
2847  0bc1 2739          	jreq	L765
2848                     ; 1224 				 ack   = FALSE;	
2850  0bc3 3f08          	clr	_ack
2851                     ; 1225 				 state = DELAY;
2853  0bc5 35510000      	mov	_state,#81
2854                     ; 1226 				 stack = 36;
2856  0bc9 35240001      	mov	_stack,#36
2857                     ; 1228 				 timerReset (1);
2859  0bcd a601          	ld	a,#1
2860  0bcf cd0000        	call	_timerReset
2862                     ; 1230 				 timerReset (3);
2864  0bd2 a603          	ld	a,#3
2865  0bd4 cd0000        	call	_timerReset
2867                     ; 1231 				 timerEnable(3, ENABLE);
2869  0bd7 ae0301        	ldw	x,#769
2870  0bda cd0000        	call	_timerEnable
2872                     ; 1233 				 GPIO_WriteLow (CH1);
2874  0bdd 4b40          	push	#64
2875  0bdf ae500a        	ldw	x,#20490
2876  0be2 cd0000        	call	_GPIO_WriteLow
2878  0be5 84            	pop	a
2879                     ; 1234 				 GPIO_WriteHigh(CH2);
2881  0be6 4b10          	push	#16
2882  0be8 ae500a        	ldw	x,#20490
2883  0beb cd0000        	call	_GPIO_WriteHigh
2885  0bee 84            	pop	a
2886                     ; 1236 				 ioCommSetDir(OUTPUT);
2888  0bef 4f            	clr	a
2889  0bf0 cd0000        	call	_ioCommSetDir
2891                     ; 1238 				 GPIO_WriteHigh(COMM);	 				 
2893  0bf3 4b20          	push	#32
2894  0bf5 ae5000        	ldw	x,#20480
2895  0bf8 cd0000        	call	_GPIO_WriteHigh
2897  0bfb 84            	pop	a
2898  0bfc               L765:
2899                     ; 1242 			 if(timerGetOverflow(1)){
2901  0bfc a601          	ld	a,#1
2902  0bfe cd0000        	call	_timerGetOverflow
2904  0c01 4d            	tnz	a
2905  0c02 2603          	jrne	L441
2906  0c04 cc1e5a        	jp	L143
2907  0c07               L441:
2908                     ; 1244 				 *control = 21;
2910  0c07 1e01          	ldw	x,(OFST+1,sp)
2911  0c09 a615          	ld	a,#21
2912  0c0b f7            	ld	(x),a
2913                     ; 1245 				  state   = FINISH;
2915  0c0c 35500000      	mov	_state,#80
2916  0c10 ac5a1e5a      	jpf	L143
2917  0c14               L311:
2918                     ; 1251 		 case 36:
2918                     ; 1252 		    
2918                     ; 1253 			 if(ack){
2920  0c14 3d08          	tnz	_ack
2921  0c16 2739          	jreq	L375
2922                     ; 1255 				 ack   = FALSE;	
2924  0c18 3f08          	clr	_ack
2925                     ; 1256 				 state = DELAY;
2927  0c1a 35510000      	mov	_state,#81
2928                     ; 1257 				 stack = 40;
2930  0c1e 35280001      	mov	_stack,#40
2931                     ; 1259 				 timerReset (1);
2933  0c22 a601          	ld	a,#1
2934  0c24 cd0000        	call	_timerReset
2936                     ; 1261 				 timerReset (3);
2938  0c27 a603          	ld	a,#3
2939  0c29 cd0000        	call	_timerReset
2941                     ; 1262 				 timerEnable(3, ENABLE);
2943  0c2c ae0301        	ldw	x,#769
2944  0c2f cd0000        	call	_timerEnable
2946                     ; 1264 				 GPIO_WriteLow (CH2);
2948  0c32 4b10          	push	#16
2949  0c34 ae500a        	ldw	x,#20490
2950  0c37 cd0000        	call	_GPIO_WriteLow
2952  0c3a 84            	pop	a
2953                     ; 1265 				 GPIO_WriteHigh(CH3);
2955  0c3b 4b04          	push	#4
2956  0c3d ae500a        	ldw	x,#20490
2957  0c40 cd0000        	call	_GPIO_WriteHigh
2959  0c43 84            	pop	a
2960                     ; 1267 				 ioCommSetDir(OUTPUT);
2962  0c44 4f            	clr	a
2963  0c45 cd0000        	call	_ioCommSetDir
2965                     ; 1269 				 GPIO_WriteHigh(COMM);
2967  0c48 4b20          	push	#32
2968  0c4a ae5000        	ldw	x,#20480
2969  0c4d cd0000        	call	_GPIO_WriteHigh
2971  0c50 84            	pop	a
2972  0c51               L375:
2973                     ; 1273 			 if(timerGetOverflow(1)){
2975  0c51 a601          	ld	a,#1
2976  0c53 cd0000        	call	_timerGetOverflow
2978  0c56 4d            	tnz	a
2979  0c57 2603          	jrne	L641
2980  0c59 cc1e5a        	jp	L143
2981  0c5c               L641:
2982                     ; 1275 				 state = DELAY;
2984  0c5c 35510000      	mov	_state,#81
2985                     ; 1276 				 stack = 37;
2987  0c60 35250001      	mov	_stack,#37
2988                     ; 1278 				 timerReset (1);
2990  0c64 a601          	ld	a,#1
2991  0c66 cd0000        	call	_timerReset
2993                     ; 1280 				 timerReset (3);
2995  0c69 a603          	ld	a,#3
2996  0c6b cd0000        	call	_timerReset
2998                     ; 1281 				 timerEnable(3, ENABLE);
3000  0c6e ae0301        	ldw	x,#769
3001  0c71 cd0000        	call	_timerEnable
3003                     ; 1283 				 ioCommSetDir(OUTPUT);
3005  0c74 4f            	clr	a
3006  0c75 cd0000        	call	_ioCommSetDir
3008                     ; 1285 				 GPIO_WriteHigh(COMM);
3010  0c78 4b20          	push	#32
3011  0c7a ae5000        	ldw	x,#20480
3012  0c7d cd0000        	call	_GPIO_WriteHigh
3014  0c80 84            	pop	a
3015  0c81 ac5a1e5a      	jpf	L143
3016  0c85               L511:
3017                     ; 1291      case 37:
3017                     ; 1292 		    
3017                     ; 1293 			 if(ack){
3019  0c85 3d08          	tnz	_ack
3020  0c87 2727          	jreq	L775
3021                     ; 1295 				 ack   = FALSE;	
3023  0c89 3f08          	clr	_ack
3024                     ; 1296 				 state = DELAY;
3026  0c8b 35510000      	mov	_state,#81
3027                     ; 1297 				 stack = 38;
3029  0c8f 35260001      	mov	_stack,#38
3030                     ; 1299 				 timerReset (1);
3032  0c93 a601          	ld	a,#1
3033  0c95 cd0000        	call	_timerReset
3035                     ; 1301 				 timerReset (3);
3037  0c98 a603          	ld	a,#3
3038  0c9a cd0000        	call	_timerReset
3040                     ; 1302 				 timerEnable(3, ENABLE);
3042  0c9d ae0301        	ldw	x,#769
3043  0ca0 cd0000        	call	_timerEnable
3045                     ; 1304 				 ioCommSetDir(OUTPUT);
3047  0ca3 4f            	clr	a
3048  0ca4 cd0000        	call	_ioCommSetDir
3050                     ; 1306 				 GPIO_WriteHigh(COMM);
3052  0ca7 4b20          	push	#32
3053  0ca9 ae5000        	ldw	x,#20480
3054  0cac cd0000        	call	_GPIO_WriteHigh
3056  0caf 84            	pop	a
3057  0cb0               L775:
3058                     ; 1310 			 if(timerGetOverflow(1)){
3060  0cb0 a601          	ld	a,#1
3061  0cb2 cd0000        	call	_timerGetOverflow
3063  0cb5 4d            	tnz	a
3064  0cb6 2603          	jrne	L051
3065  0cb8 cc1e5a        	jp	L143
3066  0cbb               L051:
3067                     ; 1312 				 *control = 22;
3069  0cbb 1e01          	ldw	x,(OFST+1,sp)
3070  0cbd a616          	ld	a,#22
3071  0cbf f7            	ld	(x),a
3072                     ; 1313 				 state    = FINISH;
3074  0cc0 35500000      	mov	_state,#80
3075  0cc4 ac5a1e5a      	jpf	L143
3076  0cc8               L711:
3077                     ; 1319      case 38:
3077                     ; 1320 		    
3077                     ; 1321 			 if(ack){
3079  0cc8 3d08          	tnz	_ack
3080  0cca 2727          	jreq	L306
3081                     ; 1323 				 ack   = FALSE;	
3083  0ccc 3f08          	clr	_ack
3084                     ; 1324 				 state = DELAY;
3086  0cce 35510000      	mov	_state,#81
3087                     ; 1325 				 stack = 39;
3089  0cd2 35270001      	mov	_stack,#39
3090                     ; 1327 				 timerReset (1);
3092  0cd6 a601          	ld	a,#1
3093  0cd8 cd0000        	call	_timerReset
3095                     ; 1329 				 timerReset (3);
3097  0cdb a603          	ld	a,#3
3098  0cdd cd0000        	call	_timerReset
3100                     ; 1330 				 timerEnable(3, ENABLE);
3102  0ce0 ae0301        	ldw	x,#769
3103  0ce3 cd0000        	call	_timerEnable
3105                     ; 1332 				 ioCommSetDir(OUTPUT);
3107  0ce6 4f            	clr	a
3108  0ce7 cd0000        	call	_ioCommSetDir
3110                     ; 1334 				 GPIO_WriteHigh(COMM);
3112  0cea 4b20          	push	#32
3113  0cec ae5000        	ldw	x,#20480
3114  0cef cd0000        	call	_GPIO_WriteHigh
3116  0cf2 84            	pop	a
3117  0cf3               L306:
3118                     ; 1338 			 if(timerGetOverflow(1)){
3120  0cf3 a601          	ld	a,#1
3121  0cf5 cd0000        	call	_timerGetOverflow
3123  0cf8 4d            	tnz	a
3124  0cf9 2603          	jrne	L251
3125  0cfb cc1e5a        	jp	L143
3126  0cfe               L251:
3127                     ; 1340 				 *control = 22;
3129  0cfe 1e01          	ldw	x,(OFST+1,sp)
3130  0d00 a616          	ld	a,#22
3131  0d02 f7            	ld	(x),a
3132                     ; 1341 					state   = FINISH;
3134  0d03 35500000      	mov	_state,#80
3135  0d07 ac5a1e5a      	jpf	L143
3136  0d0b               L121:
3137                     ; 1347      case 39:
3137                     ; 1348 		    
3137                     ; 1349 			 if(ack){
3139  0d0b 3d08          	tnz	_ack
3140  0d0d 2739          	jreq	L706
3141                     ; 1351 				 ack   = FALSE;	
3143  0d0f 3f08          	clr	_ack
3144                     ; 1352 				 state = DELAY;
3146  0d11 35510000      	mov	_state,#81
3147                     ; 1353 				 stack = 40;
3149  0d15 35280001      	mov	_stack,#40
3150                     ; 1355 				 timerReset (1);
3152  0d19 a601          	ld	a,#1
3153  0d1b cd0000        	call	_timerReset
3155                     ; 1357 				 timerReset (3);
3157  0d1e a603          	ld	a,#3
3158  0d20 cd0000        	call	_timerReset
3160                     ; 1358 				 timerEnable(3, ENABLE);
3162  0d23 ae0301        	ldw	x,#769
3163  0d26 cd0000        	call	_timerEnable
3165                     ; 1360 				 GPIO_WriteLow (CH2);
3167  0d29 4b10          	push	#16
3168  0d2b ae500a        	ldw	x,#20490
3169  0d2e cd0000        	call	_GPIO_WriteLow
3171  0d31 84            	pop	a
3172                     ; 1361 				 GPIO_WriteHigh(CH3);
3174  0d32 4b04          	push	#4
3175  0d34 ae500a        	ldw	x,#20490
3176  0d37 cd0000        	call	_GPIO_WriteHigh
3178  0d3a 84            	pop	a
3179                     ; 1363 				 ioCommSetDir(OUTPUT);
3181  0d3b 4f            	clr	a
3182  0d3c cd0000        	call	_ioCommSetDir
3184                     ; 1365 				 GPIO_WriteHigh(COMM);
3186  0d3f 4b20          	push	#32
3187  0d41 ae5000        	ldw	x,#20480
3188  0d44 cd0000        	call	_GPIO_WriteHigh
3190  0d47 84            	pop	a
3191  0d48               L706:
3192                     ; 1369 			 if(timerGetOverflow(1)){
3194  0d48 a601          	ld	a,#1
3195  0d4a cd0000        	call	_timerGetOverflow
3197  0d4d 4d            	tnz	a
3198  0d4e 2603          	jrne	L451
3199  0d50 cc1e5a        	jp	L143
3200  0d53               L451:
3201                     ; 1371 				 timerReset(1);
3203  0d53 a601          	ld	a,#1
3204  0d55 cd0000        	call	_timerReset
3206                     ; 1373 				 *control = 22;
3208  0d58 1e01          	ldw	x,(OFST+1,sp)
3209  0d5a a616          	ld	a,#22
3210  0d5c f7            	ld	(x),a
3211                     ; 1374 					state   = FINISH;
3213  0d5d 35500000      	mov	_state,#80
3214  0d61 ac5a1e5a      	jpf	L143
3215  0d65               L321:
3216                     ; 1380 		 case 40:
3216                     ; 1381 		    
3216                     ; 1382 			 if(ack){
3218  0d65 3d08          	tnz	_ack
3219  0d67 2739          	jreq	L316
3220                     ; 1384 				 ack   = FALSE;
3222  0d69 3f08          	clr	_ack
3223                     ; 1385 				 state = DELAY;
3225  0d6b 35510000      	mov	_state,#81
3226                     ; 1386 				 stack = 44;
3228  0d6f 352c0001      	mov	_stack,#44
3229                     ; 1388 				 timerReset (1);
3231  0d73 a601          	ld	a,#1
3232  0d75 cd0000        	call	_timerReset
3234                     ; 1390 				 timerReset (3);
3236  0d78 a603          	ld	a,#3
3237  0d7a cd0000        	call	_timerReset
3239                     ; 1391 				 timerEnable(3, ENABLE);
3241  0d7d ae0301        	ldw	x,#769
3242  0d80 cd0000        	call	_timerEnable
3244                     ; 1393 				 GPIO_WriteLow (CH3);
3246  0d83 4b04          	push	#4
3247  0d85 ae500a        	ldw	x,#20490
3248  0d88 cd0000        	call	_GPIO_WriteLow
3250  0d8b 84            	pop	a
3251                     ; 1394 				 GPIO_WriteHigh(CH4);
3253  0d8c 4b20          	push	#32
3254  0d8e ae5014        	ldw	x,#20500
3255  0d91 cd0000        	call	_GPIO_WriteHigh
3257  0d94 84            	pop	a
3258                     ; 1396 				 ioCommSetDir(OUTPUT);
3260  0d95 4f            	clr	a
3261  0d96 cd0000        	call	_ioCommSetDir
3263                     ; 1398 				 GPIO_WriteHigh(COMM);
3265  0d99 4b20          	push	#32
3266  0d9b ae5000        	ldw	x,#20480
3267  0d9e cd0000        	call	_GPIO_WriteHigh
3269  0da1 84            	pop	a
3270  0da2               L316:
3271                     ; 1402 			 if(timerGetOverflow(1)){
3273  0da2 a601          	ld	a,#1
3274  0da4 cd0000        	call	_timerGetOverflow
3276  0da7 4d            	tnz	a
3277  0da8 2603          	jrne	L651
3278  0daa cc1e5a        	jp	L143
3279  0dad               L651:
3280                     ; 1404 				 state = DELAY;
3282  0dad 35510000      	mov	_state,#81
3283                     ; 1405 				 stack = 41;
3285  0db1 35290001      	mov	_stack,#41
3286                     ; 1407 				 timerReset (1);
3288  0db5 a601          	ld	a,#1
3289  0db7 cd0000        	call	_timerReset
3291                     ; 1409 				 timerReset (3);
3293  0dba a603          	ld	a,#3
3294  0dbc cd0000        	call	_timerReset
3296                     ; 1410 				 timerEnable(3, ENABLE);
3298  0dbf ae0301        	ldw	x,#769
3299  0dc2 cd0000        	call	_timerEnable
3301                     ; 1412 				 ioCommSetDir(OUTPUT);
3303  0dc5 4f            	clr	a
3304  0dc6 cd0000        	call	_ioCommSetDir
3306                     ; 1414 				 GPIO_WriteHigh(COMM);
3308  0dc9 4b20          	push	#32
3309  0dcb ae5000        	ldw	x,#20480
3310  0dce cd0000        	call	_GPIO_WriteHigh
3312  0dd1 84            	pop	a
3313  0dd2 ac5a1e5a      	jpf	L143
3314  0dd6               L521:
3315                     ; 1420      case 41:
3315                     ; 1421 		    
3315                     ; 1422 			 if(ack){
3317  0dd6 3d08          	tnz	_ack
3318  0dd8 2727          	jreq	L716
3319                     ; 1424 				 ack   = FALSE;
3321  0dda 3f08          	clr	_ack
3322                     ; 1425 				 state = DELAY;
3324  0ddc 35510000      	mov	_state,#81
3325                     ; 1426 				 stack = 42;
3327  0de0 352a0001      	mov	_stack,#42
3328                     ; 1428 				 timerReset (1);
3330  0de4 a601          	ld	a,#1
3331  0de6 cd0000        	call	_timerReset
3333                     ; 1430 				 timerReset (3);
3335  0de9 a603          	ld	a,#3
3336  0deb cd0000        	call	_timerReset
3338                     ; 1431 				 timerEnable(3, ENABLE);
3340  0dee ae0301        	ldw	x,#769
3341  0df1 cd0000        	call	_timerEnable
3343                     ; 1433 				 ioCommSetDir(OUTPUT);
3345  0df4 4f            	clr	a
3346  0df5 cd0000        	call	_ioCommSetDir
3348                     ; 1435 				 GPIO_WriteHigh(COMM);
3350  0df8 4b20          	push	#32
3351  0dfa ae5000        	ldw	x,#20480
3352  0dfd cd0000        	call	_GPIO_WriteHigh
3354  0e00 84            	pop	a
3355  0e01               L716:
3356                     ; 1439 			 if(timerGetOverflow(1)){
3358  0e01 a601          	ld	a,#1
3359  0e03 cd0000        	call	_timerGetOverflow
3361  0e06 4d            	tnz	a
3362  0e07 2603          	jrne	L061
3363  0e09 cc1e5a        	jp	L143
3364  0e0c               L061:
3365                     ; 1441 				 timerReset(1);
3367  0e0c a601          	ld	a,#1
3368  0e0e cd0000        	call	_timerReset
3370                     ; 1443 				 *control = 23;
3372  0e11 1e01          	ldw	x,(OFST+1,sp)
3373  0e13 a617          	ld	a,#23
3374  0e15 f7            	ld	(x),a
3375                     ; 1444 				  state   = FINISH;
3377  0e16 35500000      	mov	_state,#80
3378  0e1a ac5a1e5a      	jpf	L143
3379  0e1e               L721:
3380                     ; 1450      case 42:
3380                     ; 1451 		    
3380                     ; 1452 			 if(ack){
3382  0e1e 3d08          	tnz	_ack
3383  0e20 2727          	jreq	L326
3384                     ; 1454 				 ack   = FALSE;
3386  0e22 3f08          	clr	_ack
3387                     ; 1455 				 state = DELAY;
3389  0e24 35510000      	mov	_state,#81
3390                     ; 1456 				 stack = 43;
3392  0e28 352b0001      	mov	_stack,#43
3393                     ; 1458 				 timerReset (1);
3395  0e2c a601          	ld	a,#1
3396  0e2e cd0000        	call	_timerReset
3398                     ; 1460 				 timerReset (3);
3400  0e31 a603          	ld	a,#3
3401  0e33 cd0000        	call	_timerReset
3403                     ; 1461 				 timerEnable(3, ENABLE);
3405  0e36 ae0301        	ldw	x,#769
3406  0e39 cd0000        	call	_timerEnable
3408                     ; 1463 				 ioCommSetDir(OUTPUT);
3410  0e3c 4f            	clr	a
3411  0e3d cd0000        	call	_ioCommSetDir
3413                     ; 1465 				 GPIO_WriteHigh(COMM);
3415  0e40 4b20          	push	#32
3416  0e42 ae5000        	ldw	x,#20480
3417  0e45 cd0000        	call	_GPIO_WriteHigh
3419  0e48 84            	pop	a
3420  0e49               L326:
3421                     ; 1469 			 if(timerGetOverflow(1)){
3423  0e49 a601          	ld	a,#1
3424  0e4b cd0000        	call	_timerGetOverflow
3426  0e4e 4d            	tnz	a
3427  0e4f 2603          	jrne	L261
3428  0e51 cc1e5a        	jp	L143
3429  0e54               L261:
3430                     ; 1471 				 timerReset(1);
3432  0e54 a601          	ld	a,#1
3433  0e56 cd0000        	call	_timerReset
3435                     ; 1473 				 *control = 23;
3437  0e59 1e01          	ldw	x,(OFST+1,sp)
3438  0e5b a617          	ld	a,#23
3439  0e5d f7            	ld	(x),a
3440                     ; 1474 				  state   = FINISH;
3442  0e5e 35500000      	mov	_state,#80
3443  0e62 ac5a1e5a      	jpf	L143
3444  0e66               L131:
3445                     ; 1480      case 43:
3445                     ; 1481 		    
3445                     ; 1482 			 if(ack){
3447  0e66 3d08          	tnz	_ack
3448  0e68 2739          	jreq	L726
3449                     ; 1484 				 ack   = FALSE;
3451  0e6a 3f08          	clr	_ack
3452                     ; 1485 				 state = DELAY;
3454  0e6c 35510000      	mov	_state,#81
3455                     ; 1486 				 stack = 44;
3457  0e70 352c0001      	mov	_stack,#44
3458                     ; 1488 				 timerReset (1);
3460  0e74 a601          	ld	a,#1
3461  0e76 cd0000        	call	_timerReset
3463                     ; 1490 				 timerReset (3);
3465  0e79 a603          	ld	a,#3
3466  0e7b cd0000        	call	_timerReset
3468                     ; 1491 				 timerEnable(3, ENABLE);
3470  0e7e ae0301        	ldw	x,#769
3471  0e81 cd0000        	call	_timerEnable
3473                     ; 1493 				 GPIO_WriteLow (CH3);
3475  0e84 4b04          	push	#4
3476  0e86 ae500a        	ldw	x,#20490
3477  0e89 cd0000        	call	_GPIO_WriteLow
3479  0e8c 84            	pop	a
3480                     ; 1494 				 GPIO_WriteHigh(CH4);
3482  0e8d 4b20          	push	#32
3483  0e8f ae5014        	ldw	x,#20500
3484  0e92 cd0000        	call	_GPIO_WriteHigh
3486  0e95 84            	pop	a
3487                     ; 1496 				 ioCommSetDir(OUTPUT);
3489  0e96 4f            	clr	a
3490  0e97 cd0000        	call	_ioCommSetDir
3492                     ; 1498 				 GPIO_WriteHigh(COMM);
3494  0e9a 4b20          	push	#32
3495  0e9c ae5000        	ldw	x,#20480
3496  0e9f cd0000        	call	_GPIO_WriteHigh
3498  0ea2 84            	pop	a
3499  0ea3               L726:
3500                     ; 1502 			 if(timerGetOverflow(1)){
3502  0ea3 a601          	ld	a,#1
3503  0ea5 cd0000        	call	_timerGetOverflow
3505  0ea8 4d            	tnz	a
3506  0ea9 2603          	jrne	L461
3507  0eab cc1e5a        	jp	L143
3508  0eae               L461:
3509                     ; 1504 				 timerReset(1);
3511  0eae a601          	ld	a,#1
3512  0eb0 cd0000        	call	_timerReset
3514                     ; 1506 				 *control = 23;
3516  0eb3 1e01          	ldw	x,(OFST+1,sp)
3517  0eb5 a617          	ld	a,#23
3518  0eb7 f7            	ld	(x),a
3519                     ; 1507 				  state   = FINISH;
3521  0eb8 35500000      	mov	_state,#80
3522  0ebc ac5a1e5a      	jpf	L143
3523  0ec0               L331:
3524                     ; 1513 		 case 44:
3524                     ; 1514 		    
3524                     ; 1515 			 if(ack){
3526  0ec0 3d08          	tnz	_ack
3527  0ec2 276b          	jreq	L336
3528                     ; 1517 				 ack   = FALSE;
3530  0ec4 3f08          	clr	_ack
3531                     ; 1518 				 state = DELAY;
3533  0ec6 35510000      	mov	_state,#81
3534                     ; 1519 				 stack = 48; 
3536  0eca 35300001      	mov	_stack,#48
3537                     ; 1521 				 timerReset           (1);
3539  0ece a601          	ld	a,#1
3540  0ed0 cd0000        	call	_timerReset
3542                     ; 1522 				 timerSetOverflowValue(1, 400);
3544  0ed3 ae0190        	ldw	x,#400
3545  0ed6 89            	pushw	x
3546  0ed7 ae0000        	ldw	x,#0
3547  0eda 89            	pushw	x
3548  0edb a601          	ld	a,#1
3549  0edd cd0000        	call	_timerSetOverflowValue
3551  0ee0 5b04          	addw	sp,#4
3552                     ; 1524 				 timerReset           (3);
3554  0ee2 a603          	ld	a,#3
3555  0ee4 cd0000        	call	_timerReset
3557                     ; 1525 				 timerEnable          (3, ENABLE);
3559  0ee7 ae0301        	ldw	x,#769
3560  0eea cd0000        	call	_timerEnable
3562                     ; 1527 				 timerSetOverflowValue(4, 350);
3564  0eed ae015e        	ldw	x,#350
3565  0ef0 89            	pushw	x
3566  0ef1 ae0000        	ldw	x,#0
3567  0ef4 89            	pushw	x
3568  0ef5 a604          	ld	a,#4
3569  0ef7 cd0000        	call	_timerSetOverflowValue
3571  0efa 5b04          	addw	sp,#4
3572                     ; 1528 				 timerReset           (4);
3574  0efc a604          	ld	a,#4
3575  0efe cd0000        	call	_timerReset
3577                     ; 1529 				 timerEnable          (4, ENABLE);
3579  0f01 ae0401        	ldw	x,#1025
3580  0f04 cd0000        	call	_timerEnable
3582                     ; 1531          GPIO_WriteLow (CH4);
3584  0f07 4b20          	push	#32
3585  0f09 ae5014        	ldw	x,#20500
3586  0f0c cd0000        	call	_GPIO_WriteLow
3588  0f0f 84            	pop	a
3589                     ; 1532 				 GPIO_WriteLow (I_MOT);				 
3591  0f10 4b08          	push	#8
3592  0f12 ae5000        	ldw	x,#20480
3593  0f15 cd0000        	call	_GPIO_WriteLow
3595  0f18 84            	pop	a
3596                     ; 1533 				 GPIO_WriteHigh(CH1);
3598  0f19 4b40          	push	#64
3599  0f1b ae500a        	ldw	x,#20490
3600  0f1e cd0000        	call	_GPIO_WriteHigh
3602  0f21 84            	pop	a
3603                     ; 1535 				 ioCommSetDir(OUTPUT);
3605  0f22 4f            	clr	a
3606  0f23 cd0000        	call	_ioCommSetDir
3608                     ; 1537 				 GPIO_WriteHigh(COMM);
3610  0f26 4b20          	push	#32
3611  0f28 ae5000        	ldw	x,#20480
3612  0f2b cd0000        	call	_GPIO_WriteHigh
3614  0f2e 84            	pop	a
3615  0f2f               L336:
3616                     ; 1541 			 if(timerGetOverflow(1)){
3618  0f2f a601          	ld	a,#1
3619  0f31 cd0000        	call	_timerGetOverflow
3621  0f34 4d            	tnz	a
3622  0f35 2603          	jrne	L661
3623  0f37 cc1e5a        	jp	L143
3624  0f3a               L661:
3625                     ; 1543 				 state = DELAY;
3627  0f3a 35510000      	mov	_state,#81
3628                     ; 1544 				 stack = 45;
3630  0f3e 352d0001      	mov	_stack,#45
3631                     ; 1546 				 timerReset (1);
3633  0f42 a601          	ld	a,#1
3634  0f44 cd0000        	call	_timerReset
3636                     ; 1548 				 timerReset (3);
3638  0f47 a603          	ld	a,#3
3639  0f49 cd0000        	call	_timerReset
3641                     ; 1549 				 timerEnable(3, ENABLE);
3643  0f4c ae0301        	ldw	x,#769
3644  0f4f cd0000        	call	_timerEnable
3646                     ; 1551 				 ioCommSetDir(OUTPUT);
3648  0f52 4f            	clr	a
3649  0f53 cd0000        	call	_ioCommSetDir
3651                     ; 1553 				 GPIO_WriteHigh(COMM);
3653  0f56 4b20          	push	#32
3654  0f58 ae5000        	ldw	x,#20480
3655  0f5b cd0000        	call	_GPIO_WriteHigh
3657  0f5e 84            	pop	a
3658  0f5f ac5a1e5a      	jpf	L143
3659  0f63               L531:
3660                     ; 1559      case 45:
3660                     ; 1560 		    
3660                     ; 1561 			 if(ack){
3662  0f63 3d08          	tnz	_ack
3663  0f65 2727          	jreq	L736
3664                     ; 1563 				 ack   = FALSE;
3666  0f67 3f08          	clr	_ack
3667                     ; 1564 				 state = DELAY;
3669  0f69 35510000      	mov	_state,#81
3670                     ; 1565 				 stack = 46; 
3672  0f6d 352e0001      	mov	_stack,#46
3673                     ; 1567 				 timerReset           (1);
3675  0f71 a601          	ld	a,#1
3676  0f73 cd0000        	call	_timerReset
3678                     ; 1569 				 timerReset           (3);
3680  0f76 a603          	ld	a,#3
3681  0f78 cd0000        	call	_timerReset
3683                     ; 1570 				 timerEnable          (3, ENABLE);
3685  0f7b ae0301        	ldw	x,#769
3686  0f7e cd0000        	call	_timerEnable
3688                     ; 1572 				 ioCommSetDir(OUTPUT);
3690  0f81 4f            	clr	a
3691  0f82 cd0000        	call	_ioCommSetDir
3693                     ; 1574 				 GPIO_WriteHigh(COMM);
3695  0f85 4b20          	push	#32
3696  0f87 ae5000        	ldw	x,#20480
3697  0f8a cd0000        	call	_GPIO_WriteHigh
3699  0f8d 84            	pop	a
3700  0f8e               L736:
3701                     ; 1578 			 if(timerGetOverflow(1)){
3703  0f8e a601          	ld	a,#1
3704  0f90 cd0000        	call	_timerGetOverflow
3706  0f93 4d            	tnz	a
3707  0f94 2603          	jrne	L071
3708  0f96 cc1e5a        	jp	L143
3709  0f99               L071:
3710                     ; 1580 				 *control = 24;
3712  0f99 1e01          	ldw	x,(OFST+1,sp)
3713  0f9b a618          	ld	a,#24
3714  0f9d f7            	ld	(x),a
3715                     ; 1581 				  state   = FINISH;
3717  0f9e 35500000      	mov	_state,#80
3718  0fa2 ac5a1e5a      	jpf	L143
3719  0fa6               L731:
3720                     ; 1587      case 46:
3720                     ; 1588 		    
3720                     ; 1589 			 if(ack){
3722  0fa6 3d08          	tnz	_ack
3723  0fa8 2727          	jreq	L346
3724                     ; 1591 				 ack   = FALSE;
3726  0faa 3f08          	clr	_ack
3727                     ; 1592 				 state = DELAY;
3729  0fac 35510000      	mov	_state,#81
3730                     ; 1593 				 stack = 47; 
3732  0fb0 352f0001      	mov	_stack,#47
3733                     ; 1595 				 timerReset           (1);
3735  0fb4 a601          	ld	a,#1
3736  0fb6 cd0000        	call	_timerReset
3738                     ; 1597 				 timerReset           (3);
3740  0fb9 a603          	ld	a,#3
3741  0fbb cd0000        	call	_timerReset
3743                     ; 1598 				 timerEnable          (3, ENABLE);
3745  0fbe ae0301        	ldw	x,#769
3746  0fc1 cd0000        	call	_timerEnable
3748                     ; 1600 				 ioCommSetDir(OUTPUT);
3750  0fc4 4f            	clr	a
3751  0fc5 cd0000        	call	_ioCommSetDir
3753                     ; 1602 				 GPIO_WriteHigh(COMM);
3755  0fc8 4b20          	push	#32
3756  0fca ae5000        	ldw	x,#20480
3757  0fcd cd0000        	call	_GPIO_WriteHigh
3759  0fd0 84            	pop	a
3760  0fd1               L346:
3761                     ; 1606 			 if(timerGetOverflow(1)){
3763  0fd1 a601          	ld	a,#1
3764  0fd3 cd0000        	call	_timerGetOverflow
3766  0fd6 4d            	tnz	a
3767  0fd7 2603          	jrne	L271
3768  0fd9 cc1e5a        	jp	L143
3769  0fdc               L271:
3770                     ; 1608 				 *control = 24;
3772  0fdc 1e01          	ldw	x,(OFST+1,sp)
3773  0fde a618          	ld	a,#24
3774  0fe0 f7            	ld	(x),a
3775                     ; 1609 				  state   = FINISH;
3777  0fe1 35500000      	mov	_state,#80
3778  0fe5 ac5a1e5a      	jpf	L143
3779  0fe9               L141:
3780                     ; 1615 		 case 47:
3780                     ; 1616 		    
3780                     ; 1617 			 if(ack){
3782  0fe9 3d08          	tnz	_ack
3783  0feb 276b          	jreq	L746
3784                     ; 1619 				 ack   = FALSE;
3786  0fed 3f08          	clr	_ack
3787                     ; 1620 				 state = DELAY;
3789  0fef 35510000      	mov	_state,#81
3790                     ; 1621 				 stack = 48; 
3792  0ff3 35300001      	mov	_stack,#48
3793                     ; 1623 				 timerReset           (1);
3795  0ff7 a601          	ld	a,#1
3796  0ff9 cd0000        	call	_timerReset
3798                     ; 1624 				 timerSetOverflowValue(1, 400);
3800  0ffc ae0190        	ldw	x,#400
3801  0fff 89            	pushw	x
3802  1000 ae0000        	ldw	x,#0
3803  1003 89            	pushw	x
3804  1004 a601          	ld	a,#1
3805  1006 cd0000        	call	_timerSetOverflowValue
3807  1009 5b04          	addw	sp,#4
3808                     ; 1626 				 timerReset           (3);
3810  100b a603          	ld	a,#3
3811  100d cd0000        	call	_timerReset
3813                     ; 1627 				 timerEnable          (3, ENABLE);
3815  1010 ae0301        	ldw	x,#769
3816  1013 cd0000        	call	_timerEnable
3818                     ; 1629 				 timerSetOverflowValue(4, 350);
3820  1016 ae015e        	ldw	x,#350
3821  1019 89            	pushw	x
3822  101a ae0000        	ldw	x,#0
3823  101d 89            	pushw	x
3824  101e a604          	ld	a,#4
3825  1020 cd0000        	call	_timerSetOverflowValue
3827  1023 5b04          	addw	sp,#4
3828                     ; 1630 				 timerReset           (4);
3830  1025 a604          	ld	a,#4
3831  1027 cd0000        	call	_timerReset
3833                     ; 1631 				 timerEnable          (4, ENABLE);
3835  102a ae0401        	ldw	x,#1025
3836  102d cd0000        	call	_timerEnable
3838                     ; 1633          GPIO_WriteLow (CH4);
3840  1030 4b20          	push	#32
3841  1032 ae5014        	ldw	x,#20500
3842  1035 cd0000        	call	_GPIO_WriteLow
3844  1038 84            	pop	a
3845                     ; 1634 				 GPIO_WriteLow (I_MOT);				 
3847  1039 4b08          	push	#8
3848  103b ae5000        	ldw	x,#20480
3849  103e cd0000        	call	_GPIO_WriteLow
3851  1041 84            	pop	a
3852                     ; 1635 				 GPIO_WriteHigh(CH1);
3854  1042 4b40          	push	#64
3855  1044 ae500a        	ldw	x,#20490
3856  1047 cd0000        	call	_GPIO_WriteHigh
3858  104a 84            	pop	a
3859                     ; 1637 				 ioCommSetDir(OUTPUT);
3861  104b 4f            	clr	a
3862  104c cd0000        	call	_ioCommSetDir
3864                     ; 1639 				 GPIO_WriteHigh(COMM);
3866  104f 4b20          	push	#32
3867  1051 ae5000        	ldw	x,#20480
3868  1054 cd0000        	call	_GPIO_WriteHigh
3870  1057 84            	pop	a
3871  1058               L746:
3872                     ; 1643 			 if(timerGetOverflow(1)){
3874  1058 a601          	ld	a,#1
3875  105a cd0000        	call	_timerGetOverflow
3877  105d 4d            	tnz	a
3878  105e 2603          	jrne	L471
3879  1060 cc1e5a        	jp	L143
3880  1063               L471:
3881                     ; 1645 				 *control = 24;
3883  1063 1e01          	ldw	x,(OFST+1,sp)
3884  1065 a618          	ld	a,#24
3885  1067 f7            	ld	(x),a
3886                     ; 1646 				  state   = FINISH;
3888  1068 35500000      	mov	_state,#80
3889  106c ac5a1e5a      	jpf	L143
3890  1070               L341:
3891                     ; 1652 		 case 48:
3891                     ; 1653 		   
3891                     ; 1654 		   if(!timerGetOverflow(4)){
3893  1070 a604          	ld	a,#4
3894  1072 cd0000        	call	_timerGetOverflow
3896  1075 4d            	tnz	a
3897  1076 2604          	jrne	L356
3898                     ; 1656 				 ack = FALSE;
3900  1078 3f08          	clr	_ack
3901                     ; 1658 				 return;
3904  107a 85            	popw	x
3905  107b 81            	ret
3906  107c               L356:
3907                     ; 1662 			 if(ack){
3909  107c 3d08          	tnz	_ack
3910  107e 2744          	jreq	L556
3911                     ; 1664 				 ack   = FALSE;
3913  1080 3f08          	clr	_ack
3914                     ; 1665 				 state = DELAY;
3916  1082 35510000      	mov	_state,#81
3917                     ; 1666 				 stack = 52;	
3919  1086 35340001      	mov	_stack,#52
3920                     ; 1668 				 timerReset (1);
3922  108a a601          	ld	a,#1
3923  108c cd0000        	call	_timerReset
3925                     ; 1670 				 timerReset (3);
3927  108f a603          	ld	a,#3
3928  1091 cd0000        	call	_timerReset
3930                     ; 1671 				 timerEnable(3, ENABLE);
3932  1094 ae0301        	ldw	x,#769
3933  1097 cd0000        	call	_timerEnable
3935                     ; 1673 				 timerReset (4);
3937  109a a604          	ld	a,#4
3938  109c cd0000        	call	_timerReset
3940                     ; 1674 				 timerEnable(4, ENABLE);
3942  109f ae0401        	ldw	x,#1025
3943  10a2 cd0000        	call	_timerEnable
3945                     ; 1676          GPIO_WriteLow (CH1);				 
3947  10a5 4b40          	push	#64
3948  10a7 ae500a        	ldw	x,#20490
3949  10aa cd0000        	call	_GPIO_WriteLow
3951  10ad 84            	pop	a
3952                     ; 1677 				 GPIO_WriteHigh(CH2);
3954  10ae 4b10          	push	#16
3955  10b0 ae500a        	ldw	x,#20490
3956  10b3 cd0000        	call	_GPIO_WriteHigh
3958  10b6 84            	pop	a
3959                     ; 1679 				 ioCommSetDir(OUTPUT);
3961  10b7 4f            	clr	a
3962  10b8 cd0000        	call	_ioCommSetDir
3964                     ; 1681 				 GPIO_WriteHigh(COMM);
3966  10bb 4b20          	push	#32
3967  10bd ae5000        	ldw	x,#20480
3968  10c0 cd0000        	call	_GPIO_WriteHigh
3970  10c3 84            	pop	a
3971  10c4               L556:
3972                     ; 1685 			 if(timerGetOverflow(1)){
3974  10c4 a601          	ld	a,#1
3975  10c6 cd0000        	call	_timerGetOverflow
3977  10c9 4d            	tnz	a
3978  10ca 2603          	jrne	L671
3979  10cc cc1e5a        	jp	L143
3980  10cf               L671:
3981                     ; 1687 				 state = DELAY;
3983  10cf 35510000      	mov	_state,#81
3984                     ; 1688 				 stack = 49;
3986  10d3 35310001      	mov	_stack,#49
3987                     ; 1690 				 timerReset (1);
3989  10d7 a601          	ld	a,#1
3990  10d9 cd0000        	call	_timerReset
3992                     ; 1692 				 timerReset (3);
3994  10dc a603          	ld	a,#3
3995  10de cd0000        	call	_timerReset
3997                     ; 1693 				 timerEnable(3, ENABLE);
3999  10e1 ae0301        	ldw	x,#769
4000  10e4 cd0000        	call	_timerEnable
4002                     ; 1695 				 timerReset (4);
4004  10e7 a604          	ld	a,#4
4005  10e9 cd0000        	call	_timerReset
4007                     ; 1697 				 ioCommSetDir(OUTPUT);
4009  10ec 4f            	clr	a
4010  10ed cd0000        	call	_ioCommSetDir
4012                     ; 1699 				 GPIO_WriteHigh(COMM);
4014  10f0 4b20          	push	#32
4015  10f2 ae5000        	ldw	x,#20480
4016  10f5 cd0000        	call	_GPIO_WriteHigh
4018  10f8 84            	pop	a
4019  10f9 ac5a1e5a      	jpf	L143
4020  10fd               L541:
4021                     ; 1705 		 case 49:
4021                     ; 1706 		   
4021                     ; 1707 		   if(!timerGetOverflow(4)){
4023  10fd a604          	ld	a,#4
4024  10ff cd0000        	call	_timerGetOverflow
4026  1102 4d            	tnz	a
4027  1103 2604          	jrne	L166
4028                     ; 1709 				 ack = FALSE;
4030  1105 3f08          	clr	_ack
4031                     ; 1711 				 return;
4033  1107 205d          	jra	L41
4034  1109               L166:
4035                     ; 1715 			 if(ack){
4037  1109 3d08          	tnz	_ack
4038  110b 2732          	jreq	L366
4039                     ; 1717 				 ack   = FALSE;
4041  110d 3f08          	clr	_ack
4042                     ; 1718 				 state = DELAY;
4044  110f 35510000      	mov	_state,#81
4045                     ; 1719 				 stack = 50;	
4047  1113 35320001      	mov	_stack,#50
4048                     ; 1721 				 timerReset (1);
4050  1117 a601          	ld	a,#1
4051  1119 cd0000        	call	_timerReset
4053                     ; 1723 				 timerReset (3);
4055  111c a603          	ld	a,#3
4056  111e cd0000        	call	_timerReset
4058                     ; 1724 				 timerEnable(3, ENABLE);
4060  1121 ae0301        	ldw	x,#769
4061  1124 cd0000        	call	_timerEnable
4063                     ; 1726 				 timerReset (4);
4065  1127 a604          	ld	a,#4
4066  1129 cd0000        	call	_timerReset
4068                     ; 1727 				 timerEnable(4, ENABLE);
4070  112c ae0401        	ldw	x,#1025
4071  112f cd0000        	call	_timerEnable
4073                     ; 1729 				 ioCommSetDir(OUTPUT);
4075  1132 4f            	clr	a
4076  1133 cd0000        	call	_ioCommSetDir
4078                     ; 1731 				 GPIO_WriteHigh(COMM);
4080  1136 4b20          	push	#32
4081  1138 ae5000        	ldw	x,#20480
4082  113b cd0000        	call	_GPIO_WriteHigh
4084  113e 84            	pop	a
4085  113f               L366:
4086                     ; 1735 			 if(timerGetOverflow(1)){
4088  113f a601          	ld	a,#1
4089  1141 cd0000        	call	_timerGetOverflow
4091  1144 4d            	tnz	a
4092  1145 2603          	jrne	L002
4093  1147 cc1e5a        	jp	L143
4094  114a               L002:
4095                     ; 1737 				 timerReset(1);
4097  114a a601          	ld	a,#1
4098  114c cd0000        	call	_timerReset
4100                     ; 1739 				 *control = 25;
4102  114f 1e01          	ldw	x,(OFST+1,sp)
4103  1151 a619          	ld	a,#25
4104  1153 f7            	ld	(x),a
4105                     ; 1740 				  state   = FINISH;
4107  1154 35500000      	mov	_state,#80
4108  1158 ac5a1e5a      	jpf	L143
4109  115c               L741:
4110                     ; 1746 		 case 50:
4110                     ; 1747 		   
4110                     ; 1748 		   if(!timerGetOverflow(4)){
4112  115c a604          	ld	a,#4
4113  115e cd0000        	call	_timerGetOverflow
4115  1161 4d            	tnz	a
4116  1162 2604          	jrne	L766
4117                     ; 1750 				 ack = FALSE;
4119  1164 3f08          	clr	_ack
4120                     ; 1752 				 return;
4121  1166               L41:
4124  1166 85            	popw	x
4125  1167 81            	ret
4126  1168               L766:
4127                     ; 1756 			 if(ack){
4129  1168 3d08          	tnz	_ack
4130  116a 2732          	jreq	L176
4131                     ; 1758 				 ack   = FALSE;
4133  116c 3f08          	clr	_ack
4134                     ; 1759 				 state = DELAY;
4136  116e 35510000      	mov	_state,#81
4137                     ; 1760 				 stack = 51;	
4139  1172 35330001      	mov	_stack,#51
4140                     ; 1762 				 timerReset (1);
4142  1176 a601          	ld	a,#1
4143  1178 cd0000        	call	_timerReset
4145                     ; 1764 				 timerReset (3);
4147  117b a603          	ld	a,#3
4148  117d cd0000        	call	_timerReset
4150                     ; 1765 				 timerEnable(3, ENABLE);
4152  1180 ae0301        	ldw	x,#769
4153  1183 cd0000        	call	_timerEnable
4155                     ; 1767 				 timerReset (4);
4157  1186 a604          	ld	a,#4
4158  1188 cd0000        	call	_timerReset
4160                     ; 1768 				 timerEnable(4, ENABLE);
4162  118b ae0401        	ldw	x,#1025
4163  118e cd0000        	call	_timerEnable
4165                     ; 1770 				 ioCommSetDir(OUTPUT);
4167  1191 4f            	clr	a
4168  1192 cd0000        	call	_ioCommSetDir
4170                     ; 1772 				 GPIO_WriteHigh(COMM);
4172  1195 4b20          	push	#32
4173  1197 ae5000        	ldw	x,#20480
4174  119a cd0000        	call	_GPIO_WriteHigh
4176  119d 84            	pop	a
4177  119e               L176:
4178                     ; 1776 			 if(timerGetOverflow(1)){
4180  119e a601          	ld	a,#1
4181  11a0 cd0000        	call	_timerGetOverflow
4183  11a3 4d            	tnz	a
4184  11a4 2603          	jrne	L202
4185  11a6 cc1e5a        	jp	L143
4186  11a9               L202:
4187                     ; 1778 				 timerReset(1);
4189  11a9 a601          	ld	a,#1
4190  11ab cd0000        	call	_timerReset
4192                     ; 1780 				 *control = 25;
4194  11ae 1e01          	ldw	x,(OFST+1,sp)
4195  11b0 a619          	ld	a,#25
4196  11b2 f7            	ld	(x),a
4197                     ; 1781 				  state   = FINISH;
4199  11b3 35500000      	mov	_state,#80
4200  11b7 ac5a1e5a      	jpf	L143
4201  11bb               L151:
4202                     ; 1787 		 case 51:
4202                     ; 1788 		   
4202                     ; 1789 		   if(!timerGetOverflow(4)){
4204  11bb a604          	ld	a,#4
4205  11bd cd0000        	call	_timerGetOverflow
4207  11c0 4d            	tnz	a
4208  11c1 2604          	jrne	L576
4209                     ; 1791 				 ack = FALSE;
4211  11c3 3f08          	clr	_ack
4212                     ; 1793 				 return;
4214  11c5 209f          	jra	L41
4215  11c7               L576:
4216                     ; 1797 			 if(ack){
4218  11c7 3d08          	tnz	_ack
4219  11c9 2744          	jreq	L776
4220                     ; 1799 				 ack   = FALSE;
4222  11cb 3f08          	clr	_ack
4223                     ; 1800 				 state = DELAY;
4225  11cd 35510000      	mov	_state,#81
4226                     ; 1801 				 stack = 52;	
4228  11d1 35340001      	mov	_stack,#52
4229                     ; 1803 				 timerReset (1);
4231  11d5 a601          	ld	a,#1
4232  11d7 cd0000        	call	_timerReset
4234                     ; 1805 				 timerReset (3);
4236  11da a603          	ld	a,#3
4237  11dc cd0000        	call	_timerReset
4239                     ; 1806 				 timerEnable(3, ENABLE);
4241  11df ae0301        	ldw	x,#769
4242  11e2 cd0000        	call	_timerEnable
4244                     ; 1808 				 timerReset (4);
4246  11e5 a604          	ld	a,#4
4247  11e7 cd0000        	call	_timerReset
4249                     ; 1809 				 timerEnable(4, ENABLE);
4251  11ea ae0401        	ldw	x,#1025
4252  11ed cd0000        	call	_timerEnable
4254                     ; 1811 				 GPIO_WriteLow (CH1);				 
4256  11f0 4b40          	push	#64
4257  11f2 ae500a        	ldw	x,#20490
4258  11f5 cd0000        	call	_GPIO_WriteLow
4260  11f8 84            	pop	a
4261                     ; 1812 				 GPIO_WriteHigh(CH2);
4263  11f9 4b10          	push	#16
4264  11fb ae500a        	ldw	x,#20490
4265  11fe cd0000        	call	_GPIO_WriteHigh
4267  1201 84            	pop	a
4268                     ; 1814 				 ioCommSetDir(OUTPUT);
4270  1202 4f            	clr	a
4271  1203 cd0000        	call	_ioCommSetDir
4273                     ; 1816 				 GPIO_WriteHigh(COMM);
4275  1206 4b20          	push	#32
4276  1208 ae5000        	ldw	x,#20480
4277  120b cd0000        	call	_GPIO_WriteHigh
4279  120e 84            	pop	a
4280  120f               L776:
4281                     ; 1820 			 if(timerGetOverflow(1)){
4283  120f a601          	ld	a,#1
4284  1211 cd0000        	call	_timerGetOverflow
4286  1214 4d            	tnz	a
4287  1215 2603          	jrne	L402
4288  1217 cc1e5a        	jp	L143
4289  121a               L402:
4290                     ; 1822 				 timerReset(1);
4292  121a a601          	ld	a,#1
4293  121c cd0000        	call	_timerReset
4295                     ; 1824 				 *control = 25;
4297  121f 1e01          	ldw	x,(OFST+1,sp)
4298  1221 a619          	ld	a,#25
4299  1223 f7            	ld	(x),a
4300                     ; 1825 				  state   = FINISH;
4302  1224 35500000      	mov	_state,#80
4303  1228 ac5a1e5a      	jpf	L143
4304  122c               L351:
4305                     ; 1831 		 case 52:
4305                     ; 1832 		    
4305                     ; 1833 			 if(!timerGetOverflow(4)){
4307  122c a604          	ld	a,#4
4308  122e cd0000        	call	_timerGetOverflow
4310  1231 4d            	tnz	a
4311  1232 2604          	jrne	L307
4312                     ; 1835 				 ack = FALSE;
4314  1234 3f08          	clr	_ack
4315                     ; 1837 				 return;
4318  1236 85            	popw	x
4319  1237 81            	ret
4320  1238               L307:
4321                     ; 1841 			 if(ack){
4323  1238 3d08          	tnz	_ack
4324  123a 2744          	jreq	L507
4325                     ; 1843 				 ack   = FALSE;
4327  123c 3f08          	clr	_ack
4328                     ; 1844 				 state = DELAY;
4330  123e 35510000      	mov	_state,#81
4331                     ; 1845 				 stack = 56;	
4333  1242 35380001      	mov	_stack,#56
4334                     ; 1847 				 timerReset (1);
4336  1246 a601          	ld	a,#1
4337  1248 cd0000        	call	_timerReset
4339                     ; 1849 				 timerReset (3);
4341  124b a603          	ld	a,#3
4342  124d cd0000        	call	_timerReset
4344                     ; 1850 				 timerEnable(3, ENABLE);	
4346  1250 ae0301        	ldw	x,#769
4347  1253 cd0000        	call	_timerEnable
4349                     ; 1852 				 timerReset (4);
4351  1256 a604          	ld	a,#4
4352  1258 cd0000        	call	_timerReset
4354                     ; 1853 				 timerEnable(4, ENABLE);
4356  125b ae0401        	ldw	x,#1025
4357  125e cd0000        	call	_timerEnable
4359                     ; 1855          GPIO_WriteLow (CH2);				 
4361  1261 4b10          	push	#16
4362  1263 ae500a        	ldw	x,#20490
4363  1266 cd0000        	call	_GPIO_WriteLow
4365  1269 84            	pop	a
4366                     ; 1856 				 GPIO_WriteHigh(CH3);
4368  126a 4b04          	push	#4
4369  126c ae500a        	ldw	x,#20490
4370  126f cd0000        	call	_GPIO_WriteHigh
4372  1272 84            	pop	a
4373                     ; 1858 				 ioCommSetDir(OUTPUT);
4375  1273 4f            	clr	a
4376  1274 cd0000        	call	_ioCommSetDir
4378                     ; 1860 				 GPIO_WriteHigh(COMM);
4380  1277 4b20          	push	#32
4381  1279 ae5000        	ldw	x,#20480
4382  127c cd0000        	call	_GPIO_WriteHigh
4384  127f 84            	pop	a
4385  1280               L507:
4386                     ; 1864 			 if(timerGetOverflow(1)){
4388  1280 a601          	ld	a,#1
4389  1282 cd0000        	call	_timerGetOverflow
4391  1285 4d            	tnz	a
4392  1286 2603          	jrne	L602
4393  1288 cc1e5a        	jp	L143
4394  128b               L602:
4395                     ; 1866 				 state = DELAY;
4397  128b 35510000      	mov	_state,#81
4398                     ; 1867 				 stack = 53;
4400  128f 35350001      	mov	_stack,#53
4401                     ; 1869 				 timerReset (1);
4403  1293 a601          	ld	a,#1
4404  1295 cd0000        	call	_timerReset
4406                     ; 1871 				 timerReset (3);
4408  1298 a603          	ld	a,#3
4409  129a cd0000        	call	_timerReset
4411                     ; 1872 				 timerEnable(3, ENABLE);
4413  129d ae0301        	ldw	x,#769
4414  12a0 cd0000        	call	_timerEnable
4416                     ; 1874 				 timerReset (4);
4418  12a3 a604          	ld	a,#4
4419  12a5 cd0000        	call	_timerReset
4421                     ; 1876 				 ioCommSetDir(OUTPUT);
4423  12a8 4f            	clr	a
4424  12a9 cd0000        	call	_ioCommSetDir
4426                     ; 1878 				 GPIO_WriteHigh(COMM);
4428  12ac 4b20          	push	#32
4429  12ae ae5000        	ldw	x,#20480
4430  12b1 cd0000        	call	_GPIO_WriteHigh
4432  12b4 84            	pop	a
4433  12b5 ac5a1e5a      	jpf	L143
4434  12b9               L551:
4435                     ; 1884 		 case 53:
4435                     ; 1885 		    
4435                     ; 1886 			 if(!timerGetOverflow(4)){
4437  12b9 a604          	ld	a,#4
4438  12bb cd0000        	call	_timerGetOverflow
4440  12be 4d            	tnz	a
4441  12bf 2604          	jrne	L117
4442                     ; 1888 				 ack = FALSE;
4444  12c1 3f08          	clr	_ack
4445                     ; 1890 				 return;
4447  12c3 205d          	jra	L61
4448  12c5               L117:
4449                     ; 1894 			 if(ack){
4451  12c5 3d08          	tnz	_ack
4452  12c7 2732          	jreq	L317
4453                     ; 1896 				 ack   = FALSE;
4455  12c9 3f08          	clr	_ack
4456                     ; 1897 				 state = DELAY;
4458  12cb 35510000      	mov	_state,#81
4459                     ; 1898 				 stack = 54;	
4461  12cf 35360001      	mov	_stack,#54
4462                     ; 1900 				 timerReset (1);
4464  12d3 a601          	ld	a,#1
4465  12d5 cd0000        	call	_timerReset
4467                     ; 1902 				 timerReset (3);
4469  12d8 a603          	ld	a,#3
4470  12da cd0000        	call	_timerReset
4472                     ; 1903 				 timerEnable(3, ENABLE);	
4474  12dd ae0301        	ldw	x,#769
4475  12e0 cd0000        	call	_timerEnable
4477                     ; 1905 				 timerReset (4);
4479  12e3 a604          	ld	a,#4
4480  12e5 cd0000        	call	_timerReset
4482                     ; 1906 				 timerEnable(4, ENABLE);
4484  12e8 ae0401        	ldw	x,#1025
4485  12eb cd0000        	call	_timerEnable
4487                     ; 1908 				 ioCommSetDir(OUTPUT);
4489  12ee 4f            	clr	a
4490  12ef cd0000        	call	_ioCommSetDir
4492                     ; 1910 				 GPIO_WriteHigh(COMM);
4494  12f2 4b20          	push	#32
4495  12f4 ae5000        	ldw	x,#20480
4496  12f7 cd0000        	call	_GPIO_WriteHigh
4498  12fa 84            	pop	a
4499  12fb               L317:
4500                     ; 1914 			 if(timerGetOverflow(1)){
4502  12fb a601          	ld	a,#1
4503  12fd cd0000        	call	_timerGetOverflow
4505  1300 4d            	tnz	a
4506  1301 2603          	jrne	L012
4507  1303 cc1e5a        	jp	L143
4508  1306               L012:
4509                     ; 1916 				 timerReset(1);
4511  1306 a601          	ld	a,#1
4512  1308 cd0000        	call	_timerReset
4514                     ; 1918 				 *control = 26;
4516  130b 1e01          	ldw	x,(OFST+1,sp)
4517  130d a61a          	ld	a,#26
4518  130f f7            	ld	(x),a
4519                     ; 1919 				  state   = FINISH;
4521  1310 35500000      	mov	_state,#80
4522  1314 ac5a1e5a      	jpf	L143
4523  1318               L751:
4524                     ; 1925 		 case 54:
4524                     ; 1926 		    
4524                     ; 1927 			 if(!timerGetOverflow(4)){
4526  1318 a604          	ld	a,#4
4527  131a cd0000        	call	_timerGetOverflow
4529  131d 4d            	tnz	a
4530  131e 2604          	jrne	L717
4531                     ; 1929 				 ack = FALSE;
4533  1320 3f08          	clr	_ack
4534                     ; 1931 				 return;
4535  1322               L61:
4538  1322 85            	popw	x
4539  1323 81            	ret
4540  1324               L717:
4541                     ; 1935 			 if(ack){
4543  1324 3d08          	tnz	_ack
4544  1326 2732          	jreq	L127
4545                     ; 1937 				 ack   = FALSE;
4547  1328 3f08          	clr	_ack
4548                     ; 1938 				 state = DELAY;
4550  132a 35510000      	mov	_state,#81
4551                     ; 1939 				 stack = 55;	
4553  132e 35370001      	mov	_stack,#55
4554                     ; 1941 				 timerReset (1);
4556  1332 a601          	ld	a,#1
4557  1334 cd0000        	call	_timerReset
4559                     ; 1943 				 timerReset (3);
4561  1337 a603          	ld	a,#3
4562  1339 cd0000        	call	_timerReset
4564                     ; 1944 				 timerEnable(3, ENABLE);	
4566  133c ae0301        	ldw	x,#769
4567  133f cd0000        	call	_timerEnable
4569                     ; 1946 				 timerReset (4);
4571  1342 a604          	ld	a,#4
4572  1344 cd0000        	call	_timerReset
4574                     ; 1947 				 timerEnable(4, ENABLE);
4576  1347 ae0401        	ldw	x,#1025
4577  134a cd0000        	call	_timerEnable
4579                     ; 1949 				 ioCommSetDir(OUTPUT);
4581  134d 4f            	clr	a
4582  134e cd0000        	call	_ioCommSetDir
4584                     ; 1951 				 GPIO_WriteHigh(COMM);
4586  1351 4b20          	push	#32
4587  1353 ae5000        	ldw	x,#20480
4588  1356 cd0000        	call	_GPIO_WriteHigh
4590  1359 84            	pop	a
4591  135a               L127:
4592                     ; 1955 			 if(timerGetOverflow(1)){
4594  135a a601          	ld	a,#1
4595  135c cd0000        	call	_timerGetOverflow
4597  135f 4d            	tnz	a
4598  1360 2603          	jrne	L212
4599  1362 cc1e5a        	jp	L143
4600  1365               L212:
4601                     ; 1957 				 timerReset(1);
4603  1365 a601          	ld	a,#1
4604  1367 cd0000        	call	_timerReset
4606                     ; 1959 				 *control = 27;
4608  136a 1e01          	ldw	x,(OFST+1,sp)
4609  136c a61b          	ld	a,#27
4610  136e f7            	ld	(x),a
4611                     ; 1960 				  state   = FINISH;
4613  136f 35500000      	mov	_state,#80
4614  1373 ac5a1e5a      	jpf	L143
4615  1377               L161:
4616                     ; 1966 		 case 55:
4616                     ; 1967 		    
4616                     ; 1968 			 if(!timerGetOverflow(4)){
4618  1377 a604          	ld	a,#4
4619  1379 cd0000        	call	_timerGetOverflow
4621  137c 4d            	tnz	a
4622  137d 2604          	jrne	L527
4623                     ; 1970 				 ack = FALSE;
4625  137f 3f08          	clr	_ack
4626                     ; 1972 				 return;
4628  1381 209f          	jra	L61
4629  1383               L527:
4630                     ; 1976 			 if(ack){
4632  1383 3d08          	tnz	_ack
4633  1385 2744          	jreq	L727
4634                     ; 1978 				 ack   = FALSE;
4636  1387 3f08          	clr	_ack
4637                     ; 1979 				 state = DELAY;
4639  1389 35510000      	mov	_state,#81
4640                     ; 1980 				 stack = 56;	
4642  138d 35380001      	mov	_stack,#56
4643                     ; 1982 				 timerReset (1);
4645  1391 a601          	ld	a,#1
4646  1393 cd0000        	call	_timerReset
4648                     ; 1984 				 timerReset (3);
4650  1396 a603          	ld	a,#3
4651  1398 cd0000        	call	_timerReset
4653                     ; 1985 				 timerEnable(3, ENABLE);	
4655  139b ae0301        	ldw	x,#769
4656  139e cd0000        	call	_timerEnable
4658                     ; 1987 				 timerReset (4);
4660  13a1 a604          	ld	a,#4
4661  13a3 cd0000        	call	_timerReset
4663                     ; 1988 				 timerEnable(4, ENABLE);
4665  13a6 ae0401        	ldw	x,#1025
4666  13a9 cd0000        	call	_timerEnable
4668                     ; 1990 				 GPIO_WriteLow (CH2);				 
4670  13ac 4b10          	push	#16
4671  13ae ae500a        	ldw	x,#20490
4672  13b1 cd0000        	call	_GPIO_WriteLow
4674  13b4 84            	pop	a
4675                     ; 1991 				 GPIO_WriteHigh(CH3);
4677  13b5 4b04          	push	#4
4678  13b7 ae500a        	ldw	x,#20490
4679  13ba cd0000        	call	_GPIO_WriteHigh
4681  13bd 84            	pop	a
4682                     ; 1993 				 ioCommSetDir(OUTPUT);
4684  13be 4f            	clr	a
4685  13bf cd0000        	call	_ioCommSetDir
4687                     ; 1995 				 GPIO_WriteHigh(COMM);
4689  13c2 4b20          	push	#32
4690  13c4 ae5000        	ldw	x,#20480
4691  13c7 cd0000        	call	_GPIO_WriteHigh
4693  13ca 84            	pop	a
4694  13cb               L727:
4695                     ; 1999 			 if(timerGetOverflow(1)){
4697  13cb a601          	ld	a,#1
4698  13cd cd0000        	call	_timerGetOverflow
4700  13d0 4d            	tnz	a
4701  13d1 2603          	jrne	L412
4702  13d3 cc1e5a        	jp	L143
4703  13d6               L412:
4704                     ; 2001 				 timerReset(1);
4706  13d6 a601          	ld	a,#1
4707  13d8 cd0000        	call	_timerReset
4709                     ; 2003 				 *control = 26;
4711  13db 1e01          	ldw	x,(OFST+1,sp)
4712  13dd a61a          	ld	a,#26
4713  13df f7            	ld	(x),a
4714                     ; 2004 				  state   = FINISH;
4716  13e0 35500000      	mov	_state,#80
4717  13e4 ac5a1e5a      	jpf	L143
4718  13e8               L361:
4719                     ; 2010 		 case 56:
4719                     ; 2011 		    
4719                     ; 2012 			 if(!timerGetOverflow(4)){
4721  13e8 a604          	ld	a,#4
4722  13ea cd0000        	call	_timerGetOverflow
4724  13ed 4d            	tnz	a
4725  13ee 2604          	jrne	L337
4726                     ; 2014 				 ack = FALSE;
4728  13f0 3f08          	clr	_ack
4729                     ; 2016 				 return;
4732  13f2 85            	popw	x
4733  13f3 81            	ret
4734  13f4               L337:
4735                     ; 2020 			 if(ack){
4737  13f4 3d08          	tnz	_ack
4738  13f6 2744          	jreq	L537
4739                     ; 2022 				 ack   = FALSE;	
4741  13f8 3f08          	clr	_ack
4742                     ; 2023 				 state = DELAY;
4744  13fa 35510000      	mov	_state,#81
4745                     ; 2024 				 stack = 60;	
4747  13fe 353c0001      	mov	_stack,#60
4748                     ; 2026 				 timerReset (1);
4750  1402 a601          	ld	a,#1
4751  1404 cd0000        	call	_timerReset
4753                     ; 2028 				 timerReset (3);
4755  1407 a603          	ld	a,#3
4756  1409 cd0000        	call	_timerReset
4758                     ; 2029 				 timerEnable(3, ENABLE);
4760  140c ae0301        	ldw	x,#769
4761  140f cd0000        	call	_timerEnable
4763                     ; 2031          timerReset (4);
4765  1412 a604          	ld	a,#4
4766  1414 cd0000        	call	_timerReset
4768                     ; 2032 				 timerEnable(4, ENABLE);
4770  1417 ae0401        	ldw	x,#1025
4771  141a cd0000        	call	_timerEnable
4773                     ; 2034          GPIO_WriteLow (CH3);				 
4775  141d 4b04          	push	#4
4776  141f ae500a        	ldw	x,#20490
4777  1422 cd0000        	call	_GPIO_WriteLow
4779  1425 84            	pop	a
4780                     ; 2035 				 GPIO_WriteHigh(CH4);
4782  1426 4b20          	push	#32
4783  1428 ae5014        	ldw	x,#20500
4784  142b cd0000        	call	_GPIO_WriteHigh
4786  142e 84            	pop	a
4787                     ; 2037 				 ioCommSetDir(OUTPUT);
4789  142f 4f            	clr	a
4790  1430 cd0000        	call	_ioCommSetDir
4792                     ; 2039 				 GPIO_WriteHigh(COMM);
4794  1433 4b20          	push	#32
4795  1435 ae5000        	ldw	x,#20480
4796  1438 cd0000        	call	_GPIO_WriteHigh
4798  143b 84            	pop	a
4799  143c               L537:
4800                     ; 2043 			 if(timerGetOverflow(1)){
4802  143c a601          	ld	a,#1
4803  143e cd0000        	call	_timerGetOverflow
4805  1441 4d            	tnz	a
4806  1442 2603          	jrne	L612
4807  1444 cc1e5a        	jp	L143
4808  1447               L612:
4809                     ; 2045 				 state = DELAY;
4811  1447 35510000      	mov	_state,#81
4812                     ; 2046 				 stack = 57;
4814  144b 35390001      	mov	_stack,#57
4815                     ; 2048 				 timerReset (1);
4817  144f a601          	ld	a,#1
4818  1451 cd0000        	call	_timerReset
4820                     ; 2050 				 timerReset (3);
4822  1454 a603          	ld	a,#3
4823  1456 cd0000        	call	_timerReset
4825                     ; 2051 				 timerEnable(3, ENABLE);
4827  1459 ae0301        	ldw	x,#769
4828  145c cd0000        	call	_timerEnable
4830                     ; 2053 				 timerReset (4);
4832  145f a604          	ld	a,#4
4833  1461 cd0000        	call	_timerReset
4835                     ; 2055 				 ioCommSetDir(OUTPUT);
4837  1464 4f            	clr	a
4838  1465 cd0000        	call	_ioCommSetDir
4840                     ; 2057 				 GPIO_WriteHigh(COMM);
4842  1468 4b20          	push	#32
4843  146a ae5000        	ldw	x,#20480
4844  146d cd0000        	call	_GPIO_WriteHigh
4846  1470 84            	pop	a
4847  1471 ac5a1e5a      	jpf	L143
4848  1475               L561:
4849                     ; 2063      case 57:
4849                     ; 2064 		    
4849                     ; 2065 			 if(!timerGetOverflow(4)){
4851  1475 a604          	ld	a,#4
4852  1477 cd0000        	call	_timerGetOverflow
4854  147a 4d            	tnz	a
4855  147b 2604          	jrne	L147
4856                     ; 2067 				 ack = FALSE;
4858  147d 3f08          	clr	_ack
4859                     ; 2069 				 return;
4861  147f 205d          	jra	L02
4862  1481               L147:
4863                     ; 2073 			 if(ack){
4865  1481 3d08          	tnz	_ack
4866  1483 2732          	jreq	L347
4867                     ; 2075 				 ack   = FALSE;	
4869  1485 3f08          	clr	_ack
4870                     ; 2076 				 state = DELAY;
4872  1487 35510000      	mov	_state,#81
4873                     ; 2077 				 stack = 58;	
4875  148b 353a0001      	mov	_stack,#58
4876                     ; 2079 				 timerReset (1);
4878  148f a601          	ld	a,#1
4879  1491 cd0000        	call	_timerReset
4881                     ; 2081 				 timerReset (3);
4883  1494 a603          	ld	a,#3
4884  1496 cd0000        	call	_timerReset
4886                     ; 2082 				 timerEnable(3, ENABLE);
4888  1499 ae0301        	ldw	x,#769
4889  149c cd0000        	call	_timerEnable
4891                     ; 2084          timerReset (4);
4893  149f a604          	ld	a,#4
4894  14a1 cd0000        	call	_timerReset
4896                     ; 2085 				 timerEnable(4, ENABLE);
4898  14a4 ae0401        	ldw	x,#1025
4899  14a7 cd0000        	call	_timerEnable
4901                     ; 2087 				 ioCommSetDir(OUTPUT);
4903  14aa 4f            	clr	a
4904  14ab cd0000        	call	_ioCommSetDir
4906                     ; 2089 				 GPIO_WriteHigh(COMM);
4908  14ae 4b20          	push	#32
4909  14b0 ae5000        	ldw	x,#20480
4910  14b3 cd0000        	call	_GPIO_WriteHigh
4912  14b6 84            	pop	a
4913  14b7               L347:
4914                     ; 2093 			 if(timerGetOverflow(1)){
4916  14b7 a601          	ld	a,#1
4917  14b9 cd0000        	call	_timerGetOverflow
4919  14bc 4d            	tnz	a
4920  14bd 2603          	jrne	L022
4921  14bf cc1e5a        	jp	L143
4922  14c2               L022:
4923                     ; 2095 				 timerReset(1);
4925  14c2 a601          	ld	a,#1
4926  14c4 cd0000        	call	_timerReset
4928                     ; 2097 				 *control = 27;
4930  14c7 1e01          	ldw	x,(OFST+1,sp)
4931  14c9 a61b          	ld	a,#27
4932  14cb f7            	ld	(x),a
4933                     ; 2098 				  state   = FINISH;
4935  14cc 35500000      	mov	_state,#80
4936  14d0 ac5a1e5a      	jpf	L143
4937  14d4               L761:
4938                     ; 2104 	   case 58:
4938                     ; 2105 		    
4938                     ; 2106 			 if(!timerGetOverflow(4)){
4940  14d4 a604          	ld	a,#4
4941  14d6 cd0000        	call	_timerGetOverflow
4943  14d9 4d            	tnz	a
4944  14da 2604          	jrne	L747
4945                     ; 2108 				 ack = FALSE;
4947  14dc 3f08          	clr	_ack
4948                     ; 2110 				 return;
4949  14de               L02:
4952  14de 85            	popw	x
4953  14df 81            	ret
4954  14e0               L747:
4955                     ; 2114 			 if(ack){
4957  14e0 3d08          	tnz	_ack
4958  14e2 2732          	jreq	L157
4959                     ; 2116 				 ack   = FALSE;	
4961  14e4 3f08          	clr	_ack
4962                     ; 2117 				 state = DELAY;
4964  14e6 35510000      	mov	_state,#81
4965                     ; 2118 				 stack = 59;	
4967  14ea 353b0001      	mov	_stack,#59
4968                     ; 2120 				 timerReset (1);
4970  14ee a601          	ld	a,#1
4971  14f0 cd0000        	call	_timerReset
4973                     ; 2122 				 timerReset (3);
4975  14f3 a603          	ld	a,#3
4976  14f5 cd0000        	call	_timerReset
4978                     ; 2123 				 timerEnable(3, ENABLE);
4980  14f8 ae0301        	ldw	x,#769
4981  14fb cd0000        	call	_timerEnable
4983                     ; 2125          timerReset (4);
4985  14fe a604          	ld	a,#4
4986  1500 cd0000        	call	_timerReset
4988                     ; 2126 				 timerEnable(4, ENABLE);
4990  1503 ae0401        	ldw	x,#1025
4991  1506 cd0000        	call	_timerEnable
4993                     ; 2128 				 ioCommSetDir(OUTPUT);
4995  1509 4f            	clr	a
4996  150a cd0000        	call	_ioCommSetDir
4998                     ; 2130 				 GPIO_WriteHigh(COMM);
5000  150d 4b20          	push	#32
5001  150f ae5000        	ldw	x,#20480
5002  1512 cd0000        	call	_GPIO_WriteHigh
5004  1515 84            	pop	a
5005  1516               L157:
5006                     ; 2134 			 if(timerGetOverflow(1)){
5008  1516 a601          	ld	a,#1
5009  1518 cd0000        	call	_timerGetOverflow
5011  151b 4d            	tnz	a
5012  151c 2603          	jrne	L222
5013  151e cc1e5a        	jp	L143
5014  1521               L222:
5015                     ; 2136 				 timerReset(1);
5017  1521 a601          	ld	a,#1
5018  1523 cd0000        	call	_timerReset
5020                     ; 2138 				 *control = 27;
5022  1526 1e01          	ldw	x,(OFST+1,sp)
5023  1528 a61b          	ld	a,#27
5024  152a f7            	ld	(x),a
5025                     ; 2139 				  state   = FINISH;
5027  152b 35500000      	mov	_state,#80
5028  152f ac5a1e5a      	jpf	L143
5029  1533               L171:
5030                     ; 2145      case 59:
5030                     ; 2146 		    
5030                     ; 2147 			 if(!timerGetOverflow(4)){
5032  1533 a604          	ld	a,#4
5033  1535 cd0000        	call	_timerGetOverflow
5035  1538 4d            	tnz	a
5036  1539 2604          	jrne	L557
5037                     ; 2149 				 ack = FALSE;
5039  153b 3f08          	clr	_ack
5040                     ; 2151 				 return;
5042  153d 209f          	jra	L02
5043  153f               L557:
5044                     ; 2155 			 if(ack){
5046  153f 3d08          	tnz	_ack
5047  1541 2744          	jreq	L757
5048                     ; 2157 				 ack   = FALSE;	
5050  1543 3f08          	clr	_ack
5051                     ; 2158 				 state = DELAY;
5053  1545 35510000      	mov	_state,#81
5054                     ; 2159 				 stack = 60;	
5056  1549 353c0001      	mov	_stack,#60
5057                     ; 2161 				 timerReset (1);
5059  154d a601          	ld	a,#1
5060  154f cd0000        	call	_timerReset
5062                     ; 2163 				 timerReset (3);
5064  1552 a603          	ld	a,#3
5065  1554 cd0000        	call	_timerReset
5067                     ; 2164 				 timerEnable(3, ENABLE);
5069  1557 ae0301        	ldw	x,#769
5070  155a cd0000        	call	_timerEnable
5072                     ; 2166          timerReset (4);
5074  155d a604          	ld	a,#4
5075  155f cd0000        	call	_timerReset
5077                     ; 2167 				 timerEnable(4, ENABLE);
5079  1562 ae0401        	ldw	x,#1025
5080  1565 cd0000        	call	_timerEnable
5082                     ; 2169 				 GPIO_WriteLow (CH3);				 
5084  1568 4b04          	push	#4
5085  156a ae500a        	ldw	x,#20490
5086  156d cd0000        	call	_GPIO_WriteLow
5088  1570 84            	pop	a
5089                     ; 2170 				 GPIO_WriteHigh(CH4);
5091  1571 4b20          	push	#32
5092  1573 ae5014        	ldw	x,#20500
5093  1576 cd0000        	call	_GPIO_WriteHigh
5095  1579 84            	pop	a
5096                     ; 2172 				 ioCommSetDir(OUTPUT);
5098  157a 4f            	clr	a
5099  157b cd0000        	call	_ioCommSetDir
5101                     ; 2174 				 GPIO_WriteHigh(COMM);
5103  157e 4b20          	push	#32
5104  1580 ae5000        	ldw	x,#20480
5105  1583 cd0000        	call	_GPIO_WriteHigh
5107  1586 84            	pop	a
5108  1587               L757:
5109                     ; 2178 			 if(timerGetOverflow(1)){
5111  1587 a601          	ld	a,#1
5112  1589 cd0000        	call	_timerGetOverflow
5114  158c 4d            	tnz	a
5115  158d 2603          	jrne	L422
5116  158f cc1e5a        	jp	L143
5117  1592               L422:
5118                     ; 2180 				 timerReset(1);
5120  1592 a601          	ld	a,#1
5121  1594 cd0000        	call	_timerReset
5123                     ; 2182 				 *control = 27;
5125  1597 1e01          	ldw	x,(OFST+1,sp)
5126  1599 a61b          	ld	a,#27
5127  159b f7            	ld	(x),a
5128                     ; 2183 				  state   = FINISH;
5130  159c 35500000      	mov	_state,#80
5131  15a0 ac5a1e5a      	jpf	L143
5132  15a4               L371:
5133                     ; 2189   	 case 60:
5133                     ; 2190 		    
5133                     ; 2191 			 if(!timerGetOverflow(4)){
5135  15a4 a604          	ld	a,#4
5136  15a6 cd0000        	call	_timerGetOverflow
5138  15a9 4d            	tnz	a
5139  15aa 2604          	jrne	L367
5140                     ; 2193 				 ack = FALSE;
5142  15ac 3f08          	clr	_ack
5143                     ; 2195 				 return;
5146  15ae 85            	popw	x
5147  15af 81            	ret
5148  15b0               L367:
5149                     ; 2199 			 if(ack){
5151  15b0 3d08          	tnz	_ack
5152  15b2 2744          	jreq	L567
5153                     ; 2201 				 ack   = FALSE;	
5155  15b4 3f08          	clr	_ack
5156                     ; 2202 				 state = DELAY;
5158  15b6 35510000      	mov	_state,#81
5159                     ; 2203 				 stack = 64;	
5161  15ba 35400001      	mov	_stack,#64
5162                     ; 2205 				 timerReset (1);
5164  15be a601          	ld	a,#1
5165  15c0 cd0000        	call	_timerReset
5167                     ; 2207 				 timerReset (3);
5169  15c3 a603          	ld	a,#3
5170  15c5 cd0000        	call	_timerReset
5172                     ; 2208 				 timerEnable(3, ENABLE);
5174  15c8 ae0301        	ldw	x,#769
5175  15cb cd0000        	call	_timerEnable
5177                     ; 2210 				 timerReset (4);
5179  15ce a604          	ld	a,#4
5180  15d0 cd0000        	call	_timerReset
5182                     ; 2211 				 timerEnable(4, ENABLE);
5184  15d3 ae0401        	ldw	x,#1025
5185  15d6 cd0000        	call	_timerEnable
5187                     ; 2213          GPIO_WriteLow (CH4);
5189  15d9 4b20          	push	#32
5190  15db ae5014        	ldw	x,#20500
5191  15de cd0000        	call	_GPIO_WriteLow
5193  15e1 84            	pop	a
5194                     ; 2214 				 GPIO_WriteHigh(CH1);
5196  15e2 4b40          	push	#64
5197  15e4 ae500a        	ldw	x,#20490
5198  15e7 cd0000        	call	_GPIO_WriteHigh
5200  15ea 84            	pop	a
5201                     ; 2216 				 ioCommSetDir(OUTPUT);
5203  15eb 4f            	clr	a
5204  15ec cd0000        	call	_ioCommSetDir
5206                     ; 2218 				 GPIO_WriteHigh(COMM);
5208  15ef 4b20          	push	#32
5209  15f1 ae5000        	ldw	x,#20480
5210  15f4 cd0000        	call	_GPIO_WriteHigh
5212  15f7 84            	pop	a
5213  15f8               L567:
5214                     ; 2222 			 if(timerGetOverflow(1)){
5216  15f8 a601          	ld	a,#1
5217  15fa cd0000        	call	_timerGetOverflow
5219  15fd 4d            	tnz	a
5220  15fe 2603          	jrne	L622
5221  1600 cc1e5a        	jp	L143
5222  1603               L622:
5223                     ; 2224 				 state = DELAY;
5225  1603 35510000      	mov	_state,#81
5226                     ; 2225 				 stack = 61;
5228  1607 353d0001      	mov	_stack,#61
5229                     ; 2227 				 timerReset (1);
5231  160b a601          	ld	a,#1
5232  160d cd0000        	call	_timerReset
5234                     ; 2229 				 timerReset (3);
5236  1610 a603          	ld	a,#3
5237  1612 cd0000        	call	_timerReset
5239                     ; 2230 				 timerEnable(3, ENABLE);
5241  1615 ae0301        	ldw	x,#769
5242  1618 cd0000        	call	_timerEnable
5244                     ; 2232 				 timerReset (4);
5246  161b a604          	ld	a,#4
5247  161d cd0000        	call	_timerReset
5249                     ; 2234 				 ioCommSetDir(OUTPUT);
5251  1620 4f            	clr	a
5252  1621 cd0000        	call	_ioCommSetDir
5254                     ; 2236 				 GPIO_WriteHigh(COMM);
5256  1624 4b20          	push	#32
5257  1626 ae5000        	ldw	x,#20480
5258  1629 cd0000        	call	_GPIO_WriteHigh
5260  162c 84            	pop	a
5261  162d ac5a1e5a      	jpf	L143
5262  1631               L571:
5263                     ; 2242   	 case 61:
5263                     ; 2243 		    
5263                     ; 2244 			 if(!timerGetOverflow(4)){
5265  1631 a604          	ld	a,#4
5266  1633 cd0000        	call	_timerGetOverflow
5268  1636 4d            	tnz	a
5269  1637 2604          	jrne	L177
5270                     ; 2246 				 ack = FALSE;
5272  1639 3f08          	clr	_ack
5273                     ; 2248 				 return;
5275  163b 2058          	jra	L22
5276  163d               L177:
5277                     ; 2252 			 if(ack){
5279  163d 3d08          	tnz	_ack
5280  163f 2732          	jreq	L377
5281                     ; 2254 				 ack   = FALSE;	
5283  1641 3f08          	clr	_ack
5284                     ; 2255 				 state = DELAY;
5286  1643 35510000      	mov	_state,#81
5287                     ; 2256 				 stack = 62;	
5289  1647 353e0001      	mov	_stack,#62
5290                     ; 2258 				 timerReset (1);
5292  164b a601          	ld	a,#1
5293  164d cd0000        	call	_timerReset
5295                     ; 2260 				 timerReset (3);
5297  1650 a603          	ld	a,#3
5298  1652 cd0000        	call	_timerReset
5300                     ; 2261 				 timerEnable(3, ENABLE);
5302  1655 ae0301        	ldw	x,#769
5303  1658 cd0000        	call	_timerEnable
5305                     ; 2263 				 timerReset (4);
5307  165b a604          	ld	a,#4
5308  165d cd0000        	call	_timerReset
5310                     ; 2264 				 timerEnable(4, ENABLE);
5312  1660 ae0401        	ldw	x,#1025
5313  1663 cd0000        	call	_timerEnable
5315                     ; 2266 				 ioCommSetDir(OUTPUT);
5317  1666 4f            	clr	a
5318  1667 cd0000        	call	_ioCommSetDir
5320                     ; 2268 				 GPIO_WriteHigh(COMM);
5322  166a 4b20          	push	#32
5323  166c ae5000        	ldw	x,#20480
5324  166f cd0000        	call	_GPIO_WriteHigh
5326  1672 84            	pop	a
5327  1673               L377:
5328                     ; 2272 			 if(timerGetOverflow(1)){
5330  1673 a601          	ld	a,#1
5331  1675 cd0000        	call	_timerGetOverflow
5333  1678 4d            	tnz	a
5334  1679 2603          	jrne	L032
5335  167b cc1e5a        	jp	L143
5336  167e               L032:
5337                     ; 2274 				 *control = 28;
5339  167e 1e01          	ldw	x,(OFST+1,sp)
5340  1680 a61c          	ld	a,#28
5341  1682 f7            	ld	(x),a
5342                     ; 2275 				  state   = FINISH;
5344  1683 35500000      	mov	_state,#80
5345  1687 ac5a1e5a      	jpf	L143
5346  168b               L771:
5347                     ; 2281      case 62:
5347                     ; 2282 		    
5347                     ; 2283 			 if(!timerGetOverflow(4)){
5349  168b a604          	ld	a,#4
5350  168d cd0000        	call	_timerGetOverflow
5352  1690 4d            	tnz	a
5353  1691 2604          	jrne	L777
5354                     ; 2285 				 ack = FALSE;
5356  1693 3f08          	clr	_ack
5357                     ; 2287 				 return;
5358  1695               L22:
5361  1695 85            	popw	x
5362  1696 81            	ret
5363  1697               L777:
5364                     ; 2291 			 if(ack){
5366  1697 3d08          	tnz	_ack
5367  1699 2732          	jreq	L1001
5368                     ; 2293 				 ack   = FALSE;	
5370  169b 3f08          	clr	_ack
5371                     ; 2294 				 state = DELAY;
5373  169d 35510000      	mov	_state,#81
5374                     ; 2295 				 stack = 63;	
5376  16a1 353f0001      	mov	_stack,#63
5377                     ; 2297 				 timerReset (1);
5379  16a5 a601          	ld	a,#1
5380  16a7 cd0000        	call	_timerReset
5382                     ; 2299 				 timerReset (3);
5384  16aa a603          	ld	a,#3
5385  16ac cd0000        	call	_timerReset
5387                     ; 2300 				 timerEnable(3, ENABLE);
5389  16af ae0301        	ldw	x,#769
5390  16b2 cd0000        	call	_timerEnable
5392                     ; 2302 				 timerReset (4);
5394  16b5 a604          	ld	a,#4
5395  16b7 cd0000        	call	_timerReset
5397                     ; 2303 				 timerEnable(4, ENABLE);
5399  16ba ae0401        	ldw	x,#1025
5400  16bd cd0000        	call	_timerEnable
5402                     ; 2305 				 ioCommSetDir(OUTPUT);
5404  16c0 4f            	clr	a
5405  16c1 cd0000        	call	_ioCommSetDir
5407                     ; 2307 				 GPIO_WriteHigh(COMM);
5409  16c4 4b20          	push	#32
5410  16c6 ae5000        	ldw	x,#20480
5411  16c9 cd0000        	call	_GPIO_WriteHigh
5413  16cc 84            	pop	a
5414  16cd               L1001:
5415                     ; 2311 			 if(timerGetOverflow(1)){
5417  16cd a601          	ld	a,#1
5418  16cf cd0000        	call	_timerGetOverflow
5420  16d2 4d            	tnz	a
5421  16d3 2603          	jrne	L232
5422  16d5 cc1e5a        	jp	L143
5423  16d8               L232:
5424                     ; 2313 				 *control = 28;
5426  16d8 1e01          	ldw	x,(OFST+1,sp)
5427  16da a61c          	ld	a,#28
5428  16dc f7            	ld	(x),a
5429                     ; 2314 				  state   = FINISH;
5431  16dd 35500000      	mov	_state,#80
5432  16e1 ac5a1e5a      	jpf	L143
5433  16e5               L102:
5434                     ; 2320      case 63:
5434                     ; 2321 		    
5434                     ; 2322 			 if(!timerGetOverflow(4)){
5436  16e5 a604          	ld	a,#4
5437  16e7 cd0000        	call	_timerGetOverflow
5439  16ea 4d            	tnz	a
5440  16eb 2604          	jrne	L5001
5441                     ; 2324 				 ack = FALSE;
5443  16ed 3f08          	clr	_ack
5444                     ; 2326 				 return;
5446  16ef 20a4          	jra	L22
5447  16f1               L5001:
5448                     ; 2330 			 if(ack){
5450  16f1 3d08          	tnz	_ack
5451  16f3 2744          	jreq	L7001
5452                     ; 2332 				 ack   = FALSE;	
5454  16f5 3f08          	clr	_ack
5455                     ; 2333 				 state = DELAY;
5457  16f7 35510000      	mov	_state,#81
5458                     ; 2334 				 stack = 64;	
5460  16fb 35400001      	mov	_stack,#64
5461                     ; 2336 				 timerReset (1);
5463  16ff a601          	ld	a,#1
5464  1701 cd0000        	call	_timerReset
5466                     ; 2338 				 timerReset (3);
5468  1704 a603          	ld	a,#3
5469  1706 cd0000        	call	_timerReset
5471                     ; 2339 				 timerEnable(3, ENABLE);
5473  1709 ae0301        	ldw	x,#769
5474  170c cd0000        	call	_timerEnable
5476                     ; 2341 				 timerReset (4);
5478  170f a604          	ld	a,#4
5479  1711 cd0000        	call	_timerReset
5481                     ; 2342 				 timerEnable(4, ENABLE);
5483  1714 ae0401        	ldw	x,#1025
5484  1717 cd0000        	call	_timerEnable
5486                     ; 2344 				 GPIO_WriteLow (CH4);
5488  171a 4b20          	push	#32
5489  171c ae5014        	ldw	x,#20500
5490  171f cd0000        	call	_GPIO_WriteLow
5492  1722 84            	pop	a
5493                     ; 2345 				 GPIO_WriteHigh(CH1);
5495  1723 4b40          	push	#64
5496  1725 ae500a        	ldw	x,#20490
5497  1728 cd0000        	call	_GPIO_WriteHigh
5499  172b 84            	pop	a
5500                     ; 2347 				 ioCommSetDir(OUTPUT);
5502  172c 4f            	clr	a
5503  172d cd0000        	call	_ioCommSetDir
5505                     ; 2349 				 GPIO_WriteHigh(COMM);
5507  1730 4b20          	push	#32
5508  1732 ae5000        	ldw	x,#20480
5509  1735 cd0000        	call	_GPIO_WriteHigh
5511  1738 84            	pop	a
5512  1739               L7001:
5513                     ; 2353 			 if(timerGetOverflow(1)){
5515  1739 a601          	ld	a,#1
5516  173b cd0000        	call	_timerGetOverflow
5518  173e 4d            	tnz	a
5519  173f 2603          	jrne	L432
5520  1741 cc1e5a        	jp	L143
5521  1744               L432:
5522                     ; 2355 				 *control = 28;
5524  1744 1e01          	ldw	x,(OFST+1,sp)
5525  1746 a61c          	ld	a,#28
5526  1748 f7            	ld	(x),a
5527                     ; 2356 				  state   = FINISH;
5529  1749 35500000      	mov	_state,#80
5530  174d ac5a1e5a      	jpf	L143
5531  1751               L302:
5532                     ; 2362   	 case 64:
5532                     ; 2363 		   
5532                     ; 2364 		   if(!timerGetOverflow(4)){
5534  1751 a604          	ld	a,#4
5535  1753 cd0000        	call	_timerGetOverflow
5537  1756 4d            	tnz	a
5538  1757 2604          	jrne	L3101
5539                     ; 2366 				 ack = FALSE;
5541  1759 3f08          	clr	_ack
5542                     ; 2368 				 return;
5545  175b 85            	popw	x
5546  175c 81            	ret
5547  175d               L3101:
5548                     ; 2372 			 if(ack){
5550  175d 3d08          	tnz	_ack
5551  175f 2744          	jreq	L5101
5552                     ; 2374 				 ack   = FALSE;
5554  1761 3f08          	clr	_ack
5555                     ; 2375 				 state = DELAY;
5557  1763 35510000      	mov	_state,#81
5558                     ; 2376 				 stack = 68; 
5560  1767 35440001      	mov	_stack,#68
5561                     ; 2378 				 timerReset (1);
5563  176b a601          	ld	a,#1
5564  176d cd0000        	call	_timerReset
5566                     ; 2380 				 timerReset (3);
5568  1770 a603          	ld	a,#3
5569  1772 cd0000        	call	_timerReset
5571                     ; 2381 				 timerEnable(3, ENABLE);
5573  1775 ae0301        	ldw	x,#769
5574  1778 cd0000        	call	_timerEnable
5576                     ; 2383 				 timerReset (4);
5578  177b a604          	ld	a,#4
5579  177d cd0000        	call	_timerReset
5581                     ; 2384 				 timerEnable(4, ENABLE);
5583  1780 ae0401        	ldw	x,#1025
5584  1783 cd0000        	call	_timerEnable
5586                     ; 2386          GPIO_WriteLow (CH1);				 
5588  1786 4b40          	push	#64
5589  1788 ae500a        	ldw	x,#20490
5590  178b cd0000        	call	_GPIO_WriteLow
5592  178e 84            	pop	a
5593                     ; 2387 				 GPIO_WriteHigh(CH2);
5595  178f 4b10          	push	#16
5596  1791 ae500a        	ldw	x,#20490
5597  1794 cd0000        	call	_GPIO_WriteHigh
5599  1797 84            	pop	a
5600                     ; 2389 				 ioCommSetDir(OUTPUT);
5602  1798 4f            	clr	a
5603  1799 cd0000        	call	_ioCommSetDir
5605                     ; 2391 				 GPIO_WriteHigh(COMM);
5607  179c 4b20          	push	#32
5608  179e ae5000        	ldw	x,#20480
5609  17a1 cd0000        	call	_GPIO_WriteHigh
5611  17a4 84            	pop	a
5612  17a5               L5101:
5613                     ; 2395 			 if(timerGetOverflow(1)){
5615  17a5 a601          	ld	a,#1
5616  17a7 cd0000        	call	_timerGetOverflow
5618  17aa 4d            	tnz	a
5619  17ab 2603          	jrne	L632
5620  17ad cc1e5a        	jp	L143
5621  17b0               L632:
5622                     ; 2397 				 state = DELAY;
5624  17b0 35510000      	mov	_state,#81
5625                     ; 2398 				 stack = 65;
5627  17b4 35410001      	mov	_stack,#65
5628                     ; 2400 				 timerReset (1);
5630  17b8 a601          	ld	a,#1
5631  17ba cd0000        	call	_timerReset
5633                     ; 2402 				 timerReset (3);
5635  17bd a603          	ld	a,#3
5636  17bf cd0000        	call	_timerReset
5638                     ; 2403 				 timerEnable(3, ENABLE);
5640  17c2 ae0301        	ldw	x,#769
5641  17c5 cd0000        	call	_timerEnable
5643                     ; 2405 				 timerReset (4);
5645  17c8 a604          	ld	a,#4
5646  17ca cd0000        	call	_timerReset
5648                     ; 2407 				 ioCommSetDir(OUTPUT);
5650  17cd 4f            	clr	a
5651  17ce cd0000        	call	_ioCommSetDir
5653                     ; 2409 				 GPIO_WriteHigh(COMM);
5655  17d1 4b20          	push	#32
5656  17d3 ae5000        	ldw	x,#20480
5657  17d6 cd0000        	call	_GPIO_WriteHigh
5659  17d9 84            	pop	a
5660  17da ac5a1e5a      	jpf	L143
5661  17de               L502:
5662                     ; 2415      case 65:
5662                     ; 2416 		   
5662                     ; 2417 		   if(!timerGetOverflow(4)){
5664  17de a604          	ld	a,#4
5665  17e0 cd0000        	call	_timerGetOverflow
5667  17e3 4d            	tnz	a
5668  17e4 2604          	jrne	L1201
5669                     ; 2419 				 ack = FALSE;
5671  17e6 3f08          	clr	_ack
5672                     ; 2421 				 return;
5674  17e8 2058          	jra	L42
5675  17ea               L1201:
5676                     ; 2425 			 if(ack){
5678  17ea 3d08          	tnz	_ack
5679  17ec 2732          	jreq	L3201
5680                     ; 2427 				 ack   = FALSE;
5682  17ee 3f08          	clr	_ack
5683                     ; 2428 				 state = DELAY;
5685  17f0 35510000      	mov	_state,#81
5686                     ; 2429 				 stack = 66; 
5688  17f4 35420001      	mov	_stack,#66
5689                     ; 2431 				 timerReset (1);
5691  17f8 a601          	ld	a,#1
5692  17fa cd0000        	call	_timerReset
5694                     ; 2433 				 timerReset (3);
5696  17fd a603          	ld	a,#3
5697  17ff cd0000        	call	_timerReset
5699                     ; 2434 				 timerEnable(3, ENABLE);
5701  1802 ae0301        	ldw	x,#769
5702  1805 cd0000        	call	_timerEnable
5704                     ; 2436 				 timerReset (4);
5706  1808 a604          	ld	a,#4
5707  180a cd0000        	call	_timerReset
5709                     ; 2437 				 timerEnable(4, ENABLE);
5711  180d ae0401        	ldw	x,#1025
5712  1810 cd0000        	call	_timerEnable
5714                     ; 2439 				 ioCommSetDir(OUTPUT);
5716  1813 4f            	clr	a
5717  1814 cd0000        	call	_ioCommSetDir
5719                     ; 2441 				 GPIO_WriteHigh(COMM);
5721  1817 4b20          	push	#32
5722  1819 ae5000        	ldw	x,#20480
5723  181c cd0000        	call	_GPIO_WriteHigh
5725  181f 84            	pop	a
5726  1820               L3201:
5727                     ; 2445 			 if(timerGetOverflow(1)){
5729  1820 a601          	ld	a,#1
5730  1822 cd0000        	call	_timerGetOverflow
5732  1825 4d            	tnz	a
5733  1826 2603          	jrne	L042
5734  1828 cc1e5a        	jp	L143
5735  182b               L042:
5736                     ; 2447 				 *control = 25;
5738  182b 1e01          	ldw	x,(OFST+1,sp)
5739  182d a619          	ld	a,#25
5740  182f f7            	ld	(x),a
5741                     ; 2448 				  state   = FINISH;
5743  1830 35500000      	mov	_state,#80
5744  1834 ac5a1e5a      	jpf	L143
5745  1838               L702:
5746                     ; 2454      case 66:
5746                     ; 2455 		   
5746                     ; 2456 		   if(!timerGetOverflow(4)){
5748  1838 a604          	ld	a,#4
5749  183a cd0000        	call	_timerGetOverflow
5751  183d 4d            	tnz	a
5752  183e 2604          	jrne	L7201
5753                     ; 2458 				 ack = FALSE;
5755  1840 3f08          	clr	_ack
5756                     ; 2460 				 return;
5757  1842               L42:
5760  1842 85            	popw	x
5761  1843 81            	ret
5762  1844               L7201:
5763                     ; 2464 			 if(ack){
5765  1844 3d08          	tnz	_ack
5766  1846 2732          	jreq	L1301
5767                     ; 2466 				 ack   = FALSE;
5769  1848 3f08          	clr	_ack
5770                     ; 2467 				 state = DELAY;
5772  184a 35510000      	mov	_state,#81
5773                     ; 2468 				 stack = 67; 
5775  184e 35430001      	mov	_stack,#67
5776                     ; 2470 				 timerReset (1);
5778  1852 a601          	ld	a,#1
5779  1854 cd0000        	call	_timerReset
5781                     ; 2472 				 timerReset (3);
5783  1857 a603          	ld	a,#3
5784  1859 cd0000        	call	_timerReset
5786                     ; 2473 				 timerEnable(3, ENABLE);
5788  185c ae0301        	ldw	x,#769
5789  185f cd0000        	call	_timerEnable
5791                     ; 2475 				 timerReset (4);
5793  1862 a604          	ld	a,#4
5794  1864 cd0000        	call	_timerReset
5796                     ; 2476 				 timerEnable(4, ENABLE);
5798  1867 ae0401        	ldw	x,#1025
5799  186a cd0000        	call	_timerEnable
5801                     ; 2478 				 ioCommSetDir(OUTPUT);
5803  186d 4f            	clr	a
5804  186e cd0000        	call	_ioCommSetDir
5806                     ; 2480 				 GPIO_WriteHigh(COMM);
5808  1871 4b20          	push	#32
5809  1873 ae5000        	ldw	x,#20480
5810  1876 cd0000        	call	_GPIO_WriteHigh
5812  1879 84            	pop	a
5813  187a               L1301:
5814                     ; 2484 			 if(timerGetOverflow(1)){
5816  187a a601          	ld	a,#1
5817  187c cd0000        	call	_timerGetOverflow
5819  187f 4d            	tnz	a
5820  1880 2603          	jrne	L242
5821  1882 cc1e5a        	jp	L143
5822  1885               L242:
5823                     ; 2486 				 *control = 25;
5825  1885 1e01          	ldw	x,(OFST+1,sp)
5826  1887 a619          	ld	a,#25
5827  1889 f7            	ld	(x),a
5828                     ; 2487 				  state   = FINISH;
5830  188a 35500000      	mov	_state,#80
5831  188e ac5a1e5a      	jpf	L143
5832  1892               L112:
5833                     ; 2493 case 67:
5833                     ; 2494 		   
5833                     ; 2495 		   if(!timerGetOverflow(4)){
5835  1892 a604          	ld	a,#4
5836  1894 cd0000        	call	_timerGetOverflow
5838  1897 4d            	tnz	a
5839  1898 2604          	jrne	L5301
5840                     ; 2497 				 ack = FALSE;
5842  189a 3f08          	clr	_ack
5843                     ; 2499 				 return;
5845  189c 20a4          	jra	L42
5846  189e               L5301:
5847                     ; 2503 			 if(ack){
5849  189e 3d08          	tnz	_ack
5850  18a0 2744          	jreq	L7301
5851                     ; 2505 				 ack   = FALSE;
5853  18a2 3f08          	clr	_ack
5854                     ; 2506 				 state = DELAY;
5856  18a4 35510000      	mov	_state,#81
5857                     ; 2507 				 stack = 68; 
5859  18a8 35440001      	mov	_stack,#68
5860                     ; 2509 				 timerReset (1);
5862  18ac a601          	ld	a,#1
5863  18ae cd0000        	call	_timerReset
5865                     ; 2511 				 timerReset (3);
5867  18b1 a603          	ld	a,#3
5868  18b3 cd0000        	call	_timerReset
5870                     ; 2512 				 timerEnable(3, ENABLE);
5872  18b6 ae0301        	ldw	x,#769
5873  18b9 cd0000        	call	_timerEnable
5875                     ; 2514 				 timerReset (4);
5877  18bc a604          	ld	a,#4
5878  18be cd0000        	call	_timerReset
5880                     ; 2515 				 timerEnable(4, ENABLE);
5882  18c1 ae0401        	ldw	x,#1025
5883  18c4 cd0000        	call	_timerEnable
5885                     ; 2517          GPIO_WriteLow (CH1);				 
5887  18c7 4b40          	push	#64
5888  18c9 ae500a        	ldw	x,#20490
5889  18cc cd0000        	call	_GPIO_WriteLow
5891  18cf 84            	pop	a
5892                     ; 2518 				 GPIO_WriteHigh(CH2);
5894  18d0 4b10          	push	#16
5895  18d2 ae500a        	ldw	x,#20490
5896  18d5 cd0000        	call	_GPIO_WriteHigh
5898  18d8 84            	pop	a
5899                     ; 2520 				 ioCommSetDir(OUTPUT);
5901  18d9 4f            	clr	a
5902  18da cd0000        	call	_ioCommSetDir
5904                     ; 2522 				 GPIO_WriteHigh(COMM);
5906  18dd 4b20          	push	#32
5907  18df ae5000        	ldw	x,#20480
5908  18e2 cd0000        	call	_GPIO_WriteHigh
5910  18e5 84            	pop	a
5911  18e6               L7301:
5912                     ; 2526 			 if(timerGetOverflow(1)){
5914  18e6 a601          	ld	a,#1
5915  18e8 cd0000        	call	_timerGetOverflow
5917  18eb 4d            	tnz	a
5918  18ec 2603          	jrne	L442
5919  18ee cc1e5a        	jp	L143
5920  18f1               L442:
5921                     ; 2528 				 *control = 25;
5923  18f1 1e01          	ldw	x,(OFST+1,sp)
5924  18f3 a619          	ld	a,#25
5925  18f5 f7            	ld	(x),a
5926                     ; 2529 				  state   = FINISH;
5928  18f6 35500000      	mov	_state,#80
5929  18fa ac5a1e5a      	jpf	L143
5930  18fe               L312:
5931                     ; 2535 		 case 68:
5931                     ; 2536 		   
5931                     ; 2537 		   if(!timerGetOverflow(4)){
5933  18fe a604          	ld	a,#4
5934  1900 cd0000        	call	_timerGetOverflow
5936  1903 4d            	tnz	a
5937  1904 2604          	jrne	L3401
5938                     ; 2539 				 ack = FALSE;
5940  1906 3f08          	clr	_ack
5941                     ; 2541 				 return;
5944  1908 85            	popw	x
5945  1909 81            	ret
5946  190a               L3401:
5947                     ; 2545 			 if(ack){
5949  190a 3d08          	tnz	_ack
5950  190c 2744          	jreq	L5401
5951                     ; 2547 				 ack   = FALSE;
5953  190e 3f08          	clr	_ack
5954                     ; 2548 				 state = DELAY;
5956  1910 35510000      	mov	_state,#81
5957                     ; 2549 				 stack = 72; 
5959  1914 35480001      	mov	_stack,#72
5960                     ; 2551 				 timerReset (1);
5962  1918 a601          	ld	a,#1
5963  191a cd0000        	call	_timerReset
5965                     ; 2553 				 timerReset (3);
5967  191d a603          	ld	a,#3
5968  191f cd0000        	call	_timerReset
5970                     ; 2554 				 timerEnable(3, ENABLE);
5972  1922 ae0301        	ldw	x,#769
5973  1925 cd0000        	call	_timerEnable
5975                     ; 2556 				 timerReset (4);
5977  1928 a604          	ld	a,#4
5978  192a cd0000        	call	_timerReset
5980                     ; 2557 				 timerEnable(4, ENABLE);
5982  192d ae0401        	ldw	x,#1025
5983  1930 cd0000        	call	_timerEnable
5985                     ; 2559          GPIO_WriteLow (CH2);				 
5987  1933 4b10          	push	#16
5988  1935 ae500a        	ldw	x,#20490
5989  1938 cd0000        	call	_GPIO_WriteLow
5991  193b 84            	pop	a
5992                     ; 2560 				 GPIO_WriteHigh(CH3);
5994  193c 4b04          	push	#4
5995  193e ae500a        	ldw	x,#20490
5996  1941 cd0000        	call	_GPIO_WriteHigh
5998  1944 84            	pop	a
5999                     ; 2562 				 ioCommSetDir(OUTPUT);
6001  1945 4f            	clr	a
6002  1946 cd0000        	call	_ioCommSetDir
6004                     ; 2564 				 GPIO_WriteHigh(COMM);
6006  1949 4b20          	push	#32
6007  194b ae5000        	ldw	x,#20480
6008  194e cd0000        	call	_GPIO_WriteHigh
6010  1951 84            	pop	a
6011  1952               L5401:
6012                     ; 2568 			 if(timerGetOverflow(1)){
6014  1952 a601          	ld	a,#1
6015  1954 cd0000        	call	_timerGetOverflow
6017  1957 4d            	tnz	a
6018  1958 2603          	jrne	L642
6019  195a cc1e5a        	jp	L143
6020  195d               L642:
6021                     ; 2570 				 state = DELAY;
6023  195d 35510000      	mov	_state,#81
6024                     ; 2571 				 stack = 69;
6026  1961 35450001      	mov	_stack,#69
6027                     ; 2573 				 timerReset (1);
6029  1965 a601          	ld	a,#1
6030  1967 cd0000        	call	_timerReset
6032                     ; 2575 				 timerReset (3);
6034  196a a603          	ld	a,#3
6035  196c cd0000        	call	_timerReset
6037                     ; 2576 				 timerEnable(3, ENABLE);
6039  196f ae0301        	ldw	x,#769
6040  1972 cd0000        	call	_timerEnable
6042                     ; 2578 				 timerReset (4);
6044  1975 a604          	ld	a,#4
6045  1977 cd0000        	call	_timerReset
6047                     ; 2580 				 ioCommSetDir(OUTPUT);
6049  197a 4f            	clr	a
6050  197b cd0000        	call	_ioCommSetDir
6052                     ; 2582 				 GPIO_WriteHigh(COMM);
6054  197e 4b20          	push	#32
6055  1980 ae5000        	ldw	x,#20480
6056  1983 cd0000        	call	_GPIO_WriteHigh
6058  1986 84            	pop	a
6059  1987 ac5a1e5a      	jpf	L143
6060  198b               L512:
6061                     ; 2588      case 69:
6061                     ; 2589 		   
6061                     ; 2590 		   if(!timerGetOverflow(4)){
6063  198b a604          	ld	a,#4
6064  198d cd0000        	call	_timerGetOverflow
6066  1990 4d            	tnz	a
6067  1991 2604          	jrne	L1501
6068                     ; 2592 				 ack = FALSE;
6070  1993 3f08          	clr	_ack
6071                     ; 2594 				 return;
6073  1995 2058          	jra	L62
6074  1997               L1501:
6075                     ; 2598 			 if(ack){
6077  1997 3d08          	tnz	_ack
6078  1999 2732          	jreq	L3501
6079                     ; 2600 				 ack   = FALSE;
6081  199b 3f08          	clr	_ack
6082                     ; 2601 				 state = DELAY;
6084  199d 35510000      	mov	_state,#81
6085                     ; 2602 				 stack = 70; 
6087  19a1 35460001      	mov	_stack,#70
6088                     ; 2604 				 timerReset (1);
6090  19a5 a601          	ld	a,#1
6091  19a7 cd0000        	call	_timerReset
6093                     ; 2606 				 timerReset (3);
6095  19aa a603          	ld	a,#3
6096  19ac cd0000        	call	_timerReset
6098                     ; 2607 				 timerEnable(3, ENABLE);
6100  19af ae0301        	ldw	x,#769
6101  19b2 cd0000        	call	_timerEnable
6103                     ; 2609 				 timerReset (4);
6105  19b5 a604          	ld	a,#4
6106  19b7 cd0000        	call	_timerReset
6108                     ; 2610 				 timerEnable(4, ENABLE);
6110  19ba ae0401        	ldw	x,#1025
6111  19bd cd0000        	call	_timerEnable
6113                     ; 2612 				 ioCommSetDir(OUTPUT);
6115  19c0 4f            	clr	a
6116  19c1 cd0000        	call	_ioCommSetDir
6118                     ; 2614 				 GPIO_WriteHigh(COMM);
6120  19c4 4b20          	push	#32
6121  19c6 ae5000        	ldw	x,#20480
6122  19c9 cd0000        	call	_GPIO_WriteHigh
6124  19cc 84            	pop	a
6125  19cd               L3501:
6126                     ; 2618 			 if(timerGetOverflow(1)){
6128  19cd a601          	ld	a,#1
6129  19cf cd0000        	call	_timerGetOverflow
6131  19d2 4d            	tnz	a
6132  19d3 2603          	jrne	L052
6133  19d5 cc1e5a        	jp	L143
6134  19d8               L052:
6135                     ; 2620 				 *control = 26;
6137  19d8 1e01          	ldw	x,(OFST+1,sp)
6138  19da a61a          	ld	a,#26
6139  19dc f7            	ld	(x),a
6140                     ; 2621 					state   = FINISH;
6142  19dd 35500000      	mov	_state,#80
6143  19e1 ac5a1e5a      	jpf	L143
6144  19e5               L712:
6145                     ; 2627      case 70:
6145                     ; 2628 		   
6145                     ; 2629 		   if(!timerGetOverflow(4)){
6147  19e5 a604          	ld	a,#4
6148  19e7 cd0000        	call	_timerGetOverflow
6150  19ea 4d            	tnz	a
6151  19eb 2604          	jrne	L7501
6152                     ; 2631 				 ack = FALSE;
6154  19ed 3f08          	clr	_ack
6155                     ; 2633 				 return;
6156  19ef               L62:
6159  19ef 85            	popw	x
6160  19f0 81            	ret
6161  19f1               L7501:
6162                     ; 2637 			 if(ack){
6164  19f1 3d08          	tnz	_ack
6165  19f3 2732          	jreq	L1601
6166                     ; 2639 				 ack   = FALSE;
6168  19f5 3f08          	clr	_ack
6169                     ; 2640 				 state = DELAY;
6171  19f7 35510000      	mov	_state,#81
6172                     ; 2641 				 stack = 71; 
6174  19fb 35470001      	mov	_stack,#71
6175                     ; 2643 				 timerReset (1);
6177  19ff a601          	ld	a,#1
6178  1a01 cd0000        	call	_timerReset
6180                     ; 2645 				 timerReset (3);
6182  1a04 a603          	ld	a,#3
6183  1a06 cd0000        	call	_timerReset
6185                     ; 2646 				 timerEnable(3, ENABLE);
6187  1a09 ae0301        	ldw	x,#769
6188  1a0c cd0000        	call	_timerEnable
6190                     ; 2648 				 timerReset (4);
6192  1a0f a604          	ld	a,#4
6193  1a11 cd0000        	call	_timerReset
6195                     ; 2649 				 timerEnable(4, ENABLE);
6197  1a14 ae0401        	ldw	x,#1025
6198  1a17 cd0000        	call	_timerEnable
6200                     ; 2651 				 ioCommSetDir(OUTPUT);
6202  1a1a 4f            	clr	a
6203  1a1b cd0000        	call	_ioCommSetDir
6205                     ; 2653 				 GPIO_WriteHigh(COMM);
6207  1a1e 4b20          	push	#32
6208  1a20 ae5000        	ldw	x,#20480
6209  1a23 cd0000        	call	_GPIO_WriteHigh
6211  1a26 84            	pop	a
6212  1a27               L1601:
6213                     ; 2657 			 if(timerGetOverflow(1)){
6215  1a27 a601          	ld	a,#1
6216  1a29 cd0000        	call	_timerGetOverflow
6218  1a2c 4d            	tnz	a
6219  1a2d 2603          	jrne	L252
6220  1a2f cc1e5a        	jp	L143
6221  1a32               L252:
6222                     ; 2659 				 *control = 26;
6224  1a32 1e01          	ldw	x,(OFST+1,sp)
6225  1a34 a61a          	ld	a,#26
6226  1a36 f7            	ld	(x),a
6227                     ; 2660 					state   = FINISH;
6229  1a37 35500000      	mov	_state,#80
6230  1a3b ac5a1e5a      	jpf	L143
6231  1a3f               L122:
6232                     ; 2666    case 71:
6232                     ; 2667 		   
6232                     ; 2668 		   if(!timerGetOverflow(4)){
6234  1a3f a604          	ld	a,#4
6235  1a41 cd0000        	call	_timerGetOverflow
6237  1a44 4d            	tnz	a
6238  1a45 2604          	jrne	L5601
6239                     ; 2670 				 ack = FALSE;
6241  1a47 3f08          	clr	_ack
6242                     ; 2672 				 return;
6244  1a49 20a4          	jra	L62
6245  1a4b               L5601:
6246                     ; 2676 			 if(ack){
6248  1a4b 3d08          	tnz	_ack
6249  1a4d 2744          	jreq	L7601
6250                     ; 2678 				 ack   = FALSE;
6252  1a4f 3f08          	clr	_ack
6253                     ; 2679 				 state = DELAY;
6255  1a51 35510000      	mov	_state,#81
6256                     ; 2680 				 stack = 72; 
6258  1a55 35480001      	mov	_stack,#72
6259                     ; 2682 				 timerReset (1);
6261  1a59 a601          	ld	a,#1
6262  1a5b cd0000        	call	_timerReset
6264                     ; 2684 				 timerReset (3);
6266  1a5e a603          	ld	a,#3
6267  1a60 cd0000        	call	_timerReset
6269                     ; 2685 				 timerEnable(3, ENABLE);
6271  1a63 ae0301        	ldw	x,#769
6272  1a66 cd0000        	call	_timerEnable
6274                     ; 2687 				 timerReset (4);
6276  1a69 a604          	ld	a,#4
6277  1a6b cd0000        	call	_timerReset
6279                     ; 2688 				 timerEnable(4, ENABLE);
6281  1a6e ae0401        	ldw	x,#1025
6282  1a71 cd0000        	call	_timerEnable
6284                     ; 2690 				 GPIO_WriteLow (CH2);				 
6286  1a74 4b10          	push	#16
6287  1a76 ae500a        	ldw	x,#20490
6288  1a79 cd0000        	call	_GPIO_WriteLow
6290  1a7c 84            	pop	a
6291                     ; 2691 				 GPIO_WriteHigh(CH3);
6293  1a7d 4b04          	push	#4
6294  1a7f ae500a        	ldw	x,#20490
6295  1a82 cd0000        	call	_GPIO_WriteHigh
6297  1a85 84            	pop	a
6298                     ; 2693 				 ioCommSetDir(OUTPUT);
6300  1a86 4f            	clr	a
6301  1a87 cd0000        	call	_ioCommSetDir
6303                     ; 2695 				 GPIO_WriteHigh(COMM);
6305  1a8a 4b20          	push	#32
6306  1a8c ae5000        	ldw	x,#20480
6307  1a8f cd0000        	call	_GPIO_WriteHigh
6309  1a92 84            	pop	a
6310  1a93               L7601:
6311                     ; 2699 			 if(timerGetOverflow(1)){
6313  1a93 a601          	ld	a,#1
6314  1a95 cd0000        	call	_timerGetOverflow
6316  1a98 4d            	tnz	a
6317  1a99 2603          	jrne	L452
6318  1a9b cc1e5a        	jp	L143
6319  1a9e               L452:
6320                     ; 2701 				 *control = 26;
6322  1a9e 1e01          	ldw	x,(OFST+1,sp)
6323  1aa0 a61a          	ld	a,#26
6324  1aa2 f7            	ld	(x),a
6325                     ; 2702 					state   = FINISH;
6327  1aa3 35500000      	mov	_state,#80
6328  1aa7 ac5a1e5a      	jpf	L143
6329  1aab               L322:
6330                     ; 2708 		 case 72:
6330                     ; 2709 		    
6330                     ; 2710 			 if(!timerGetOverflow(4)){
6332  1aab a604          	ld	a,#4
6333  1aad cd0000        	call	_timerGetOverflow
6335  1ab0 4d            	tnz	a
6336  1ab1 2604          	jrne	L3701
6337                     ; 2712 				 ack = FALSE;
6339  1ab3 3f08          	clr	_ack
6340                     ; 2714 				 return;
6343  1ab5 85            	popw	x
6344  1ab6 81            	ret
6345  1ab7               L3701:
6346                     ; 2718 			 if(ack){
6348  1ab7 3d08          	tnz	_ack
6349  1ab9 2744          	jreq	L5701
6350                     ; 2720 				 ack   = FALSE;
6352  1abb 3f08          	clr	_ack
6353                     ; 2721 				 state = DELAY;
6355  1abd 35510000      	mov	_state,#81
6356                     ; 2722 				 stack = 76; 
6358  1ac1 354c0001      	mov	_stack,#76
6359                     ; 2724 				 timerReset (1);
6361  1ac5 a601          	ld	a,#1
6362  1ac7 cd0000        	call	_timerReset
6364                     ; 2726 				 timerReset (3);
6366  1aca a603          	ld	a,#3
6367  1acc cd0000        	call	_timerReset
6369                     ; 2727 				 timerEnable(3, ENABLE);
6371  1acf ae0301        	ldw	x,#769
6372  1ad2 cd0000        	call	_timerEnable
6374                     ; 2729 				 timerReset (4);
6376  1ad5 a604          	ld	a,#4
6377  1ad7 cd0000        	call	_timerReset
6379                     ; 2730 				 timerEnable(4, ENABLE);
6381  1ada ae0401        	ldw	x,#1025
6382  1add cd0000        	call	_timerEnable
6384                     ; 2732          GPIO_WriteLow (CH3);				 
6386  1ae0 4b04          	push	#4
6387  1ae2 ae500a        	ldw	x,#20490
6388  1ae5 cd0000        	call	_GPIO_WriteLow
6390  1ae8 84            	pop	a
6391                     ; 2733 				 GPIO_WriteHigh(CH4);
6393  1ae9 4b20          	push	#32
6394  1aeb ae5014        	ldw	x,#20500
6395  1aee cd0000        	call	_GPIO_WriteHigh
6397  1af1 84            	pop	a
6398                     ; 2735 				 ioCommSetDir(OUTPUT);
6400  1af2 4f            	clr	a
6401  1af3 cd0000        	call	_ioCommSetDir
6403                     ; 2737 				 GPIO_WriteHigh(COMM);
6405  1af6 4b20          	push	#32
6406  1af8 ae5000        	ldw	x,#20480
6407  1afb cd0000        	call	_GPIO_WriteHigh
6409  1afe 84            	pop	a
6410  1aff               L5701:
6411                     ; 2741 			 if(timerGetOverflow(1)){
6413  1aff a601          	ld	a,#1
6414  1b01 cd0000        	call	_timerGetOverflow
6416  1b04 4d            	tnz	a
6417  1b05 2603          	jrne	L652
6418  1b07 cc1e5a        	jp	L143
6419  1b0a               L652:
6420                     ; 2743 				 state = DELAY;
6422  1b0a 35510000      	mov	_state,#81
6423                     ; 2744 				 stack = 73;
6425  1b0e 35490001      	mov	_stack,#73
6426                     ; 2746 				 timerReset (1);
6428  1b12 a601          	ld	a,#1
6429  1b14 cd0000        	call	_timerReset
6431                     ; 2748 				 timerReset (3);
6433  1b17 a603          	ld	a,#3
6434  1b19 cd0000        	call	_timerReset
6436                     ; 2749 				 timerEnable(3, ENABLE);
6438  1b1c ae0301        	ldw	x,#769
6439  1b1f cd0000        	call	_timerEnable
6441                     ; 2751 				 timerReset (4);
6443  1b22 a604          	ld	a,#4
6444  1b24 cd0000        	call	_timerReset
6446                     ; 2753 				 ioCommSetDir(OUTPUT);
6448  1b27 4f            	clr	a
6449  1b28 cd0000        	call	_ioCommSetDir
6451                     ; 2755 				 GPIO_WriteHigh(COMM);
6453  1b2b 4b20          	push	#32
6454  1b2d ae5000        	ldw	x,#20480
6455  1b30 cd0000        	call	_GPIO_WriteHigh
6457  1b33 84            	pop	a
6458  1b34 ac5a1e5a      	jpf	L143
6459  1b38               L522:
6460                     ; 2761      case 73:
6460                     ; 2762 		    
6460                     ; 2763 			 if(!timerGetOverflow(4)){
6462  1b38 a604          	ld	a,#4
6463  1b3a cd0000        	call	_timerGetOverflow
6465  1b3d 4d            	tnz	a
6466  1b3e 2604          	jrne	L1011
6467                     ; 2765 				 ack = FALSE;
6469  1b40 3f08          	clr	_ack
6470                     ; 2767 				 return;
6472  1b42 2058          	jra	L03
6473  1b44               L1011:
6474                     ; 2771 			 if(ack){
6476  1b44 3d08          	tnz	_ack
6477  1b46 2732          	jreq	L3011
6478                     ; 2773 				 ack   = FALSE;
6480  1b48 3f08          	clr	_ack
6481                     ; 2774 				 state = DELAY;
6483  1b4a 35510000      	mov	_state,#81
6484                     ; 2775 				 stack = 74; 
6486  1b4e 354a0001      	mov	_stack,#74
6487                     ; 2777 				 timerReset (1);
6489  1b52 a601          	ld	a,#1
6490  1b54 cd0000        	call	_timerReset
6492                     ; 2779 				 timerReset (3);
6494  1b57 a603          	ld	a,#3
6495  1b59 cd0000        	call	_timerReset
6497                     ; 2780 				 timerEnable(3, ENABLE);
6499  1b5c ae0301        	ldw	x,#769
6500  1b5f cd0000        	call	_timerEnable
6502                     ; 2782 				 timerReset (4);
6504  1b62 a604          	ld	a,#4
6505  1b64 cd0000        	call	_timerReset
6507                     ; 2783 				 timerEnable(4, ENABLE);
6509  1b67 ae0401        	ldw	x,#1025
6510  1b6a cd0000        	call	_timerEnable
6512                     ; 2785 				 ioCommSetDir(OUTPUT);
6514  1b6d 4f            	clr	a
6515  1b6e cd0000        	call	_ioCommSetDir
6517                     ; 2787 				 GPIO_WriteHigh(COMM);
6519  1b71 4b20          	push	#32
6520  1b73 ae5000        	ldw	x,#20480
6521  1b76 cd0000        	call	_GPIO_WriteHigh
6523  1b79 84            	pop	a
6524  1b7a               L3011:
6525                     ; 2791 			 if(timerGetOverflow(1)){
6527  1b7a a601          	ld	a,#1
6528  1b7c cd0000        	call	_timerGetOverflow
6530  1b7f 4d            	tnz	a
6531  1b80 2603          	jrne	L062
6532  1b82 cc1e5a        	jp	L143
6533  1b85               L062:
6534                     ; 2793 				 *control = 27;
6536  1b85 1e01          	ldw	x,(OFST+1,sp)
6537  1b87 a61b          	ld	a,#27
6538  1b89 f7            	ld	(x),a
6539                     ; 2794 				  state   = FINISH;
6541  1b8a 35500000      	mov	_state,#80
6542  1b8e ac5a1e5a      	jpf	L143
6543  1b92               L722:
6544                     ; 2800      case 74:
6544                     ; 2801 		    
6544                     ; 2802 			 if(!timerGetOverflow(4)){
6546  1b92 a604          	ld	a,#4
6547  1b94 cd0000        	call	_timerGetOverflow
6549  1b97 4d            	tnz	a
6550  1b98 2604          	jrne	L7011
6551                     ; 2804 				 ack = FALSE;
6553  1b9a 3f08          	clr	_ack
6554                     ; 2806 				 return;
6555  1b9c               L03:
6558  1b9c 85            	popw	x
6559  1b9d 81            	ret
6560  1b9e               L7011:
6561                     ; 2810 			 if(ack){
6563  1b9e 3d08          	tnz	_ack
6564  1ba0 2732          	jreq	L1111
6565                     ; 2812 				 ack   = FALSE;
6567  1ba2 3f08          	clr	_ack
6568                     ; 2813 				 state = DELAY;
6570  1ba4 35510000      	mov	_state,#81
6571                     ; 2814 				 stack = 75; 
6573  1ba8 354b0001      	mov	_stack,#75
6574                     ; 2816 				 timerReset (1);
6576  1bac a601          	ld	a,#1
6577  1bae cd0000        	call	_timerReset
6579                     ; 2818 				 timerReset (3);
6581  1bb1 a603          	ld	a,#3
6582  1bb3 cd0000        	call	_timerReset
6584                     ; 2819 				 timerEnable(3, ENABLE);
6586  1bb6 ae0301        	ldw	x,#769
6587  1bb9 cd0000        	call	_timerEnable
6589                     ; 2821 				 timerReset (4);
6591  1bbc a604          	ld	a,#4
6592  1bbe cd0000        	call	_timerReset
6594                     ; 2822 				 timerEnable(4, ENABLE);
6596  1bc1 ae0401        	ldw	x,#1025
6597  1bc4 cd0000        	call	_timerEnable
6599                     ; 2824 				 ioCommSetDir(OUTPUT);
6601  1bc7 4f            	clr	a
6602  1bc8 cd0000        	call	_ioCommSetDir
6604                     ; 2826 				 GPIO_WriteHigh(COMM);
6606  1bcb 4b20          	push	#32
6607  1bcd ae5000        	ldw	x,#20480
6608  1bd0 cd0000        	call	_GPIO_WriteHigh
6610  1bd3 84            	pop	a
6611  1bd4               L1111:
6612                     ; 2830 			 if(timerGetOverflow(1)){
6614  1bd4 a601          	ld	a,#1
6615  1bd6 cd0000        	call	_timerGetOverflow
6617  1bd9 4d            	tnz	a
6618  1bda 2603          	jrne	L262
6619  1bdc cc1e5a        	jp	L143
6620  1bdf               L262:
6621                     ; 2832 				 *control = 27;
6623  1bdf 1e01          	ldw	x,(OFST+1,sp)
6624  1be1 a61b          	ld	a,#27
6625  1be3 f7            	ld	(x),a
6626                     ; 2833 				  state   = FINISH;
6628  1be4 35500000      	mov	_state,#80
6629  1be8 ac5a1e5a      	jpf	L143
6630  1bec               L132:
6631                     ; 2839      case 75:
6631                     ; 2840 		    
6631                     ; 2841 			 if(!timerGetOverflow(4)){
6633  1bec a604          	ld	a,#4
6634  1bee cd0000        	call	_timerGetOverflow
6636  1bf1 4d            	tnz	a
6637  1bf2 2604          	jrne	L5111
6638                     ; 2843 				 ack = FALSE;
6640  1bf4 3f08          	clr	_ack
6641                     ; 2845 				 return;
6643  1bf6 20a4          	jra	L03
6644  1bf8               L5111:
6645                     ; 2849 			 if(ack){
6647  1bf8 3d08          	tnz	_ack
6648  1bfa 2744          	jreq	L7111
6649                     ; 2851 				 ack   = FALSE;
6651  1bfc 3f08          	clr	_ack
6652                     ; 2852 				 state = DELAY;
6654  1bfe 35510000      	mov	_state,#81
6655                     ; 2853 				 stack = 76; 
6657  1c02 354c0001      	mov	_stack,#76
6658                     ; 2855 				 timerReset (1);
6660  1c06 a601          	ld	a,#1
6661  1c08 cd0000        	call	_timerReset
6663                     ; 2857 				 timerReset (3);
6665  1c0b a603          	ld	a,#3
6666  1c0d cd0000        	call	_timerReset
6668                     ; 2858 				 timerEnable(3, ENABLE);
6670  1c10 ae0301        	ldw	x,#769
6671  1c13 cd0000        	call	_timerEnable
6673                     ; 2860 				 timerReset (4);
6675  1c16 a604          	ld	a,#4
6676  1c18 cd0000        	call	_timerReset
6678                     ; 2861 				 timerEnable(4, ENABLE);
6680  1c1b ae0401        	ldw	x,#1025
6681  1c1e cd0000        	call	_timerEnable
6683                     ; 2863 				 GPIO_WriteLow (CH3);				 
6685  1c21 4b04          	push	#4
6686  1c23 ae500a        	ldw	x,#20490
6687  1c26 cd0000        	call	_GPIO_WriteLow
6689  1c29 84            	pop	a
6690                     ; 2864 				 GPIO_WriteHigh(CH4);
6692  1c2a 4b20          	push	#32
6693  1c2c ae5014        	ldw	x,#20500
6694  1c2f cd0000        	call	_GPIO_WriteHigh
6696  1c32 84            	pop	a
6697                     ; 2866 				 ioCommSetDir(OUTPUT);
6699  1c33 4f            	clr	a
6700  1c34 cd0000        	call	_ioCommSetDir
6702                     ; 2868 				 GPIO_WriteHigh(COMM);
6704  1c37 4b20          	push	#32
6705  1c39 ae5000        	ldw	x,#20480
6706  1c3c cd0000        	call	_GPIO_WriteHigh
6708  1c3f 84            	pop	a
6709  1c40               L7111:
6710                     ; 2872 			 if(timerGetOverflow(1)){
6712  1c40 a601          	ld	a,#1
6713  1c42 cd0000        	call	_timerGetOverflow
6715  1c45 4d            	tnz	a
6716  1c46 2603          	jrne	L462
6717  1c48 cc1e5a        	jp	L143
6718  1c4b               L462:
6719                     ; 2874 				 *control = 27;
6721  1c4b 1e01          	ldw	x,(OFST+1,sp)
6722  1c4d a61b          	ld	a,#27
6723  1c4f f7            	ld	(x),a
6724                     ; 2875 				  state   = FINISH;
6726  1c50 35500000      	mov	_state,#80
6727  1c54 ac5a1e5a      	jpf	L143
6728  1c58               L332:
6729                     ; 2881  	   case 76:
6729                     ; 2882 		   
6729                     ; 2883 			 if(!timerGetOverflow(4)){
6731  1c58 a604          	ld	a,#4
6732  1c5a cd0000        	call	_timerGetOverflow
6734  1c5d 4d            	tnz	a
6735  1c5e 2604          	jrne	L3211
6736                     ; 2885 				 ack = FALSE;
6738  1c60 3f08          	clr	_ack
6739                     ; 2887 				 return;
6741  1c62 206c          	jra	L23
6742  1c64               L3211:
6743                     ; 2891 			 if(ack){
6745  1c64 3d08          	tnz	_ack
6746  1c66 2725          	jreq	L5211
6747                     ; 2893 				  ack     = FALSE;
6749  1c68 3f08          	clr	_ack
6750                     ; 2894 				 *control =  3;
6752  1c6a 1e01          	ldw	x,(OFST+1,sp)
6753  1c6c a603          	ld	a,#3
6754  1c6e f7            	ld	(x),a
6755                     ; 2895 				  state   = 80;
6757  1c6f 35500000      	mov	_state,#80
6758                     ; 2897 				 timerEnable(1, DISABLE);
6760  1c73 ae0100        	ldw	x,#256
6761  1c76 cd0000        	call	_timerEnable
6763                     ; 2898 				 timerReset (1);
6765  1c79 a601          	ld	a,#1
6766  1c7b cd0000        	call	_timerReset
6768                     ; 2900 				 timerEnable(3, DISABLE);
6770  1c7e ae0300        	ldw	x,#768
6771  1c81 cd0000        	call	_timerEnable
6773                     ; 2901 				 timerReset (3);	
6775  1c84 a603          	ld	a,#3
6776  1c86 cd0000        	call	_timerReset
6778                     ; 2903 				 buzzer = TRUE;
6780  1c89 35010009      	mov	_buzzer,#1
6781  1c8d               L5211:
6782                     ; 2907 			 if(timerGetOverflow(1)){
6784  1c8d a601          	ld	a,#1
6785  1c8f cd0000        	call	_timerGetOverflow
6787  1c92 4d            	tnz	a
6788  1c93 2603          	jrne	L662
6789  1c95 cc1e5a        	jp	L143
6790  1c98               L662:
6791                     ; 2909 				 state = DELAY;
6793  1c98 35510000      	mov	_state,#81
6794                     ; 2910 				 stack = 77;
6796  1c9c 354d0001      	mov	_stack,#77
6797                     ; 2912 				 timerReset (1);
6799  1ca0 a601          	ld	a,#1
6800  1ca2 cd0000        	call	_timerReset
6802                     ; 2914 				 timerReset (3);
6804  1ca5 a603          	ld	a,#3
6805  1ca7 cd0000        	call	_timerReset
6807                     ; 2915 				 timerEnable(3, ENABLE);
6809  1caa ae0301        	ldw	x,#769
6810  1cad cd0000        	call	_timerEnable
6812                     ; 2917 				 timerReset (4);
6814  1cb0 a604          	ld	a,#4
6815  1cb2 cd0000        	call	_timerReset
6817                     ; 2919 				 ioCommSetDir(OUTPUT);
6819  1cb5 4f            	clr	a
6820  1cb6 cd0000        	call	_ioCommSetDir
6822                     ; 2921 				 GPIO_WriteHigh(COMM);	 
6824  1cb9 4b20          	push	#32
6825  1cbb ae5000        	ldw	x,#20480
6826  1cbe cd0000        	call	_GPIO_WriteHigh
6828  1cc1 84            	pop	a
6829  1cc2 ac5a1e5a      	jpf	L143
6830  1cc6               L532:
6831                     ; 2927      case 77:
6831                     ; 2928 		   
6831                     ; 2929 			 if(!timerGetOverflow(4)){
6833  1cc6 a604          	ld	a,#4
6834  1cc8 cd0000        	call	_timerGetOverflow
6836  1ccb 4d            	tnz	a
6837  1ccc 2604          	jrne	L1311
6838                     ; 2931 				 ack = FALSE;
6840  1cce 3f08          	clr	_ack
6841                     ; 2933 				 return;
6842  1cd0               L23:
6845  1cd0 85            	popw	x
6846  1cd1 81            	ret
6847  1cd2               L1311:
6848                     ; 2937 			 if(ack){
6850  1cd2 3d08          	tnz	_ack
6851  1cd4 271c          	jreq	L3311
6852                     ; 2939 				  ack     = FALSE;
6854  1cd6 3f08          	clr	_ack
6855                     ; 2940 				  state   = 78;
6857  1cd8 354e0000      	mov	_state,#78
6858                     ; 2942 				 timerReset (1);
6860  1cdc a601          	ld	a,#1
6861  1cde cd0000        	call	_timerReset
6863                     ; 2943 				 timerEnable(3, ENABLE);
6865  1ce1 ae0301        	ldw	x,#769
6866  1ce4 cd0000        	call	_timerEnable
6868                     ; 2945 				 timerReset (3);	
6870  1ce7 a603          	ld	a,#3
6871  1ce9 cd0000        	call	_timerReset
6873                     ; 2946 				 timerEnable(3, ENABLE);
6875  1cec ae0301        	ldw	x,#769
6876  1cef cd0000        	call	_timerEnable
6878  1cf2               L3311:
6879                     ; 2950 			 if(timerGetOverflow(1)){
6881  1cf2 a601          	ld	a,#1
6882  1cf4 cd0000        	call	_timerGetOverflow
6884  1cf7 4d            	tnz	a
6885  1cf8 2603          	jrne	L072
6886  1cfa cc1e5a        	jp	L143
6887  1cfd               L072:
6888                     ; 2952 				 *control = 28;
6890  1cfd 1e01          	ldw	x,(OFST+1,sp)
6891  1cff a61c          	ld	a,#28
6892  1d01 f7            	ld	(x),a
6893                     ; 2953 				  state   = FINISH;	 
6895  1d02 35500000      	mov	_state,#80
6896  1d06 ac5a1e5a      	jpf	L143
6897  1d0a               L732:
6898                     ; 2959      case 78:
6898                     ; 2960 		   
6898                     ; 2961 			 if(!timerGetOverflow(4)){
6900  1d0a a604          	ld	a,#4
6901  1d0c cd0000        	call	_timerGetOverflow
6903  1d0f 4d            	tnz	a
6904  1d10 2604          	jrne	L7311
6905                     ; 2963 				 ack = FALSE;
6907  1d12 3f08          	clr	_ack
6908                     ; 2965 				 return;
6910  1d14 20ba          	jra	L23
6911  1d16               L7311:
6912                     ; 2969 			 if(ack){
6914  1d16 3d08          	tnz	_ack
6915  1d18 271c          	jreq	L1411
6916                     ; 2971 				  ack     = FALSE;
6918  1d1a 3f08          	clr	_ack
6919                     ; 2972 				  state   = 79;
6921  1d1c 354f0000      	mov	_state,#79
6922                     ; 2974 				 timerReset (1);
6924  1d20 a601          	ld	a,#1
6925  1d22 cd0000        	call	_timerReset
6927                     ; 2975 				 timerEnable(3, ENABLE);
6929  1d25 ae0301        	ldw	x,#769
6930  1d28 cd0000        	call	_timerEnable
6932                     ; 2977 				 timerReset (3);	
6934  1d2b a603          	ld	a,#3
6935  1d2d cd0000        	call	_timerReset
6937                     ; 2978 				 timerEnable(3, ENABLE);
6939  1d30 ae0301        	ldw	x,#769
6940  1d33 cd0000        	call	_timerEnable
6942  1d36               L1411:
6943                     ; 2982 			 if(timerGetOverflow(1)){
6945  1d36 a601          	ld	a,#1
6946  1d38 cd0000        	call	_timerGetOverflow
6948  1d3b 4d            	tnz	a
6949  1d3c 2603          	jrne	L272
6950  1d3e cc1e5a        	jp	L143
6951  1d41               L272:
6952                     ; 2984 				 *control = 28;
6954  1d41 1e01          	ldw	x,(OFST+1,sp)
6955  1d43 a61c          	ld	a,#28
6956  1d45 f7            	ld	(x),a
6957                     ; 2985 				  state   = FINISH;	 
6959  1d46 35500000      	mov	_state,#80
6960  1d4a ac5a1e5a      	jpf	L143
6961  1d4e               L142:
6962                     ; 2991      case 79:
6962                     ; 2992 		   
6962                     ; 2993 			 if(!timerGetOverflow(4)){
6964  1d4e a604          	ld	a,#4
6965  1d50 cd0000        	call	_timerGetOverflow
6967  1d53 4d            	tnz	a
6968  1d54 2604          	jrne	L5411
6969                     ; 2995 				 ack = FALSE;
6971  1d56 3f08          	clr	_ack
6972                     ; 2997 				 return;
6975  1d58 85            	popw	x
6976  1d59 81            	ret
6977  1d5a               L5411:
6978                     ; 3001 			 if(ack){
6980  1d5a 3d08          	tnz	_ack
6981  1d5c 2725          	jreq	L7411
6982                     ; 3003 				  ack     = FALSE;
6984  1d5e 3f08          	clr	_ack
6985                     ; 3004 				 *control = 3;
6987  1d60 1e01          	ldw	x,(OFST+1,sp)
6988  1d62 a603          	ld	a,#3
6989  1d64 f7            	ld	(x),a
6990                     ; 3005 				  state   = FINISH;
6992  1d65 35500000      	mov	_state,#80
6993                     ; 3007 				 timerEnable(1, DISABLE);
6995  1d69 ae0100        	ldw	x,#256
6996  1d6c cd0000        	call	_timerEnable
6998                     ; 3008 				 timerReset (1);
7000  1d6f a601          	ld	a,#1
7001  1d71 cd0000        	call	_timerReset
7003                     ; 3010 				 timerEnable(3, DISABLE);
7005  1d74 ae0300        	ldw	x,#768
7006  1d77 cd0000        	call	_timerEnable
7008                     ; 3011 				 timerReset (3);	
7010  1d7a a603          	ld	a,#3
7011  1d7c cd0000        	call	_timerReset
7013                     ; 3013 				 buzzer = TRUE;
7015  1d7f 35010009      	mov	_buzzer,#1
7016  1d83               L7411:
7017                     ; 3017 			 if(timerGetOverflow(1)){
7019  1d83 a601          	ld	a,#1
7020  1d85 cd0000        	call	_timerGetOverflow
7022  1d88 4d            	tnz	a
7023  1d89 2603          	jrne	L472
7024  1d8b cc1e5a        	jp	L143
7025  1d8e               L472:
7026                     ; 3019 				 *control = 28;
7028  1d8e 1e01          	ldw	x,(OFST+1,sp)
7029  1d90 a61c          	ld	a,#28
7030  1d92 f7            	ld	(x),a
7031                     ; 3020 				  state   = FINISH;
7033  1d93 35500000      	mov	_state,#80
7034  1d97 ac5a1e5a      	jpf	L143
7035  1d9b               L342:
7036                     ; 3026      case FINISH:
7036                     ; 3027 		   
7036                     ; 3028 		   if(timerDelay(500)){
7038  1d9b ae01f4        	ldw	x,#500
7039  1d9e 89            	pushw	x
7040  1d9f ae0000        	ldw	x,#0
7041  1da2 89            	pushw	x
7042  1da3 cd0000        	call	_timerDelay
7044  1da6 5b04          	addw	sp,#4
7045  1da8 4d            	tnz	a
7046  1da9 2603          	jrne	L672
7047  1dab cc1e5a        	jp	L143
7048  1dae               L672:
7049                     ; 3030 				 GPIO_WriteLow(CH1);
7051  1dae 4b40          	push	#64
7052  1db0 ae500a        	ldw	x,#20490
7053  1db3 cd0000        	call	_GPIO_WriteLow
7055  1db6 84            	pop	a
7056                     ; 3031 		     GPIO_WriteLow(CH2);
7058  1db7 4b10          	push	#16
7059  1db9 ae500a        	ldw	x,#20490
7060  1dbc cd0000        	call	_GPIO_WriteLow
7062  1dbf 84            	pop	a
7063                     ; 3032 		     GPIO_WriteLow(CH3);
7065  1dc0 4b04          	push	#4
7066  1dc2 ae500a        	ldw	x,#20490
7067  1dc5 cd0000        	call	_GPIO_WriteLow
7069  1dc8 84            	pop	a
7070                     ; 3033 		     GPIO_WriteLow(CH4);
7072  1dc9 4b20          	push	#32
7073  1dcb ae5014        	ldw	x,#20500
7074  1dce cd0000        	call	_GPIO_WriteLow
7076  1dd1 84            	pop	a
7077                     ; 3034 			   GPIO_WriteLow(IGN);
7079  1dd2 4b08          	push	#8
7080  1dd4 ae500a        	ldw	x,#20490
7081  1dd7 cd0000        	call	_GPIO_WriteLow
7083  1dda 84            	pop	a
7084                     ; 3035 			   GPIO_WriteLow(DOOR);
7086  1ddb 4b02          	push	#2
7087  1ddd ae5000        	ldw	x,#20480
7088  1de0 cd0000        	call	_GPIO_WriteLow
7090  1de3 84            	pop	a
7091                     ; 3036 			   GPIO_WriteLow(SETA);
7093  1de4 4b02          	push	#2
7094  1de6 ae500a        	ldw	x,#20490
7095  1de9 cd0000        	call	_GPIO_WriteLow
7097  1dec 84            	pop	a
7098                     ; 3037 			   GPIO_WriteLow(SW_P);
7100  1ded 4b20          	push	#32
7101  1def ae500a        	ldw	x,#20490
7102  1df2 cd0000        	call	_GPIO_WriteLow
7104  1df5 84            	pop	a
7105                     ; 3038 			   GPIO_WriteLow(SW_N);
7107  1df6 4b01          	push	#1
7108  1df8 ae501e        	ldw	x,#20510
7109  1dfb cd0000        	call	_GPIO_WriteLow
7111  1dfe 84            	pop	a
7112                     ; 3039 			   GPIO_WriteLow(I_MOT);
7114  1dff 4b08          	push	#8
7115  1e01 ae5000        	ldw	x,#20480
7116  1e04 cd0000        	call	_GPIO_WriteLow
7118  1e07 84            	pop	a
7119                     ; 3040 		     GPIO_WriteLow(CMD_DN);
7121  1e08 4b04          	push	#4
7122  1e0a ae5000        	ldw	x,#20480
7123  1e0d cd0000        	call	_GPIO_WriteLow
7125  1e10 84            	pop	a
7126                     ; 3041 		     GPIO_WriteLow(CMD_UP); 
7128  1e11 4b40          	push	#64
7129  1e13 ae5000        	ldw	x,#20480
7130  1e16 cd0000        	call	_GPIO_WriteLow
7132  1e19 84            	pop	a
7133                     ; 3043 				 ack   = 0;
7135  1e1a 3f08          	clr	_ack
7136                     ; 3044 				 state = 0;
7138  1e1c 3f00          	clr	_state
7139                     ; 3046 				 timerEnable(2, DISABLE);
7141  1e1e ae0200        	ldw	x,#512
7142  1e21 cd0000        	call	_timerEnable
7144                     ; 3047 				 timerReset (2);
7146  1e24 a602          	ld	a,#2
7147  1e26 cd0000        	call	_timerReset
7149  1e29 202f          	jra	L143
7150  1e2b               L542:
7151                     ; 3053 		 case DELAY:
7151                     ; 3054 		    
7151                     ; 3055 		   if(timerGetOverflow(3)){
7153  1e2b a603          	ld	a,#3
7154  1e2d cd0000        	call	_timerGetOverflow
7156  1e30 4d            	tnz	a
7157  1e31 2727          	jreq	L143
7158                     ; 3057 				 GPIO_WriteLow (COMM);
7160  1e33 4b20          	push	#32
7161  1e35 ae5000        	ldw	x,#20480
7162  1e38 cd0000        	call	_GPIO_WriteLow
7164  1e3b 84            	pop	a
7165                     ; 3059 				 ioCommSetDir(INPUT);
7167  1e3c a601          	ld	a,#1
7168  1e3e cd0000        	call	_ioCommSetDir
7170                     ; 3061 				 timerEnable(2, DISABLE);
7172  1e41 ae0200        	ldw	x,#512
7173  1e44 cd0000        	call	_timerEnable
7175                     ; 3062 				 timerReset (2);
7177  1e47 a602          	ld	a,#2
7178  1e49 cd0000        	call	_timerReset
7180                     ; 3064 				 timerEnable(3, DISABLE);
7182  1e4c ae0300        	ldw	x,#768
7183  1e4f cd0000        	call	_timerEnable
7185                     ; 3065 				 timerReset (3);
7187  1e52 a603          	ld	a,#3
7188  1e54 cd0000        	call	_timerReset
7190                     ; 3067 				 state = stack;
7192  1e57 450100        	mov	_state,_stack
7193  1e5a               L143:
7194                     ; 3075   }
7197  1e5a 85            	popw	x
7198  1e5b 81            	ret
7234                     ; 3086 void testStop (uint8_t *control){
7235                     	switch	.text
7236  1e5c               _testStop:
7240                     ; 3088 	 *control = 6;
7242  1e5c a606          	ld	a,#6
7243  1e5e f7            	ld	(x),a
7244                     ; 3089 	    state = 0;
7246  1e5f 3f00          	clr	_state
7247                     ; 3091 	}
7250  1e61 81            	ret
7286                     ; 3102 void testSetBuffer(uint16_t *bufferAddr){
7287                     	switch	.text
7288  1e62               _testSetBuffer:
7292                     ; 3104 	 buffer = bufferAddr; 
7294  1e62 bf05          	ldw	_buffer,x
7295                     ; 3106   }
7298  1e64 81            	ret
7325                     ; 3111 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3){
7327                     	switch	.text
7328  1e65               f_EXTI_PORTA_IRQHandler:
7330  1e65 8a            	push	cc
7331  1e66 84            	pop	a
7332  1e67 a4bf          	and	a,#191
7333  1e69 88            	push	a
7334  1e6a 86            	pop	cc
7335  1e6b 3b0002        	push	c_x+2
7336  1e6e be00          	ldw	x,c_x
7337  1e70 89            	pushw	x
7338  1e71 3b0002        	push	c_y+2
7339  1e74 be00          	ldw	x,c_y
7340  1e76 89            	pushw	x
7343                     ; 3113 	 timerSetOverflowValue(2, 10);
7345  1e77 ae000a        	ldw	x,#10
7346  1e7a 89            	pushw	x
7347  1e7b ae0000        	ldw	x,#0
7348  1e7e 89            	pushw	x
7349  1e7f a602          	ld	a,#2
7350  1e81 cd0000        	call	_timerSetOverflowValue
7352  1e84 5b04          	addw	sp,#4
7353                     ; 3114 	 timerReset           (2);
7355  1e86 a602          	ld	a,#2
7356  1e88 cd0000        	call	_timerReset
7358                     ; 3115 	 timerEnable          (2, ENABLE);
7360  1e8b ae0201        	ldw	x,#513
7361  1e8e cd0000        	call	_timerEnable
7363                     ; 3117   }
7366  1e91 85            	popw	x
7367  1e92 bf00          	ldw	c_y,x
7368  1e94 320002        	pop	c_y+2
7369  1e97 85            	popw	x
7370  1e98 bf00          	ldw	c_x,x
7371  1e9a 320002        	pop	c_x+2
7372  1e9d 80            	iret
7395                     ; 3119 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4){
7396                     	switch	.text
7397  1e9e               f_EXTI_PORTB_IRQHandler:
7401                     ; 3121   }
7404  1e9e 80            	iret
7427                     ; 3123 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5){
7428                     	switch	.text
7429  1e9f               f_EXTI_PORTC_IRQHandler:
7433                     ; 3125 	}
7436  1e9f 80            	iret
7459                     ; 3127 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6){
7460                     	switch	.text
7461  1ea0               f_EXTI_PORTD_IRQHandler:
7465                     ; 3129   }
7468  1ea0 80            	iret
7491                     ; 3131 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7){
7492                     	switch	.text
7493  1ea1               f_EXTI_PORTE_IRQHandler:
7497                     ; 3133   }
7500  1ea1 80            	iret
7649                     	xdef	f_EXTI_PORTE_IRQHandler
7650                     	xdef	f_EXTI_PORTD_IRQHandler
7651                     	xdef	f_EXTI_PORTC_IRQHandler
7652                     	xdef	f_EXTI_PORTB_IRQHandler
7653                     	xdef	f_EXTI_PORTA_IRQHandler
7654                     	xdef	_start
7655                     	xdef	_menu
7656                     	xdef	_blink
7657                     	xdef	_buzzer
7658                     	xdef	_ack
7659                     	xdef	_deboucing
7660                     	xdef	_buffer
7661                     	xdef	_model_in
7662                     	xdef	_model_out
7663                     	xdef	_delay
7664                     	xdef	_stack
7665                     	xdef	_state
7666                     	xdef	_testSetBuffer
7667                     	xdef	_testStop
7668                     	xdef	_test
7669                     	xref	_timeBase210us
7670                     	xref	_timerDelay
7671                     	xref	_timerGetOverflow
7672                     	xref	_timerSetOverflowValue
7673                     	xref	_timerReset
7674                     	xref	_timerEnable
7675                     	xref	_ioCommSetDir
7676                     	xref	_GPIO_ReadInputPin
7677                     	xref	_GPIO_WriteReverse
7678                     	xref	_GPIO_WriteLow
7679                     	xref	_GPIO_WriteHigh
7680                     	xref.b	c_x
7681                     	xref.b	c_y
7700                     	end
