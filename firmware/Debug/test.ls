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
  23  0003 01            	dc.b	1
  24  0004               _model_in:
  25  0004 00            	dc.b	0
  26  0005               _menuState:
  27  0005 00            	dc.b	0
  28  0006               _selectState:
  29  0006 00            	dc.b	0
  30  0007               _buffer:
  31  0007 0000          	dc.w	0
  32  0009               _debouncing1:
  33  0009 00            	dc.b	0
  34  000a               _debouncing2:
  35  000a 00            	dc.b	0
  36  000b               _ack:
  37  000b 00            	dc.b	0
  38  000c               _buzzer:
  39  000c 00            	dc.b	0
  40  000d               _blink:
  41  000d 00            	dc.b	0
  42  000e               _menu:
  43  000e 01            	dc.b	1
  44  000f               _start:
  45  000f 01            	dc.b	1
  46  0010               _wait:
  47  0010 01            	dc.b	1
 109                     .const:	section	.text
 110  0000               L01:
 111  0000 017f          	dc.w	L3
 112  0002 0225          	dc.w	L5
 113  0004 028b          	dc.w	L7
 114  0006 0312          	dc.w	L11
 115  0008 0355          	dc.w	L31
 116  000a 0398          	dc.w	L51
 117  000c 03e4          	dc.w	L71
 118  000e 0430          	dc.w	L12
 119  0010 047c          	dc.w	L32
 120  0012 04c8          	dc.w	L52
 121  0014 0514          	dc.w	L72
 122  0016 0560          	dc.w	L13
 123  0018 05ac          	dc.w	L33
 124  001a 05f8          	dc.w	L53
 125  001c 0644          	dc.w	L73
 126  001e 0690          	dc.w	L14
 127  0020 06fa          	dc.w	L34
 128  0022 073d          	dc.w	L54
 129  0024 0780          	dc.w	L74
 130  0026 07c3          	dc.w	L15
 131  0028 0806          	dc.w	L35
 132  002a 0849          	dc.w	L55
 133  002c 0895          	dc.w	L75
 134  002e 08f6          	dc.w	L16
 135  0030 0939          	dc.w	L36
 136  0032 097c          	dc.w	L56
 137  0034 09bf          	dc.w	L76
 138  0036 0a02          	dc.w	L17
 139  0038 0a45          	dc.w	L37
 140  003a 0a88          	dc.w	L57
 141  003c 0acb          	dc.w	L77
 142  003e 0b0e          	dc.w	L101
 143  0040 0b8a          	dc.w	L301
 144  0042 0bfb          	dc.w	L501
 145  0044 0c3e          	dc.w	L701
 146  0046 0c81          	dc.w	L111
 147  0048 0cd6          	dc.w	L311
 148  004a 0d47          	dc.w	L511
 149  004c 0d8a          	dc.w	L711
 150  004e 0dcd          	dc.w	L121
 151  0050 0e27          	dc.w	L321
 152  0052 0e98          	dc.w	L521
 153  0054 0ee0          	dc.w	L721
 154  0056 0f28          	dc.w	L131
 155  0058 0f82          	dc.w	L331
 156  005a 1025          	dc.w	L531
 157  005c 1068          	dc.w	L731
 158  005e 10ab          	dc.w	L141
 159  0060 1132          	dc.w	L341
 160  0062 11c1          	dc.w	L541
 161  0064 1220          	dc.w	L741
 162  0066 127f          	dc.w	L151
 163  0068 12f0          	dc.w	L351
 164  006a 137d          	dc.w	L551
 165  006c 13dc          	dc.w	L751
 166  006e 143b          	dc.w	L161
 167  0070 14ac          	dc.w	L361
 168  0072 1539          	dc.w	L561
 169  0074 1598          	dc.w	L761
 170  0076 15f7          	dc.w	L171
 171  0078 1668          	dc.w	L371
 172  007a 16f5          	dc.w	L571
 173  007c 174f          	dc.w	L771
 174  007e 17a9          	dc.w	L102
 175  0080 1815          	dc.w	L302
 176  0082 18a2          	dc.w	L502
 177  0084 18fc          	dc.w	L702
 178  0086 1956          	dc.w	L112
 179  0088 19c2          	dc.w	L312
 180  008a 1a4f          	dc.w	L512
 181  008c 1aa9          	dc.w	L712
 182  008e 1b03          	dc.w	L122
 183  0090 1b6f          	dc.w	L322
 184  0092 1bfc          	dc.w	L522
 185  0094 1c56          	dc.w	L722
 186  0096 1cb0          	dc.w	L132
 187  0098 1d1c          	dc.w	L332
 188  009a 1da6          	dc.w	L532
 189  009c 1e00          	dc.w	L732
 190  009e 1e5a          	dc.w	L142
 191  00a0 1ec3          	dc.w	L342
 192  00a2 1f0c          	dc.w	L542
 193  00a4 1fab          	dc.w	L742
 194                     ; 56 void testUpdate(uint8_t *control){
 195                     	scross	off
 196                     	switch	.text
 197  0000               _testUpdate:
 199  0000 89            	pushw	x
 200       00000000      OFST:	set	0
 203                     ; 58 	 if(*control >= 31){
 205  0001 f6            	ld	a,(x)
 206  0002 a11f          	cp	a,#31
 207  0004 2445          	jruge	L21
 208                     ; 60 		 return;
 210                     ; 64 	 if(((*buffer > 500)&&(*buffer < 4500))||(*(buffer + 2) < 500)){
 212  0006 be07          	ldw	x,_buffer
 213  0008 9093          	ldw	y,x
 214  000a 90fe          	ldw	y,(y)
 215  000c 90a301f5      	cpw	y,#501
 216  0010 250c          	jrult	L303
 218  0012 be07          	ldw	x,_buffer
 219  0014 9093          	ldw	y,x
 220  0016 90fe          	ldw	y,(y)
 221  0018 90a31194      	cpw	y,#4500
 222  001c 250d          	jrult	L103
 223  001e               L303:
 225  001e be07          	ldw	x,_buffer
 226  0020 9093          	ldw	y,x
 227  0022 90ee04        	ldw	y,(4,y)
 228  0025 90a301f4      	cpw	y,#500
 229  0029 2422          	jruge	L772
 230  002b               L103:
 231                     ; 66 		 *control  = 0;
 233  002b 1e01          	ldw	x,(OFST+1,sp)
 234  002d 7f            	clr	(x)
 235                     ; 67 		  state    = 0;
 237  002e 3f00          	clr	_state
 238                     ; 68 			ack      = FALSE;
 240  0030 3f0b          	clr	_ack
 241                     ; 69 			wait     = TRUE;
 243  0032 35010010      	mov	_wait,#1
 244                     ; 71 		 timerEnable(2, DISABLE);
 246  0036 ae0200        	ldw	x,#512
 247  0039 cd0000        	call	_timerEnable
 249                     ; 72 		 timerReset (2);
 251  003c a602          	ld	a,#2
 252  003e cd0000        	call	_timerReset
 254                     ; 74 		 timerReset (6);
 256  0041 a606          	ld	a,#6
 257  0043 cd0000        	call	_timerReset
 259                     ; 76 		 ioCommSetDir(INPUT);
 261  0046 a601          	ld	a,#1
 262  0048 cd0000        	call	_ioCommSetDir
 264                     ; 78 		 return;
 265  004b               L21:
 268  004b 85            	popw	x
 269  004c 81            	ret
 270  004d               L772:
 271                     ; 82 		 if((state == 0)&&(*control < 3)){
 273  004d 3d00          	tnz	_state
 274  004f 262b          	jrne	L503
 276  0051 1e01          	ldw	x,(OFST+1,sp)
 277  0053 f6            	ld	a,(x)
 278  0054 a103          	cp	a,#3
 279  0056 2424          	jruge	L503
 280                     ; 84 			 if(*control == 0){
 282  0058 1e01          	ldw	x,(OFST+1,sp)
 283  005a 7d            	tnz	(x)
 284  005b 261a          	jrne	L113
 285                     ; 86 			   timerSetOverflowValue(6, 500);
 287  005d ae01f4        	ldw	x,#500
 288  0060 89            	pushw	x
 289  0061 ae0000        	ldw	x,#0
 290  0064 89            	pushw	x
 291  0065 a606          	ld	a,#6
 292  0067 cd0000        	call	_timerSetOverflowValue
 294  006a 5b04          	addw	sp,#4
 295                     ; 87 			   timerReset           (6);
 297  006c a606          	ld	a,#6
 298  006e cd0000        	call	_timerReset
 300                     ; 88 			   timerEnable          (6, ENABLE);
 302  0071 ae0601        	ldw	x,#1537
 303  0074 cd0000        	call	_timerEnable
 305  0077               L113:
 306                     ; 92 			 *control = 1;
 308  0077 1e01          	ldw	x,(OFST+1,sp)
 309  0079 a601          	ld	a,#1
 310  007b f7            	ld	(x),a
 311  007c               L503:
 312                     ; 98 	 if(*buffer > 4500){
 314  007c be07          	ldw	x,_buffer
 315  007e 9093          	ldw	y,x
 316  0080 90fe          	ldw	y,(y)
 317  0082 90a31195      	cpw	y,#4501
 318  0086 2507          	jrult	L313
 319                     ; 100 		 *control = 4;
 321  0088 1e01          	ldw	x,(OFST+1,sp)
 322  008a a604          	ld	a,#4
 323  008c f7            	ld	(x),a
 324                     ; 102 		 return;
 326  008d 20bc          	jra	L21
 327  008f               L313:
 328                     ; 106 	 if(!timerGetOverflow(6) && wait){
 330  008f a606          	ld	a,#6
 331  0091 cd0000        	call	_timerGetOverflow
 333  0094 4d            	tnz	a
 334  0095 2608          	jrne	L513
 336  0097 3d10          	tnz	_wait
 337  0099 2704          	jreq	L513
 338                     ; 108 		 ack = FALSE;
 340  009b 3f0b          	clr	_ack
 341                     ; 110 		 return;
 343  009d 20ac          	jra	L21
 344  009f               L513:
 345                     ; 114 		 wait = FALSE;
 347  009f 3f10          	clr	_wait
 348                     ; 116 		 timerEnable(6, DISABLE);
 350  00a1 ae0600        	ldw	x,#1536
 351  00a4 cd0000        	call	_timerEnable
 353                     ; 117 		 timerReset (6);
 355  00a7 a606          	ld	a,#6
 356  00a9 cd0000        	call	_timerReset
 358                     ; 121 	 if((state == 0)&&(*control >= 3)&&(*control < 31)){
 360  00ac 3d00          	tnz	_state
 361  00ae 2703          	jreq	L43
 362  00b0 cc0145        	jp	L123
 363  00b3               L43:
 365  00b3 1e01          	ldw	x,(OFST+1,sp)
 366  00b5 f6            	ld	a,(x)
 367  00b6 a103          	cp	a,#3
 368  00b8 2403          	jruge	L63
 369  00ba cc0145        	jp	L123
 370  00bd               L63:
 372  00bd 1e01          	ldw	x,(OFST+1,sp)
 373  00bf f6            	ld	a,(x)
 374  00c0 a11f          	cp	a,#31
 375  00c2 24f6          	jruge	L123
 376                     ; 123 		 if(buzzer){
 378  00c4 3d0c          	tnz	_buzzer
 379  00c6 2747          	jreq	L323
 380                     ; 125 			 buzzer = FALSE;
 382  00c8 3f0c          	clr	_buzzer
 383                     ; 126 			 menu   = TRUE;
 385  00ca 3501000e      	mov	_menu,#1
 386                     ; 128 			 if(*control == 3){
 388  00ce 1e01          	ldw	x,(OFST+1,sp)
 389  00d0 f6            	ld	a,(x)
 390  00d1 a103          	cp	a,#3
 391  00d3 2620          	jrne	L523
 392                     ; 130 				 timerSetOverflowValue(3, 1000);
 394  00d5 ae03e8        	ldw	x,#1000
 395  00d8 89            	pushw	x
 396  00d9 ae0000        	ldw	x,#0
 397  00dc 89            	pushw	x
 398  00dd a603          	ld	a,#3
 399  00df cd0000        	call	_timerSetOverflowValue
 401  00e2 5b04          	addw	sp,#4
 402                     ; 131 				 timerReset           (3);
 404  00e4 a603          	ld	a,#3
 405  00e6 cd0000        	call	_timerReset
 407                     ; 132 				 timerEnable          (3, ENABLE);
 409  00e9 ae0301        	ldw	x,#769
 410  00ec cd0000        	call	_timerEnable
 412                     ; 134 				 blink = TRUE;
 414  00ef 3501000d      	mov	_blink,#1
 416  00f3 201a          	jra	L323
 417  00f5               L523:
 418                     ; 138 				 timerSetOverflowValue(1, 500);
 420  00f5 ae01f4        	ldw	x,#500
 421  00f8 89            	pushw	x
 422  00f9 ae0000        	ldw	x,#0
 423  00fc 89            	pushw	x
 424  00fd a601          	ld	a,#1
 425  00ff cd0000        	call	_timerSetOverflowValue
 427  0102 5b04          	addw	sp,#4
 428                     ; 139 				 timerReset           (1);
 430  0104 a601          	ld	a,#1
 431  0106 cd0000        	call	_timerReset
 433                     ; 140 				 timerEnable          (1, ENABLE);	
 435  0109 ae0101        	ldw	x,#257
 436  010c cd0000        	call	_timerEnable
 438  010f               L323:
 439                     ; 146 		 if(timerGetOverflow(1)){
 441  010f a601          	ld	a,#1
 442  0111 cd0000        	call	_timerGetOverflow
 444  0114 4d            	tnz	a
 445  0115 2711          	jreq	L133
 446                     ; 148 			 timerReset(1);
 448  0117 a601          	ld	a,#1
 449  0119 cd0000        	call	_timerReset
 451                     ; 150 			 if(blink){
 453  011c 3d0d          	tnz	_blink
 454  011e 2704          	jreq	L333
 455                     ; 152 				 blink = FALSE;
 457  0120 3f0d          	clr	_blink
 459  0122 2004          	jra	L133
 460  0124               L333:
 461                     ; 156 				 blink = TRUE;	
 463  0124 3501000d      	mov	_blink,#1
 464  0128               L133:
 465                     ; 162 		 if(!timerGetOverflow(3) && blink){
 467  0128 a603          	ld	a,#3
 468  012a cd0000        	call	_timerGetOverflow
 470  012d 4d            	tnz	a
 471  012e 260c          	jrne	L733
 473  0130 3d0d          	tnz	_blink
 474  0132 2708          	jreq	L733
 475                     ; 164 			 if(timeBase210us()){
 477  0134 cd0000        	call	_timeBase210us
 479  0137 4d            	tnz	a
 480  0138 270b          	jreq	L123
 481  013a 2009          	jra	L123
 482  013c               L733:
 483                     ; 172 			 GPIO_WriteLow(BUZZER);	
 485  013c 4b40          	push	#64
 486  013e ae500f        	ldw	x,#20495
 487  0141 cd0000        	call	_GPIO_WriteLow
 489  0144 84            	pop	a
 490  0145               L123:
 491                     ; 178 	 if(timerGetOverflow(2)){
 493  0145 a602          	ld	a,#2
 494  0147 cd0000        	call	_timerGetOverflow
 496  014a 4d            	tnz	a
 497  014b 2721          	jreq	L543
 498                     ; 180 		 if(!GPIO_ReadInputPin(COMM)&&(*control != 0)){
 500  014d 4b20          	push	#32
 501  014f ae5000        	ldw	x,#20480
 502  0152 cd0000        	call	_GPIO_ReadInputPin
 504  0155 5b01          	addw	sp,#1
 505  0157 4d            	tnz	a
 506  0158 2609          	jrne	L743
 508  015a 1e01          	ldw	x,(OFST+1,sp)
 509  015c 7d            	tnz	(x)
 510  015d 2704          	jreq	L743
 511                     ; 182 			 ack = TRUE;
 513  015f 3501000b      	mov	_ack,#1
 514  0163               L743:
 515                     ; 186 		 timerEnable(2, DISABLE);	
 517  0163 ae0200        	ldw	x,#512
 518  0166 cd0000        	call	_timerEnable
 520                     ; 187 		 timerReset (2);	 
 522  0169 a602          	ld	a,#2
 523  016b cd0000        	call	_timerReset
 525  016e               L543:
 526                     ; 191    switch(state){
 528  016e b600          	ld	a,_state
 530                     ; 3189 		 break;
 531  0170 a153          	cp	a,#83
 532  0172 2407          	jruge	L6
 533  0174 5f            	clrw	x
 534  0175 97            	ld	xl,a
 535  0176 58            	sllw	x
 536  0177 de0000        	ldw	x,(L01,x)
 537  017a fc            	jp	(x)
 538  017b               L6:
 539  017b acda1fda      	jpf	L353
 540  017f               L3:
 541                     ; 193 		 case 0:	 
 541                     ; 194 			 
 541                     ; 195 			 GPIO_WriteLow(CH1);
 543  017f 4b40          	push	#64
 544  0181 ae500a        	ldw	x,#20490
 545  0184 cd0000        	call	_GPIO_WriteLow
 547  0187 84            	pop	a
 548                     ; 196 			 GPIO_WriteLow(CH2);
 550  0188 4b10          	push	#16
 551  018a ae500a        	ldw	x,#20490
 552  018d cd0000        	call	_GPIO_WriteLow
 554  0190 84            	pop	a
 555                     ; 197 			 GPIO_WriteLow(CH3);
 557  0191 4b04          	push	#4
 558  0193 ae500a        	ldw	x,#20490
 559  0196 cd0000        	call	_GPIO_WriteLow
 561  0199 84            	pop	a
 562                     ; 198 			 GPIO_WriteLow(CH4);
 564  019a 4b20          	push	#32
 565  019c ae5014        	ldw	x,#20500
 566  019f cd0000        	call	_GPIO_WriteLow
 568  01a2 84            	pop	a
 569                     ; 199 			 GPIO_WriteLow(IGN);
 571  01a3 4b08          	push	#8
 572  01a5 ae500a        	ldw	x,#20490
 573  01a8 cd0000        	call	_GPIO_WriteLow
 575  01ab 84            	pop	a
 576                     ; 200 			 GPIO_WriteLow(DOOR);
 578  01ac 4b02          	push	#2
 579  01ae ae5000        	ldw	x,#20480
 580  01b1 cd0000        	call	_GPIO_WriteLow
 582  01b4 84            	pop	a
 583                     ; 201 			 GPIO_WriteLow(SETA);
 585  01b5 4b02          	push	#2
 586  01b7 ae500a        	ldw	x,#20490
 587  01ba cd0000        	call	_GPIO_WriteLow
 589  01bd 84            	pop	a
 590                     ; 202 			 GPIO_WriteLow(SW_P);
 592  01be 4b20          	push	#32
 593  01c0 ae500a        	ldw	x,#20490
 594  01c3 cd0000        	call	_GPIO_WriteLow
 596  01c6 84            	pop	a
 597                     ; 203 			 GPIO_WriteLow(SW_N);
 599  01c7 4b01          	push	#1
 600  01c9 ae501e        	ldw	x,#20510
 601  01cc cd0000        	call	_GPIO_WriteLow
 603  01cf 84            	pop	a
 604                     ; 204 			 GPIO_WriteLow(I_MOT);
 606  01d0 4b08          	push	#8
 607  01d2 ae5000        	ldw	x,#20480
 608  01d5 cd0000        	call	_GPIO_WriteLow
 610  01d8 84            	pop	a
 611                     ; 205 			 GPIO_WriteLow(CMD_DN);
 613  01d9 4b04          	push	#4
 614  01db ae5000        	ldw	x,#20480
 615  01de cd0000        	call	_GPIO_WriteLow
 617  01e1 84            	pop	a
 618                     ; 206 			 GPIO_WriteLow(CMD_UP); 
 620  01e2 4b40          	push	#64
 621  01e4 ae5000        	ldw	x,#20480
 622  01e7 cd0000        	call	_GPIO_WriteLow
 624  01ea 84            	pop	a
 625                     ; 208 			 if(ack){				 
 627  01eb 3d0b          	tnz	_ack
 628  01ed 2603          	jrne	L04
 629  01ef cc1fda        	jp	L353
 630  01f2               L04:
 631                     ; 211 				 *control = 2;
 633  01f2 1e01          	ldw	x,(OFST+1,sp)
 634  01f4 a602          	ld	a,#2
 635  01f6 f7            	ld	(x),a
 636                     ; 212 				  ack     = FALSE;
 638  01f7 3f0b          	clr	_ack
 639                     ; 213 					menu    = FALSE;
 641  01f9 3f0e          	clr	_menu
 642                     ; 214 				  buzzer  = TRUE;
 644  01fb 3501000c      	mov	_buzzer,#1
 645                     ; 215 				  state   = 1;			 
 647  01ff 35010000      	mov	_state,#1
 648                     ; 217 			   timerSetOverflowValue(3, 30);			     
 650  0203 ae001e        	ldw	x,#30
 651  0206 89            	pushw	x
 652  0207 ae0000        	ldw	x,#0
 653  020a 89            	pushw	x
 654  020b a603          	ld	a,#3
 655  020d cd0000        	call	_timerSetOverflowValue
 657  0210 5b04          	addw	sp,#4
 658                     ; 218 			   timerReset           (3);			     			 
 660  0212 a603          	ld	a,#3
 661  0214 cd0000        	call	_timerReset
 663                     ; 219 				 timerEnable          (3, ENABLE);	
 665  0217 ae0301        	ldw	x,#769
 666  021a cd0000        	call	_timerEnable
 668                     ; 221 				 ioCommSetDir(OUTPUT);
 670  021d 4f            	clr	a
 671  021e cd0000        	call	_ioCommSetDir
 673  0221 acda1fda      	jpf	L353
 674  0225               L5:
 675                     ; 227      case 1:      
 675                     ; 228 			 
 675                     ; 229 			 if(timerGetOverflow(3)){
 677  0225 a603          	ld	a,#3
 678  0227 cd0000        	call	_timerGetOverflow
 680  022a 4d            	tnz	a
 681  022b 2603          	jrne	L24
 682  022d cc1fda        	jp	L353
 683  0230               L24:
 684                     ; 231 				 model_in++;
 686  0230 3c04          	inc	_model_in
 687                     ; 233 				 if(model_in <= (2 * model_out)){
 689  0232 9c            	rvf
 690  0233 b603          	ld	a,_model_out
 691  0235 5f            	clrw	x
 692  0236 97            	ld	xl,a
 693  0237 58            	sllw	x
 694  0238 b604          	ld	a,_model_in
 695  023a 905f          	clrw	y
 696  023c 9097          	ld	yl,a
 697  023e 90bf00        	ldw	c_y,y
 698  0241 b300          	cpw	x,c_y
 699  0243 2f2c          	jrslt	L163
 700                     ; 235 					 GPIO_WriteReverse(COMM);
 702  0245 4b20          	push	#32
 703  0247 ae5000        	ldw	x,#20480
 704  024a cd0000        	call	_GPIO_WriteReverse
 706  024d 84            	pop	a
 707                     ; 237 					 timerSetOverflowValue(1, 1500);
 709  024e ae05dc        	ldw	x,#1500
 710  0251 89            	pushw	x
 711  0252 ae0000        	ldw	x,#0
 712  0255 89            	pushw	x
 713  0256 a601          	ld	a,#1
 714  0258 cd0000        	call	_timerSetOverflowValue
 716  025b 5b04          	addw	sp,#4
 717                     ; 238 				   timerReset           (1);
 719  025d a601          	ld	a,#1
 720  025f cd0000        	call	_timerReset
 722                     ; 239 				   timerEnable          (1, ENABLE);
 724  0262 ae0101        	ldw	x,#257
 725  0265 cd0000        	call	_timerEnable
 727                     ; 241 				   timerReset           (3);
 729  0268 a603          	ld	a,#3
 730  026a cd0000        	call	_timerReset
 733  026d acda1fda      	jpf	L353
 734  0271               L163:
 735                     ; 245 					 model_in = 0;					 
 737  0271 3f04          	clr	_model_in
 738                     ; 246 					 state    = 2;
 740  0273 35020000      	mov	_state,#2
 741                     ; 248 					 timerEnable(1, ENABLE);
 743  0277 ae0101        	ldw	x,#257
 744  027a cd0000        	call	_timerEnable
 746                     ; 249 					 timerReset (1);
 748  027d a601          	ld	a,#1
 749  027f cd0000        	call	_timerReset
 751                     ; 251 					 ioCommSetDir(INPUT);
 753  0282 a601          	ld	a,#1
 754  0284 cd0000        	call	_ioCommSetDir
 756  0287 acda1fda      	jpf	L353
 757  028b               L7:
 758                     ; 262      case 2:
 758                     ; 263 		   
 758                     ; 264 			 if(ack){
 760  028b 3d0b          	tnz	_ack
 761  028d 2729          	jreq	L563
 762                     ; 266 				 ack = FALSE;
 764  028f 3f0b          	clr	_ack
 765                     ; 268 				 if(model_in == 0){
 767  0291 3d04          	tnz	_model_in
 768  0293 261c          	jrne	L763
 769                     ; 270 					 timerSetOverflowValue(1, 50);
 771  0295 ae0032        	ldw	x,#50
 772  0298 89            	pushw	x
 773  0299 ae0000        	ldw	x,#0
 774  029c 89            	pushw	x
 775  029d a601          	ld	a,#1
 776  029f cd0000        	call	_timerSetOverflowValue
 778  02a2 5b04          	addw	sp,#4
 779                     ; 271 					 timerReset           (1);
 781  02a4 a601          	ld	a,#1
 782  02a6 cd0000        	call	_timerReset
 784                     ; 272 					 timerEnable          (1, ENABLE);
 786  02a9 ae0101        	ldw	x,#257
 787  02ac cd0000        	call	_timerEnable
 790  02af 2005          	jra	L173
 791  02b1               L763:
 792                     ; 276 					 timerReset(1);
 794  02b1 a601          	ld	a,#1
 795  02b3 cd0000        	call	_timerReset
 797  02b6               L173:
 798                     ; 280 				 model_in++;
 800  02b6 3c04          	inc	_model_in
 801  02b8               L563:
 802                     ; 284 			 if(timerGetOverflow(1)){
 804  02b8 a601          	ld	a,#1
 805  02ba cd0000        	call	_timerGetOverflow
 807  02bd 4d            	tnz	a
 808  02be 2603          	jrne	L44
 809  02c0 cc1fda        	jp	L353
 810  02c3               L44:
 811                     ; 286 				 if(model_in == model_out){
 813  02c3 b604          	ld	a,_model_in
 814  02c5 b103          	cp	a,_model_out
 815  02c7 263a          	jrne	L573
 816                     ; 288 					  buzzer  = TRUE;
 818  02c9 3501000c      	mov	_buzzer,#1
 819                     ; 289 					  state   = DELAY;
 821  02cd 35520000      	mov	_state,#82
 822                     ; 290 					  stack   = 3;
 824  02d1 35030001      	mov	_stack,#3
 825                     ; 292 				   timerReset (1);
 827  02d5 a601          	ld	a,#1
 828  02d7 cd0000        	call	_timerReset
 830                     ; 294 					 timerSetOverflowValue(3, 15);	
 832  02da ae000f        	ldw	x,#15
 833  02dd 89            	pushw	x
 834  02de ae0000        	ldw	x,#0
 835  02e1 89            	pushw	x
 836  02e2 a603          	ld	a,#3
 837  02e4 cd0000        	call	_timerSetOverflowValue
 839  02e7 5b04          	addw	sp,#4
 840                     ; 295 				   timerReset           (3);			     			 
 842  02e9 a603          	ld	a,#3
 843  02eb cd0000        	call	_timerReset
 845                     ; 296 				   timerEnable          (3, ENABLE);
 847  02ee ae0301        	ldw	x,#769
 848  02f1 cd0000        	call	_timerEnable
 850                     ; 298 				   ioCommSetDir(OUTPUT);
 852  02f4 4f            	clr	a
 853  02f5 cd0000        	call	_ioCommSetDir
 855                     ; 300 				   GPIO_WriteHigh(COMM);					 
 857  02f8 4b20          	push	#32
 858  02fa ae5000        	ldw	x,#20480
 859  02fd cd0000        	call	_GPIO_WriteHigh
 861  0300 84            	pop	a
 863  0301 2009          	jra	L773
 864  0303               L573:
 865                     ; 304 					 *control = 5;
 867  0303 1e01          	ldw	x,(OFST+1,sp)
 868  0305 a605          	ld	a,#5
 869  0307 f7            	ld	(x),a
 870                     ; 305 				    state   = FINISH;
 872  0308 35510000      	mov	_state,#81
 873  030c               L773:
 874                     ; 309 				 model_in = 0;
 876  030c 3f04          	clr	_model_in
 877  030e acda1fda      	jpf	L353
 878  0312               L11:
 879                     ; 315 		 case 3:
 879                     ; 316 		    
 879                     ; 317 			 if(ack){
 881  0312 3d0b          	tnz	_ack
 882  0314 2727          	jreq	L104
 883                     ; 319 				 ack   = FALSE;
 885  0316 3f0b          	clr	_ack
 886                     ; 320 				 state = DELAY;
 888  0318 35520000      	mov	_state,#82
 889                     ; 321 				 stack = 4;
 891  031c 35040001      	mov	_stack,#4
 892                     ; 323 				 timerReset (1);
 894  0320 a601          	ld	a,#1
 895  0322 cd0000        	call	_timerReset
 897                     ; 325 				 timerReset (3);
 899  0325 a603          	ld	a,#3
 900  0327 cd0000        	call	_timerReset
 902                     ; 326 				 timerEnable(3, ENABLE);
 904  032a ae0301        	ldw	x,#769
 905  032d cd0000        	call	_timerEnable
 907                     ; 328 				 ioCommSetDir(OUTPUT);
 909  0330 4f            	clr	a
 910  0331 cd0000        	call	_ioCommSetDir
 912                     ; 330 				 GPIO_WriteHigh(COMM);			 
 914  0334 4b20          	push	#32
 915  0336 ae5000        	ldw	x,#20480
 916  0339 cd0000        	call	_GPIO_WriteHigh
 918  033c 84            	pop	a
 919  033d               L104:
 920                     ; 334 			 if(timerGetOverflow(1)){
 922  033d a601          	ld	a,#1
 923  033f cd0000        	call	_timerGetOverflow
 925  0342 4d            	tnz	a
 926  0343 2603          	jrne	L64
 927  0345 cc1fda        	jp	L353
 928  0348               L64:
 929                     ; 336 				 *control =  7;
 931  0348 1e01          	ldw	x,(OFST+1,sp)
 932  034a a607          	ld	a,#7
 933  034c f7            	ld	(x),a
 934                     ; 337 				  state   = FINISH;
 936  034d 35510000      	mov	_state,#81
 937  0351 acda1fda      	jpf	L353
 938  0355               L31:
 939                     ; 343 		 case 4:
 939                     ; 344 		    
 939                     ; 345 			 if(ack){
 941  0355 3d0b          	tnz	_ack
 942  0357 2727          	jreq	L504
 943                     ; 347 				 ack   = FALSE;
 945  0359 3f0b          	clr	_ack
 946                     ; 348 				 state = DELAY;
 948  035b 35520000      	mov	_state,#82
 949                     ; 349 				 stack = 5;
 951  035f 35050001      	mov	_stack,#5
 952                     ; 351 				 timerReset (1);
 954  0363 a601          	ld	a,#1
 955  0365 cd0000        	call	_timerReset
 957                     ; 353 				 timerReset (3);
 959  0368 a603          	ld	a,#3
 960  036a cd0000        	call	_timerReset
 962                     ; 354 				 timerEnable(3, ENABLE);	
 964  036d ae0301        	ldw	x,#769
 965  0370 cd0000        	call	_timerEnable
 967                     ; 356 				 ioCommSetDir(OUTPUT);
 969  0373 4f            	clr	a
 970  0374 cd0000        	call	_ioCommSetDir
 972                     ; 358 				 GPIO_WriteHigh(COMM);
 974  0377 4b20          	push	#32
 975  0379 ae5000        	ldw	x,#20480
 976  037c cd0000        	call	_GPIO_WriteHigh
 978  037f 84            	pop	a
 979  0380               L504:
 980                     ; 362 			 if(timerGetOverflow(1)){
 982  0380 a601          	ld	a,#1
 983  0382 cd0000        	call	_timerGetOverflow
 985  0385 4d            	tnz	a
 986  0386 2603          	jrne	L05
 987  0388 cc1fda        	jp	L353
 988  038b               L05:
 989                     ; 364 				 *control =  7;
 991  038b 1e01          	ldw	x,(OFST+1,sp)
 992  038d a607          	ld	a,#7
 993  038f f7            	ld	(x),a
 994                     ; 365 				  state   = FINISH;
 996  0390 35510000      	mov	_state,#81
 997  0394 acda1fda      	jpf	L353
 998  0398               L51:
 999                     ; 371 		 case 5:
 999                     ; 372 		    
 999                     ; 373 			 if(ack){
1001  0398 3d0b          	tnz	_ack
1002  039a 2730          	jreq	L114
1003                     ; 375 				 ack   = FALSE;;
1005  039c 3f0b          	clr	_ack
1006                     ; 376 				 state = DELAY;
1009  039e 35520000      	mov	_state,#82
1010                     ; 377 				 stack = 6;
1012  03a2 35060001      	mov	_stack,#6
1013                     ; 379 				 timerReset (1);
1015  03a6 a601          	ld	a,#1
1016  03a8 cd0000        	call	_timerReset
1018                     ; 381 				 timerReset (3);
1020  03ab a603          	ld	a,#3
1021  03ad cd0000        	call	_timerReset
1023                     ; 382 				 timerEnable(3, ENABLE);	
1025  03b0 ae0301        	ldw	x,#769
1026  03b3 cd0000        	call	_timerEnable
1028                     ; 384 				 GPIO_WriteHigh(SETA);
1030  03b6 4b02          	push	#2
1031  03b8 ae500a        	ldw	x,#20490
1032  03bb cd0000        	call	_GPIO_WriteHigh
1034  03be 84            	pop	a
1035                     ; 386 				 ioCommSetDir(OUTPUT);
1037  03bf 4f            	clr	a
1038  03c0 cd0000        	call	_ioCommSetDir
1040                     ; 388 				 GPIO_WriteHigh(COMM);
1042  03c3 4b20          	push	#32
1043  03c5 ae5000        	ldw	x,#20480
1044  03c8 cd0000        	call	_GPIO_WriteHigh
1046  03cb 84            	pop	a
1047  03cc               L114:
1048                     ; 392 			 if(timerGetOverflow(1)){
1050  03cc a601          	ld	a,#1
1051  03ce cd0000        	call	_timerGetOverflow
1053  03d1 4d            	tnz	a
1054  03d2 2603          	jrne	L25
1055  03d4 cc1fda        	jp	L353
1056  03d7               L25:
1057                     ; 394 				 *control =  8;
1059  03d7 1e01          	ldw	x,(OFST+1,sp)
1060  03d9 a608          	ld	a,#8
1061  03db f7            	ld	(x),a
1062                     ; 395 				  state   = FINISH;
1064  03dc 35510000      	mov	_state,#81
1065  03e0 acda1fda      	jpf	L353
1066  03e4               L71:
1067                     ; 401 		 case 6:
1067                     ; 402 		    
1067                     ; 403 			 if(ack){
1069  03e4 3d0b          	tnz	_ack
1070  03e6 2730          	jreq	L514
1071                     ; 405 				 ack   = FALSE;
1073  03e8 3f0b          	clr	_ack
1074                     ; 406 				 state = DELAY;
1076  03ea 35520000      	mov	_state,#82
1077                     ; 407 				 stack = 7;
1079  03ee 35070001      	mov	_stack,#7
1080                     ; 409 				 timerReset (1);
1082  03f2 a601          	ld	a,#1
1083  03f4 cd0000        	call	_timerReset
1085                     ; 411 				 timerReset (3);
1087  03f7 a603          	ld	a,#3
1088  03f9 cd0000        	call	_timerReset
1090                     ; 412 				 timerEnable(3, ENABLE);	
1092  03fc ae0301        	ldw	x,#769
1093  03ff cd0000        	call	_timerEnable
1095                     ; 414 				 GPIO_WriteLow(SETA);
1097  0402 4b02          	push	#2
1098  0404 ae500a        	ldw	x,#20490
1099  0407 cd0000        	call	_GPIO_WriteLow
1101  040a 84            	pop	a
1102                     ; 416 				 ioCommSetDir(OUTPUT);
1104  040b 4f            	clr	a
1105  040c cd0000        	call	_ioCommSetDir
1107                     ; 418 				 GPIO_WriteHigh(COMM);
1109  040f 4b20          	push	#32
1110  0411 ae5000        	ldw	x,#20480
1111  0414 cd0000        	call	_GPIO_WriteHigh
1113  0417 84            	pop	a
1114  0418               L514:
1115                     ; 422 			 if(timerGetOverflow(1)){
1117  0418 a601          	ld	a,#1
1118  041a cd0000        	call	_timerGetOverflow
1120  041d 4d            	tnz	a
1121  041e 2603          	jrne	L45
1122  0420 cc1fda        	jp	L353
1123  0423               L45:
1124                     ; 424 				 *control =  8;
1126  0423 1e01          	ldw	x,(OFST+1,sp)
1127  0425 a608          	ld	a,#8
1128  0427 f7            	ld	(x),a
1129                     ; 425 				  state   = FINISH;
1131  0428 35510000      	mov	_state,#81
1132  042c acda1fda      	jpf	L353
1133  0430               L12:
1134                     ; 431 		 case 7:
1134                     ; 432 		    
1134                     ; 433 			 if(ack){
1136  0430 3d0b          	tnz	_ack
1137  0432 2730          	jreq	L124
1138                     ; 435 				 ack   = FALSE;
1140  0434 3f0b          	clr	_ack
1141                     ; 436 				 state = DELAY;
1143  0436 35520000      	mov	_state,#82
1144                     ; 437 				 stack = 8;
1146  043a 35080001      	mov	_stack,#8
1147                     ; 439 				 timerReset (1);
1149  043e a601          	ld	a,#1
1150  0440 cd0000        	call	_timerReset
1152                     ; 441 				 timerReset (3);
1154  0443 a603          	ld	a,#3
1155  0445 cd0000        	call	_timerReset
1157                     ; 442 				 timerEnable(3, ENABLE);		
1159  0448 ae0301        	ldw	x,#769
1160  044b cd0000        	call	_timerEnable
1162                     ; 444 				 GPIO_WriteHigh(IGN);
1164  044e 4b08          	push	#8
1165  0450 ae500a        	ldw	x,#20490
1166  0453 cd0000        	call	_GPIO_WriteHigh
1168  0456 84            	pop	a
1169                     ; 446 				 ioCommSetDir(OUTPUT);
1171  0457 4f            	clr	a
1172  0458 cd0000        	call	_ioCommSetDir
1174                     ; 448 				 GPIO_WriteHigh(COMM);
1176  045b 4b20          	push	#32
1177  045d ae5000        	ldw	x,#20480
1178  0460 cd0000        	call	_GPIO_WriteHigh
1180  0463 84            	pop	a
1181  0464               L124:
1182                     ; 452 			 if(timerGetOverflow(1)){
1184  0464 a601          	ld	a,#1
1185  0466 cd0000        	call	_timerGetOverflow
1187  0469 4d            	tnz	a
1188  046a 2603          	jrne	L65
1189  046c cc1fda        	jp	L353
1190  046f               L65:
1191                     ; 454 				 *control =  9;
1193  046f 1e01          	ldw	x,(OFST+1,sp)
1194  0471 a609          	ld	a,#9
1195  0473 f7            	ld	(x),a
1196                     ; 455 				  state   = FINISH;
1198  0474 35510000      	mov	_state,#81
1199  0478 acda1fda      	jpf	L353
1200  047c               L32:
1201                     ; 461 		 case 8:
1201                     ; 462 		    
1201                     ; 463 			 if(ack){
1203  047c 3d0b          	tnz	_ack
1204  047e 2730          	jreq	L524
1205                     ; 465 				 ack      = FALSE;	
1207  0480 3f0b          	clr	_ack
1208                     ; 466 				 state    = DELAY;
1210  0482 35520000      	mov	_state,#82
1211                     ; 467 				 stack    = 9;
1213  0486 35090001      	mov	_stack,#9
1214                     ; 469 				 timerReset (1);
1216  048a a601          	ld	a,#1
1217  048c cd0000        	call	_timerReset
1219                     ; 471 				 timerReset (3);
1221  048f a603          	ld	a,#3
1222  0491 cd0000        	call	_timerReset
1224                     ; 472 				 timerEnable(3, ENABLE);		
1226  0494 ae0301        	ldw	x,#769
1227  0497 cd0000        	call	_timerEnable
1229                     ; 474 				 GPIO_WriteLow(IGN);
1231  049a 4b08          	push	#8
1232  049c ae500a        	ldw	x,#20490
1233  049f cd0000        	call	_GPIO_WriteLow
1235  04a2 84            	pop	a
1236                     ; 476 				 ioCommSetDir(OUTPUT);
1238  04a3 4f            	clr	a
1239  04a4 cd0000        	call	_ioCommSetDir
1241                     ; 478 				 GPIO_WriteHigh(COMM);
1243  04a7 4b20          	push	#32
1244  04a9 ae5000        	ldw	x,#20480
1245  04ac cd0000        	call	_GPIO_WriteHigh
1247  04af 84            	pop	a
1248  04b0               L524:
1249                     ; 482 			 if(timerGetOverflow(1)){
1251  04b0 a601          	ld	a,#1
1252  04b2 cd0000        	call	_timerGetOverflow
1254  04b5 4d            	tnz	a
1255  04b6 2603          	jrne	L06
1256  04b8 cc1fda        	jp	L353
1257  04bb               L06:
1258                     ; 484 				 *control =  9;
1260  04bb 1e01          	ldw	x,(OFST+1,sp)
1261  04bd a609          	ld	a,#9
1262  04bf f7            	ld	(x),a
1263                     ; 485 				  state   = FINISH;
1265  04c0 35510000      	mov	_state,#81
1266  04c4 acda1fda      	jpf	L353
1267  04c8               L52:
1268                     ; 491 		 case 9:
1268                     ; 492 		    
1268                     ; 493 			 if(ack){
1270  04c8 3d0b          	tnz	_ack
1271  04ca 2730          	jreq	L134
1272                     ; 495 				 ack   = FALSE;
1274  04cc 3f0b          	clr	_ack
1275                     ; 496 				 state = DELAY;
1277  04ce 35520000      	mov	_state,#82
1278                     ; 497 				 stack = 10;
1280  04d2 350a0001      	mov	_stack,#10
1281                     ; 499 				 timerReset (1);
1283  04d6 a601          	ld	a,#1
1284  04d8 cd0000        	call	_timerReset
1286                     ; 501 				 timerReset (3);
1288  04db a603          	ld	a,#3
1289  04dd cd0000        	call	_timerReset
1291                     ; 502 				 timerEnable(3, ENABLE);	
1293  04e0 ae0301        	ldw	x,#769
1294  04e3 cd0000        	call	_timerEnable
1296                     ; 504 				 GPIO_WriteHigh(CMD_UP);
1298  04e6 4b40          	push	#64
1299  04e8 ae5000        	ldw	x,#20480
1300  04eb cd0000        	call	_GPIO_WriteHigh
1302  04ee 84            	pop	a
1303                     ; 506 				 ioCommSetDir(OUTPUT);
1305  04ef 4f            	clr	a
1306  04f0 cd0000        	call	_ioCommSetDir
1308                     ; 508 				 GPIO_WriteHigh(COMM);
1310  04f3 4b20          	push	#32
1311  04f5 ae5000        	ldw	x,#20480
1312  04f8 cd0000        	call	_GPIO_WriteHigh
1314  04fb 84            	pop	a
1315  04fc               L134:
1316                     ; 512 			 if(timerGetOverflow(1)){
1318  04fc a601          	ld	a,#1
1319  04fe cd0000        	call	_timerGetOverflow
1321  0501 4d            	tnz	a
1322  0502 2603          	jrne	L26
1323  0504 cc1fda        	jp	L353
1324  0507               L26:
1325                     ; 514 				 *control =  10;
1327  0507 1e01          	ldw	x,(OFST+1,sp)
1328  0509 a60a          	ld	a,#10
1329  050b f7            	ld	(x),a
1330                     ; 515 				  state   = FINISH;
1332  050c 35510000      	mov	_state,#81
1333  0510 acda1fda      	jpf	L353
1334  0514               L72:
1335                     ; 521 		 case 10:
1335                     ; 522 		    
1335                     ; 523 			 if(ack){
1337  0514 3d0b          	tnz	_ack
1338  0516 2730          	jreq	L534
1339                     ; 525 				 ack   = FALSE;
1341  0518 3f0b          	clr	_ack
1342                     ; 526 				 state = DELAY;
1344  051a 35520000      	mov	_state,#82
1345                     ; 527 				 stack = 11;
1347  051e 350b0001      	mov	_stack,#11
1348                     ; 529 				 timerReset (1);
1350  0522 a601          	ld	a,#1
1351  0524 cd0000        	call	_timerReset
1353                     ; 531 				 timerReset (3);
1355  0527 a603          	ld	a,#3
1356  0529 cd0000        	call	_timerReset
1358                     ; 532 				 timerEnable(3, ENABLE);	
1360  052c ae0301        	ldw	x,#769
1361  052f cd0000        	call	_timerEnable
1363                     ; 534 				 GPIO_WriteLow(CMD_UP);
1365  0532 4b40          	push	#64
1366  0534 ae5000        	ldw	x,#20480
1367  0537 cd0000        	call	_GPIO_WriteLow
1369  053a 84            	pop	a
1370                     ; 536 				 ioCommSetDir(OUTPUT);
1372  053b 4f            	clr	a
1373  053c cd0000        	call	_ioCommSetDir
1375                     ; 538 				 GPIO_WriteHigh(COMM);
1377  053f 4b20          	push	#32
1378  0541 ae5000        	ldw	x,#20480
1379  0544 cd0000        	call	_GPIO_WriteHigh
1381  0547 84            	pop	a
1382  0548               L534:
1383                     ; 542 			 if(timerGetOverflow(1)){
1385  0548 a601          	ld	a,#1
1386  054a cd0000        	call	_timerGetOverflow
1388  054d 4d            	tnz	a
1389  054e 2603          	jrne	L46
1390  0550 cc1fda        	jp	L353
1391  0553               L46:
1392                     ; 544 				 *control =  10;
1394  0553 1e01          	ldw	x,(OFST+1,sp)
1395  0555 a60a          	ld	a,#10
1396  0557 f7            	ld	(x),a
1397                     ; 545 				  state   = FINISH;
1399  0558 35510000      	mov	_state,#81
1400  055c acda1fda      	jpf	L353
1401  0560               L13:
1402                     ; 551 		 case 11:
1402                     ; 552 		    
1402                     ; 553 			 if(ack){
1404  0560 3d0b          	tnz	_ack
1405  0562 2730          	jreq	L144
1406                     ; 555 				 ack   = FALSE;	
1408  0564 3f0b          	clr	_ack
1409                     ; 556 				 state = DELAY;
1411  0566 35520000      	mov	_state,#82
1412                     ; 557 				 stack = 12;
1414  056a 350c0001      	mov	_stack,#12
1415                     ; 559 				 timerReset (1);
1417  056e a601          	ld	a,#1
1418  0570 cd0000        	call	_timerReset
1420                     ; 561 				 timerReset (3);
1422  0573 a603          	ld	a,#3
1423  0575 cd0000        	call	_timerReset
1425                     ; 562 				 timerEnable(3, ENABLE);
1427  0578 ae0301        	ldw	x,#769
1428  057b cd0000        	call	_timerEnable
1430                     ; 564 				 GPIO_WriteHigh(CMD_DN);
1432  057e 4b04          	push	#4
1433  0580 ae5000        	ldw	x,#20480
1434  0583 cd0000        	call	_GPIO_WriteHigh
1436  0586 84            	pop	a
1437                     ; 566 				 ioCommSetDir(OUTPUT);
1439  0587 4f            	clr	a
1440  0588 cd0000        	call	_ioCommSetDir
1442                     ; 568 				 GPIO_WriteHigh(COMM);
1444  058b 4b20          	push	#32
1445  058d ae5000        	ldw	x,#20480
1446  0590 cd0000        	call	_GPIO_WriteHigh
1448  0593 84            	pop	a
1449  0594               L144:
1450                     ; 572 			 if(timerGetOverflow(1)){
1452  0594 a601          	ld	a,#1
1453  0596 cd0000        	call	_timerGetOverflow
1455  0599 4d            	tnz	a
1456  059a 2603          	jrne	L66
1457  059c cc1fda        	jp	L353
1458  059f               L66:
1459                     ; 574 				 *control =  11;
1461  059f 1e01          	ldw	x,(OFST+1,sp)
1462  05a1 a60b          	ld	a,#11
1463  05a3 f7            	ld	(x),a
1464                     ; 575 				  state   = FINISH;
1466  05a4 35510000      	mov	_state,#81
1467  05a8 acda1fda      	jpf	L353
1468  05ac               L33:
1469                     ; 581 		 case 12:
1469                     ; 582 		    
1469                     ; 583 			 if(ack){
1471  05ac 3d0b          	tnz	_ack
1472  05ae 2730          	jreq	L544
1473                     ; 585 				 ack   = FALSE;	
1475  05b0 3f0b          	clr	_ack
1476                     ; 586 				 state = DELAY;
1478  05b2 35520000      	mov	_state,#82
1479                     ; 587 				 stack = 13;
1481  05b6 350d0001      	mov	_stack,#13
1482                     ; 589 				 timerReset (1);
1484  05ba a601          	ld	a,#1
1485  05bc cd0000        	call	_timerReset
1487                     ; 591 				 timerReset (3);
1489  05bf a603          	ld	a,#3
1490  05c1 cd0000        	call	_timerReset
1492                     ; 592 				 timerEnable(3, ENABLE);		
1494  05c4 ae0301        	ldw	x,#769
1495  05c7 cd0000        	call	_timerEnable
1497                     ; 594 				 GPIO_WriteLow(CMD_DN);
1499  05ca 4b04          	push	#4
1500  05cc ae5000        	ldw	x,#20480
1501  05cf cd0000        	call	_GPIO_WriteLow
1503  05d2 84            	pop	a
1504                     ; 596 				 ioCommSetDir(OUTPUT);
1506  05d3 4f            	clr	a
1507  05d4 cd0000        	call	_ioCommSetDir
1509                     ; 598 				 GPIO_WriteHigh(COMM);
1511  05d7 4b20          	push	#32
1512  05d9 ae5000        	ldw	x,#20480
1513  05dc cd0000        	call	_GPIO_WriteHigh
1515  05df 84            	pop	a
1516  05e0               L544:
1517                     ; 602 			 if(timerGetOverflow(1)){
1519  05e0 a601          	ld	a,#1
1520  05e2 cd0000        	call	_timerGetOverflow
1522  05e5 4d            	tnz	a
1523  05e6 2603          	jrne	L07
1524  05e8 cc1fda        	jp	L353
1525  05eb               L07:
1526                     ; 604 				 *control =  11;
1528  05eb 1e01          	ldw	x,(OFST+1,sp)
1529  05ed a60b          	ld	a,#11
1530  05ef f7            	ld	(x),a
1531                     ; 605 				  state   = FINISH;
1533  05f0 35510000      	mov	_state,#81
1534  05f4 acda1fda      	jpf	L353
1535  05f8               L53:
1536                     ; 611 		 case 13:
1536                     ; 612 		    
1536                     ; 613 			 if(ack){
1538  05f8 3d0b          	tnz	_ack
1539  05fa 2730          	jreq	L154
1540                     ; 615 				 ack   = FALSE;
1542  05fc 3f0b          	clr	_ack
1543                     ; 616 				 state = DELAY;
1545  05fe 35520000      	mov	_state,#82
1546                     ; 617 				 stack = 14;
1548  0602 350e0001      	mov	_stack,#14
1549                     ; 619  				 timerReset (1);
1551  0606 a601          	ld	a,#1
1552  0608 cd0000        	call	_timerReset
1554                     ; 621 				 timerReset (3);
1556  060b a603          	ld	a,#3
1557  060d cd0000        	call	_timerReset
1559                     ; 622 				 timerEnable(3, ENABLE);
1561  0610 ae0301        	ldw	x,#769
1562  0613 cd0000        	call	_timerEnable
1564                     ; 624 				 GPIO_WriteHigh(DOOR);
1566  0616 4b02          	push	#2
1567  0618 ae5000        	ldw	x,#20480
1568  061b cd0000        	call	_GPIO_WriteHigh
1570  061e 84            	pop	a
1571                     ; 626 				 ioCommSetDir(OUTPUT);
1573  061f 4f            	clr	a
1574  0620 cd0000        	call	_ioCommSetDir
1576                     ; 628 				 GPIO_WriteHigh(COMM);
1578  0623 4b20          	push	#32
1579  0625 ae5000        	ldw	x,#20480
1580  0628 cd0000        	call	_GPIO_WriteHigh
1582  062b 84            	pop	a
1583  062c               L154:
1584                     ; 632 			 if(timerGetOverflow(1)){
1586  062c a601          	ld	a,#1
1587  062e cd0000        	call	_timerGetOverflow
1589  0631 4d            	tnz	a
1590  0632 2603          	jrne	L27
1591  0634 cc1fda        	jp	L353
1592  0637               L27:
1593                     ; 634 				 *control = 12;
1595  0637 1e01          	ldw	x,(OFST+1,sp)
1596  0639 a60c          	ld	a,#12
1597  063b f7            	ld	(x),a
1598                     ; 635 				  state   = FINISH;
1600  063c 35510000      	mov	_state,#81
1601  0640 acda1fda      	jpf	L353
1602  0644               L73:
1603                     ; 641 		 case 14:
1603                     ; 642 		    
1603                     ; 643 			 if(ack){
1605  0644 3d0b          	tnz	_ack
1606  0646 2730          	jreq	L554
1607                     ; 645 				 ack   = FALSE;
1609  0648 3f0b          	clr	_ack
1610                     ; 646 				 state = DELAY;
1612  064a 35520000      	mov	_state,#82
1613                     ; 647 				 stack = 15;
1615  064e 350f0001      	mov	_stack,#15
1616                     ; 649 				 timerReset (1);
1618  0652 a601          	ld	a,#1
1619  0654 cd0000        	call	_timerReset
1621                     ; 651 				 timerReset (3);
1623  0657 a603          	ld	a,#3
1624  0659 cd0000        	call	_timerReset
1626                     ; 652 				 timerEnable(3, ENABLE);	
1628  065c ae0301        	ldw	x,#769
1629  065f cd0000        	call	_timerEnable
1631                     ; 654 				 GPIO_WriteLow(DOOR);
1633  0662 4b02          	push	#2
1634  0664 ae5000        	ldw	x,#20480
1635  0667 cd0000        	call	_GPIO_WriteLow
1637  066a 84            	pop	a
1638                     ; 656 				 ioCommSetDir(OUTPUT);
1640  066b 4f            	clr	a
1641  066c cd0000        	call	_ioCommSetDir
1643                     ; 658 				 GPIO_WriteHigh(COMM);
1645  066f 4b20          	push	#32
1646  0671 ae5000        	ldw	x,#20480
1647  0674 cd0000        	call	_GPIO_WriteHigh
1649  0677 84            	pop	a
1650  0678               L554:
1651                     ; 662 			 if(timerGetOverflow(1)){
1653  0678 a601          	ld	a,#1
1654  067a cd0000        	call	_timerGetOverflow
1656  067d 4d            	tnz	a
1657  067e 2603          	jrne	L47
1658  0680 cc1fda        	jp	L353
1659  0683               L47:
1660                     ; 664 				 *control = 12;
1662  0683 1e01          	ldw	x,(OFST+1,sp)
1663  0685 a60c          	ld	a,#12
1664  0687 f7            	ld	(x),a
1665                     ; 665 				  state   = FINISH;
1667  0688 35510000      	mov	_state,#81
1668  068c acda1fda      	jpf	L353
1669  0690               L14:
1670                     ; 671 		 case 15:
1670                     ; 672 		    
1670                     ; 673 			 if(ack){
1672  0690 3d0b          	tnz	_ack
1673  0692 2730          	jreq	L164
1674                     ; 675 				 ack   = FALSE;
1676  0694 3f0b          	clr	_ack
1677                     ; 676 				 state = DELAY;
1679  0696 35520000      	mov	_state,#82
1680                     ; 677 				 stack = 22;
1682  069a 35160001      	mov	_stack,#22
1683                     ; 679 				 timerReset (1);
1685  069e a601          	ld	a,#1
1686  06a0 cd0000        	call	_timerReset
1688                     ; 681 				 timerReset (3);
1690  06a3 a603          	ld	a,#3
1691  06a5 cd0000        	call	_timerReset
1693                     ; 682 				 timerEnable(3, ENABLE);	
1695  06a8 ae0301        	ldw	x,#769
1696  06ab cd0000        	call	_timerEnable
1698                     ; 684 				 GPIO_WriteHigh(SW_P);
1700  06ae 4b20          	push	#32
1701  06b0 ae500a        	ldw	x,#20490
1702  06b3 cd0000        	call	_GPIO_WriteHigh
1704  06b6 84            	pop	a
1705                     ; 686 				 ioCommSetDir(OUTPUT);
1707  06b7 4f            	clr	a
1708  06b8 cd0000        	call	_ioCommSetDir
1710                     ; 688 				 GPIO_WriteHigh(COMM);
1712  06bb 4b20          	push	#32
1713  06bd ae5000        	ldw	x,#20480
1714  06c0 cd0000        	call	_GPIO_WriteHigh
1716  06c3 84            	pop	a
1717  06c4               L164:
1718                     ; 692 			 if(timerGetOverflow(1)){
1720  06c4 a601          	ld	a,#1
1721  06c6 cd0000        	call	_timerGetOverflow
1723  06c9 4d            	tnz	a
1724  06ca 2603          	jrne	L67
1725  06cc cc1fda        	jp	L353
1726  06cf               L67:
1727                     ; 694 				 ack   = FALSE;
1729  06cf 3f0b          	clr	_ack
1730                     ; 695 				 state = DELAY;
1732  06d1 35520000      	mov	_state,#82
1733                     ; 696 				 stack = 16;
1735  06d5 35100001      	mov	_stack,#16
1736                     ; 698 				 timerReset (1);
1738  06d9 a601          	ld	a,#1
1739  06db cd0000        	call	_timerReset
1741                     ; 700 				 timerReset (3);
1743  06de a603          	ld	a,#3
1744  06e0 cd0000        	call	_timerReset
1746                     ; 701 				 timerEnable(3, ENABLE);
1748  06e3 ae0301        	ldw	x,#769
1749  06e6 cd0000        	call	_timerEnable
1751                     ; 703 				 ioCommSetDir(OUTPUT);
1753  06e9 4f            	clr	a
1754  06ea cd0000        	call	_ioCommSetDir
1756                     ; 705 				 GPIO_WriteHigh(COMM);
1758  06ed 4b20          	push	#32
1759  06ef ae5000        	ldw	x,#20480
1760  06f2 cd0000        	call	_GPIO_WriteHigh
1762  06f5 84            	pop	a
1763  06f6 acda1fda      	jpf	L353
1764  06fa               L34:
1765                     ; 711 		 case 16:
1765                     ; 712 		    
1765                     ; 713 			 if(ack){
1767  06fa 3d0b          	tnz	_ack
1768  06fc 2727          	jreq	L564
1769                     ; 715 				 ack   = FALSE;
1771  06fe 3f0b          	clr	_ack
1772                     ; 716 				 state = DELAY;
1774  0700 35520000      	mov	_state,#82
1775                     ; 717 				 stack = 17;
1777  0704 35110001      	mov	_stack,#17
1778                     ; 719 				 timerReset (1);
1780  0708 a601          	ld	a,#1
1781  070a cd0000        	call	_timerReset
1783                     ; 721 				 timerReset (3);
1785  070d a603          	ld	a,#3
1786  070f cd0000        	call	_timerReset
1788                     ; 722 				 timerEnable(3, ENABLE); 
1790  0712 ae0301        	ldw	x,#769
1791  0715 cd0000        	call	_timerEnable
1793                     ; 724 				 ioCommSetDir(OUTPUT);
1795  0718 4f            	clr	a
1796  0719 cd0000        	call	_ioCommSetDir
1798                     ; 726 				 GPIO_WriteHigh(COMM);
1800  071c 4b20          	push	#32
1801  071e ae5000        	ldw	x,#20480
1802  0721 cd0000        	call	_GPIO_WriteHigh
1804  0724 84            	pop	a
1805  0725               L564:
1806                     ; 730 			 if(timerGetOverflow(1)){
1808  0725 a601          	ld	a,#1
1809  0727 cd0000        	call	_timerGetOverflow
1811  072a 4d            	tnz	a
1812  072b 2603          	jrne	L001
1813  072d cc1fda        	jp	L353
1814  0730               L001:
1815                     ; 732 				 *control = 13;
1817  0730 1e01          	ldw	x,(OFST+1,sp)
1818  0732 a60d          	ld	a,#13
1819  0734 f7            	ld	(x),a
1820                     ; 733 				  state   = FINISH;
1822  0735 35510000      	mov	_state,#81
1823  0739 acda1fda      	jpf	L353
1824  073d               L54:
1825                     ; 739 		 case 17:
1825                     ; 740 		    
1825                     ; 741 			 if(ack){
1827  073d 3d0b          	tnz	_ack
1828  073f 2727          	jreq	L174
1829                     ; 743 				 ack   = FALSE;
1831  0741 3f0b          	clr	_ack
1832                     ; 744 				 state = DELAY;
1834  0743 35520000      	mov	_state,#82
1835                     ; 745 				 stack = 18;
1837  0747 35120001      	mov	_stack,#18
1838                     ; 747 				 timerReset (1);
1840  074b a601          	ld	a,#1
1841  074d cd0000        	call	_timerReset
1843                     ; 749 				 timerReset (3);
1845  0750 a603          	ld	a,#3
1846  0752 cd0000        	call	_timerReset
1848                     ; 750 				 timerEnable(3, ENABLE);	
1850  0755 ae0301        	ldw	x,#769
1851  0758 cd0000        	call	_timerEnable
1853                     ; 752 				 ioCommSetDir(OUTPUT);
1855  075b 4f            	clr	a
1856  075c cd0000        	call	_ioCommSetDir
1858                     ; 754 				 GPIO_WriteHigh(COMM);
1860  075f 4b20          	push	#32
1861  0761 ae5000        	ldw	x,#20480
1862  0764 cd0000        	call	_GPIO_WriteHigh
1864  0767 84            	pop	a
1865  0768               L174:
1866                     ; 758 			 if(timerGetOverflow(1)){
1868  0768 a601          	ld	a,#1
1869  076a cd0000        	call	_timerGetOverflow
1871  076d 4d            	tnz	a
1872  076e 2603          	jrne	L201
1873  0770 cc1fda        	jp	L353
1874  0773               L201:
1875                     ; 760 				 *control = 14;
1877  0773 1e01          	ldw	x,(OFST+1,sp)
1878  0775 a60e          	ld	a,#14
1879  0777 f7            	ld	(x),a
1880                     ; 761 				  state   = FINISH;
1882  0778 35510000      	mov	_state,#81
1883  077c acda1fda      	jpf	L353
1884  0780               L74:
1885                     ; 767 		 case 18:
1885                     ; 768 		    
1885                     ; 769 			 if(ack){
1887  0780 3d0b          	tnz	_ack
1888  0782 2727          	jreq	L574
1889                     ; 771 				 ack   = FALSE;
1891  0784 3f0b          	clr	_ack
1892                     ; 772 				 state = DELAY;
1894  0786 35520000      	mov	_state,#82
1895                     ; 773 				 stack = 19;
1897  078a 35130001      	mov	_stack,#19
1898                     ; 775 				 timerReset (1);
1900  078e a601          	ld	a,#1
1901  0790 cd0000        	call	_timerReset
1903                     ; 777 				 timerReset (3);
1905  0793 a603          	ld	a,#3
1906  0795 cd0000        	call	_timerReset
1908                     ; 778 				 timerEnable(3, ENABLE);
1910  0798 ae0301        	ldw	x,#769
1911  079b cd0000        	call	_timerEnable
1913                     ; 780 				 ioCommSetDir(OUTPUT);
1915  079e 4f            	clr	a
1916  079f cd0000        	call	_ioCommSetDir
1918                     ; 782 				 GPIO_WriteHigh(COMM);
1920  07a2 4b20          	push	#32
1921  07a4 ae5000        	ldw	x,#20480
1922  07a7 cd0000        	call	_GPIO_WriteHigh
1924  07aa 84            	pop	a
1925  07ab               L574:
1926                     ; 786 			 if(timerGetOverflow(1)){
1928  07ab a601          	ld	a,#1
1929  07ad cd0000        	call	_timerGetOverflow
1931  07b0 4d            	tnz	a
1932  07b1 2603          	jrne	L401
1933  07b3 cc1fda        	jp	L353
1934  07b6               L401:
1935                     ; 788 				 *control = 15;
1937  07b6 1e01          	ldw	x,(OFST+1,sp)
1938  07b8 a60f          	ld	a,#15
1939  07ba f7            	ld	(x),a
1940                     ; 789 				  state   = FINISH;
1942  07bb 35510000      	mov	_state,#81
1943  07bf acda1fda      	jpf	L353
1944  07c3               L15:
1945                     ; 795 		 case 19:
1945                     ; 796 		    
1945                     ; 797 			 if(ack){
1947  07c3 3d0b          	tnz	_ack
1948  07c5 2727          	jreq	L105
1949                     ; 799 				 ack   = FALSE;
1951  07c7 3f0b          	clr	_ack
1952                     ; 800 				 state = DELAY;
1954  07c9 35520000      	mov	_state,#82
1955                     ; 801 				 stack = 20;
1957  07cd 35140001      	mov	_stack,#20
1958                     ; 803 				 timerReset (1);
1960  07d1 a601          	ld	a,#1
1961  07d3 cd0000        	call	_timerReset
1963                     ; 805 				 timerReset (3);
1965  07d6 a603          	ld	a,#3
1966  07d8 cd0000        	call	_timerReset
1968                     ; 806 				 timerEnable(3, ENABLE);	
1970  07db ae0301        	ldw	x,#769
1971  07de cd0000        	call	_timerEnable
1973                     ; 808 				 ioCommSetDir(OUTPUT);
1975  07e1 4f            	clr	a
1976  07e2 cd0000        	call	_ioCommSetDir
1978                     ; 810 				 GPIO_WriteHigh(COMM);
1980  07e5 4b20          	push	#32
1981  07e7 ae5000        	ldw	x,#20480
1982  07ea cd0000        	call	_GPIO_WriteHigh
1984  07ed 84            	pop	a
1985  07ee               L105:
1986                     ; 814 			 if(timerGetOverflow(1)){
1988  07ee a601          	ld	a,#1
1989  07f0 cd0000        	call	_timerGetOverflow
1991  07f3 4d            	tnz	a
1992  07f4 2603          	jrne	L601
1993  07f6 cc1fda        	jp	L353
1994  07f9               L601:
1995                     ; 816 				 *control = 16;
1997  07f9 1e01          	ldw	x,(OFST+1,sp)
1998  07fb a610          	ld	a,#16
1999  07fd f7            	ld	(x),a
2000                     ; 817 				  state   = FINISH;
2002  07fe 35510000      	mov	_state,#81
2003  0802 acda1fda      	jpf	L353
2004  0806               L35:
2005                     ; 823 		 case 20:
2005                     ; 824 		    
2005                     ; 825 			 if(ack){
2007  0806 3d0b          	tnz	_ack
2008  0808 2727          	jreq	L505
2009                     ; 827 				 ack   = FALSE;
2011  080a 3f0b          	clr	_ack
2012                     ; 828 				 state = DELAY;
2014  080c 35520000      	mov	_state,#82
2015                     ; 829 				 stack = 21;
2017  0810 35150001      	mov	_stack,#21
2018                     ; 831 				 timerReset (1);
2020  0814 a601          	ld	a,#1
2021  0816 cd0000        	call	_timerReset
2023                     ; 833 				 timerReset (3);
2025  0819 a603          	ld	a,#3
2026  081b cd0000        	call	_timerReset
2028                     ; 834 				 timerEnable(3, ENABLE);
2030  081e ae0301        	ldw	x,#769
2031  0821 cd0000        	call	_timerEnable
2033                     ; 836 				 ioCommSetDir(OUTPUT);
2035  0824 4f            	clr	a
2036  0825 cd0000        	call	_ioCommSetDir
2038                     ; 838 				 GPIO_WriteHigh(COMM);
2040  0828 4b20          	push	#32
2041  082a ae5000        	ldw	x,#20480
2042  082d cd0000        	call	_GPIO_WriteHigh
2044  0830 84            	pop	a
2045  0831               L505:
2046                     ; 842 			 if(timerGetOverflow(1)){
2048  0831 a601          	ld	a,#1
2049  0833 cd0000        	call	_timerGetOverflow
2051  0836 4d            	tnz	a
2052  0837 2603          	jrne	L011
2053  0839 cc1fda        	jp	L353
2054  083c               L011:
2055                     ; 844 				 *control = 17;
2057  083c 1e01          	ldw	x,(OFST+1,sp)
2058  083e a611          	ld	a,#17
2059  0840 f7            	ld	(x),a
2060                     ; 845 				  state   = FINISH;
2062  0841 35510000      	mov	_state,#81
2063  0845 acda1fda      	jpf	L353
2064  0849               L55:
2065                     ; 851 		 case 21:
2065                     ; 852 		    
2065                     ; 853 			 if(ack){
2067  0849 3d0b          	tnz	_ack
2068  084b 2730          	jreq	L115
2069                     ; 855 				 ack   = FALSE;
2071  084d 3f0b          	clr	_ack
2072                     ; 856 				 state = DELAY;
2074  084f 35520000      	mov	_state,#82
2075                     ; 857 				 stack = 22;
2077  0853 35160001      	mov	_stack,#22
2078                     ; 859 				 timerReset (1);
2080  0857 a601          	ld	a,#1
2081  0859 cd0000        	call	_timerReset
2083                     ; 861 				 timerReset (3);
2085  085c a603          	ld	a,#3
2086  085e cd0000        	call	_timerReset
2088                     ; 862 				 timerEnable(3, ENABLE);
2090  0861 ae0301        	ldw	x,#769
2091  0864 cd0000        	call	_timerEnable
2093                     ; 864 				 GPIO_WriteHigh(SW_P);
2095  0867 4b20          	push	#32
2096  0869 ae500a        	ldw	x,#20490
2097  086c cd0000        	call	_GPIO_WriteHigh
2099  086f 84            	pop	a
2100                     ; 865 				 ioCommSetDir(OUTPUT);
2102  0870 4f            	clr	a
2103  0871 cd0000        	call	_ioCommSetDir
2105                     ; 867 				 GPIO_WriteHigh(COMM);
2107  0874 4b20          	push	#32
2108  0876 ae5000        	ldw	x,#20480
2109  0879 cd0000        	call	_GPIO_WriteHigh
2111  087c 84            	pop	a
2112  087d               L115:
2113                     ; 871 			 if(timerGetOverflow(1)){
2115  087d a601          	ld	a,#1
2116  087f cd0000        	call	_timerGetOverflow
2118  0882 4d            	tnz	a
2119  0883 2603          	jrne	L211
2120  0885 cc1fda        	jp	L353
2121  0888               L211:
2122                     ; 873 				 *control = 18;
2124  0888 1e01          	ldw	x,(OFST+1,sp)
2125  088a a612          	ld	a,#18
2126  088c f7            	ld	(x),a
2127                     ; 874 				  state   = FINISH;
2129  088d 35510000      	mov	_state,#81
2130  0891 acda1fda      	jpf	L353
2131  0895               L75:
2132                     ; 880 		 case 22:
2132                     ; 881 		    
2132                     ; 882 			 if(ack){
2134  0895 3d0b          	tnz	_ack
2135  0897 2727          	jreq	L515
2136                     ; 884 				 ack   = FALSE;	
2138  0899 3f0b          	clr	_ack
2139                     ; 885 				 state = DELAY;
2141  089b 35520000      	mov	_state,#82
2142                     ; 886 				 stack = 29;
2144  089f 351d0001      	mov	_stack,#29
2145                     ; 888 				 timerReset (1);
2147  08a3 a601          	ld	a,#1
2148  08a5 cd0000        	call	_timerReset
2150                     ; 890 				 timerReset (3);
2152  08a8 a603          	ld	a,#3
2153  08aa cd0000        	call	_timerReset
2155                     ; 891 				 timerEnable(3, ENABLE);
2157  08ad ae0301        	ldw	x,#769
2158  08b0 cd0000        	call	_timerEnable
2160                     ; 893 				 ioCommSetDir(OUTPUT);
2162  08b3 4f            	clr	a
2163  08b4 cd0000        	call	_ioCommSetDir
2165                     ; 895 				 GPIO_WriteHigh(COMM);
2167  08b7 4b20          	push	#32
2168  08b9 ae5000        	ldw	x,#20480
2169  08bc cd0000        	call	_GPIO_WriteHigh
2171  08bf 84            	pop	a
2172  08c0               L515:
2173                     ; 899 			 if(timerGetOverflow(1)){
2175  08c0 a601          	ld	a,#1
2176  08c2 cd0000        	call	_timerGetOverflow
2178  08c5 4d            	tnz	a
2179  08c6 2603          	jrne	L411
2180  08c8 cc1fda        	jp	L353
2181  08cb               L411:
2182                     ; 901 				 ack   = FALSE;
2184  08cb 3f0b          	clr	_ack
2185                     ; 902 				 state = DELAY;
2187  08cd 35520000      	mov	_state,#82
2188                     ; 903 				 stack = 23;
2190  08d1 35170001      	mov	_stack,#23
2191                     ; 905 				 timerReset (1);
2193  08d5 a601          	ld	a,#1
2194  08d7 cd0000        	call	_timerReset
2196                     ; 907 				 timerReset (3);
2198  08da a603          	ld	a,#3
2199  08dc cd0000        	call	_timerReset
2201                     ; 908 				 timerEnable(3, ENABLE);
2203  08df ae0301        	ldw	x,#769
2204  08e2 cd0000        	call	_timerEnable
2206                     ; 910 				 ioCommSetDir(OUTPUT);
2208  08e5 4f            	clr	a
2209  08e6 cd0000        	call	_ioCommSetDir
2211                     ; 912 				 GPIO_WriteHigh(COMM);
2213  08e9 4b20          	push	#32
2214  08eb ae5000        	ldw	x,#20480
2215  08ee cd0000        	call	_GPIO_WriteHigh
2217  08f1 84            	pop	a
2218  08f2 acda1fda      	jpf	L353
2219  08f6               L16:
2220                     ; 918 		 case 23:
2220                     ; 919 		    
2220                     ; 920 			 if(ack){
2222  08f6 3d0b          	tnz	_ack
2223  08f8 2727          	jreq	L125
2224                     ; 922 				 ack   = FALSE;
2226  08fa 3f0b          	clr	_ack
2227                     ; 923 				 state = DELAY;
2229  08fc 35520000      	mov	_state,#82
2230                     ; 924 				 stack = 24;
2232  0900 35180001      	mov	_stack,#24
2233                     ; 926 				 timerReset (1);
2235  0904 a601          	ld	a,#1
2236  0906 cd0000        	call	_timerReset
2238                     ; 928 				 timerReset (3);
2240  0909 a603          	ld	a,#3
2241  090b cd0000        	call	_timerReset
2243                     ; 929 				 timerEnable(3, ENABLE);	
2245  090e ae0301        	ldw	x,#769
2246  0911 cd0000        	call	_timerEnable
2248                     ; 931 				 ioCommSetDir(OUTPUT);
2250  0914 4f            	clr	a
2251  0915 cd0000        	call	_ioCommSetDir
2253                     ; 933 				 GPIO_WriteHigh(COMM);
2255  0918 4b20          	push	#32
2256  091a ae5000        	ldw	x,#20480
2257  091d cd0000        	call	_GPIO_WriteHigh
2259  0920 84            	pop	a
2260  0921               L125:
2261                     ; 937 			 if(timerGetOverflow(1)){
2263  0921 a601          	ld	a,#1
2264  0923 cd0000        	call	_timerGetOverflow
2266  0926 4d            	tnz	a
2267  0927 2603          	jrne	L611
2268  0929 cc1fda        	jp	L353
2269  092c               L611:
2270                     ; 939 				 *control = 13;
2272  092c 1e01          	ldw	x,(OFST+1,sp)
2273  092e a60d          	ld	a,#13
2274  0930 f7            	ld	(x),a
2275                     ; 940 				  state   = FINISH;
2277  0931 35510000      	mov	_state,#81
2278  0935 acda1fda      	jpf	L353
2279  0939               L36:
2280                     ; 946 		 case 24:
2280                     ; 947 		    
2280                     ; 948 			 if(ack){
2282  0939 3d0b          	tnz	_ack
2283  093b 2727          	jreq	L525
2284                     ; 950 				 ack   = FALSE;
2286  093d 3f0b          	clr	_ack
2287                     ; 951 				 state = DELAY;
2289  093f 35520000      	mov	_state,#82
2290                     ; 952 				 stack = 25;
2292  0943 35190001      	mov	_stack,#25
2293                     ; 954 				 timerReset (1);
2295  0947 a601          	ld	a,#1
2296  0949 cd0000        	call	_timerReset
2298                     ; 956 				 timerReset (3);
2300  094c a603          	ld	a,#3
2301  094e cd0000        	call	_timerReset
2303                     ; 957 				 timerEnable(3, ENABLE);
2305  0951 ae0301        	ldw	x,#769
2306  0954 cd0000        	call	_timerEnable
2308                     ; 959 				 ioCommSetDir(OUTPUT);
2310  0957 4f            	clr	a
2311  0958 cd0000        	call	_ioCommSetDir
2313                     ; 961 				 GPIO_WriteHigh(COMM);
2315  095b 4b20          	push	#32
2316  095d ae5000        	ldw	x,#20480
2317  0960 cd0000        	call	_GPIO_WriteHigh
2319  0963 84            	pop	a
2320  0964               L525:
2321                     ; 965 			 if(timerGetOverflow(1)){
2323  0964 a601          	ld	a,#1
2324  0966 cd0000        	call	_timerGetOverflow
2326  0969 4d            	tnz	a
2327  096a 2603          	jrne	L021
2328  096c cc1fda        	jp	L353
2329  096f               L021:
2330                     ; 967 				 *control = 14;
2332  096f 1e01          	ldw	x,(OFST+1,sp)
2333  0971 a60e          	ld	a,#14
2334  0973 f7            	ld	(x),a
2335                     ; 968 				  state   = FINISH;
2337  0974 35510000      	mov	_state,#81
2338  0978 acda1fda      	jpf	L353
2339  097c               L56:
2340                     ; 974 		 case 25:
2340                     ; 975 		    
2340                     ; 976 			 if(ack){
2342  097c 3d0b          	tnz	_ack
2343  097e 2727          	jreq	L135
2344                     ; 978 				 ack   = FALSE;
2346  0980 3f0b          	clr	_ack
2347                     ; 979 				 state = DELAY;
2349  0982 35520000      	mov	_state,#82
2350                     ; 980 				 stack = 26;
2352  0986 351a0001      	mov	_stack,#26
2353                     ; 982 				 timerReset (1);
2355  098a a601          	ld	a,#1
2356  098c cd0000        	call	_timerReset
2358                     ; 984 				 timerReset (3);
2360  098f a603          	ld	a,#3
2361  0991 cd0000        	call	_timerReset
2363                     ; 985 				 timerEnable(3, ENABLE);
2365  0994 ae0301        	ldw	x,#769
2366  0997 cd0000        	call	_timerEnable
2368                     ; 987 				 ioCommSetDir(OUTPUT);
2370  099a 4f            	clr	a
2371  099b cd0000        	call	_ioCommSetDir
2373                     ; 989 				 GPIO_WriteHigh(COMM);
2375  099e 4b20          	push	#32
2376  09a0 ae5000        	ldw	x,#20480
2377  09a3 cd0000        	call	_GPIO_WriteHigh
2379  09a6 84            	pop	a
2380  09a7               L135:
2381                     ; 993 			 if(timerGetOverflow(1)){
2383  09a7 a601          	ld	a,#1
2384  09a9 cd0000        	call	_timerGetOverflow
2386  09ac 4d            	tnz	a
2387  09ad 2603          	jrne	L221
2388  09af cc1fda        	jp	L353
2389  09b2               L221:
2390                     ; 995 				 *control = 15;
2392  09b2 1e01          	ldw	x,(OFST+1,sp)
2393  09b4 a60f          	ld	a,#15
2394  09b6 f7            	ld	(x),a
2395                     ; 996 				  state   = FINISH;
2397  09b7 35510000      	mov	_state,#81
2398  09bb acda1fda      	jpf	L353
2399  09bf               L76:
2400                     ; 1002 		 case 26:
2400                     ; 1003 		    
2400                     ; 1004 			 if(ack){
2402  09bf 3d0b          	tnz	_ack
2403  09c1 2727          	jreq	L535
2404                     ; 1006 				 ack   = FALSE;
2406  09c3 3f0b          	clr	_ack
2407                     ; 1007 				 state = DELAY;
2409  09c5 35520000      	mov	_state,#82
2410                     ; 1008 				 stack = 27;
2412  09c9 351b0001      	mov	_stack,#27
2413                     ; 1010 				 timerReset (1);
2415  09cd a601          	ld	a,#1
2416  09cf cd0000        	call	_timerReset
2418                     ; 1012 				 timerReset (3);
2420  09d2 a603          	ld	a,#3
2421  09d4 cd0000        	call	_timerReset
2423                     ; 1013 				 timerEnable(3, ENABLE);
2425  09d7 ae0301        	ldw	x,#769
2426  09da cd0000        	call	_timerEnable
2428                     ; 1015 				 ioCommSetDir(OUTPUT);
2430  09dd 4f            	clr	a
2431  09de cd0000        	call	_ioCommSetDir
2433                     ; 1017 				 GPIO_WriteHigh(COMM);
2435  09e1 4b20          	push	#32
2436  09e3 ae5000        	ldw	x,#20480
2437  09e6 cd0000        	call	_GPIO_WriteHigh
2439  09e9 84            	pop	a
2440  09ea               L535:
2441                     ; 1021 			 if(timerGetOverflow(1)){
2443  09ea a601          	ld	a,#1
2444  09ec cd0000        	call	_timerGetOverflow
2446  09ef 4d            	tnz	a
2447  09f0 2603          	jrne	L421
2448  09f2 cc1fda        	jp	L353
2449  09f5               L421:
2450                     ; 1023 				 *control = 16;
2452  09f5 1e01          	ldw	x,(OFST+1,sp)
2453  09f7 a610          	ld	a,#16
2454  09f9 f7            	ld	(x),a
2455                     ; 1024 				  state   = FINISH;
2457  09fa 35510000      	mov	_state,#81
2458  09fe acda1fda      	jpf	L353
2459  0a02               L17:
2460                     ; 1030 		 case 27:
2460                     ; 1031 		    
2460                     ; 1032 			 if(ack){
2462  0a02 3d0b          	tnz	_ack
2463  0a04 2727          	jreq	L145
2464                     ; 1034 				 ack      = FALSE;
2466  0a06 3f0b          	clr	_ack
2467                     ; 1035 				 state    = DELAY;
2469  0a08 35520000      	mov	_state,#82
2470                     ; 1036 				 stack    = 28;
2472  0a0c 351c0001      	mov	_stack,#28
2473                     ; 1038 				 timerReset (1);
2475  0a10 a601          	ld	a,#1
2476  0a12 cd0000        	call	_timerReset
2478                     ; 1040 				 timerReset (3);
2480  0a15 a603          	ld	a,#3
2481  0a17 cd0000        	call	_timerReset
2483                     ; 1041 				 timerEnable(3, ENABLE);
2485  0a1a ae0301        	ldw	x,#769
2486  0a1d cd0000        	call	_timerEnable
2488                     ; 1043 				 ioCommSetDir(OUTPUT);
2490  0a20 4f            	clr	a
2491  0a21 cd0000        	call	_ioCommSetDir
2493                     ; 1045 				 GPIO_WriteHigh(COMM);
2495  0a24 4b20          	push	#32
2496  0a26 ae5000        	ldw	x,#20480
2497  0a29 cd0000        	call	_GPIO_WriteHigh
2499  0a2c 84            	pop	a
2500  0a2d               L145:
2501                     ; 1049 			 if(timerGetOverflow(1)){
2503  0a2d a601          	ld	a,#1
2504  0a2f cd0000        	call	_timerGetOverflow
2506  0a32 4d            	tnz	a
2507  0a33 2603          	jrne	L621
2508  0a35 cc1fda        	jp	L353
2509  0a38               L621:
2510                     ; 1051 				 *control = 17;
2512  0a38 1e01          	ldw	x,(OFST+1,sp)
2513  0a3a a611          	ld	a,#17
2514  0a3c f7            	ld	(x),a
2515                     ; 1052 				  state   = FINISH;
2517  0a3d 35510000      	mov	_state,#81
2518  0a41 acda1fda      	jpf	L353
2519  0a45               L37:
2520                     ; 1058 		 case 28:
2520                     ; 1059 		    
2520                     ; 1060 			 if(ack){
2522  0a45 3d0b          	tnz	_ack
2523  0a47 2727          	jreq	L545
2524                     ; 1062 				 ack   = FALSE;	
2526  0a49 3f0b          	clr	_ack
2527                     ; 1063 				 state = DELAY;
2529  0a4b 35520000      	mov	_state,#82
2530                     ; 1064 				 stack = 29;
2532  0a4f 351d0001      	mov	_stack,#29
2533                     ; 1066 				 timerReset (1);
2535  0a53 a601          	ld	a,#1
2536  0a55 cd0000        	call	_timerReset
2538                     ; 1068 				 timerReset (3);
2540  0a58 a603          	ld	a,#3
2541  0a5a cd0000        	call	_timerReset
2543                     ; 1069 				 timerEnable(3, ENABLE);
2545  0a5d ae0301        	ldw	x,#769
2546  0a60 cd0000        	call	_timerEnable
2548                     ; 1071 				 ioCommSetDir(OUTPUT);
2550  0a63 4f            	clr	a
2551  0a64 cd0000        	call	_ioCommSetDir
2553                     ; 1073 				 GPIO_WriteHigh(COMM);
2555  0a67 4b20          	push	#32
2556  0a69 ae5000        	ldw	x,#20480
2557  0a6c cd0000        	call	_GPIO_WriteHigh
2559  0a6f 84            	pop	a
2560  0a70               L545:
2561                     ; 1077 			 if(timerGetOverflow(1)){
2563  0a70 a601          	ld	a,#1
2564  0a72 cd0000        	call	_timerGetOverflow
2566  0a75 4d            	tnz	a
2567  0a76 2603          	jrne	L031
2568  0a78 cc1fda        	jp	L353
2569  0a7b               L031:
2570                     ; 1079 				 *control = 18;
2572  0a7b 1e01          	ldw	x,(OFST+1,sp)
2573  0a7d a612          	ld	a,#18
2574  0a7f f7            	ld	(x),a
2575                     ; 1080 				  state   = FINISH;
2577  0a80 35510000      	mov	_state,#81
2578  0a84 acda1fda      	jpf	L353
2579  0a88               L57:
2580                     ; 1086 		 case 29:
2580                     ; 1087 		    
2580                     ; 1088 			 if(ack){
2582  0a88 3d0b          	tnz	_ack
2583  0a8a 2727          	jreq	L155
2584                     ; 1090 				 ack   = FALSE;	
2586  0a8c 3f0b          	clr	_ack
2587                     ; 1091 				 state = DELAY;
2589  0a8e 35520000      	mov	_state,#82
2590                     ; 1092 				 stack = 30;
2592  0a92 351e0001      	mov	_stack,#30
2593                     ; 1094 				 timerReset (1);
2595  0a96 a601          	ld	a,#1
2596  0a98 cd0000        	call	_timerReset
2598                     ; 1096 				 timerReset (3);
2600  0a9b a603          	ld	a,#3
2601  0a9d cd0000        	call	_timerReset
2603                     ; 1097 				 timerEnable(3, ENABLE);
2605  0aa0 ae0301        	ldw	x,#769
2606  0aa3 cd0000        	call	_timerEnable
2608                     ; 1099 				 ioCommSetDir(OUTPUT);
2610  0aa6 4f            	clr	a
2611  0aa7 cd0000        	call	_ioCommSetDir
2613                     ; 1101 				 GPIO_WriteHigh(COMM);
2615  0aaa 4b20          	push	#32
2616  0aac ae5000        	ldw	x,#20480
2617  0aaf cd0000        	call	_GPIO_WriteHigh
2619  0ab2 84            	pop	a
2620  0ab3               L155:
2621                     ; 1105 			 if(timerGetOverflow(1)){
2623  0ab3 a601          	ld	a,#1
2624  0ab5 cd0000        	call	_timerGetOverflow
2626  0ab8 4d            	tnz	a
2627  0ab9 2603          	jrne	L231
2628  0abb cc1fda        	jp	L353
2629  0abe               L231:
2630                     ; 1107 				 *control = 19;
2632  0abe 1e01          	ldw	x,(OFST+1,sp)
2633  0ac0 a613          	ld	a,#19
2634  0ac2 f7            	ld	(x),a
2635                     ; 1108 				  state   = FINISH;
2637  0ac3 35510000      	mov	_state,#81
2638  0ac7 acda1fda      	jpf	L353
2639  0acb               L77:
2640                     ; 1114 		 case 30:
2640                     ; 1115 		    
2640                     ; 1116 			 if(ack){
2642  0acb 3d0b          	tnz	_ack
2643  0acd 2727          	jreq	L555
2644                     ; 1118 				 ack   = FALSE;
2646  0acf 3f0b          	clr	_ack
2647                     ; 1119 				 state = DELAY;
2649  0ad1 35520000      	mov	_state,#82
2650                     ; 1120 				 stack = 31;
2652  0ad5 351f0001      	mov	_stack,#31
2653                     ; 1122 				 timerReset (1);
2655  0ad9 a601          	ld	a,#1
2656  0adb cd0000        	call	_timerReset
2658                     ; 1124 				 timerReset (3);
2660  0ade a603          	ld	a,#3
2661  0ae0 cd0000        	call	_timerReset
2663                     ; 1125 				 timerEnable(3, ENABLE);	
2665  0ae3 ae0301        	ldw	x,#769
2666  0ae6 cd0000        	call	_timerEnable
2668                     ; 1127 				 ioCommSetDir(OUTPUT);
2670  0ae9 4f            	clr	a
2671  0aea cd0000        	call	_ioCommSetDir
2673                     ; 1129 				 GPIO_WriteHigh(COMM);
2675  0aed 4b20          	push	#32
2676  0aef ae5000        	ldw	x,#20480
2677  0af2 cd0000        	call	_GPIO_WriteHigh
2679  0af5 84            	pop	a
2680  0af6               L555:
2681                     ; 1133 			 if(timerGetOverflow(1)){
2683  0af6 a601          	ld	a,#1
2684  0af8 cd0000        	call	_timerGetOverflow
2686  0afb 4d            	tnz	a
2687  0afc 2603          	jrne	L431
2688  0afe cc1fda        	jp	L353
2689  0b01               L431:
2690                     ; 1135 				 *control = 20;
2692  0b01 1e01          	ldw	x,(OFST+1,sp)
2693  0b03 a614          	ld	a,#20
2694  0b05 f7            	ld	(x),a
2695                     ; 1136 				  state   = FINISH;
2697  0b06 35510000      	mov	_state,#81
2698  0b0a acda1fda      	jpf	L353
2699  0b0e               L101:
2700                     ; 1142 		 case 31:
2700                     ; 1143 		    
2700                     ; 1144 			 if(ack){
2702  0b0e 3d0b          	tnz	_ack
2703  0b10 2760          	jreq	L165
2704                     ; 1146 				 ack   = FALSE;
2706  0b12 3f0b          	clr	_ack
2707                     ; 1147 				 state = DELAY;
2709  0b14 35520000      	mov	_state,#82
2710                     ; 1148 				 stack = 32;
2712  0b18 35200001      	mov	_stack,#32
2713                     ; 1150 				 timerReset           (1);
2715  0b1c a601          	ld	a,#1
2716  0b1e cd0000        	call	_timerReset
2718                     ; 1151 				 timerSetOverflowValue(1, 200);
2720  0b21 ae00c8        	ldw	x,#200
2721  0b24 89            	pushw	x
2722  0b25 ae0000        	ldw	x,#0
2723  0b28 89            	pushw	x
2724  0b29 a601          	ld	a,#1
2725  0b2b cd0000        	call	_timerSetOverflowValue
2727  0b2e 5b04          	addw	sp,#4
2728                     ; 1153 				 timerReset           (3);				 
2730  0b30 a603          	ld	a,#3
2731  0b32 cd0000        	call	_timerReset
2733                     ; 1154 				 timerSetOverflowValue(3, 100);
2735  0b35 ae0064        	ldw	x,#100
2736  0b38 89            	pushw	x
2737  0b39 ae0000        	ldw	x,#0
2738  0b3c 89            	pushw	x
2739  0b3d a603          	ld	a,#3
2740  0b3f cd0000        	call	_timerSetOverflowValue
2742  0b42 5b04          	addw	sp,#4
2743                     ; 1155 				 timerEnable          (3, ENABLE);
2745  0b44 ae0301        	ldw	x,#769
2746  0b47 cd0000        	call	_timerEnable
2748                     ; 1157 				 GPIO_WriteLow (SW_P);
2750  0b4a 4b20          	push	#32
2751  0b4c ae500a        	ldw	x,#20490
2752  0b4f cd0000        	call	_GPIO_WriteLow
2754  0b52 84            	pop	a
2755                     ; 1158          GPIO_WriteHigh(CH1);   				 
2757  0b53 4b40          	push	#64
2758  0b55 ae500a        	ldw	x,#20490
2759  0b58 cd0000        	call	_GPIO_WriteHigh
2761  0b5b 84            	pop	a
2762                     ; 1159 				 GPIO_WriteHigh(I_MOT);
2764  0b5c 4b08          	push	#8
2765  0b5e ae5000        	ldw	x,#20480
2766  0b61 cd0000        	call	_GPIO_WriteHigh
2768  0b64 84            	pop	a
2769                     ; 1161 				 ioCommSetDir(OUTPUT);
2771  0b65 4f            	clr	a
2772  0b66 cd0000        	call	_ioCommSetDir
2774                     ; 1163 				 GPIO_WriteHigh(COMM);
2776  0b69 4b20          	push	#32
2777  0b6b ae5000        	ldw	x,#20480
2778  0b6e cd0000        	call	_GPIO_WriteHigh
2780  0b71 84            	pop	a
2781  0b72               L165:
2782                     ; 1167 			 if(timerGetOverflow(1)){
2784  0b72 a601          	ld	a,#1
2785  0b74 cd0000        	call	_timerGetOverflow
2787  0b77 4d            	tnz	a
2788  0b78 2603          	jrne	L631
2789  0b7a cc1fda        	jp	L353
2790  0b7d               L631:
2791                     ; 1169 				 *control = 21;
2793  0b7d 1e01          	ldw	x,(OFST+1,sp)
2794  0b7f a615          	ld	a,#21
2795  0b81 f7            	ld	(x),a
2796                     ; 1170 				  state   = FINISH;
2798  0b82 35510000      	mov	_state,#81
2799  0b86 acda1fda      	jpf	L353
2800  0b8a               L301:
2801                     ; 1176 		 case 32:
2801                     ; 1177 		    
2801                     ; 1178 			 if(ack){
2803  0b8a 3d0b          	tnz	_ack
2804  0b8c 2739          	jreq	L565
2805                     ; 1180 				 ack   = FALSE;	
2807  0b8e 3f0b          	clr	_ack
2808                     ; 1181 				 state = DELAY;
2810  0b90 35520000      	mov	_state,#82
2811                     ; 1182 				 stack = 36;
2813  0b94 35240001      	mov	_stack,#36
2814                     ; 1184 				 timerReset (1);
2816  0b98 a601          	ld	a,#1
2817  0b9a cd0000        	call	_timerReset
2819                     ; 1186 				 timerReset (3);
2821  0b9d a603          	ld	a,#3
2822  0b9f cd0000        	call	_timerReset
2824                     ; 1187 				 timerEnable(3, ENABLE);
2826  0ba2 ae0301        	ldw	x,#769
2827  0ba5 cd0000        	call	_timerEnable
2829                     ; 1189 				 GPIO_WriteLow (CH1);
2831  0ba8 4b40          	push	#64
2832  0baa ae500a        	ldw	x,#20490
2833  0bad cd0000        	call	_GPIO_WriteLow
2835  0bb0 84            	pop	a
2836                     ; 1190 				 GPIO_WriteHigh(CH2);
2838  0bb1 4b10          	push	#16
2839  0bb3 ae500a        	ldw	x,#20490
2840  0bb6 cd0000        	call	_GPIO_WriteHigh
2842  0bb9 84            	pop	a
2843                     ; 1192 				 ioCommSetDir(OUTPUT);
2845  0bba 4f            	clr	a
2846  0bbb cd0000        	call	_ioCommSetDir
2848                     ; 1194 				 GPIO_WriteHigh(COMM);	 				 
2850  0bbe 4b20          	push	#32
2851  0bc0 ae5000        	ldw	x,#20480
2852  0bc3 cd0000        	call	_GPIO_WriteHigh
2854  0bc6 84            	pop	a
2855  0bc7               L565:
2856                     ; 1198 			 if(timerGetOverflow(1)){
2858  0bc7 a601          	ld	a,#1
2859  0bc9 cd0000        	call	_timerGetOverflow
2861  0bcc 4d            	tnz	a
2862  0bcd 2603          	jrne	L041
2863  0bcf cc1fda        	jp	L353
2864  0bd2               L041:
2865                     ; 1200 				 state = DELAY;
2867  0bd2 35520000      	mov	_state,#82
2868                     ; 1201 				 stack = 33;
2870  0bd6 35210001      	mov	_stack,#33
2871                     ; 1203 				 timerReset (1);
2873  0bda a601          	ld	a,#1
2874  0bdc cd0000        	call	_timerReset
2876                     ; 1205 				 timerReset (3);
2878  0bdf a603          	ld	a,#3
2879  0be1 cd0000        	call	_timerReset
2881                     ; 1206 				 timerEnable(3, ENABLE);
2883  0be4 ae0301        	ldw	x,#769
2884  0be7 cd0000        	call	_timerEnable
2886                     ; 1208 				 ioCommSetDir(OUTPUT);
2888  0bea 4f            	clr	a
2889  0beb cd0000        	call	_ioCommSetDir
2891                     ; 1210 				 GPIO_WriteHigh(COMM);
2893  0bee 4b20          	push	#32
2894  0bf0 ae5000        	ldw	x,#20480
2895  0bf3 cd0000        	call	_GPIO_WriteHigh
2897  0bf6 84            	pop	a
2898  0bf7 acda1fda      	jpf	L353
2899  0bfb               L501:
2900                     ; 1216 		 case 33:
2900                     ; 1217 		    
2900                     ; 1218 			 if(ack){
2902  0bfb 3d0b          	tnz	_ack
2903  0bfd 2727          	jreq	L175
2904                     ; 1220 				 ack   = FALSE;	
2906  0bff 3f0b          	clr	_ack
2907                     ; 1221 				 state = DELAY;
2909  0c01 35520000      	mov	_state,#82
2910                     ; 1222 				 stack = 34;
2912  0c05 35220001      	mov	_stack,#34
2913                     ; 1224 				 timerReset (1);
2915  0c09 a601          	ld	a,#1
2916  0c0b cd0000        	call	_timerReset
2918                     ; 1226 				 timerReset (3);
2920  0c0e a603          	ld	a,#3
2921  0c10 cd0000        	call	_timerReset
2923                     ; 1227 				 timerEnable(3, ENABLE);
2925  0c13 ae0301        	ldw	x,#769
2926  0c16 cd0000        	call	_timerEnable
2928                     ; 1229 				 ioCommSetDir(OUTPUT);
2930  0c19 4f            	clr	a
2931  0c1a cd0000        	call	_ioCommSetDir
2933                     ; 1231 				 GPIO_WriteHigh(COMM);	 				 
2935  0c1d 4b20          	push	#32
2936  0c1f ae5000        	ldw	x,#20480
2937  0c22 cd0000        	call	_GPIO_WriteHigh
2939  0c25 84            	pop	a
2940  0c26               L175:
2941                     ; 1235 			 if(timerGetOverflow(1)){
2943  0c26 a601          	ld	a,#1
2944  0c28 cd0000        	call	_timerGetOverflow
2946  0c2b 4d            	tnz	a
2947  0c2c 2603          	jrne	L241
2948  0c2e cc1fda        	jp	L353
2949  0c31               L241:
2950                     ; 1237 				 *control = 22;
2952  0c31 1e01          	ldw	x,(OFST+1,sp)
2953  0c33 a616          	ld	a,#22
2954  0c35 f7            	ld	(x),a
2955                     ; 1238 				 state    = FINISH;
2957  0c36 35510000      	mov	_state,#81
2958  0c3a acda1fda      	jpf	L353
2959  0c3e               L701:
2960                     ; 1244 		 case 34:
2960                     ; 1245 		    
2960                     ; 1246 			 if(ack){
2962  0c3e 3d0b          	tnz	_ack
2963  0c40 2727          	jreq	L575
2964                     ; 1248 				 ack   = FALSE;	
2966  0c42 3f0b          	clr	_ack
2967                     ; 1249 				 state = DELAY;
2969  0c44 35520000      	mov	_state,#82
2970                     ; 1250 				 stack = 35;
2972  0c48 35230001      	mov	_stack,#35
2973                     ; 1252 				 timerReset (1);
2975  0c4c a601          	ld	a,#1
2976  0c4e cd0000        	call	_timerReset
2978                     ; 1254 				 timerReset (3);
2980  0c51 a603          	ld	a,#3
2981  0c53 cd0000        	call	_timerReset
2983                     ; 1255 				 timerEnable(3, ENABLE);
2985  0c56 ae0301        	ldw	x,#769
2986  0c59 cd0000        	call	_timerEnable
2988                     ; 1257 				 ioCommSetDir(OUTPUT);
2990  0c5c 4f            	clr	a
2991  0c5d cd0000        	call	_ioCommSetDir
2993                     ; 1259 				 GPIO_WriteHigh(COMM);	 				 
2995  0c60 4b20          	push	#32
2996  0c62 ae5000        	ldw	x,#20480
2997  0c65 cd0000        	call	_GPIO_WriteHigh
2999  0c68 84            	pop	a
3000  0c69               L575:
3001                     ; 1263 			 if(timerGetOverflow(1)){
3003  0c69 a601          	ld	a,#1
3004  0c6b cd0000        	call	_timerGetOverflow
3006  0c6e 4d            	tnz	a
3007  0c6f 2603          	jrne	L441
3008  0c71 cc1fda        	jp	L353
3009  0c74               L441:
3010                     ; 1265 				 *control = 22;
3012  0c74 1e01          	ldw	x,(OFST+1,sp)
3013  0c76 a616          	ld	a,#22
3014  0c78 f7            	ld	(x),a
3015                     ; 1266 				 state    = FINISH;
3017  0c79 35510000      	mov	_state,#81
3018  0c7d acda1fda      	jpf	L353
3019  0c81               L111:
3020                     ; 1272      case 35:
3020                     ; 1273 		    
3020                     ; 1274 			 if(ack){
3022  0c81 3d0b          	tnz	_ack
3023  0c83 2739          	jreq	L106
3024                     ; 1276 				 ack   = FALSE;	
3026  0c85 3f0b          	clr	_ack
3027                     ; 1277 				 state = DELAY;
3029  0c87 35520000      	mov	_state,#82
3030                     ; 1278 				 stack = 36;
3032  0c8b 35240001      	mov	_stack,#36
3033                     ; 1280 				 timerReset (1);
3035  0c8f a601          	ld	a,#1
3036  0c91 cd0000        	call	_timerReset
3038                     ; 1282 				 timerReset (3);
3040  0c94 a603          	ld	a,#3
3041  0c96 cd0000        	call	_timerReset
3043                     ; 1283 				 timerEnable(3, ENABLE);
3045  0c99 ae0301        	ldw	x,#769
3046  0c9c cd0000        	call	_timerEnable
3048                     ; 1285 				 GPIO_WriteLow (CH1);
3050  0c9f 4b40          	push	#64
3051  0ca1 ae500a        	ldw	x,#20490
3052  0ca4 cd0000        	call	_GPIO_WriteLow
3054  0ca7 84            	pop	a
3055                     ; 1286 				 GPIO_WriteHigh(CH2);
3057  0ca8 4b10          	push	#16
3058  0caa ae500a        	ldw	x,#20490
3059  0cad cd0000        	call	_GPIO_WriteHigh
3061  0cb0 84            	pop	a
3062                     ; 1288 				 ioCommSetDir(OUTPUT);
3064  0cb1 4f            	clr	a
3065  0cb2 cd0000        	call	_ioCommSetDir
3067                     ; 1290 				 GPIO_WriteHigh(COMM);	 				 
3069  0cb5 4b20          	push	#32
3070  0cb7 ae5000        	ldw	x,#20480
3071  0cba cd0000        	call	_GPIO_WriteHigh
3073  0cbd 84            	pop	a
3074  0cbe               L106:
3075                     ; 1294 			 if(timerGetOverflow(1)){
3077  0cbe a601          	ld	a,#1
3078  0cc0 cd0000        	call	_timerGetOverflow
3080  0cc3 4d            	tnz	a
3081  0cc4 2603          	jrne	L641
3082  0cc6 cc1fda        	jp	L353
3083  0cc9               L641:
3084                     ; 1296 				 *control = 22;
3086  0cc9 1e01          	ldw	x,(OFST+1,sp)
3087  0ccb a616          	ld	a,#22
3088  0ccd f7            	ld	(x),a
3089                     ; 1297 				  state   = FINISH;
3091  0cce 35510000      	mov	_state,#81
3092  0cd2 acda1fda      	jpf	L353
3093  0cd6               L311:
3094                     ; 1303 		 case 36:
3094                     ; 1304 		    
3094                     ; 1305 			 if(ack){
3096  0cd6 3d0b          	tnz	_ack
3097  0cd8 2739          	jreq	L506
3098                     ; 1307 				 ack   = FALSE;	
3100  0cda 3f0b          	clr	_ack
3101                     ; 1308 				 state = DELAY;
3103  0cdc 35520000      	mov	_state,#82
3104                     ; 1309 				 stack = 40;
3106  0ce0 35280001      	mov	_stack,#40
3107                     ; 1311 				 timerReset (1);
3109  0ce4 a601          	ld	a,#1
3110  0ce6 cd0000        	call	_timerReset
3112                     ; 1313 				 timerReset (3);
3114  0ce9 a603          	ld	a,#3
3115  0ceb cd0000        	call	_timerReset
3117                     ; 1314 				 timerEnable(3, ENABLE);
3119  0cee ae0301        	ldw	x,#769
3120  0cf1 cd0000        	call	_timerEnable
3122                     ; 1316 				 GPIO_WriteLow (CH2);
3124  0cf4 4b10          	push	#16
3125  0cf6 ae500a        	ldw	x,#20490
3126  0cf9 cd0000        	call	_GPIO_WriteLow
3128  0cfc 84            	pop	a
3129                     ; 1317 				 GPIO_WriteHigh(CH3);
3131  0cfd 4b04          	push	#4
3132  0cff ae500a        	ldw	x,#20490
3133  0d02 cd0000        	call	_GPIO_WriteHigh
3135  0d05 84            	pop	a
3136                     ; 1319 				 ioCommSetDir(OUTPUT);
3138  0d06 4f            	clr	a
3139  0d07 cd0000        	call	_ioCommSetDir
3141                     ; 1321 				 GPIO_WriteHigh(COMM);
3143  0d0a 4b20          	push	#32
3144  0d0c ae5000        	ldw	x,#20480
3145  0d0f cd0000        	call	_GPIO_WriteHigh
3147  0d12 84            	pop	a
3148  0d13               L506:
3149                     ; 1325 			 if(timerGetOverflow(1)){
3151  0d13 a601          	ld	a,#1
3152  0d15 cd0000        	call	_timerGetOverflow
3154  0d18 4d            	tnz	a
3155  0d19 2603          	jrne	L051
3156  0d1b cc1fda        	jp	L353
3157  0d1e               L051:
3158                     ; 1327 				 state = DELAY;
3160  0d1e 35520000      	mov	_state,#82
3161                     ; 1328 				 stack = 37;
3163  0d22 35250001      	mov	_stack,#37
3164                     ; 1330 				 timerReset (1);
3166  0d26 a601          	ld	a,#1
3167  0d28 cd0000        	call	_timerReset
3169                     ; 1332 				 timerReset (3);
3171  0d2b a603          	ld	a,#3
3172  0d2d cd0000        	call	_timerReset
3174                     ; 1333 				 timerEnable(3, ENABLE);
3176  0d30 ae0301        	ldw	x,#769
3177  0d33 cd0000        	call	_timerEnable
3179                     ; 1335 				 ioCommSetDir(OUTPUT);
3181  0d36 4f            	clr	a
3182  0d37 cd0000        	call	_ioCommSetDir
3184                     ; 1337 				 GPIO_WriteHigh(COMM);
3186  0d3a 4b20          	push	#32
3187  0d3c ae5000        	ldw	x,#20480
3188  0d3f cd0000        	call	_GPIO_WriteHigh
3190  0d42 84            	pop	a
3191  0d43 acda1fda      	jpf	L353
3192  0d47               L511:
3193                     ; 1343      case 37:
3193                     ; 1344 		    
3193                     ; 1345 			 if(ack){
3195  0d47 3d0b          	tnz	_ack
3196  0d49 2727          	jreq	L116
3197                     ; 1347 				 ack   = FALSE;	
3199  0d4b 3f0b          	clr	_ack
3200                     ; 1348 				 state = DELAY;
3202  0d4d 35520000      	mov	_state,#82
3203                     ; 1349 				 stack = 38;
3205  0d51 35260001      	mov	_stack,#38
3206                     ; 1351 				 timerReset (1);
3208  0d55 a601          	ld	a,#1
3209  0d57 cd0000        	call	_timerReset
3211                     ; 1353 				 timerReset (3);
3213  0d5a a603          	ld	a,#3
3214  0d5c cd0000        	call	_timerReset
3216                     ; 1354 				 timerEnable(3, ENABLE);
3218  0d5f ae0301        	ldw	x,#769
3219  0d62 cd0000        	call	_timerEnable
3221                     ; 1356 				 ioCommSetDir(OUTPUT);
3223  0d65 4f            	clr	a
3224  0d66 cd0000        	call	_ioCommSetDir
3226                     ; 1358 				 GPIO_WriteHigh(COMM);
3228  0d69 4b20          	push	#32
3229  0d6b ae5000        	ldw	x,#20480
3230  0d6e cd0000        	call	_GPIO_WriteHigh
3232  0d71 84            	pop	a
3233  0d72               L116:
3234                     ; 1362 			 if(timerGetOverflow(1)){
3236  0d72 a601          	ld	a,#1
3237  0d74 cd0000        	call	_timerGetOverflow
3239  0d77 4d            	tnz	a
3240  0d78 2603          	jrne	L251
3241  0d7a cc1fda        	jp	L353
3242  0d7d               L251:
3243                     ; 1364 				 *control = 23;
3245  0d7d 1e01          	ldw	x,(OFST+1,sp)
3246  0d7f a617          	ld	a,#23
3247  0d81 f7            	ld	(x),a
3248                     ; 1365 				 state    = FINISH;
3250  0d82 35510000      	mov	_state,#81
3251  0d86 acda1fda      	jpf	L353
3252  0d8a               L711:
3253                     ; 1371      case 38:
3253                     ; 1372 		    
3253                     ; 1373 			 if(ack){
3255  0d8a 3d0b          	tnz	_ack
3256  0d8c 2727          	jreq	L516
3257                     ; 1375 				 ack   = FALSE;	
3259  0d8e 3f0b          	clr	_ack
3260                     ; 1376 				 state = DELAY;
3262  0d90 35520000      	mov	_state,#82
3263                     ; 1377 				 stack = 39;
3265  0d94 35270001      	mov	_stack,#39
3266                     ; 1379 				 timerReset (1);
3268  0d98 a601          	ld	a,#1
3269  0d9a cd0000        	call	_timerReset
3271                     ; 1381 				 timerReset (3);
3273  0d9d a603          	ld	a,#3
3274  0d9f cd0000        	call	_timerReset
3276                     ; 1382 				 timerEnable(3, ENABLE);
3278  0da2 ae0301        	ldw	x,#769
3279  0da5 cd0000        	call	_timerEnable
3281                     ; 1384 				 ioCommSetDir(OUTPUT);
3283  0da8 4f            	clr	a
3284  0da9 cd0000        	call	_ioCommSetDir
3286                     ; 1386 				 GPIO_WriteHigh(COMM);
3288  0dac 4b20          	push	#32
3289  0dae ae5000        	ldw	x,#20480
3290  0db1 cd0000        	call	_GPIO_WriteHigh
3292  0db4 84            	pop	a
3293  0db5               L516:
3294                     ; 1390 			 if(timerGetOverflow(1)){
3296  0db5 a601          	ld	a,#1
3297  0db7 cd0000        	call	_timerGetOverflow
3299  0dba 4d            	tnz	a
3300  0dbb 2603          	jrne	L451
3301  0dbd cc1fda        	jp	L353
3302  0dc0               L451:
3303                     ; 1392 				 *control = 23;
3305  0dc0 1e01          	ldw	x,(OFST+1,sp)
3306  0dc2 a617          	ld	a,#23
3307  0dc4 f7            	ld	(x),a
3308                     ; 1393 					state   = FINISH;
3310  0dc5 35510000      	mov	_state,#81
3311  0dc9 acda1fda      	jpf	L353
3312  0dcd               L121:
3313                     ; 1399      case 39:
3313                     ; 1400 		    
3313                     ; 1401 			 if(ack){
3315  0dcd 3d0b          	tnz	_ack
3316  0dcf 2739          	jreq	L126
3317                     ; 1403 				 ack   = FALSE;	
3319  0dd1 3f0b          	clr	_ack
3320                     ; 1404 				 state = DELAY;
3322  0dd3 35520000      	mov	_state,#82
3323                     ; 1405 				 stack = 40;
3325  0dd7 35280001      	mov	_stack,#40
3326                     ; 1407 				 timerReset (1);
3328  0ddb a601          	ld	a,#1
3329  0ddd cd0000        	call	_timerReset
3331                     ; 1409 				 timerReset (3);
3333  0de0 a603          	ld	a,#3
3334  0de2 cd0000        	call	_timerReset
3336                     ; 1410 				 timerEnable(3, ENABLE);
3338  0de5 ae0301        	ldw	x,#769
3339  0de8 cd0000        	call	_timerEnable
3341                     ; 1412 				 GPIO_WriteLow (CH2);
3343  0deb 4b10          	push	#16
3344  0ded ae500a        	ldw	x,#20490
3345  0df0 cd0000        	call	_GPIO_WriteLow
3347  0df3 84            	pop	a
3348                     ; 1413 				 GPIO_WriteHigh(CH3);
3350  0df4 4b04          	push	#4
3351  0df6 ae500a        	ldw	x,#20490
3352  0df9 cd0000        	call	_GPIO_WriteHigh
3354  0dfc 84            	pop	a
3355                     ; 1415 				 ioCommSetDir(OUTPUT);
3357  0dfd 4f            	clr	a
3358  0dfe cd0000        	call	_ioCommSetDir
3360                     ; 1417 				 GPIO_WriteHigh(COMM);
3362  0e01 4b20          	push	#32
3363  0e03 ae5000        	ldw	x,#20480
3364  0e06 cd0000        	call	_GPIO_WriteHigh
3366  0e09 84            	pop	a
3367  0e0a               L126:
3368                     ; 1421 			 if(timerGetOverflow(1)){
3370  0e0a a601          	ld	a,#1
3371  0e0c cd0000        	call	_timerGetOverflow
3373  0e0f 4d            	tnz	a
3374  0e10 2603          	jrne	L651
3375  0e12 cc1fda        	jp	L353
3376  0e15               L651:
3377                     ; 1423 				 timerReset(1);
3379  0e15 a601          	ld	a,#1
3380  0e17 cd0000        	call	_timerReset
3382                     ; 1425 				 *control = 23;
3384  0e1a 1e01          	ldw	x,(OFST+1,sp)
3385  0e1c a617          	ld	a,#23
3386  0e1e f7            	ld	(x),a
3387                     ; 1426 					state   = FINISH;
3389  0e1f 35510000      	mov	_state,#81
3390  0e23 acda1fda      	jpf	L353
3391  0e27               L321:
3392                     ; 1432 		 case 40:
3392                     ; 1433 		    
3392                     ; 1434 			 if(ack){
3394  0e27 3d0b          	tnz	_ack
3395  0e29 2739          	jreq	L526
3396                     ; 1436 				 ack   = FALSE;
3398  0e2b 3f0b          	clr	_ack
3399                     ; 1437 				 state = DELAY;
3401  0e2d 35520000      	mov	_state,#82
3402                     ; 1438 				 stack = 44;
3404  0e31 352c0001      	mov	_stack,#44
3405                     ; 1440 				 timerReset (1);
3407  0e35 a601          	ld	a,#1
3408  0e37 cd0000        	call	_timerReset
3410                     ; 1442 				 timerReset (3);
3412  0e3a a603          	ld	a,#3
3413  0e3c cd0000        	call	_timerReset
3415                     ; 1443 				 timerEnable(3, ENABLE);
3417  0e3f ae0301        	ldw	x,#769
3418  0e42 cd0000        	call	_timerEnable
3420                     ; 1445 				 GPIO_WriteLow (CH3);
3422  0e45 4b04          	push	#4
3423  0e47 ae500a        	ldw	x,#20490
3424  0e4a cd0000        	call	_GPIO_WriteLow
3426  0e4d 84            	pop	a
3427                     ; 1446 				 GPIO_WriteHigh(CH4);
3429  0e4e 4b20          	push	#32
3430  0e50 ae5014        	ldw	x,#20500
3431  0e53 cd0000        	call	_GPIO_WriteHigh
3433  0e56 84            	pop	a
3434                     ; 1448 				 ioCommSetDir(OUTPUT);
3436  0e57 4f            	clr	a
3437  0e58 cd0000        	call	_ioCommSetDir
3439                     ; 1450 				 GPIO_WriteHigh(COMM);
3441  0e5b 4b20          	push	#32
3442  0e5d ae5000        	ldw	x,#20480
3443  0e60 cd0000        	call	_GPIO_WriteHigh
3445  0e63 84            	pop	a
3446  0e64               L526:
3447                     ; 1454 			 if(timerGetOverflow(1)){
3449  0e64 a601          	ld	a,#1
3450  0e66 cd0000        	call	_timerGetOverflow
3452  0e69 4d            	tnz	a
3453  0e6a 2603          	jrne	L061
3454  0e6c cc1fda        	jp	L353
3455  0e6f               L061:
3456                     ; 1456 				 state = DELAY;
3458  0e6f 35520000      	mov	_state,#82
3459                     ; 1457 				 stack = 41;
3461  0e73 35290001      	mov	_stack,#41
3462                     ; 1459 				 timerReset (1);
3464  0e77 a601          	ld	a,#1
3465  0e79 cd0000        	call	_timerReset
3467                     ; 1461 				 timerReset (3);
3469  0e7c a603          	ld	a,#3
3470  0e7e cd0000        	call	_timerReset
3472                     ; 1462 				 timerEnable(3, ENABLE);
3474  0e81 ae0301        	ldw	x,#769
3475  0e84 cd0000        	call	_timerEnable
3477                     ; 1464 				 ioCommSetDir(OUTPUT);
3479  0e87 4f            	clr	a
3480  0e88 cd0000        	call	_ioCommSetDir
3482                     ; 1466 				 GPIO_WriteHigh(COMM);
3484  0e8b 4b20          	push	#32
3485  0e8d ae5000        	ldw	x,#20480
3486  0e90 cd0000        	call	_GPIO_WriteHigh
3488  0e93 84            	pop	a
3489  0e94 acda1fda      	jpf	L353
3490  0e98               L521:
3491                     ; 1472      case 41:
3491                     ; 1473 		    
3491                     ; 1474 			 if(ack){
3493  0e98 3d0b          	tnz	_ack
3494  0e9a 2727          	jreq	L136
3495                     ; 1476 				 ack   = FALSE;
3497  0e9c 3f0b          	clr	_ack
3498                     ; 1477 				 state = DELAY;
3500  0e9e 35520000      	mov	_state,#82
3501                     ; 1478 				 stack = 42;
3503  0ea2 352a0001      	mov	_stack,#42
3504                     ; 1480 				 timerReset (1);
3506  0ea6 a601          	ld	a,#1
3507  0ea8 cd0000        	call	_timerReset
3509                     ; 1482 				 timerReset (3);
3511  0eab a603          	ld	a,#3
3512  0ead cd0000        	call	_timerReset
3514                     ; 1483 				 timerEnable(3, ENABLE);
3516  0eb0 ae0301        	ldw	x,#769
3517  0eb3 cd0000        	call	_timerEnable
3519                     ; 1485 				 ioCommSetDir(OUTPUT);
3521  0eb6 4f            	clr	a
3522  0eb7 cd0000        	call	_ioCommSetDir
3524                     ; 1487 				 GPIO_WriteHigh(COMM);
3526  0eba 4b20          	push	#32
3527  0ebc ae5000        	ldw	x,#20480
3528  0ebf cd0000        	call	_GPIO_WriteHigh
3530  0ec2 84            	pop	a
3531  0ec3               L136:
3532                     ; 1491 			 if(timerGetOverflow(1)){
3534  0ec3 a601          	ld	a,#1
3535  0ec5 cd0000        	call	_timerGetOverflow
3537  0ec8 4d            	tnz	a
3538  0ec9 2603          	jrne	L261
3539  0ecb cc1fda        	jp	L353
3540  0ece               L261:
3541                     ; 1493 				 timerReset(1);
3543  0ece a601          	ld	a,#1
3544  0ed0 cd0000        	call	_timerReset
3546                     ; 1495 				 *control = 24;
3548  0ed3 1e01          	ldw	x,(OFST+1,sp)
3549  0ed5 a618          	ld	a,#24
3550  0ed7 f7            	ld	(x),a
3551                     ; 1496 				  state   = FINISH;
3553  0ed8 35510000      	mov	_state,#81
3554  0edc acda1fda      	jpf	L353
3555  0ee0               L721:
3556                     ; 1502      case 42:
3556                     ; 1503 		    
3556                     ; 1504 			 if(ack){
3558  0ee0 3d0b          	tnz	_ack
3559  0ee2 2727          	jreq	L536
3560                     ; 1506 				 ack   = FALSE;
3562  0ee4 3f0b          	clr	_ack
3563                     ; 1507 				 state = DELAY;
3565  0ee6 35520000      	mov	_state,#82
3566                     ; 1508 				 stack = 43;
3568  0eea 352b0001      	mov	_stack,#43
3569                     ; 1510 				 timerReset (1);
3571  0eee a601          	ld	a,#1
3572  0ef0 cd0000        	call	_timerReset
3574                     ; 1512 				 timerReset (3);
3576  0ef3 a603          	ld	a,#3
3577  0ef5 cd0000        	call	_timerReset
3579                     ; 1513 				 timerEnable(3, ENABLE);
3581  0ef8 ae0301        	ldw	x,#769
3582  0efb cd0000        	call	_timerEnable
3584                     ; 1515 				 ioCommSetDir(OUTPUT);
3586  0efe 4f            	clr	a
3587  0eff cd0000        	call	_ioCommSetDir
3589                     ; 1517 				 GPIO_WriteHigh(COMM);
3591  0f02 4b20          	push	#32
3592  0f04 ae5000        	ldw	x,#20480
3593  0f07 cd0000        	call	_GPIO_WriteHigh
3595  0f0a 84            	pop	a
3596  0f0b               L536:
3597                     ; 1521 			 if(timerGetOverflow(1)){
3599  0f0b a601          	ld	a,#1
3600  0f0d cd0000        	call	_timerGetOverflow
3602  0f10 4d            	tnz	a
3603  0f11 2603          	jrne	L461
3604  0f13 cc1fda        	jp	L353
3605  0f16               L461:
3606                     ; 1523 				 timerReset(1);
3608  0f16 a601          	ld	a,#1
3609  0f18 cd0000        	call	_timerReset
3611                     ; 1525 				 *control = 24;
3613  0f1b 1e01          	ldw	x,(OFST+1,sp)
3614  0f1d a618          	ld	a,#24
3615  0f1f f7            	ld	(x),a
3616                     ; 1526 				  state   = FINISH;
3618  0f20 35510000      	mov	_state,#81
3619  0f24 acda1fda      	jpf	L353
3620  0f28               L131:
3621                     ; 1532      case 43:
3621                     ; 1533 		    
3621                     ; 1534 			 if(ack){
3623  0f28 3d0b          	tnz	_ack
3624  0f2a 2739          	jreq	L146
3625                     ; 1536 				 ack   = FALSE;
3627  0f2c 3f0b          	clr	_ack
3628                     ; 1537 				 state = DELAY;
3630  0f2e 35520000      	mov	_state,#82
3631                     ; 1538 				 stack = 44;
3633  0f32 352c0001      	mov	_stack,#44
3634                     ; 1540 				 timerReset (1);
3636  0f36 a601          	ld	a,#1
3637  0f38 cd0000        	call	_timerReset
3639                     ; 1542 				 timerReset (3);
3641  0f3b a603          	ld	a,#3
3642  0f3d cd0000        	call	_timerReset
3644                     ; 1543 				 timerEnable(3, ENABLE);
3646  0f40 ae0301        	ldw	x,#769
3647  0f43 cd0000        	call	_timerEnable
3649                     ; 1545 				 GPIO_WriteLow (CH3);
3651  0f46 4b04          	push	#4
3652  0f48 ae500a        	ldw	x,#20490
3653  0f4b cd0000        	call	_GPIO_WriteLow
3655  0f4e 84            	pop	a
3656                     ; 1546 				 GPIO_WriteHigh(CH4);
3658  0f4f 4b20          	push	#32
3659  0f51 ae5014        	ldw	x,#20500
3660  0f54 cd0000        	call	_GPIO_WriteHigh
3662  0f57 84            	pop	a
3663                     ; 1548 				 ioCommSetDir(OUTPUT);
3665  0f58 4f            	clr	a
3666  0f59 cd0000        	call	_ioCommSetDir
3668                     ; 1550 				 GPIO_WriteHigh(COMM);
3670  0f5c 4b20          	push	#32
3671  0f5e ae5000        	ldw	x,#20480
3672  0f61 cd0000        	call	_GPIO_WriteHigh
3674  0f64 84            	pop	a
3675  0f65               L146:
3676                     ; 1554 			 if(timerGetOverflow(1)){
3678  0f65 a601          	ld	a,#1
3679  0f67 cd0000        	call	_timerGetOverflow
3681  0f6a 4d            	tnz	a
3682  0f6b 2603          	jrne	L661
3683  0f6d cc1fda        	jp	L353
3684  0f70               L661:
3685                     ; 1556 				 timerReset(1);
3687  0f70 a601          	ld	a,#1
3688  0f72 cd0000        	call	_timerReset
3690                     ; 1558 				 *control = 24;
3692  0f75 1e01          	ldw	x,(OFST+1,sp)
3693  0f77 a618          	ld	a,#24
3694  0f79 f7            	ld	(x),a
3695                     ; 1559 				  state   = FINISH;
3697  0f7a 35510000      	mov	_state,#81
3698  0f7e acda1fda      	jpf	L353
3699  0f82               L331:
3700                     ; 1565 		 case 44:
3700                     ; 1566 		    
3700                     ; 1567 			 if(ack){
3702  0f82 3d0b          	tnz	_ack
3703  0f84 276b          	jreq	L546
3704                     ; 1569 				 ack   = FALSE;
3706  0f86 3f0b          	clr	_ack
3707                     ; 1570 				 state = DELAY;
3709  0f88 35520000      	mov	_state,#82
3710                     ; 1571 				 stack = 48; 
3712  0f8c 35300001      	mov	_stack,#48
3713                     ; 1573 				 timerReset           (1);
3715  0f90 a601          	ld	a,#1
3716  0f92 cd0000        	call	_timerReset
3718                     ; 1574 				 timerSetOverflowValue(1, 400);
3720  0f95 ae0190        	ldw	x,#400
3721  0f98 89            	pushw	x
3722  0f99 ae0000        	ldw	x,#0
3723  0f9c 89            	pushw	x
3724  0f9d a601          	ld	a,#1
3725  0f9f cd0000        	call	_timerSetOverflowValue
3727  0fa2 5b04          	addw	sp,#4
3728                     ; 1576 				 timerReset           (3);
3730  0fa4 a603          	ld	a,#3
3731  0fa6 cd0000        	call	_timerReset
3733                     ; 1577 				 timerEnable          (3, ENABLE);
3735  0fa9 ae0301        	ldw	x,#769
3736  0fac cd0000        	call	_timerEnable
3738                     ; 1579 				 timerSetOverflowValue(4, 350);
3740  0faf ae015e        	ldw	x,#350
3741  0fb2 89            	pushw	x
3742  0fb3 ae0000        	ldw	x,#0
3743  0fb6 89            	pushw	x
3744  0fb7 a604          	ld	a,#4
3745  0fb9 cd0000        	call	_timerSetOverflowValue
3747  0fbc 5b04          	addw	sp,#4
3748                     ; 1580 				 timerReset           (4);
3750  0fbe a604          	ld	a,#4
3751  0fc0 cd0000        	call	_timerReset
3753                     ; 1581 				 timerEnable          (4, ENABLE);
3755  0fc3 ae0401        	ldw	x,#1025
3756  0fc6 cd0000        	call	_timerEnable
3758                     ; 1583          GPIO_WriteLow (CH4);
3760  0fc9 4b20          	push	#32
3761  0fcb ae5014        	ldw	x,#20500
3762  0fce cd0000        	call	_GPIO_WriteLow
3764  0fd1 84            	pop	a
3765                     ; 1584 				 GPIO_WriteLow (I_MOT);				 
3767  0fd2 4b08          	push	#8
3768  0fd4 ae5000        	ldw	x,#20480
3769  0fd7 cd0000        	call	_GPIO_WriteLow
3771  0fda 84            	pop	a
3772                     ; 1585 				 GPIO_WriteHigh(CH1);
3774  0fdb 4b40          	push	#64
3775  0fdd ae500a        	ldw	x,#20490
3776  0fe0 cd0000        	call	_GPIO_WriteHigh
3778  0fe3 84            	pop	a
3779                     ; 1587 				 ioCommSetDir(OUTPUT);
3781  0fe4 4f            	clr	a
3782  0fe5 cd0000        	call	_ioCommSetDir
3784                     ; 1589 				 GPIO_WriteHigh(COMM);
3786  0fe8 4b20          	push	#32
3787  0fea ae5000        	ldw	x,#20480
3788  0fed cd0000        	call	_GPIO_WriteHigh
3790  0ff0 84            	pop	a
3791  0ff1               L546:
3792                     ; 1593 			 if(timerGetOverflow(1)){
3794  0ff1 a601          	ld	a,#1
3795  0ff3 cd0000        	call	_timerGetOverflow
3797  0ff6 4d            	tnz	a
3798  0ff7 2603          	jrne	L071
3799  0ff9 cc1fda        	jp	L353
3800  0ffc               L071:
3801                     ; 1595 				 state = DELAY;
3803  0ffc 35520000      	mov	_state,#82
3804                     ; 1596 				 stack = 45;
3806  1000 352d0001      	mov	_stack,#45
3807                     ; 1598 				 timerReset (1);
3809  1004 a601          	ld	a,#1
3810  1006 cd0000        	call	_timerReset
3812                     ; 1600 				 timerReset (3);
3814  1009 a603          	ld	a,#3
3815  100b cd0000        	call	_timerReset
3817                     ; 1601 				 timerEnable(3, ENABLE);
3819  100e ae0301        	ldw	x,#769
3820  1011 cd0000        	call	_timerEnable
3822                     ; 1603 				 ioCommSetDir(OUTPUT);
3824  1014 4f            	clr	a
3825  1015 cd0000        	call	_ioCommSetDir
3827                     ; 1605 				 GPIO_WriteHigh(COMM);
3829  1018 4b20          	push	#32
3830  101a ae5000        	ldw	x,#20480
3831  101d cd0000        	call	_GPIO_WriteHigh
3833  1020 84            	pop	a
3834  1021 acda1fda      	jpf	L353
3835  1025               L531:
3836                     ; 1611      case 45:
3836                     ; 1612 		    
3836                     ; 1613 			 if(ack){
3838  1025 3d0b          	tnz	_ack
3839  1027 2727          	jreq	L156
3840                     ; 1615 				 ack   = FALSE;
3842  1029 3f0b          	clr	_ack
3843                     ; 1616 				 state = DELAY;
3845  102b 35520000      	mov	_state,#82
3846                     ; 1617 				 stack = 46; 
3848  102f 352e0001      	mov	_stack,#46
3849                     ; 1619 				 timerReset           (1);
3851  1033 a601          	ld	a,#1
3852  1035 cd0000        	call	_timerReset
3854                     ; 1621 				 timerReset           (3);
3856  1038 a603          	ld	a,#3
3857  103a cd0000        	call	_timerReset
3859                     ; 1622 				 timerEnable          (3, ENABLE);
3861  103d ae0301        	ldw	x,#769
3862  1040 cd0000        	call	_timerEnable
3864                     ; 1624 				 ioCommSetDir(OUTPUT);
3866  1043 4f            	clr	a
3867  1044 cd0000        	call	_ioCommSetDir
3869                     ; 1626 				 GPIO_WriteHigh(COMM);
3871  1047 4b20          	push	#32
3872  1049 ae5000        	ldw	x,#20480
3873  104c cd0000        	call	_GPIO_WriteHigh
3875  104f 84            	pop	a
3876  1050               L156:
3877                     ; 1630 			 if(timerGetOverflow(1)){
3879  1050 a601          	ld	a,#1
3880  1052 cd0000        	call	_timerGetOverflow
3882  1055 4d            	tnz	a
3883  1056 2603          	jrne	L271
3884  1058 cc1fda        	jp	L353
3885  105b               L271:
3886                     ; 1632 				 *control = 25;
3888  105b 1e01          	ldw	x,(OFST+1,sp)
3889  105d a619          	ld	a,#25
3890  105f f7            	ld	(x),a
3891                     ; 1633 				  state   = FINISH;
3893  1060 35510000      	mov	_state,#81
3894  1064 acda1fda      	jpf	L353
3895  1068               L731:
3896                     ; 1639      case 46:
3896                     ; 1640 		    
3896                     ; 1641 			 if(ack){
3898  1068 3d0b          	tnz	_ack
3899  106a 2727          	jreq	L556
3900                     ; 1643 				 ack   = FALSE;
3902  106c 3f0b          	clr	_ack
3903                     ; 1644 				 state = DELAY;
3905  106e 35520000      	mov	_state,#82
3906                     ; 1645 				 stack = 47; 
3908  1072 352f0001      	mov	_stack,#47
3909                     ; 1647 				 timerReset           (1);
3911  1076 a601          	ld	a,#1
3912  1078 cd0000        	call	_timerReset
3914                     ; 1649 				 timerReset           (3);
3916  107b a603          	ld	a,#3
3917  107d cd0000        	call	_timerReset
3919                     ; 1650 				 timerEnable          (3, ENABLE);
3921  1080 ae0301        	ldw	x,#769
3922  1083 cd0000        	call	_timerEnable
3924                     ; 1652 				 ioCommSetDir(OUTPUT);
3926  1086 4f            	clr	a
3927  1087 cd0000        	call	_ioCommSetDir
3929                     ; 1654 				 GPIO_WriteHigh(COMM);
3931  108a 4b20          	push	#32
3932  108c ae5000        	ldw	x,#20480
3933  108f cd0000        	call	_GPIO_WriteHigh
3935  1092 84            	pop	a
3936  1093               L556:
3937                     ; 1658 			 if(timerGetOverflow(1)){
3939  1093 a601          	ld	a,#1
3940  1095 cd0000        	call	_timerGetOverflow
3942  1098 4d            	tnz	a
3943  1099 2603          	jrne	L471
3944  109b cc1fda        	jp	L353
3945  109e               L471:
3946                     ; 1660 				 *control = 25;
3948  109e 1e01          	ldw	x,(OFST+1,sp)
3949  10a0 a619          	ld	a,#25
3950  10a2 f7            	ld	(x),a
3951                     ; 1661 				  state   = FINISH;
3953  10a3 35510000      	mov	_state,#81
3954  10a7 acda1fda      	jpf	L353
3955  10ab               L141:
3956                     ; 1667 		 case 47:
3956                     ; 1668 		    
3956                     ; 1669 			 if(ack){
3958  10ab 3d0b          	tnz	_ack
3959  10ad 276b          	jreq	L166
3960                     ; 1671 				 ack   = FALSE;
3962  10af 3f0b          	clr	_ack
3963                     ; 1672 				 state = DELAY;
3965  10b1 35520000      	mov	_state,#82
3966                     ; 1673 				 stack = 48; 
3968  10b5 35300001      	mov	_stack,#48
3969                     ; 1675 				 timerReset           (1);
3971  10b9 a601          	ld	a,#1
3972  10bb cd0000        	call	_timerReset
3974                     ; 1676 				 timerSetOverflowValue(1, 400);
3976  10be ae0190        	ldw	x,#400
3977  10c1 89            	pushw	x
3978  10c2 ae0000        	ldw	x,#0
3979  10c5 89            	pushw	x
3980  10c6 a601          	ld	a,#1
3981  10c8 cd0000        	call	_timerSetOverflowValue
3983  10cb 5b04          	addw	sp,#4
3984                     ; 1678 				 timerReset           (3);
3986  10cd a603          	ld	a,#3
3987  10cf cd0000        	call	_timerReset
3989                     ; 1679 				 timerEnable          (3, ENABLE);
3991  10d2 ae0301        	ldw	x,#769
3992  10d5 cd0000        	call	_timerEnable
3994                     ; 1681 				 timerSetOverflowValue(4, 365);
3996  10d8 ae016d        	ldw	x,#365
3997  10db 89            	pushw	x
3998  10dc ae0000        	ldw	x,#0
3999  10df 89            	pushw	x
4000  10e0 a604          	ld	a,#4
4001  10e2 cd0000        	call	_timerSetOverflowValue
4003  10e5 5b04          	addw	sp,#4
4004                     ; 1682 				 timerReset           (4);
4006  10e7 a604          	ld	a,#4
4007  10e9 cd0000        	call	_timerReset
4009                     ; 1683 				 timerEnable          (4, ENABLE);
4011  10ec ae0401        	ldw	x,#1025
4012  10ef cd0000        	call	_timerEnable
4014                     ; 1685          GPIO_WriteLow (CH4);
4016  10f2 4b20          	push	#32
4017  10f4 ae5014        	ldw	x,#20500
4018  10f7 cd0000        	call	_GPIO_WriteLow
4020  10fa 84            	pop	a
4021                     ; 1686 				 GPIO_WriteLow (I_MOT);				 
4023  10fb 4b08          	push	#8
4024  10fd ae5000        	ldw	x,#20480
4025  1100 cd0000        	call	_GPIO_WriteLow
4027  1103 84            	pop	a
4028                     ; 1687 				 GPIO_WriteHigh(CH1);
4030  1104 4b40          	push	#64
4031  1106 ae500a        	ldw	x,#20490
4032  1109 cd0000        	call	_GPIO_WriteHigh
4034  110c 84            	pop	a
4035                     ; 1689 				 ioCommSetDir(OUTPUT);
4037  110d 4f            	clr	a
4038  110e cd0000        	call	_ioCommSetDir
4040                     ; 1691 				 GPIO_WriteHigh(COMM);
4042  1111 4b20          	push	#32
4043  1113 ae5000        	ldw	x,#20480
4044  1116 cd0000        	call	_GPIO_WriteHigh
4046  1119 84            	pop	a
4047  111a               L166:
4048                     ; 1695 			 if(timerGetOverflow(1)){
4050  111a a601          	ld	a,#1
4051  111c cd0000        	call	_timerGetOverflow
4053  111f 4d            	tnz	a
4054  1120 2603          	jrne	L671
4055  1122 cc1fda        	jp	L353
4056  1125               L671:
4057                     ; 1697 				 *control = 25;
4059  1125 1e01          	ldw	x,(OFST+1,sp)
4060  1127 a619          	ld	a,#25
4061  1129 f7            	ld	(x),a
4062                     ; 1698 				  state   = FINISH;
4064  112a 35510000      	mov	_state,#81
4065  112e acda1fda      	jpf	L353
4066  1132               L341:
4067                     ; 1704 		 case 48:
4067                     ; 1705 		   
4067                     ; 1706 		   if(!timerGetOverflow(4)){
4069  1132 a604          	ld	a,#4
4070  1134 cd0000        	call	_timerGetOverflow
4072  1137 4d            	tnz	a
4073  1138 2604          	jrne	L566
4074                     ; 1708 				 ack = FALSE;
4076  113a 3f0b          	clr	_ack
4077                     ; 1710 				 return;
4080  113c 85            	popw	x
4081  113d 81            	ret
4082  113e               L566:
4083                     ; 1714 			 if(ack){
4085  113e 3d0b          	tnz	_ack
4086  1140 2744          	jreq	L766
4087                     ; 1716 				 ack   = FALSE;
4089  1142 3f0b          	clr	_ack
4090                     ; 1717 				 state = DELAY;
4092  1144 35520000      	mov	_state,#82
4093                     ; 1718 				 stack = 52;	
4095  1148 35340001      	mov	_stack,#52
4096                     ; 1720 				 timerReset (1);
4098  114c a601          	ld	a,#1
4099  114e cd0000        	call	_timerReset
4101                     ; 1722 				 timerReset (3);
4103  1151 a603          	ld	a,#3
4104  1153 cd0000        	call	_timerReset
4106                     ; 1723 				 timerEnable(3, ENABLE);
4108  1156 ae0301        	ldw	x,#769
4109  1159 cd0000        	call	_timerEnable
4111                     ; 1725 				 timerReset (4);
4113  115c a604          	ld	a,#4
4114  115e cd0000        	call	_timerReset
4116                     ; 1726 				 timerEnable(4, ENABLE);
4118  1161 ae0401        	ldw	x,#1025
4119  1164 cd0000        	call	_timerEnable
4121                     ; 1728          GPIO_WriteLow (CH1);				 
4123  1167 4b40          	push	#64
4124  1169 ae500a        	ldw	x,#20490
4125  116c cd0000        	call	_GPIO_WriteLow
4127  116f 84            	pop	a
4128                     ; 1729 				 GPIO_WriteHigh(CH2);
4130  1170 4b10          	push	#16
4131  1172 ae500a        	ldw	x,#20490
4132  1175 cd0000        	call	_GPIO_WriteHigh
4134  1178 84            	pop	a
4135                     ; 1731 				 ioCommSetDir(OUTPUT);
4137  1179 4f            	clr	a
4138  117a cd0000        	call	_ioCommSetDir
4140                     ; 1733 				 GPIO_WriteHigh(COMM);
4142  117d 4b20          	push	#32
4143  117f ae5000        	ldw	x,#20480
4144  1182 cd0000        	call	_GPIO_WriteHigh
4146  1185 84            	pop	a
4147  1186               L766:
4148                     ; 1737 			 if(timerGetOverflow(1)){
4150  1186 a601          	ld	a,#1
4151  1188 cd0000        	call	_timerGetOverflow
4153  118b 4d            	tnz	a
4154  118c 2603          	jrne	L002
4155  118e cc1fda        	jp	L353
4156  1191               L002:
4157                     ; 1739 				 ack   = FALSE;
4159  1191 3f0b          	clr	_ack
4160                     ; 1740 				 state = DELAY;
4162  1193 35520000      	mov	_state,#82
4163                     ; 1741 				 stack = 49;
4165  1197 35310001      	mov	_stack,#49
4166                     ; 1743 				 timerReset (1);
4168  119b a601          	ld	a,#1
4169  119d cd0000        	call	_timerReset
4171                     ; 1745 				 timerReset (3);
4173  11a0 a603          	ld	a,#3
4174  11a2 cd0000        	call	_timerReset
4176                     ; 1746 				 timerEnable(3, ENABLE);
4178  11a5 ae0301        	ldw	x,#769
4179  11a8 cd0000        	call	_timerEnable
4181                     ; 1748 				 timerReset (4);
4183  11ab a604          	ld	a,#4
4184  11ad cd0000        	call	_timerReset
4186                     ; 1750 				 ioCommSetDir(OUTPUT);
4188  11b0 4f            	clr	a
4189  11b1 cd0000        	call	_ioCommSetDir
4191                     ; 1752 				 GPIO_WriteHigh(COMM);
4193  11b4 4b20          	push	#32
4194  11b6 ae5000        	ldw	x,#20480
4195  11b9 cd0000        	call	_GPIO_WriteHigh
4197  11bc 84            	pop	a
4198  11bd acda1fda      	jpf	L353
4199  11c1               L541:
4200                     ; 1758 		 case 49:
4200                     ; 1759 		   
4200                     ; 1760 		   if(!timerGetOverflow(4)){
4202  11c1 a604          	ld	a,#4
4203  11c3 cd0000        	call	_timerGetOverflow
4205  11c6 4d            	tnz	a
4206  11c7 2604          	jrne	L376
4207                     ; 1762 				 ack = FALSE;
4209  11c9 3f0b          	clr	_ack
4210                     ; 1764 				 return;
4212  11cb 205d          	jra	L41
4213  11cd               L376:
4214                     ; 1768 			 if(ack){
4216  11cd 3d0b          	tnz	_ack
4217  11cf 2732          	jreq	L576
4218                     ; 1770 				 ack   = FALSE;
4220  11d1 3f0b          	clr	_ack
4221                     ; 1771 				 state = DELAY;
4223  11d3 35520000      	mov	_state,#82
4224                     ; 1772 				 stack = 50;	
4226  11d7 35320001      	mov	_stack,#50
4227                     ; 1774 				 timerReset (1);
4229  11db a601          	ld	a,#1
4230  11dd cd0000        	call	_timerReset
4232                     ; 1776 				 timerReset (3);
4234  11e0 a603          	ld	a,#3
4235  11e2 cd0000        	call	_timerReset
4237                     ; 1777 				 timerEnable(3, ENABLE);
4239  11e5 ae0301        	ldw	x,#769
4240  11e8 cd0000        	call	_timerEnable
4242                     ; 1779 				 timerReset (4);
4244  11eb a604          	ld	a,#4
4245  11ed cd0000        	call	_timerReset
4247                     ; 1780 				 timerEnable(4, ENABLE);
4249  11f0 ae0401        	ldw	x,#1025
4250  11f3 cd0000        	call	_timerEnable
4252                     ; 1782 				 ioCommSetDir(OUTPUT);
4254  11f6 4f            	clr	a
4255  11f7 cd0000        	call	_ioCommSetDir
4257                     ; 1784 				 GPIO_WriteHigh(COMM);
4259  11fa 4b20          	push	#32
4260  11fc ae5000        	ldw	x,#20480
4261  11ff cd0000        	call	_GPIO_WriteHigh
4263  1202 84            	pop	a
4264  1203               L576:
4265                     ; 1788 			 if(timerGetOverflow(1)){
4267  1203 a601          	ld	a,#1
4268  1205 cd0000        	call	_timerGetOverflow
4270  1208 4d            	tnz	a
4271  1209 2603          	jrne	L202
4272  120b cc1fda        	jp	L353
4273  120e               L202:
4274                     ; 1790 				 timerReset(1);
4276  120e a601          	ld	a,#1
4277  1210 cd0000        	call	_timerReset
4279                     ; 1792 				 *control = 26;
4281  1213 1e01          	ldw	x,(OFST+1,sp)
4282  1215 a61a          	ld	a,#26
4283  1217 f7            	ld	(x),a
4284                     ; 1793 				  state   = FINISH;
4286  1218 35510000      	mov	_state,#81
4287  121c acda1fda      	jpf	L353
4288  1220               L741:
4289                     ; 1799 		 case 50:
4289                     ; 1800 		   
4289                     ; 1801 		   if(!timerGetOverflow(4)){
4291  1220 a604          	ld	a,#4
4292  1222 cd0000        	call	_timerGetOverflow
4294  1225 4d            	tnz	a
4295  1226 2604          	jrne	L107
4296                     ; 1803 				 ack = FALSE;
4298  1228 3f0b          	clr	_ack
4299                     ; 1805 				 return;
4300  122a               L41:
4303  122a 85            	popw	x
4304  122b 81            	ret
4305  122c               L107:
4306                     ; 1809 			 if(ack){
4308  122c 3d0b          	tnz	_ack
4309  122e 2732          	jreq	L307
4310                     ; 1811 				 ack   = FALSE;
4312  1230 3f0b          	clr	_ack
4313                     ; 1812 				 state = DELAY;
4315  1232 35520000      	mov	_state,#82
4316                     ; 1813 				 stack = 51;	
4318  1236 35330001      	mov	_stack,#51
4319                     ; 1815 				 timerReset (1);
4321  123a a601          	ld	a,#1
4322  123c cd0000        	call	_timerReset
4324                     ; 1817 				 timerReset (3);
4326  123f a603          	ld	a,#3
4327  1241 cd0000        	call	_timerReset
4329                     ; 1818 				 timerEnable(3, ENABLE);
4331  1244 ae0301        	ldw	x,#769
4332  1247 cd0000        	call	_timerEnable
4334                     ; 1820 				 timerReset (4);
4336  124a a604          	ld	a,#4
4337  124c cd0000        	call	_timerReset
4339                     ; 1821 				 timerEnable(4, ENABLE);
4341  124f ae0401        	ldw	x,#1025
4342  1252 cd0000        	call	_timerEnable
4344                     ; 1823 				 ioCommSetDir(OUTPUT);
4346  1255 4f            	clr	a
4347  1256 cd0000        	call	_ioCommSetDir
4349                     ; 1825 				 GPIO_WriteHigh(COMM);
4351  1259 4b20          	push	#32
4352  125b ae5000        	ldw	x,#20480
4353  125e cd0000        	call	_GPIO_WriteHigh
4355  1261 84            	pop	a
4356  1262               L307:
4357                     ; 1829 			 if(timerGetOverflow(1)){
4359  1262 a601          	ld	a,#1
4360  1264 cd0000        	call	_timerGetOverflow
4362  1267 4d            	tnz	a
4363  1268 2603          	jrne	L402
4364  126a cc1fda        	jp	L353
4365  126d               L402:
4366                     ; 1831 				 timerReset(1);
4368  126d a601          	ld	a,#1
4369  126f cd0000        	call	_timerReset
4371                     ; 1833 				 *control = 26;
4373  1272 1e01          	ldw	x,(OFST+1,sp)
4374  1274 a61a          	ld	a,#26
4375  1276 f7            	ld	(x),a
4376                     ; 1834 				  state   = FINISH;
4378  1277 35510000      	mov	_state,#81
4379  127b acda1fda      	jpf	L353
4380  127f               L151:
4381                     ; 1840 		 case 51:
4381                     ; 1841 		   
4381                     ; 1842 		   if(!timerGetOverflow(4)){
4383  127f a604          	ld	a,#4
4384  1281 cd0000        	call	_timerGetOverflow
4386  1284 4d            	tnz	a
4387  1285 2604          	jrne	L707
4388                     ; 1844 				 ack = FALSE;
4390  1287 3f0b          	clr	_ack
4391                     ; 1846 				 return;
4393  1289 209f          	jra	L41
4394  128b               L707:
4395                     ; 1850 			 if(ack){
4397  128b 3d0b          	tnz	_ack
4398  128d 2744          	jreq	L117
4399                     ; 1852 				 ack   = FALSE;
4401  128f 3f0b          	clr	_ack
4402                     ; 1853 				 state = DELAY;
4404  1291 35520000      	mov	_state,#82
4405                     ; 1854 				 stack = 52;	
4407  1295 35340001      	mov	_stack,#52
4408                     ; 1856 				 timerReset (1);
4410  1299 a601          	ld	a,#1
4411  129b cd0000        	call	_timerReset
4413                     ; 1858 				 timerReset (3);
4415  129e a603          	ld	a,#3
4416  12a0 cd0000        	call	_timerReset
4418                     ; 1859 				 timerEnable(3, ENABLE);
4420  12a3 ae0301        	ldw	x,#769
4421  12a6 cd0000        	call	_timerEnable
4423                     ; 1861 				 timerReset (4);
4425  12a9 a604          	ld	a,#4
4426  12ab cd0000        	call	_timerReset
4428                     ; 1862 				 timerEnable(4, ENABLE);
4430  12ae ae0401        	ldw	x,#1025
4431  12b1 cd0000        	call	_timerEnable
4433                     ; 1864 				 GPIO_WriteLow (CH1);				 
4435  12b4 4b40          	push	#64
4436  12b6 ae500a        	ldw	x,#20490
4437  12b9 cd0000        	call	_GPIO_WriteLow
4439  12bc 84            	pop	a
4440                     ; 1865 				 GPIO_WriteHigh(CH2);
4442  12bd 4b10          	push	#16
4443  12bf ae500a        	ldw	x,#20490
4444  12c2 cd0000        	call	_GPIO_WriteHigh
4446  12c5 84            	pop	a
4447                     ; 1867 				 ioCommSetDir(OUTPUT);
4449  12c6 4f            	clr	a
4450  12c7 cd0000        	call	_ioCommSetDir
4452                     ; 1869 				 GPIO_WriteHigh(COMM);
4454  12ca 4b20          	push	#32
4455  12cc ae5000        	ldw	x,#20480
4456  12cf cd0000        	call	_GPIO_WriteHigh
4458  12d2 84            	pop	a
4459  12d3               L117:
4460                     ; 1873 			 if(timerGetOverflow(1)){
4462  12d3 a601          	ld	a,#1
4463  12d5 cd0000        	call	_timerGetOverflow
4465  12d8 4d            	tnz	a
4466  12d9 2603          	jrne	L602
4467  12db cc1fda        	jp	L353
4468  12de               L602:
4469                     ; 1875 				 timerReset(1);
4471  12de a601          	ld	a,#1
4472  12e0 cd0000        	call	_timerReset
4474                     ; 1877 				 *control = 26;
4476  12e3 1e01          	ldw	x,(OFST+1,sp)
4477  12e5 a61a          	ld	a,#26
4478  12e7 f7            	ld	(x),a
4479                     ; 1878 				  state   = FINISH;
4481  12e8 35510000      	mov	_state,#81
4482  12ec acda1fda      	jpf	L353
4483  12f0               L351:
4484                     ; 1884 		 case 52:
4484                     ; 1885 		    
4484                     ; 1886 			 if(!timerGetOverflow(4)){
4486  12f0 a604          	ld	a,#4
4487  12f2 cd0000        	call	_timerGetOverflow
4489  12f5 4d            	tnz	a
4490  12f6 2604          	jrne	L517
4491                     ; 1888 				 ack = FALSE;
4493  12f8 3f0b          	clr	_ack
4494                     ; 1890 				 return;
4497  12fa 85            	popw	x
4498  12fb 81            	ret
4499  12fc               L517:
4500                     ; 1894 			 if(ack){
4502  12fc 3d0b          	tnz	_ack
4503  12fe 2744          	jreq	L717
4504                     ; 1896 				 ack   = FALSE;
4506  1300 3f0b          	clr	_ack
4507                     ; 1897 				 state = DELAY;
4509  1302 35520000      	mov	_state,#82
4510                     ; 1898 				 stack = 56;	
4512  1306 35380001      	mov	_stack,#56
4513                     ; 1900 				 timerReset (1);
4515  130a a601          	ld	a,#1
4516  130c cd0000        	call	_timerReset
4518                     ; 1902 				 timerReset (3);
4520  130f a603          	ld	a,#3
4521  1311 cd0000        	call	_timerReset
4523                     ; 1903 				 timerEnable(3, ENABLE);	
4525  1314 ae0301        	ldw	x,#769
4526  1317 cd0000        	call	_timerEnable
4528                     ; 1905 				 timerReset (4);
4530  131a a604          	ld	a,#4
4531  131c cd0000        	call	_timerReset
4533                     ; 1906 				 timerEnable(4, ENABLE);
4535  131f ae0401        	ldw	x,#1025
4536  1322 cd0000        	call	_timerEnable
4538                     ; 1908          GPIO_WriteLow (CH2);				 
4540  1325 4b10          	push	#16
4541  1327 ae500a        	ldw	x,#20490
4542  132a cd0000        	call	_GPIO_WriteLow
4544  132d 84            	pop	a
4545                     ; 1909 				 GPIO_WriteHigh(CH3);
4547  132e 4b04          	push	#4
4548  1330 ae500a        	ldw	x,#20490
4549  1333 cd0000        	call	_GPIO_WriteHigh
4551  1336 84            	pop	a
4552                     ; 1911 				 ioCommSetDir(OUTPUT);
4554  1337 4f            	clr	a
4555  1338 cd0000        	call	_ioCommSetDir
4557                     ; 1913 				 GPIO_WriteHigh(COMM);
4559  133b 4b20          	push	#32
4560  133d ae5000        	ldw	x,#20480
4561  1340 cd0000        	call	_GPIO_WriteHigh
4563  1343 84            	pop	a
4564  1344               L717:
4565                     ; 1917 			 if(timerGetOverflow(1)){
4567  1344 a601          	ld	a,#1
4568  1346 cd0000        	call	_timerGetOverflow
4570  1349 4d            	tnz	a
4571  134a 2603          	jrne	L012
4572  134c cc1fda        	jp	L353
4573  134f               L012:
4574                     ; 1919 				 state = DELAY;
4576  134f 35520000      	mov	_state,#82
4577                     ; 1920 				 stack = 53;
4579  1353 35350001      	mov	_stack,#53
4580                     ; 1922 				 timerReset (1);
4582  1357 a601          	ld	a,#1
4583  1359 cd0000        	call	_timerReset
4585                     ; 1924 				 timerReset (3);
4587  135c a603          	ld	a,#3
4588  135e cd0000        	call	_timerReset
4590                     ; 1925 				 timerEnable(3, ENABLE);
4592  1361 ae0301        	ldw	x,#769
4593  1364 cd0000        	call	_timerEnable
4595                     ; 1927 				 timerReset (4);
4597  1367 a604          	ld	a,#4
4598  1369 cd0000        	call	_timerReset
4600                     ; 1929 				 ioCommSetDir(OUTPUT);
4602  136c 4f            	clr	a
4603  136d cd0000        	call	_ioCommSetDir
4605                     ; 1931 				 GPIO_WriteHigh(COMM);
4607  1370 4b20          	push	#32
4608  1372 ae5000        	ldw	x,#20480
4609  1375 cd0000        	call	_GPIO_WriteHigh
4611  1378 84            	pop	a
4612  1379 acda1fda      	jpf	L353
4613  137d               L551:
4614                     ; 1937 		 case 53:
4614                     ; 1938 		    
4614                     ; 1939 			 if(!timerGetOverflow(4)){
4616  137d a604          	ld	a,#4
4617  137f cd0000        	call	_timerGetOverflow
4619  1382 4d            	tnz	a
4620  1383 2604          	jrne	L327
4621                     ; 1941 				 ack = FALSE;
4623  1385 3f0b          	clr	_ack
4624                     ; 1943 				 return;
4626  1387 205d          	jra	L61
4627  1389               L327:
4628                     ; 1947 			 if(ack){
4630  1389 3d0b          	tnz	_ack
4631  138b 2732          	jreq	L527
4632                     ; 1949 				 ack   = FALSE;
4634  138d 3f0b          	clr	_ack
4635                     ; 1950 				 state = DELAY;
4637  138f 35520000      	mov	_state,#82
4638                     ; 1951 				 stack = 54;	
4640  1393 35360001      	mov	_stack,#54
4641                     ; 1953 				 timerReset (1);
4643  1397 a601          	ld	a,#1
4644  1399 cd0000        	call	_timerReset
4646                     ; 1955 				 timerReset (3);
4648  139c a603          	ld	a,#3
4649  139e cd0000        	call	_timerReset
4651                     ; 1956 				 timerEnable(3, ENABLE);	
4653  13a1 ae0301        	ldw	x,#769
4654  13a4 cd0000        	call	_timerEnable
4656                     ; 1958 				 timerReset (4);
4658  13a7 a604          	ld	a,#4
4659  13a9 cd0000        	call	_timerReset
4661                     ; 1959 				 timerEnable(4, ENABLE);
4663  13ac ae0401        	ldw	x,#1025
4664  13af cd0000        	call	_timerEnable
4666                     ; 1961 				 ioCommSetDir(OUTPUT);
4668  13b2 4f            	clr	a
4669  13b3 cd0000        	call	_ioCommSetDir
4671                     ; 1963 				 GPIO_WriteHigh(COMM);
4673  13b6 4b20          	push	#32
4674  13b8 ae5000        	ldw	x,#20480
4675  13bb cd0000        	call	_GPIO_WriteHigh
4677  13be 84            	pop	a
4678  13bf               L527:
4679                     ; 1967 			 if(timerGetOverflow(1)){
4681  13bf a601          	ld	a,#1
4682  13c1 cd0000        	call	_timerGetOverflow
4684  13c4 4d            	tnz	a
4685  13c5 2603          	jrne	L212
4686  13c7 cc1fda        	jp	L353
4687  13ca               L212:
4688                     ; 1969 				 timerReset(1);
4690  13ca a601          	ld	a,#1
4691  13cc cd0000        	call	_timerReset
4693                     ; 1971 				 *control = 27;
4695  13cf 1e01          	ldw	x,(OFST+1,sp)
4696  13d1 a61b          	ld	a,#27
4697  13d3 f7            	ld	(x),a
4698                     ; 1972 				  state   = FINISH;
4700  13d4 35510000      	mov	_state,#81
4701  13d8 acda1fda      	jpf	L353
4702  13dc               L751:
4703                     ; 1978 		 case 54:
4703                     ; 1979 		    
4703                     ; 1980 			 if(!timerGetOverflow(4)){
4705  13dc a604          	ld	a,#4
4706  13de cd0000        	call	_timerGetOverflow
4708  13e1 4d            	tnz	a
4709  13e2 2604          	jrne	L137
4710                     ; 1982 				 ack = FALSE;
4712  13e4 3f0b          	clr	_ack
4713                     ; 1984 				 return;
4714  13e6               L61:
4717  13e6 85            	popw	x
4718  13e7 81            	ret
4719  13e8               L137:
4720                     ; 1988 			 if(ack){
4722  13e8 3d0b          	tnz	_ack
4723  13ea 2732          	jreq	L337
4724                     ; 1990 				 ack   = FALSE;
4726  13ec 3f0b          	clr	_ack
4727                     ; 1991 				 state = DELAY;
4729  13ee 35520000      	mov	_state,#82
4730                     ; 1992 				 stack = 55;	
4732  13f2 35370001      	mov	_stack,#55
4733                     ; 1994 				 timerReset (1);
4735  13f6 a601          	ld	a,#1
4736  13f8 cd0000        	call	_timerReset
4738                     ; 1996 				 timerReset (3);
4740  13fb a603          	ld	a,#3
4741  13fd cd0000        	call	_timerReset
4743                     ; 1997 				 timerEnable(3, ENABLE);	
4745  1400 ae0301        	ldw	x,#769
4746  1403 cd0000        	call	_timerEnable
4748                     ; 1999 				 timerReset (4);
4750  1406 a604          	ld	a,#4
4751  1408 cd0000        	call	_timerReset
4753                     ; 2000 				 timerEnable(4, ENABLE);
4755  140b ae0401        	ldw	x,#1025
4756  140e cd0000        	call	_timerEnable
4758                     ; 2002 				 ioCommSetDir(OUTPUT);
4760  1411 4f            	clr	a
4761  1412 cd0000        	call	_ioCommSetDir
4763                     ; 2004 				 GPIO_WriteHigh(COMM);
4765  1415 4b20          	push	#32
4766  1417 ae5000        	ldw	x,#20480
4767  141a cd0000        	call	_GPIO_WriteHigh
4769  141d 84            	pop	a
4770  141e               L337:
4771                     ; 2008 			 if(timerGetOverflow(1)){
4773  141e a601          	ld	a,#1
4774  1420 cd0000        	call	_timerGetOverflow
4776  1423 4d            	tnz	a
4777  1424 2603          	jrne	L412
4778  1426 cc1fda        	jp	L353
4779  1429               L412:
4780                     ; 2010 				 timerReset(1);
4782  1429 a601          	ld	a,#1
4783  142b cd0000        	call	_timerReset
4785                     ; 2012 				 *control = 27;
4787  142e 1e01          	ldw	x,(OFST+1,sp)
4788  1430 a61b          	ld	a,#27
4789  1432 f7            	ld	(x),a
4790                     ; 2013 				  state   = FINISH;
4792  1433 35510000      	mov	_state,#81
4793  1437 acda1fda      	jpf	L353
4794  143b               L161:
4795                     ; 2019 		 case 55:
4795                     ; 2020 		    
4795                     ; 2021 			 if(!timerGetOverflow(4)){
4797  143b a604          	ld	a,#4
4798  143d cd0000        	call	_timerGetOverflow
4800  1440 4d            	tnz	a
4801  1441 2604          	jrne	L737
4802                     ; 2023 				 ack = FALSE;
4804  1443 3f0b          	clr	_ack
4805                     ; 2025 				 return;
4807  1445 209f          	jra	L61
4808  1447               L737:
4809                     ; 2029 			 if(ack){
4811  1447 3d0b          	tnz	_ack
4812  1449 2744          	jreq	L147
4813                     ; 2031 				 ack   = FALSE;
4815  144b 3f0b          	clr	_ack
4816                     ; 2032 				 state = DELAY;
4818  144d 35520000      	mov	_state,#82
4819                     ; 2033 				 stack = 56;	
4821  1451 35380001      	mov	_stack,#56
4822                     ; 2035 				 timerReset (1);
4824  1455 a601          	ld	a,#1
4825  1457 cd0000        	call	_timerReset
4827                     ; 2037 				 timerReset (3);
4829  145a a603          	ld	a,#3
4830  145c cd0000        	call	_timerReset
4832                     ; 2038 				 timerEnable(3, ENABLE);	
4834  145f ae0301        	ldw	x,#769
4835  1462 cd0000        	call	_timerEnable
4837                     ; 2040 				 timerReset (4);
4839  1465 a604          	ld	a,#4
4840  1467 cd0000        	call	_timerReset
4842                     ; 2041 				 timerEnable(4, ENABLE);
4844  146a ae0401        	ldw	x,#1025
4845  146d cd0000        	call	_timerEnable
4847                     ; 2043 				 GPIO_WriteLow (CH2);				 
4849  1470 4b10          	push	#16
4850  1472 ae500a        	ldw	x,#20490
4851  1475 cd0000        	call	_GPIO_WriteLow
4853  1478 84            	pop	a
4854                     ; 2044 				 GPIO_WriteHigh(CH3);
4856  1479 4b04          	push	#4
4857  147b ae500a        	ldw	x,#20490
4858  147e cd0000        	call	_GPIO_WriteHigh
4860  1481 84            	pop	a
4861                     ; 2046 				 ioCommSetDir(OUTPUT);
4863  1482 4f            	clr	a
4864  1483 cd0000        	call	_ioCommSetDir
4866                     ; 2048 				 GPIO_WriteHigh(COMM);
4868  1486 4b20          	push	#32
4869  1488 ae5000        	ldw	x,#20480
4870  148b cd0000        	call	_GPIO_WriteHigh
4872  148e 84            	pop	a
4873  148f               L147:
4874                     ; 2052 			 if(timerGetOverflow(1)){
4876  148f a601          	ld	a,#1
4877  1491 cd0000        	call	_timerGetOverflow
4879  1494 4d            	tnz	a
4880  1495 2603          	jrne	L612
4881  1497 cc1fda        	jp	L353
4882  149a               L612:
4883                     ; 2054 				 timerReset(1);
4885  149a a601          	ld	a,#1
4886  149c cd0000        	call	_timerReset
4888                     ; 2056 				 *control = 27;
4890  149f 1e01          	ldw	x,(OFST+1,sp)
4891  14a1 a61b          	ld	a,#27
4892  14a3 f7            	ld	(x),a
4893                     ; 2057 				  state   = FINISH;
4895  14a4 35510000      	mov	_state,#81
4896  14a8 acda1fda      	jpf	L353
4897  14ac               L361:
4898                     ; 2063 		 case 56:
4898                     ; 2064 		    
4898                     ; 2065 			 if(!timerGetOverflow(4)){
4900  14ac a604          	ld	a,#4
4901  14ae cd0000        	call	_timerGetOverflow
4903  14b1 4d            	tnz	a
4904  14b2 2604          	jrne	L547
4905                     ; 2067 				 ack = FALSE;
4907  14b4 3f0b          	clr	_ack
4908                     ; 2069 				 return;
4911  14b6 85            	popw	x
4912  14b7 81            	ret
4913  14b8               L547:
4914                     ; 2073 			 if(ack){
4916  14b8 3d0b          	tnz	_ack
4917  14ba 2744          	jreq	L747
4918                     ; 2075 				 ack   = FALSE;	
4920  14bc 3f0b          	clr	_ack
4921                     ; 2076 				 state = DELAY;
4923  14be 35520000      	mov	_state,#82
4924                     ; 2077 				 stack = 60;	
4926  14c2 353c0001      	mov	_stack,#60
4927                     ; 2079 				 timerReset (1);
4929  14c6 a601          	ld	a,#1
4930  14c8 cd0000        	call	_timerReset
4932                     ; 2081 				 timerReset (3);
4934  14cb a603          	ld	a,#3
4935  14cd cd0000        	call	_timerReset
4937                     ; 2082 				 timerEnable(3, ENABLE);
4939  14d0 ae0301        	ldw	x,#769
4940  14d3 cd0000        	call	_timerEnable
4942                     ; 2084          timerReset (4);
4944  14d6 a604          	ld	a,#4
4945  14d8 cd0000        	call	_timerReset
4947                     ; 2085 				 timerEnable(4, ENABLE);
4949  14db ae0401        	ldw	x,#1025
4950  14de cd0000        	call	_timerEnable
4952                     ; 2087          GPIO_WriteLow (CH3);				 
4954  14e1 4b04          	push	#4
4955  14e3 ae500a        	ldw	x,#20490
4956  14e6 cd0000        	call	_GPIO_WriteLow
4958  14e9 84            	pop	a
4959                     ; 2088 				 GPIO_WriteHigh(CH4);
4961  14ea 4b20          	push	#32
4962  14ec ae5014        	ldw	x,#20500
4963  14ef cd0000        	call	_GPIO_WriteHigh
4965  14f2 84            	pop	a
4966                     ; 2090 				 ioCommSetDir(OUTPUT);
4968  14f3 4f            	clr	a
4969  14f4 cd0000        	call	_ioCommSetDir
4971                     ; 2092 				 GPIO_WriteHigh(COMM);
4973  14f7 4b20          	push	#32
4974  14f9 ae5000        	ldw	x,#20480
4975  14fc cd0000        	call	_GPIO_WriteHigh
4977  14ff 84            	pop	a
4978  1500               L747:
4979                     ; 2096 			 if(timerGetOverflow(1)){
4981  1500 a601          	ld	a,#1
4982  1502 cd0000        	call	_timerGetOverflow
4984  1505 4d            	tnz	a
4985  1506 2603          	jrne	L022
4986  1508 cc1fda        	jp	L353
4987  150b               L022:
4988                     ; 2098 				 state = DELAY;
4990  150b 35520000      	mov	_state,#82
4991                     ; 2099 				 stack = 57;
4993  150f 35390001      	mov	_stack,#57
4994                     ; 2101 				 timerReset (1);
4996  1513 a601          	ld	a,#1
4997  1515 cd0000        	call	_timerReset
4999                     ; 2103 				 timerReset (3);
5001  1518 a603          	ld	a,#3
5002  151a cd0000        	call	_timerReset
5004                     ; 2104 				 timerEnable(3, ENABLE);
5006  151d ae0301        	ldw	x,#769
5007  1520 cd0000        	call	_timerEnable
5009                     ; 2106 				 timerReset (4);
5011  1523 a604          	ld	a,#4
5012  1525 cd0000        	call	_timerReset
5014                     ; 2108 				 ioCommSetDir(OUTPUT);
5016  1528 4f            	clr	a
5017  1529 cd0000        	call	_ioCommSetDir
5019                     ; 2110 				 GPIO_WriteHigh(COMM);
5021  152c 4b20          	push	#32
5022  152e ae5000        	ldw	x,#20480
5023  1531 cd0000        	call	_GPIO_WriteHigh
5025  1534 84            	pop	a
5026  1535 acda1fda      	jpf	L353
5027  1539               L561:
5028                     ; 2116      case 57:
5028                     ; 2117 		    
5028                     ; 2118 			 if(!timerGetOverflow(4)){
5030  1539 a604          	ld	a,#4
5031  153b cd0000        	call	_timerGetOverflow
5033  153e 4d            	tnz	a
5034  153f 2604          	jrne	L357
5035                     ; 2120 				 ack = FALSE;
5037  1541 3f0b          	clr	_ack
5038                     ; 2122 				 return;
5040  1543 205d          	jra	L02
5041  1545               L357:
5042                     ; 2126 			 if(ack){
5044  1545 3d0b          	tnz	_ack
5045  1547 2732          	jreq	L557
5046                     ; 2128 				 ack   = FALSE;	
5048  1549 3f0b          	clr	_ack
5049                     ; 2129 				 state = DELAY;
5051  154b 35520000      	mov	_state,#82
5052                     ; 2130 				 stack = 58;	
5054  154f 353a0001      	mov	_stack,#58
5055                     ; 2132 				 timerReset (1);
5057  1553 a601          	ld	a,#1
5058  1555 cd0000        	call	_timerReset
5060                     ; 2134 				 timerReset (3);
5062  1558 a603          	ld	a,#3
5063  155a cd0000        	call	_timerReset
5065                     ; 2135 				 timerEnable(3, ENABLE);
5067  155d ae0301        	ldw	x,#769
5068  1560 cd0000        	call	_timerEnable
5070                     ; 2137          timerReset (4);
5072  1563 a604          	ld	a,#4
5073  1565 cd0000        	call	_timerReset
5075                     ; 2138 				 timerEnable(4, ENABLE);
5077  1568 ae0401        	ldw	x,#1025
5078  156b cd0000        	call	_timerEnable
5080                     ; 2140 				 ioCommSetDir(OUTPUT);
5082  156e 4f            	clr	a
5083  156f cd0000        	call	_ioCommSetDir
5085                     ; 2142 				 GPIO_WriteHigh(COMM);
5087  1572 4b20          	push	#32
5088  1574 ae5000        	ldw	x,#20480
5089  1577 cd0000        	call	_GPIO_WriteHigh
5091  157a 84            	pop	a
5092  157b               L557:
5093                     ; 2146 			 if(timerGetOverflow(1)){
5095  157b a601          	ld	a,#1
5096  157d cd0000        	call	_timerGetOverflow
5098  1580 4d            	tnz	a
5099  1581 2603          	jrne	L222
5100  1583 cc1fda        	jp	L353
5101  1586               L222:
5102                     ; 2148 				 timerReset(1);
5104  1586 a601          	ld	a,#1
5105  1588 cd0000        	call	_timerReset
5107                     ; 2150 				 *control = 28;
5109  158b 1e01          	ldw	x,(OFST+1,sp)
5110  158d a61c          	ld	a,#28
5111  158f f7            	ld	(x),a
5112                     ; 2151 				  state   = FINISH;
5114  1590 35510000      	mov	_state,#81
5115  1594 acda1fda      	jpf	L353
5116  1598               L761:
5117                     ; 2157 	   case 58:
5117                     ; 2158 		    
5117                     ; 2159 			 if(!timerGetOverflow(4)){
5119  1598 a604          	ld	a,#4
5120  159a cd0000        	call	_timerGetOverflow
5122  159d 4d            	tnz	a
5123  159e 2604          	jrne	L167
5124                     ; 2161 				 ack = FALSE;
5126  15a0 3f0b          	clr	_ack
5127                     ; 2163 				 return;
5128  15a2               L02:
5131  15a2 85            	popw	x
5132  15a3 81            	ret
5133  15a4               L167:
5134                     ; 2167 			 if(ack){
5136  15a4 3d0b          	tnz	_ack
5137  15a6 2732          	jreq	L367
5138                     ; 2169 				 ack   = FALSE;	
5140  15a8 3f0b          	clr	_ack
5141                     ; 2170 				 state = DELAY;
5143  15aa 35520000      	mov	_state,#82
5144                     ; 2171 				 stack = 59;	
5146  15ae 353b0001      	mov	_stack,#59
5147                     ; 2173 				 timerReset (1);
5149  15b2 a601          	ld	a,#1
5150  15b4 cd0000        	call	_timerReset
5152                     ; 2175 				 timerReset (3);
5154  15b7 a603          	ld	a,#3
5155  15b9 cd0000        	call	_timerReset
5157                     ; 2176 				 timerEnable(3, ENABLE);
5159  15bc ae0301        	ldw	x,#769
5160  15bf cd0000        	call	_timerEnable
5162                     ; 2178          timerReset (4);
5164  15c2 a604          	ld	a,#4
5165  15c4 cd0000        	call	_timerReset
5167                     ; 2179 				 timerEnable(4, ENABLE);
5169  15c7 ae0401        	ldw	x,#1025
5170  15ca cd0000        	call	_timerEnable
5172                     ; 2181 				 ioCommSetDir(OUTPUT);
5174  15cd 4f            	clr	a
5175  15ce cd0000        	call	_ioCommSetDir
5177                     ; 2183 				 GPIO_WriteHigh(COMM);
5179  15d1 4b20          	push	#32
5180  15d3 ae5000        	ldw	x,#20480
5181  15d6 cd0000        	call	_GPIO_WriteHigh
5183  15d9 84            	pop	a
5184  15da               L367:
5185                     ; 2187 			 if(timerGetOverflow(1)){
5187  15da a601          	ld	a,#1
5188  15dc cd0000        	call	_timerGetOverflow
5190  15df 4d            	tnz	a
5191  15e0 2603          	jrne	L422
5192  15e2 cc1fda        	jp	L353
5193  15e5               L422:
5194                     ; 2189 				 timerReset(1);
5196  15e5 a601          	ld	a,#1
5197  15e7 cd0000        	call	_timerReset
5199                     ; 2191 				 *control = 28;
5201  15ea 1e01          	ldw	x,(OFST+1,sp)
5202  15ec a61c          	ld	a,#28
5203  15ee f7            	ld	(x),a
5204                     ; 2192 				  state   = FINISH;
5206  15ef 35510000      	mov	_state,#81
5207  15f3 acda1fda      	jpf	L353
5208  15f7               L171:
5209                     ; 2198      case 59:
5209                     ; 2199 		    
5209                     ; 2200 			 if(!timerGetOverflow(4)){
5211  15f7 a604          	ld	a,#4
5212  15f9 cd0000        	call	_timerGetOverflow
5214  15fc 4d            	tnz	a
5215  15fd 2604          	jrne	L767
5216                     ; 2202 				 ack = FALSE;
5218  15ff 3f0b          	clr	_ack
5219                     ; 2204 				 return;
5221  1601 209f          	jra	L02
5222  1603               L767:
5223                     ; 2208 			 if(ack){
5225  1603 3d0b          	tnz	_ack
5226  1605 2744          	jreq	L177
5227                     ; 2210 				 ack   = FALSE;	
5229  1607 3f0b          	clr	_ack
5230                     ; 2211 				 state = DELAY;
5232  1609 35520000      	mov	_state,#82
5233                     ; 2212 				 stack = 60;	
5235  160d 353c0001      	mov	_stack,#60
5236                     ; 2214 				 timerReset (1);
5238  1611 a601          	ld	a,#1
5239  1613 cd0000        	call	_timerReset
5241                     ; 2216 				 timerReset (3);
5243  1616 a603          	ld	a,#3
5244  1618 cd0000        	call	_timerReset
5246                     ; 2217 				 timerEnable(3, ENABLE);
5248  161b ae0301        	ldw	x,#769
5249  161e cd0000        	call	_timerEnable
5251                     ; 2219          timerReset (4);
5253  1621 a604          	ld	a,#4
5254  1623 cd0000        	call	_timerReset
5256                     ; 2220 				 timerEnable(4, ENABLE);
5258  1626 ae0401        	ldw	x,#1025
5259  1629 cd0000        	call	_timerEnable
5261                     ; 2222 				 GPIO_WriteLow (CH3);				 
5263  162c 4b04          	push	#4
5264  162e ae500a        	ldw	x,#20490
5265  1631 cd0000        	call	_GPIO_WriteLow
5267  1634 84            	pop	a
5268                     ; 2223 				 GPIO_WriteHigh(CH4);
5270  1635 4b20          	push	#32
5271  1637 ae5014        	ldw	x,#20500
5272  163a cd0000        	call	_GPIO_WriteHigh
5274  163d 84            	pop	a
5275                     ; 2225 				 ioCommSetDir(OUTPUT);
5277  163e 4f            	clr	a
5278  163f cd0000        	call	_ioCommSetDir
5280                     ; 2227 				 GPIO_WriteHigh(COMM);
5282  1642 4b20          	push	#32
5283  1644 ae5000        	ldw	x,#20480
5284  1647 cd0000        	call	_GPIO_WriteHigh
5286  164a 84            	pop	a
5287  164b               L177:
5288                     ; 2231 			 if(timerGetOverflow(1)){
5290  164b a601          	ld	a,#1
5291  164d cd0000        	call	_timerGetOverflow
5293  1650 4d            	tnz	a
5294  1651 2603          	jrne	L622
5295  1653 cc1fda        	jp	L353
5296  1656               L622:
5297                     ; 2233 				 timerReset(1);
5299  1656 a601          	ld	a,#1
5300  1658 cd0000        	call	_timerReset
5302                     ; 2235 				 *control = 28;
5304  165b 1e01          	ldw	x,(OFST+1,sp)
5305  165d a61c          	ld	a,#28
5306  165f f7            	ld	(x),a
5307                     ; 2236 				  state   = FINISH;
5309  1660 35510000      	mov	_state,#81
5310  1664 acda1fda      	jpf	L353
5311  1668               L371:
5312                     ; 2242   	 case 60:
5312                     ; 2243 		    
5312                     ; 2244 			 if(!timerGetOverflow(4)){
5314  1668 a604          	ld	a,#4
5315  166a cd0000        	call	_timerGetOverflow
5317  166d 4d            	tnz	a
5318  166e 2604          	jrne	L577
5319                     ; 2246 				 ack = FALSE;
5321  1670 3f0b          	clr	_ack
5322                     ; 2248 				 return;
5325  1672 85            	popw	x
5326  1673 81            	ret
5327  1674               L577:
5328                     ; 2252 			 if(ack){
5330  1674 3d0b          	tnz	_ack
5331  1676 2744          	jreq	L777
5332                     ; 2254 				 ack   = FALSE;	
5334  1678 3f0b          	clr	_ack
5335                     ; 2255 				 state = DELAY;
5337  167a 35520000      	mov	_state,#82
5338                     ; 2256 				 stack = 64;	
5340  167e 35400001      	mov	_stack,#64
5341                     ; 2258 				 timerReset (1);
5343  1682 a601          	ld	a,#1
5344  1684 cd0000        	call	_timerReset
5346                     ; 2260 				 timerReset (3);
5348  1687 a603          	ld	a,#3
5349  1689 cd0000        	call	_timerReset
5351                     ; 2261 				 timerEnable(3, ENABLE);
5353  168c ae0301        	ldw	x,#769
5354  168f cd0000        	call	_timerEnable
5356                     ; 2263 				 timerReset (4);
5358  1692 a604          	ld	a,#4
5359  1694 cd0000        	call	_timerReset
5361                     ; 2264 				 timerEnable(4, ENABLE);
5363  1697 ae0401        	ldw	x,#1025
5364  169a cd0000        	call	_timerEnable
5366                     ; 2266          GPIO_WriteLow (CH4);
5368  169d 4b20          	push	#32
5369  169f ae5014        	ldw	x,#20500
5370  16a2 cd0000        	call	_GPIO_WriteLow
5372  16a5 84            	pop	a
5373                     ; 2267 				 GPIO_WriteHigh(CH1);
5375  16a6 4b40          	push	#64
5376  16a8 ae500a        	ldw	x,#20490
5377  16ab cd0000        	call	_GPIO_WriteHigh
5379  16ae 84            	pop	a
5380                     ; 2269 				 ioCommSetDir(OUTPUT);
5382  16af 4f            	clr	a
5383  16b0 cd0000        	call	_ioCommSetDir
5385                     ; 2271 				 GPIO_WriteHigh(COMM);
5387  16b3 4b20          	push	#32
5388  16b5 ae5000        	ldw	x,#20480
5389  16b8 cd0000        	call	_GPIO_WriteHigh
5391  16bb 84            	pop	a
5392  16bc               L777:
5393                     ; 2275 			 if(timerGetOverflow(1)){
5395  16bc a601          	ld	a,#1
5396  16be cd0000        	call	_timerGetOverflow
5398  16c1 4d            	tnz	a
5399  16c2 2603          	jrne	L032
5400  16c4 cc1fda        	jp	L353
5401  16c7               L032:
5402                     ; 2277 				 state = DELAY;
5404  16c7 35520000      	mov	_state,#82
5405                     ; 2278 				 stack = 61;
5407  16cb 353d0001      	mov	_stack,#61
5408                     ; 2280 				 timerReset (1);
5410  16cf a601          	ld	a,#1
5411  16d1 cd0000        	call	_timerReset
5413                     ; 2282 				 timerReset (3);
5415  16d4 a603          	ld	a,#3
5416  16d6 cd0000        	call	_timerReset
5418                     ; 2283 				 timerEnable(3, ENABLE);
5420  16d9 ae0301        	ldw	x,#769
5421  16dc cd0000        	call	_timerEnable
5423                     ; 2285 				 timerReset (4);
5425  16df a604          	ld	a,#4
5426  16e1 cd0000        	call	_timerReset
5428                     ; 2287 				 ioCommSetDir(OUTPUT);
5430  16e4 4f            	clr	a
5431  16e5 cd0000        	call	_ioCommSetDir
5433                     ; 2289 				 GPIO_WriteHigh(COMM);
5435  16e8 4b20          	push	#32
5436  16ea ae5000        	ldw	x,#20480
5437  16ed cd0000        	call	_GPIO_WriteHigh
5439  16f0 84            	pop	a
5440  16f1 acda1fda      	jpf	L353
5441  16f5               L571:
5442                     ; 2295   	 case 61:
5442                     ; 2296 		    
5442                     ; 2297 			 if(!timerGetOverflow(4)){
5444  16f5 a604          	ld	a,#4
5445  16f7 cd0000        	call	_timerGetOverflow
5447  16fa 4d            	tnz	a
5448  16fb 2604          	jrne	L3001
5449                     ; 2299 				 ack = FALSE;
5451  16fd 3f0b          	clr	_ack
5452                     ; 2301 				 return;
5454  16ff 2058          	jra	L22
5455  1701               L3001:
5456                     ; 2305 			 if(ack){
5458  1701 3d0b          	tnz	_ack
5459  1703 2732          	jreq	L5001
5460                     ; 2307 				 ack   = FALSE;	
5462  1705 3f0b          	clr	_ack
5463                     ; 2308 				 state = DELAY;
5465  1707 35520000      	mov	_state,#82
5466                     ; 2309 				 stack = 62;	
5468  170b 353e0001      	mov	_stack,#62
5469                     ; 2311 				 timerReset (1);
5471  170f a601          	ld	a,#1
5472  1711 cd0000        	call	_timerReset
5474                     ; 2313 				 timerReset (3);
5476  1714 a603          	ld	a,#3
5477  1716 cd0000        	call	_timerReset
5479                     ; 2314 				 timerEnable(3, ENABLE);
5481  1719 ae0301        	ldw	x,#769
5482  171c cd0000        	call	_timerEnable
5484                     ; 2316 				 timerReset (4);
5486  171f a604          	ld	a,#4
5487  1721 cd0000        	call	_timerReset
5489                     ; 2317 				 timerEnable(4, ENABLE);
5491  1724 ae0401        	ldw	x,#1025
5492  1727 cd0000        	call	_timerEnable
5494                     ; 2319 				 ioCommSetDir(OUTPUT);
5496  172a 4f            	clr	a
5497  172b cd0000        	call	_ioCommSetDir
5499                     ; 2321 				 GPIO_WriteHigh(COMM);
5501  172e 4b20          	push	#32
5502  1730 ae5000        	ldw	x,#20480
5503  1733 cd0000        	call	_GPIO_WriteHigh
5505  1736 84            	pop	a
5506  1737               L5001:
5507                     ; 2325 			 if(timerGetOverflow(1)){
5509  1737 a601          	ld	a,#1
5510  1739 cd0000        	call	_timerGetOverflow
5512  173c 4d            	tnz	a
5513  173d 2603          	jrne	L232
5514  173f cc1fda        	jp	L353
5515  1742               L232:
5516                     ; 2327 				 *control = 29;
5518  1742 1e01          	ldw	x,(OFST+1,sp)
5519  1744 a61d          	ld	a,#29
5520  1746 f7            	ld	(x),a
5521                     ; 2328 				  state   = FINISH;
5523  1747 35510000      	mov	_state,#81
5524  174b acda1fda      	jpf	L353
5525  174f               L771:
5526                     ; 2334      case 62:
5526                     ; 2335 		    
5526                     ; 2336 			 if(!timerGetOverflow(4)){
5528  174f a604          	ld	a,#4
5529  1751 cd0000        	call	_timerGetOverflow
5531  1754 4d            	tnz	a
5532  1755 2604          	jrne	L1101
5533                     ; 2338 				 ack = FALSE;
5535  1757 3f0b          	clr	_ack
5536                     ; 2340 				 return;
5537  1759               L22:
5540  1759 85            	popw	x
5541  175a 81            	ret
5542  175b               L1101:
5543                     ; 2344 			 if(ack){
5545  175b 3d0b          	tnz	_ack
5546  175d 2732          	jreq	L3101
5547                     ; 2346 				 ack   = FALSE;	
5549  175f 3f0b          	clr	_ack
5550                     ; 2347 				 state = DELAY;
5552  1761 35520000      	mov	_state,#82
5553                     ; 2348 				 stack = 63;	
5555  1765 353f0001      	mov	_stack,#63
5556                     ; 2350 				 timerReset (1);
5558  1769 a601          	ld	a,#1
5559  176b cd0000        	call	_timerReset
5561                     ; 2352 				 timerReset (3);
5563  176e a603          	ld	a,#3
5564  1770 cd0000        	call	_timerReset
5566                     ; 2353 				 timerEnable(3, ENABLE);
5568  1773 ae0301        	ldw	x,#769
5569  1776 cd0000        	call	_timerEnable
5571                     ; 2355 				 timerReset (4);
5573  1779 a604          	ld	a,#4
5574  177b cd0000        	call	_timerReset
5576                     ; 2356 				 timerEnable(4, ENABLE);
5578  177e ae0401        	ldw	x,#1025
5579  1781 cd0000        	call	_timerEnable
5581                     ; 2358 				 ioCommSetDir(OUTPUT);
5583  1784 4f            	clr	a
5584  1785 cd0000        	call	_ioCommSetDir
5586                     ; 2360 				 GPIO_WriteHigh(COMM);
5588  1788 4b20          	push	#32
5589  178a ae5000        	ldw	x,#20480
5590  178d cd0000        	call	_GPIO_WriteHigh
5592  1790 84            	pop	a
5593  1791               L3101:
5594                     ; 2364 			 if(timerGetOverflow(1)){
5596  1791 a601          	ld	a,#1
5597  1793 cd0000        	call	_timerGetOverflow
5599  1796 4d            	tnz	a
5600  1797 2603          	jrne	L432
5601  1799 cc1fda        	jp	L353
5602  179c               L432:
5603                     ; 2366 				 *control = 29;
5605  179c 1e01          	ldw	x,(OFST+1,sp)
5606  179e a61d          	ld	a,#29
5607  17a0 f7            	ld	(x),a
5608                     ; 2367 				  state   = FINISH;
5610  17a1 35510000      	mov	_state,#81
5611  17a5 acda1fda      	jpf	L353
5612  17a9               L102:
5613                     ; 2373      case 63:
5613                     ; 2374 		    
5613                     ; 2375 			 if(!timerGetOverflow(4)){
5615  17a9 a604          	ld	a,#4
5616  17ab cd0000        	call	_timerGetOverflow
5618  17ae 4d            	tnz	a
5619  17af 2604          	jrne	L7101
5620                     ; 2377 				 ack = FALSE;
5622  17b1 3f0b          	clr	_ack
5623                     ; 2379 				 return;
5625  17b3 20a4          	jra	L22
5626  17b5               L7101:
5627                     ; 2383 			 if(ack){
5629  17b5 3d0b          	tnz	_ack
5630  17b7 2744          	jreq	L1201
5631                     ; 2385 				 ack   = FALSE;	
5633  17b9 3f0b          	clr	_ack
5634                     ; 2386 				 state = DELAY;
5636  17bb 35520000      	mov	_state,#82
5637                     ; 2387 				 stack = 64;	
5639  17bf 35400001      	mov	_stack,#64
5640                     ; 2389 				 timerReset (1);
5642  17c3 a601          	ld	a,#1
5643  17c5 cd0000        	call	_timerReset
5645                     ; 2391 				 timerReset (3);
5647  17c8 a603          	ld	a,#3
5648  17ca cd0000        	call	_timerReset
5650                     ; 2392 				 timerEnable(3, ENABLE);
5652  17cd ae0301        	ldw	x,#769
5653  17d0 cd0000        	call	_timerEnable
5655                     ; 2394 				 timerReset (4);
5657  17d3 a604          	ld	a,#4
5658  17d5 cd0000        	call	_timerReset
5660                     ; 2395 				 timerEnable(4, ENABLE);
5662  17d8 ae0401        	ldw	x,#1025
5663  17db cd0000        	call	_timerEnable
5665                     ; 2397 				 GPIO_WriteLow (CH4);
5667  17de 4b20          	push	#32
5668  17e0 ae5014        	ldw	x,#20500
5669  17e3 cd0000        	call	_GPIO_WriteLow
5671  17e6 84            	pop	a
5672                     ; 2398 				 GPIO_WriteHigh(CH1);
5674  17e7 4b40          	push	#64
5675  17e9 ae500a        	ldw	x,#20490
5676  17ec cd0000        	call	_GPIO_WriteHigh
5678  17ef 84            	pop	a
5679                     ; 2400 				 ioCommSetDir(OUTPUT);
5681  17f0 4f            	clr	a
5682  17f1 cd0000        	call	_ioCommSetDir
5684                     ; 2402 				 GPIO_WriteHigh(COMM);
5686  17f4 4b20          	push	#32
5687  17f6 ae5000        	ldw	x,#20480
5688  17f9 cd0000        	call	_GPIO_WriteHigh
5690  17fc 84            	pop	a
5691  17fd               L1201:
5692                     ; 2406 			 if(timerGetOverflow(1)){
5694  17fd a601          	ld	a,#1
5695  17ff cd0000        	call	_timerGetOverflow
5697  1802 4d            	tnz	a
5698  1803 2603          	jrne	L632
5699  1805 cc1fda        	jp	L353
5700  1808               L632:
5701                     ; 2408 				 *control = 29;
5703  1808 1e01          	ldw	x,(OFST+1,sp)
5704  180a a61d          	ld	a,#29
5705  180c f7            	ld	(x),a
5706                     ; 2409 				  state   = FINISH;
5708  180d 35510000      	mov	_state,#81
5709  1811 acda1fda      	jpf	L353
5710  1815               L302:
5711                     ; 2415   	 case 64:
5711                     ; 2416 		   
5711                     ; 2417 		   if(!timerGetOverflow(4)){
5713  1815 a604          	ld	a,#4
5714  1817 cd0000        	call	_timerGetOverflow
5716  181a 4d            	tnz	a
5717  181b 2604          	jrne	L5201
5718                     ; 2419 				 ack = FALSE;
5720  181d 3f0b          	clr	_ack
5721                     ; 2421 				 return;
5724  181f 85            	popw	x
5725  1820 81            	ret
5726  1821               L5201:
5727                     ; 2425 			 if(ack){
5729  1821 3d0b          	tnz	_ack
5730  1823 2744          	jreq	L7201
5731                     ; 2427 				 ack   = FALSE;
5733  1825 3f0b          	clr	_ack
5734                     ; 2428 				 state = DELAY;
5736  1827 35520000      	mov	_state,#82
5737                     ; 2429 				 stack = 68; 
5739  182b 35440001      	mov	_stack,#68
5740                     ; 2431 				 timerReset (1);
5742  182f a601          	ld	a,#1
5743  1831 cd0000        	call	_timerReset
5745                     ; 2433 				 timerReset (3);
5747  1834 a603          	ld	a,#3
5748  1836 cd0000        	call	_timerReset
5750                     ; 2434 				 timerEnable(3, ENABLE);
5752  1839 ae0301        	ldw	x,#769
5753  183c cd0000        	call	_timerEnable
5755                     ; 2436 				 timerReset (4);
5757  183f a604          	ld	a,#4
5758  1841 cd0000        	call	_timerReset
5760                     ; 2437 				 timerEnable(4, ENABLE);
5762  1844 ae0401        	ldw	x,#1025
5763  1847 cd0000        	call	_timerEnable
5765                     ; 2439          GPIO_WriteLow (CH1);				 
5767  184a 4b40          	push	#64
5768  184c ae500a        	ldw	x,#20490
5769  184f cd0000        	call	_GPIO_WriteLow
5771  1852 84            	pop	a
5772                     ; 2440 				 GPIO_WriteHigh(CH2);
5774  1853 4b10          	push	#16
5775  1855 ae500a        	ldw	x,#20490
5776  1858 cd0000        	call	_GPIO_WriteHigh
5778  185b 84            	pop	a
5779                     ; 2442 				 ioCommSetDir(OUTPUT);
5781  185c 4f            	clr	a
5782  185d cd0000        	call	_ioCommSetDir
5784                     ; 2444 				 GPIO_WriteHigh(COMM);
5786  1860 4b20          	push	#32
5787  1862 ae5000        	ldw	x,#20480
5788  1865 cd0000        	call	_GPIO_WriteHigh
5790  1868 84            	pop	a
5791  1869               L7201:
5792                     ; 2448 			 if(timerGetOverflow(1)){
5794  1869 a601          	ld	a,#1
5795  186b cd0000        	call	_timerGetOverflow
5797  186e 4d            	tnz	a
5798  186f 2603          	jrne	L042
5799  1871 cc1fda        	jp	L353
5800  1874               L042:
5801                     ; 2450 				 state = DELAY;
5803  1874 35520000      	mov	_state,#82
5804                     ; 2451 				 stack = 65;
5806  1878 35410001      	mov	_stack,#65
5807                     ; 2453 				 timerReset (1);
5809  187c a601          	ld	a,#1
5810  187e cd0000        	call	_timerReset
5812                     ; 2455 				 timerReset (3);
5814  1881 a603          	ld	a,#3
5815  1883 cd0000        	call	_timerReset
5817                     ; 2456 				 timerEnable(3, ENABLE);
5819  1886 ae0301        	ldw	x,#769
5820  1889 cd0000        	call	_timerEnable
5822                     ; 2458 				 timerReset (4);
5824  188c a604          	ld	a,#4
5825  188e cd0000        	call	_timerReset
5827                     ; 2460 				 ioCommSetDir(OUTPUT);
5829  1891 4f            	clr	a
5830  1892 cd0000        	call	_ioCommSetDir
5832                     ; 2462 				 GPIO_WriteHigh(COMM);
5834  1895 4b20          	push	#32
5835  1897 ae5000        	ldw	x,#20480
5836  189a cd0000        	call	_GPIO_WriteHigh
5838  189d 84            	pop	a
5839  189e acda1fda      	jpf	L353
5840  18a2               L502:
5841                     ; 2468      case 65:
5841                     ; 2469 		   
5841                     ; 2470 		   if(!timerGetOverflow(4)){
5843  18a2 a604          	ld	a,#4
5844  18a4 cd0000        	call	_timerGetOverflow
5846  18a7 4d            	tnz	a
5847  18a8 2604          	jrne	L3301
5848                     ; 2472 				 ack = FALSE;
5850  18aa 3f0b          	clr	_ack
5851                     ; 2474 				 return;
5853  18ac 2058          	jra	L42
5854  18ae               L3301:
5855                     ; 2478 			 if(ack){
5857  18ae 3d0b          	tnz	_ack
5858  18b0 2732          	jreq	L5301
5859                     ; 2480 				 ack   = FALSE;
5861  18b2 3f0b          	clr	_ack
5862                     ; 2481 				 state = DELAY;
5864  18b4 35520000      	mov	_state,#82
5865                     ; 2482 				 stack = 66; 
5867  18b8 35420001      	mov	_stack,#66
5868                     ; 2484 				 timerReset (1);
5870  18bc a601          	ld	a,#1
5871  18be cd0000        	call	_timerReset
5873                     ; 2486 				 timerReset (3);
5875  18c1 a603          	ld	a,#3
5876  18c3 cd0000        	call	_timerReset
5878                     ; 2487 				 timerEnable(3, ENABLE);
5880  18c6 ae0301        	ldw	x,#769
5881  18c9 cd0000        	call	_timerEnable
5883                     ; 2489 				 timerReset (4);
5885  18cc a604          	ld	a,#4
5886  18ce cd0000        	call	_timerReset
5888                     ; 2490 				 timerEnable(4, ENABLE);
5890  18d1 ae0401        	ldw	x,#1025
5891  18d4 cd0000        	call	_timerEnable
5893                     ; 2492 				 ioCommSetDir(OUTPUT);
5895  18d7 4f            	clr	a
5896  18d8 cd0000        	call	_ioCommSetDir
5898                     ; 2494 				 GPIO_WriteHigh(COMM);
5900  18db 4b20          	push	#32
5901  18dd ae5000        	ldw	x,#20480
5902  18e0 cd0000        	call	_GPIO_WriteHigh
5904  18e3 84            	pop	a
5905  18e4               L5301:
5906                     ; 2498 			 if(timerGetOverflow(1)){
5908  18e4 a601          	ld	a,#1
5909  18e6 cd0000        	call	_timerGetOverflow
5911  18e9 4d            	tnz	a
5912  18ea 2603          	jrne	L242
5913  18ec cc1fda        	jp	L353
5914  18ef               L242:
5915                     ; 2500 				 *control = 26;
5917  18ef 1e01          	ldw	x,(OFST+1,sp)
5918  18f1 a61a          	ld	a,#26
5919  18f3 f7            	ld	(x),a
5920                     ; 2501 				  state   = FINISH;
5922  18f4 35510000      	mov	_state,#81
5923  18f8 acda1fda      	jpf	L353
5924  18fc               L702:
5925                     ; 2507      case 66:
5925                     ; 2508 		   
5925                     ; 2509 		   if(!timerGetOverflow(4)){
5927  18fc a604          	ld	a,#4
5928  18fe cd0000        	call	_timerGetOverflow
5930  1901 4d            	tnz	a
5931  1902 2604          	jrne	L1401
5932                     ; 2511 				 ack = FALSE;
5934  1904 3f0b          	clr	_ack
5935                     ; 2513 				 return;
5936  1906               L42:
5939  1906 85            	popw	x
5940  1907 81            	ret
5941  1908               L1401:
5942                     ; 2517 			 if(ack){
5944  1908 3d0b          	tnz	_ack
5945  190a 2732          	jreq	L3401
5946                     ; 2519 				 ack   = FALSE;
5948  190c 3f0b          	clr	_ack
5949                     ; 2520 				 state = DELAY;
5951  190e 35520000      	mov	_state,#82
5952                     ; 2521 				 stack = 67; 
5954  1912 35430001      	mov	_stack,#67
5955                     ; 2523 				 timerReset (1);
5957  1916 a601          	ld	a,#1
5958  1918 cd0000        	call	_timerReset
5960                     ; 2525 				 timerReset (3);
5962  191b a603          	ld	a,#3
5963  191d cd0000        	call	_timerReset
5965                     ; 2526 				 timerEnable(3, ENABLE);
5967  1920 ae0301        	ldw	x,#769
5968  1923 cd0000        	call	_timerEnable
5970                     ; 2528 				 timerReset (4);
5972  1926 a604          	ld	a,#4
5973  1928 cd0000        	call	_timerReset
5975                     ; 2529 				 timerEnable(4, ENABLE);
5977  192b ae0401        	ldw	x,#1025
5978  192e cd0000        	call	_timerEnable
5980                     ; 2531 				 ioCommSetDir(OUTPUT);
5982  1931 4f            	clr	a
5983  1932 cd0000        	call	_ioCommSetDir
5985                     ; 2533 				 GPIO_WriteHigh(COMM);
5987  1935 4b20          	push	#32
5988  1937 ae5000        	ldw	x,#20480
5989  193a cd0000        	call	_GPIO_WriteHigh
5991  193d 84            	pop	a
5992  193e               L3401:
5993                     ; 2537 			 if(timerGetOverflow(1)){
5995  193e a601          	ld	a,#1
5996  1940 cd0000        	call	_timerGetOverflow
5998  1943 4d            	tnz	a
5999  1944 2603          	jrne	L442
6000  1946 cc1fda        	jp	L353
6001  1949               L442:
6002                     ; 2539 				 *control = 26;
6004  1949 1e01          	ldw	x,(OFST+1,sp)
6005  194b a61a          	ld	a,#26
6006  194d f7            	ld	(x),a
6007                     ; 2540 				  state   = FINISH;
6009  194e 35510000      	mov	_state,#81
6010  1952 acda1fda      	jpf	L353
6011  1956               L112:
6012                     ; 2546 case 67:
6012                     ; 2547 		   
6012                     ; 2548 		   if(!timerGetOverflow(4)){
6014  1956 a604          	ld	a,#4
6015  1958 cd0000        	call	_timerGetOverflow
6017  195b 4d            	tnz	a
6018  195c 2604          	jrne	L7401
6019                     ; 2550 				 ack = FALSE;
6021  195e 3f0b          	clr	_ack
6022                     ; 2552 				 return;
6024  1960 20a4          	jra	L42
6025  1962               L7401:
6026                     ; 2556 			 if(ack){
6028  1962 3d0b          	tnz	_ack
6029  1964 2744          	jreq	L1501
6030                     ; 2558 				 ack   = FALSE;
6032  1966 3f0b          	clr	_ack
6033                     ; 2559 				 state = DELAY;
6035  1968 35520000      	mov	_state,#82
6036                     ; 2560 				 stack = 68; 
6038  196c 35440001      	mov	_stack,#68
6039                     ; 2562 				 timerReset (1);
6041  1970 a601          	ld	a,#1
6042  1972 cd0000        	call	_timerReset
6044                     ; 2564 				 timerReset (3);
6046  1975 a603          	ld	a,#3
6047  1977 cd0000        	call	_timerReset
6049                     ; 2565 				 timerEnable(3, ENABLE);
6051  197a ae0301        	ldw	x,#769
6052  197d cd0000        	call	_timerEnable
6054                     ; 2567 				 timerReset (4);
6056  1980 a604          	ld	a,#4
6057  1982 cd0000        	call	_timerReset
6059                     ; 2568 				 timerEnable(4, ENABLE);
6061  1985 ae0401        	ldw	x,#1025
6062  1988 cd0000        	call	_timerEnable
6064                     ; 2570          GPIO_WriteLow (CH1);				 
6066  198b 4b40          	push	#64
6067  198d ae500a        	ldw	x,#20490
6068  1990 cd0000        	call	_GPIO_WriteLow
6070  1993 84            	pop	a
6071                     ; 2571 				 GPIO_WriteHigh(CH2);
6073  1994 4b10          	push	#16
6074  1996 ae500a        	ldw	x,#20490
6075  1999 cd0000        	call	_GPIO_WriteHigh
6077  199c 84            	pop	a
6078                     ; 2573 				 ioCommSetDir(OUTPUT);
6080  199d 4f            	clr	a
6081  199e cd0000        	call	_ioCommSetDir
6083                     ; 2575 				 GPIO_WriteHigh(COMM);
6085  19a1 4b20          	push	#32
6086  19a3 ae5000        	ldw	x,#20480
6087  19a6 cd0000        	call	_GPIO_WriteHigh
6089  19a9 84            	pop	a
6090  19aa               L1501:
6091                     ; 2579 			 if(timerGetOverflow(1)){
6093  19aa a601          	ld	a,#1
6094  19ac cd0000        	call	_timerGetOverflow
6096  19af 4d            	tnz	a
6097  19b0 2603          	jrne	L642
6098  19b2 cc1fda        	jp	L353
6099  19b5               L642:
6100                     ; 2581 				 *control = 26;
6102  19b5 1e01          	ldw	x,(OFST+1,sp)
6103  19b7 a61a          	ld	a,#26
6104  19b9 f7            	ld	(x),a
6105                     ; 2582 				  state   = FINISH;
6107  19ba 35510000      	mov	_state,#81
6108  19be acda1fda      	jpf	L353
6109  19c2               L312:
6110                     ; 2588 		 case 68:
6110                     ; 2589 		   
6110                     ; 2590 		   if(!timerGetOverflow(4)){
6112  19c2 a604          	ld	a,#4
6113  19c4 cd0000        	call	_timerGetOverflow
6115  19c7 4d            	tnz	a
6116  19c8 2604          	jrne	L5501
6117                     ; 2592 				 ack = FALSE;
6119  19ca 3f0b          	clr	_ack
6120                     ; 2594 				 return;
6123  19cc 85            	popw	x
6124  19cd 81            	ret
6125  19ce               L5501:
6126                     ; 2598 			 if(ack){
6128  19ce 3d0b          	tnz	_ack
6129  19d0 2744          	jreq	L7501
6130                     ; 2600 				 ack   = FALSE;
6132  19d2 3f0b          	clr	_ack
6133                     ; 2601 				 state = DELAY;
6135  19d4 35520000      	mov	_state,#82
6136                     ; 2602 				 stack = 72; 
6138  19d8 35480001      	mov	_stack,#72
6139                     ; 2604 				 timerReset (1);
6141  19dc a601          	ld	a,#1
6142  19de cd0000        	call	_timerReset
6144                     ; 2606 				 timerReset (3);
6146  19e1 a603          	ld	a,#3
6147  19e3 cd0000        	call	_timerReset
6149                     ; 2607 				 timerEnable(3, ENABLE);
6151  19e6 ae0301        	ldw	x,#769
6152  19e9 cd0000        	call	_timerEnable
6154                     ; 2609 				 timerReset (4);
6156  19ec a604          	ld	a,#4
6157  19ee cd0000        	call	_timerReset
6159                     ; 2610 				 timerEnable(4, ENABLE);
6161  19f1 ae0401        	ldw	x,#1025
6162  19f4 cd0000        	call	_timerEnable
6164                     ; 2612          GPIO_WriteLow (CH2);				 
6166  19f7 4b10          	push	#16
6167  19f9 ae500a        	ldw	x,#20490
6168  19fc cd0000        	call	_GPIO_WriteLow
6170  19ff 84            	pop	a
6171                     ; 2613 				 GPIO_WriteHigh(CH3);
6173  1a00 4b04          	push	#4
6174  1a02 ae500a        	ldw	x,#20490
6175  1a05 cd0000        	call	_GPIO_WriteHigh
6177  1a08 84            	pop	a
6178                     ; 2615 				 ioCommSetDir(OUTPUT);
6180  1a09 4f            	clr	a
6181  1a0a cd0000        	call	_ioCommSetDir
6183                     ; 2617 				 GPIO_WriteHigh(COMM);
6185  1a0d 4b20          	push	#32
6186  1a0f ae5000        	ldw	x,#20480
6187  1a12 cd0000        	call	_GPIO_WriteHigh
6189  1a15 84            	pop	a
6190  1a16               L7501:
6191                     ; 2621 			 if(timerGetOverflow(1)){
6193  1a16 a601          	ld	a,#1
6194  1a18 cd0000        	call	_timerGetOverflow
6196  1a1b 4d            	tnz	a
6197  1a1c 2603          	jrne	L052
6198  1a1e cc1fda        	jp	L353
6199  1a21               L052:
6200                     ; 2623 				 state = DELAY;
6202  1a21 35520000      	mov	_state,#82
6203                     ; 2624 				 stack = 69;
6205  1a25 35450001      	mov	_stack,#69
6206                     ; 2626 				 timerReset (1);
6208  1a29 a601          	ld	a,#1
6209  1a2b cd0000        	call	_timerReset
6211                     ; 2628 				 timerReset (3);
6213  1a2e a603          	ld	a,#3
6214  1a30 cd0000        	call	_timerReset
6216                     ; 2629 				 timerEnable(3, ENABLE);
6218  1a33 ae0301        	ldw	x,#769
6219  1a36 cd0000        	call	_timerEnable
6221                     ; 2631 				 timerReset (4);
6223  1a39 a604          	ld	a,#4
6224  1a3b cd0000        	call	_timerReset
6226                     ; 2633 				 ioCommSetDir(OUTPUT);
6228  1a3e 4f            	clr	a
6229  1a3f cd0000        	call	_ioCommSetDir
6231                     ; 2635 				 GPIO_WriteHigh(COMM);
6233  1a42 4b20          	push	#32
6234  1a44 ae5000        	ldw	x,#20480
6235  1a47 cd0000        	call	_GPIO_WriteHigh
6237  1a4a 84            	pop	a
6238  1a4b acda1fda      	jpf	L353
6239  1a4f               L512:
6240                     ; 2641      case 69:
6240                     ; 2642 		   
6240                     ; 2643 		   if(!timerGetOverflow(4)){
6242  1a4f a604          	ld	a,#4
6243  1a51 cd0000        	call	_timerGetOverflow
6245  1a54 4d            	tnz	a
6246  1a55 2604          	jrne	L3601
6247                     ; 2645 				 ack = FALSE;
6249  1a57 3f0b          	clr	_ack
6250                     ; 2647 				 return;
6252  1a59 2058          	jra	L62
6253  1a5b               L3601:
6254                     ; 2651 			 if(ack){
6256  1a5b 3d0b          	tnz	_ack
6257  1a5d 2732          	jreq	L5601
6258                     ; 2653 				 ack   = FALSE;
6260  1a5f 3f0b          	clr	_ack
6261                     ; 2654 				 state = DELAY;
6263  1a61 35520000      	mov	_state,#82
6264                     ; 2655 				 stack = 70; 
6266  1a65 35460001      	mov	_stack,#70
6267                     ; 2657 				 timerReset (1);
6269  1a69 a601          	ld	a,#1
6270  1a6b cd0000        	call	_timerReset
6272                     ; 2659 				 timerReset (3);
6274  1a6e a603          	ld	a,#3
6275  1a70 cd0000        	call	_timerReset
6277                     ; 2660 				 timerEnable(3, ENABLE);
6279  1a73 ae0301        	ldw	x,#769
6280  1a76 cd0000        	call	_timerEnable
6282                     ; 2662 				 timerReset (4);
6284  1a79 a604          	ld	a,#4
6285  1a7b cd0000        	call	_timerReset
6287                     ; 2663 				 timerEnable(4, ENABLE);
6289  1a7e ae0401        	ldw	x,#1025
6290  1a81 cd0000        	call	_timerEnable
6292                     ; 2665 				 ioCommSetDir(OUTPUT);
6294  1a84 4f            	clr	a
6295  1a85 cd0000        	call	_ioCommSetDir
6297                     ; 2667 				 GPIO_WriteHigh(COMM);
6299  1a88 4b20          	push	#32
6300  1a8a ae5000        	ldw	x,#20480
6301  1a8d cd0000        	call	_GPIO_WriteHigh
6303  1a90 84            	pop	a
6304  1a91               L5601:
6305                     ; 2671 			 if(timerGetOverflow(1)){
6307  1a91 a601          	ld	a,#1
6308  1a93 cd0000        	call	_timerGetOverflow
6310  1a96 4d            	tnz	a
6311  1a97 2603          	jrne	L252
6312  1a99 cc1fda        	jp	L353
6313  1a9c               L252:
6314                     ; 2673 				 *control = 27;
6316  1a9c 1e01          	ldw	x,(OFST+1,sp)
6317  1a9e a61b          	ld	a,#27
6318  1aa0 f7            	ld	(x),a
6319                     ; 2674 					state   = FINISH;
6321  1aa1 35510000      	mov	_state,#81
6322  1aa5 acda1fda      	jpf	L353
6323  1aa9               L712:
6324                     ; 2680      case 70:
6324                     ; 2681 		   
6324                     ; 2682 		   if(!timerGetOverflow(4)){
6326  1aa9 a604          	ld	a,#4
6327  1aab cd0000        	call	_timerGetOverflow
6329  1aae 4d            	tnz	a
6330  1aaf 2604          	jrne	L1701
6331                     ; 2684 				 ack = FALSE;
6333  1ab1 3f0b          	clr	_ack
6334                     ; 2686 				 return;
6335  1ab3               L62:
6338  1ab3 85            	popw	x
6339  1ab4 81            	ret
6340  1ab5               L1701:
6341                     ; 2690 			 if(ack){
6343  1ab5 3d0b          	tnz	_ack
6344  1ab7 2732          	jreq	L3701
6345                     ; 2692 				 ack   = FALSE;
6347  1ab9 3f0b          	clr	_ack
6348                     ; 2693 				 state = DELAY;
6350  1abb 35520000      	mov	_state,#82
6351                     ; 2694 				 stack = 71; 
6353  1abf 35470001      	mov	_stack,#71
6354                     ; 2696 				 timerReset (1);
6356  1ac3 a601          	ld	a,#1
6357  1ac5 cd0000        	call	_timerReset
6359                     ; 2698 				 timerReset (3);
6361  1ac8 a603          	ld	a,#3
6362  1aca cd0000        	call	_timerReset
6364                     ; 2699 				 timerEnable(3, ENABLE);
6366  1acd ae0301        	ldw	x,#769
6367  1ad0 cd0000        	call	_timerEnable
6369                     ; 2701 				 timerReset (4);
6371  1ad3 a604          	ld	a,#4
6372  1ad5 cd0000        	call	_timerReset
6374                     ; 2702 				 timerEnable(4, ENABLE);
6376  1ad8 ae0401        	ldw	x,#1025
6377  1adb cd0000        	call	_timerEnable
6379                     ; 2704 				 ioCommSetDir(OUTPUT);
6381  1ade 4f            	clr	a
6382  1adf cd0000        	call	_ioCommSetDir
6384                     ; 2706 				 GPIO_WriteHigh(COMM);
6386  1ae2 4b20          	push	#32
6387  1ae4 ae5000        	ldw	x,#20480
6388  1ae7 cd0000        	call	_GPIO_WriteHigh
6390  1aea 84            	pop	a
6391  1aeb               L3701:
6392                     ; 2710 			 if(timerGetOverflow(1)){
6394  1aeb a601          	ld	a,#1
6395  1aed cd0000        	call	_timerGetOverflow
6397  1af0 4d            	tnz	a
6398  1af1 2603          	jrne	L452
6399  1af3 cc1fda        	jp	L353
6400  1af6               L452:
6401                     ; 2712 				 *control = 27;
6403  1af6 1e01          	ldw	x,(OFST+1,sp)
6404  1af8 a61b          	ld	a,#27
6405  1afa f7            	ld	(x),a
6406                     ; 2713 					state   = FINISH;
6408  1afb 35510000      	mov	_state,#81
6409  1aff acda1fda      	jpf	L353
6410  1b03               L122:
6411                     ; 2719    case 71:
6411                     ; 2720 		   
6411                     ; 2721 		   if(!timerGetOverflow(4)){
6413  1b03 a604          	ld	a,#4
6414  1b05 cd0000        	call	_timerGetOverflow
6416  1b08 4d            	tnz	a
6417  1b09 2604          	jrne	L7701
6418                     ; 2723 				 ack = FALSE;
6420  1b0b 3f0b          	clr	_ack
6421                     ; 2725 				 return;
6423  1b0d 20a4          	jra	L62
6424  1b0f               L7701:
6425                     ; 2729 			 if(ack){
6427  1b0f 3d0b          	tnz	_ack
6428  1b11 2744          	jreq	L1011
6429                     ; 2731 				 ack   = FALSE;
6431  1b13 3f0b          	clr	_ack
6432                     ; 2732 				 state = DELAY;
6434  1b15 35520000      	mov	_state,#82
6435                     ; 2733 				 stack = 72; 
6437  1b19 35480001      	mov	_stack,#72
6438                     ; 2735 				 timerReset (1);
6440  1b1d a601          	ld	a,#1
6441  1b1f cd0000        	call	_timerReset
6443                     ; 2737 				 timerReset (3);
6445  1b22 a603          	ld	a,#3
6446  1b24 cd0000        	call	_timerReset
6448                     ; 2738 				 timerEnable(3, ENABLE);
6450  1b27 ae0301        	ldw	x,#769
6451  1b2a cd0000        	call	_timerEnable
6453                     ; 2740 				 timerReset (4);
6455  1b2d a604          	ld	a,#4
6456  1b2f cd0000        	call	_timerReset
6458                     ; 2741 				 timerEnable(4, ENABLE);
6460  1b32 ae0401        	ldw	x,#1025
6461  1b35 cd0000        	call	_timerEnable
6463                     ; 2743 				 GPIO_WriteLow (CH2);				 
6465  1b38 4b10          	push	#16
6466  1b3a ae500a        	ldw	x,#20490
6467  1b3d cd0000        	call	_GPIO_WriteLow
6469  1b40 84            	pop	a
6470                     ; 2744 				 GPIO_WriteHigh(CH3);
6472  1b41 4b04          	push	#4
6473  1b43 ae500a        	ldw	x,#20490
6474  1b46 cd0000        	call	_GPIO_WriteHigh
6476  1b49 84            	pop	a
6477                     ; 2746 				 ioCommSetDir(OUTPUT);
6479  1b4a 4f            	clr	a
6480  1b4b cd0000        	call	_ioCommSetDir
6482                     ; 2748 				 GPIO_WriteHigh(COMM);
6484  1b4e 4b20          	push	#32
6485  1b50 ae5000        	ldw	x,#20480
6486  1b53 cd0000        	call	_GPIO_WriteHigh
6488  1b56 84            	pop	a
6489  1b57               L1011:
6490                     ; 2752 			 if(timerGetOverflow(1)){
6492  1b57 a601          	ld	a,#1
6493  1b59 cd0000        	call	_timerGetOverflow
6495  1b5c 4d            	tnz	a
6496  1b5d 2603          	jrne	L652
6497  1b5f cc1fda        	jp	L353
6498  1b62               L652:
6499                     ; 2754 				 *control = 27;
6501  1b62 1e01          	ldw	x,(OFST+1,sp)
6502  1b64 a61b          	ld	a,#27
6503  1b66 f7            	ld	(x),a
6504                     ; 2755 					state   = FINISH;
6506  1b67 35510000      	mov	_state,#81
6507  1b6b acda1fda      	jpf	L353
6508  1b6f               L322:
6509                     ; 2761 		 case 72:
6509                     ; 2762 		    
6509                     ; 2763 			 if(!timerGetOverflow(4)){
6511  1b6f a604          	ld	a,#4
6512  1b71 cd0000        	call	_timerGetOverflow
6514  1b74 4d            	tnz	a
6515  1b75 2604          	jrne	L5011
6516                     ; 2765 				 ack = FALSE;
6518  1b77 3f0b          	clr	_ack
6519                     ; 2767 				 return;
6522  1b79 85            	popw	x
6523  1b7a 81            	ret
6524  1b7b               L5011:
6525                     ; 2771 			 if(ack){
6527  1b7b 3d0b          	tnz	_ack
6528  1b7d 2744          	jreq	L7011
6529                     ; 2773 				 ack   = FALSE;
6531  1b7f 3f0b          	clr	_ack
6532                     ; 2774 				 state = DELAY;
6534  1b81 35520000      	mov	_state,#82
6535                     ; 2775 				 stack = 76; 
6537  1b85 354c0001      	mov	_stack,#76
6538                     ; 2777 				 timerReset (1);
6540  1b89 a601          	ld	a,#1
6541  1b8b cd0000        	call	_timerReset
6543                     ; 2779 				 timerReset (3);
6545  1b8e a603          	ld	a,#3
6546  1b90 cd0000        	call	_timerReset
6548                     ; 2780 				 timerEnable(3, ENABLE);
6550  1b93 ae0301        	ldw	x,#769
6551  1b96 cd0000        	call	_timerEnable
6553                     ; 2782 				 timerReset (4);
6555  1b99 a604          	ld	a,#4
6556  1b9b cd0000        	call	_timerReset
6558                     ; 2783 				 timerEnable(4, ENABLE);
6560  1b9e ae0401        	ldw	x,#1025
6561  1ba1 cd0000        	call	_timerEnable
6563                     ; 2785          GPIO_WriteLow (CH3);				 
6565  1ba4 4b04          	push	#4
6566  1ba6 ae500a        	ldw	x,#20490
6567  1ba9 cd0000        	call	_GPIO_WriteLow
6569  1bac 84            	pop	a
6570                     ; 2786 				 GPIO_WriteHigh(CH4);
6572  1bad 4b20          	push	#32
6573  1baf ae5014        	ldw	x,#20500
6574  1bb2 cd0000        	call	_GPIO_WriteHigh
6576  1bb5 84            	pop	a
6577                     ; 2788 				 ioCommSetDir(OUTPUT);
6579  1bb6 4f            	clr	a
6580  1bb7 cd0000        	call	_ioCommSetDir
6582                     ; 2790 				 GPIO_WriteHigh(COMM);
6584  1bba 4b20          	push	#32
6585  1bbc ae5000        	ldw	x,#20480
6586  1bbf cd0000        	call	_GPIO_WriteHigh
6588  1bc2 84            	pop	a
6589  1bc3               L7011:
6590                     ; 2794 			 if(timerGetOverflow(1)){
6592  1bc3 a601          	ld	a,#1
6593  1bc5 cd0000        	call	_timerGetOverflow
6595  1bc8 4d            	tnz	a
6596  1bc9 2603          	jrne	L062
6597  1bcb cc1fda        	jp	L353
6598  1bce               L062:
6599                     ; 2796 				 state = DELAY;
6601  1bce 35520000      	mov	_state,#82
6602                     ; 2797 				 stack = 73;
6604  1bd2 35490001      	mov	_stack,#73
6605                     ; 2799 				 timerReset (1);
6607  1bd6 a601          	ld	a,#1
6608  1bd8 cd0000        	call	_timerReset
6610                     ; 2801 				 timerReset (3);
6612  1bdb a603          	ld	a,#3
6613  1bdd cd0000        	call	_timerReset
6615                     ; 2802 				 timerEnable(3, ENABLE);
6617  1be0 ae0301        	ldw	x,#769
6618  1be3 cd0000        	call	_timerEnable
6620                     ; 2804 				 timerReset (4);
6622  1be6 a604          	ld	a,#4
6623  1be8 cd0000        	call	_timerReset
6625                     ; 2806 				 ioCommSetDir(OUTPUT);
6627  1beb 4f            	clr	a
6628  1bec cd0000        	call	_ioCommSetDir
6630                     ; 2808 				 GPIO_WriteHigh(COMM);
6632  1bef 4b20          	push	#32
6633  1bf1 ae5000        	ldw	x,#20480
6634  1bf4 cd0000        	call	_GPIO_WriteHigh
6636  1bf7 84            	pop	a
6637  1bf8 acda1fda      	jpf	L353
6638  1bfc               L522:
6639                     ; 2814      case 73:
6639                     ; 2815 		    
6639                     ; 2816 			 if(!timerGetOverflow(4)){
6641  1bfc a604          	ld	a,#4
6642  1bfe cd0000        	call	_timerGetOverflow
6644  1c01 4d            	tnz	a
6645  1c02 2604          	jrne	L3111
6646                     ; 2818 				 ack = FALSE;
6648  1c04 3f0b          	clr	_ack
6649                     ; 2820 				 return;
6651  1c06 2058          	jra	L03
6652  1c08               L3111:
6653                     ; 2824 			 if(ack){
6655  1c08 3d0b          	tnz	_ack
6656  1c0a 2732          	jreq	L5111
6657                     ; 2826 				 ack   = FALSE;
6659  1c0c 3f0b          	clr	_ack
6660                     ; 2827 				 state = DELAY;
6662  1c0e 35520000      	mov	_state,#82
6663                     ; 2828 				 stack = 74; 
6665  1c12 354a0001      	mov	_stack,#74
6666                     ; 2830 				 timerReset (1);
6668  1c16 a601          	ld	a,#1
6669  1c18 cd0000        	call	_timerReset
6671                     ; 2832 				 timerReset (3);
6673  1c1b a603          	ld	a,#3
6674  1c1d cd0000        	call	_timerReset
6676                     ; 2833 				 timerEnable(3, ENABLE);
6678  1c20 ae0301        	ldw	x,#769
6679  1c23 cd0000        	call	_timerEnable
6681                     ; 2835 				 timerReset (4);
6683  1c26 a604          	ld	a,#4
6684  1c28 cd0000        	call	_timerReset
6686                     ; 2836 				 timerEnable(4, ENABLE);
6688  1c2b ae0401        	ldw	x,#1025
6689  1c2e cd0000        	call	_timerEnable
6691                     ; 2838 				 ioCommSetDir(OUTPUT);
6693  1c31 4f            	clr	a
6694  1c32 cd0000        	call	_ioCommSetDir
6696                     ; 2840 				 GPIO_WriteHigh(COMM);
6698  1c35 4b20          	push	#32
6699  1c37 ae5000        	ldw	x,#20480
6700  1c3a cd0000        	call	_GPIO_WriteHigh
6702  1c3d 84            	pop	a
6703  1c3e               L5111:
6704                     ; 2844 			 if(timerGetOverflow(1)){
6706  1c3e a601          	ld	a,#1
6707  1c40 cd0000        	call	_timerGetOverflow
6709  1c43 4d            	tnz	a
6710  1c44 2603          	jrne	L262
6711  1c46 cc1fda        	jp	L353
6712  1c49               L262:
6713                     ; 2846 				 *control = 28;
6715  1c49 1e01          	ldw	x,(OFST+1,sp)
6716  1c4b a61c          	ld	a,#28
6717  1c4d f7            	ld	(x),a
6718                     ; 2847 				  state   = FINISH;
6720  1c4e 35510000      	mov	_state,#81
6721  1c52 acda1fda      	jpf	L353
6722  1c56               L722:
6723                     ; 2853      case 74:
6723                     ; 2854 		    
6723                     ; 2855 			 if(!timerGetOverflow(4)){
6725  1c56 a604          	ld	a,#4
6726  1c58 cd0000        	call	_timerGetOverflow
6728  1c5b 4d            	tnz	a
6729  1c5c 2604          	jrne	L1211
6730                     ; 2857 				 ack = FALSE;
6732  1c5e 3f0b          	clr	_ack
6733                     ; 2859 				 return;
6734  1c60               L03:
6737  1c60 85            	popw	x
6738  1c61 81            	ret
6739  1c62               L1211:
6740                     ; 2863 			 if(ack){
6742  1c62 3d0b          	tnz	_ack
6743  1c64 2732          	jreq	L3211
6744                     ; 2865 				 ack   = FALSE;
6746  1c66 3f0b          	clr	_ack
6747                     ; 2866 				 state = DELAY;
6749  1c68 35520000      	mov	_state,#82
6750                     ; 2867 				 stack = 75; 
6752  1c6c 354b0001      	mov	_stack,#75
6753                     ; 2869 				 timerReset (1);
6755  1c70 a601          	ld	a,#1
6756  1c72 cd0000        	call	_timerReset
6758                     ; 2871 				 timerReset (3);
6760  1c75 a603          	ld	a,#3
6761  1c77 cd0000        	call	_timerReset
6763                     ; 2872 				 timerEnable(3, ENABLE);
6765  1c7a ae0301        	ldw	x,#769
6766  1c7d cd0000        	call	_timerEnable
6768                     ; 2874 				 timerReset (4);
6770  1c80 a604          	ld	a,#4
6771  1c82 cd0000        	call	_timerReset
6773                     ; 2875 				 timerEnable(4, ENABLE);
6775  1c85 ae0401        	ldw	x,#1025
6776  1c88 cd0000        	call	_timerEnable
6778                     ; 2877 				 ioCommSetDir(OUTPUT);
6780  1c8b 4f            	clr	a
6781  1c8c cd0000        	call	_ioCommSetDir
6783                     ; 2879 				 GPIO_WriteHigh(COMM);
6785  1c8f 4b20          	push	#32
6786  1c91 ae5000        	ldw	x,#20480
6787  1c94 cd0000        	call	_GPIO_WriteHigh
6789  1c97 84            	pop	a
6790  1c98               L3211:
6791                     ; 2883 			 if(timerGetOverflow(1)){
6793  1c98 a601          	ld	a,#1
6794  1c9a cd0000        	call	_timerGetOverflow
6796  1c9d 4d            	tnz	a
6797  1c9e 2603          	jrne	L462
6798  1ca0 cc1fda        	jp	L353
6799  1ca3               L462:
6800                     ; 2885 				 *control = 28;
6802  1ca3 1e01          	ldw	x,(OFST+1,sp)
6803  1ca5 a61c          	ld	a,#28
6804  1ca7 f7            	ld	(x),a
6805                     ; 2886 				  state   = FINISH;
6807  1ca8 35510000      	mov	_state,#81
6808  1cac acda1fda      	jpf	L353
6809  1cb0               L132:
6810                     ; 2892      case 75:
6810                     ; 2893 		    
6810                     ; 2894 			 if(!timerGetOverflow(4)){
6812  1cb0 a604          	ld	a,#4
6813  1cb2 cd0000        	call	_timerGetOverflow
6815  1cb5 4d            	tnz	a
6816  1cb6 2604          	jrne	L7211
6817                     ; 2896 				 ack = FALSE;
6819  1cb8 3f0b          	clr	_ack
6820                     ; 2898 				 return;
6822  1cba 20a4          	jra	L03
6823  1cbc               L7211:
6824                     ; 2902 			 if(ack){
6826  1cbc 3d0b          	tnz	_ack
6827  1cbe 2744          	jreq	L1311
6828                     ; 2904 				 ack   = FALSE;
6830  1cc0 3f0b          	clr	_ack
6831                     ; 2905 				 state = DELAY;
6833  1cc2 35520000      	mov	_state,#82
6834                     ; 2906 				 stack = 76; 
6836  1cc6 354c0001      	mov	_stack,#76
6837                     ; 2908 				 timerReset (1);
6839  1cca a601          	ld	a,#1
6840  1ccc cd0000        	call	_timerReset
6842                     ; 2910 				 timerReset (3);
6844  1ccf a603          	ld	a,#3
6845  1cd1 cd0000        	call	_timerReset
6847                     ; 2911 				 timerEnable(3, ENABLE);
6849  1cd4 ae0301        	ldw	x,#769
6850  1cd7 cd0000        	call	_timerEnable
6852                     ; 2913 				 timerReset (4);
6854  1cda a604          	ld	a,#4
6855  1cdc cd0000        	call	_timerReset
6857                     ; 2914 				 timerEnable(4, ENABLE);
6859  1cdf ae0401        	ldw	x,#1025
6860  1ce2 cd0000        	call	_timerEnable
6862                     ; 2916 				 GPIO_WriteLow (CH3);				 
6864  1ce5 4b04          	push	#4
6865  1ce7 ae500a        	ldw	x,#20490
6866  1cea cd0000        	call	_GPIO_WriteLow
6868  1ced 84            	pop	a
6869                     ; 2917 				 GPIO_WriteHigh(CH4);
6871  1cee 4b20          	push	#32
6872  1cf0 ae5014        	ldw	x,#20500
6873  1cf3 cd0000        	call	_GPIO_WriteHigh
6875  1cf6 84            	pop	a
6876                     ; 2919 				 ioCommSetDir(OUTPUT);
6878  1cf7 4f            	clr	a
6879  1cf8 cd0000        	call	_ioCommSetDir
6881                     ; 2921 				 GPIO_WriteHigh(COMM);
6883  1cfb 4b20          	push	#32
6884  1cfd ae5000        	ldw	x,#20480
6885  1d00 cd0000        	call	_GPIO_WriteHigh
6887  1d03 84            	pop	a
6888  1d04               L1311:
6889                     ; 2925 			 if(timerGetOverflow(1)){
6891  1d04 a601          	ld	a,#1
6892  1d06 cd0000        	call	_timerGetOverflow
6894  1d09 4d            	tnz	a
6895  1d0a 2603          	jrne	L662
6896  1d0c cc1fda        	jp	L353
6897  1d0f               L662:
6898                     ; 2927 				 *control = 28;
6900  1d0f 1e01          	ldw	x,(OFST+1,sp)
6901  1d11 a61c          	ld	a,#28
6902  1d13 f7            	ld	(x),a
6903                     ; 2928 				  state   = FINISH;
6905  1d14 35510000      	mov	_state,#81
6906  1d18 acda1fda      	jpf	L353
6907  1d1c               L332:
6908                     ; 2934  	   case 76:
6908                     ; 2935 		   
6908                     ; 2936 			 if(!timerGetOverflow(4)){
6910  1d1c a604          	ld	a,#4
6911  1d1e cd0000        	call	_timerGetOverflow
6913  1d21 4d            	tnz	a
6914  1d22 2604          	jrne	L5311
6915                     ; 2938 				 ack = FALSE;
6917  1d24 3f0b          	clr	_ack
6918                     ; 2940 				 return;
6921  1d26 85            	popw	x
6922  1d27 81            	ret
6923  1d28               L5311:
6924                     ; 2944 			 if(ack){
6926  1d28 3d0b          	tnz	_ack
6927  1d2a 2741          	jreq	L7311
6928                     ; 2946 				  ack     = FALSE;
6930  1d2c 3f0b          	clr	_ack
6931                     ; 2947 					state   = DELAY;
6933  1d2e 35520000      	mov	_state,#82
6934                     ; 2948 				  stack   = 80;
6936  1d32 35500001      	mov	_stack,#80
6937                     ; 2950 				 timerReset (1);
6939  1d36 a601          	ld	a,#1
6940  1d38 cd0000        	call	_timerReset
6942                     ; 2952 				 timerReset (3);
6944  1d3b a603          	ld	a,#3
6945  1d3d cd0000        	call	_timerReset
6947                     ; 2953 				 timerEnable(3, ENABLE);
6949  1d40 ae0301        	ldw	x,#769
6950  1d43 cd0000        	call	_timerEnable
6952                     ; 2955 				 timerSetOverflowValue(4, 220);
6954  1d46 ae00dc        	ldw	x,#220
6955  1d49 89            	pushw	x
6956  1d4a ae0000        	ldw	x,#0
6957  1d4d 89            	pushw	x
6958  1d4e a604          	ld	a,#4
6959  1d50 cd0000        	call	_timerSetOverflowValue
6961  1d53 5b04          	addw	sp,#4
6962                     ; 2956 				 timerReset           (4);
6964  1d55 a604          	ld	a,#4
6965  1d57 cd0000        	call	_timerReset
6967                     ; 2957 				 timerEnable          (4, ENABLE);
6969  1d5a ae0401        	ldw	x,#1025
6970  1d5d cd0000        	call	_timerEnable
6972                     ; 2959 				 ioCommSetDir(OUTPUT);
6974  1d60 4f            	clr	a
6975  1d61 cd0000        	call	_ioCommSetDir
6977                     ; 2961 				 GPIO_WriteHigh(COMM);
6979  1d64 4b20          	push	#32
6980  1d66 ae5000        	ldw	x,#20480
6981  1d69 cd0000        	call	_GPIO_WriteHigh
6983  1d6c 84            	pop	a
6984  1d6d               L7311:
6985                     ; 2965 			 if(timerGetOverflow(1)){
6987  1d6d a601          	ld	a,#1
6988  1d6f cd0000        	call	_timerGetOverflow
6990  1d72 4d            	tnz	a
6991  1d73 2603          	jrne	L072
6992  1d75 cc1fda        	jp	L353
6993  1d78               L072:
6994                     ; 2967 				 state = DELAY;
6996  1d78 35520000      	mov	_state,#82
6997                     ; 2968 				 stack = 77;
6999  1d7c 354d0001      	mov	_stack,#77
7000                     ; 2970 				 timerReset (1);
7002  1d80 a601          	ld	a,#1
7003  1d82 cd0000        	call	_timerReset
7005                     ; 2972 				 timerReset (3);
7007  1d85 a603          	ld	a,#3
7008  1d87 cd0000        	call	_timerReset
7010                     ; 2973 				 timerEnable(3, ENABLE);
7012  1d8a ae0301        	ldw	x,#769
7013  1d8d cd0000        	call	_timerEnable
7015                     ; 2975 				 timerReset (4);
7017  1d90 a604          	ld	a,#4
7018  1d92 cd0000        	call	_timerReset
7020                     ; 2977 				 ioCommSetDir(OUTPUT);
7022  1d95 4f            	clr	a
7023  1d96 cd0000        	call	_ioCommSetDir
7025                     ; 2979 				 GPIO_WriteHigh(COMM);	 
7027  1d99 4b20          	push	#32
7028  1d9b ae5000        	ldw	x,#20480
7029  1d9e cd0000        	call	_GPIO_WriteHigh
7031  1da1 84            	pop	a
7032  1da2 acda1fda      	jpf	L353
7033  1da6               L532:
7034                     ; 2985      case 77:
7034                     ; 2986 		   
7034                     ; 2987 			 if(!timerGetOverflow(4)){
7036  1da6 a604          	ld	a,#4
7037  1da8 cd0000        	call	_timerGetOverflow
7039  1dab 4d            	tnz	a
7040  1dac 2604          	jrne	L3411
7041                     ; 2989 				 ack = FALSE;
7043  1dae 3f0b          	clr	_ack
7044                     ; 2991 				 return;
7046  1db0 2058          	jra	L23
7047  1db2               L3411:
7048                     ; 2995 			 if(ack){
7050  1db2 3d0b          	tnz	_ack
7051  1db4 2732          	jreq	L5411
7052                     ; 2997 				  ack     = FALSE;
7054  1db6 3f0b          	clr	_ack
7055                     ; 2998 					state   = DELAY;
7057  1db8 35520000      	mov	_state,#82
7058                     ; 2999 				  stack   = 78;
7060  1dbc 354e0001      	mov	_stack,#78
7061                     ; 3001 				 timerReset (1);
7063  1dc0 a601          	ld	a,#1
7064  1dc2 cd0000        	call	_timerReset
7066                     ; 3003 				 timerReset (3);
7068  1dc5 a603          	ld	a,#3
7069  1dc7 cd0000        	call	_timerReset
7071                     ; 3004 				 timerEnable(3, ENABLE);
7073  1dca ae0301        	ldw	x,#769
7074  1dcd cd0000        	call	_timerEnable
7076                     ; 3006 				 timerReset (4);
7078  1dd0 a604          	ld	a,#4
7079  1dd2 cd0000        	call	_timerReset
7081                     ; 3007 				 timerEnable(4, ENABLE);
7083  1dd5 ae0401        	ldw	x,#1025
7084  1dd8 cd0000        	call	_timerEnable
7086                     ; 3009 				 ioCommSetDir(OUTPUT);
7088  1ddb 4f            	clr	a
7089  1ddc cd0000        	call	_ioCommSetDir
7091                     ; 3011 				 GPIO_WriteHigh(COMM);
7093  1ddf 4b20          	push	#32
7094  1de1 ae5000        	ldw	x,#20480
7095  1de4 cd0000        	call	_GPIO_WriteHigh
7097  1de7 84            	pop	a
7098  1de8               L5411:
7099                     ; 3015 			 if(timerGetOverflow(1)){
7101  1de8 a601          	ld	a,#1
7102  1dea cd0000        	call	_timerGetOverflow
7104  1ded 4d            	tnz	a
7105  1dee 2603          	jrne	L272
7106  1df0 cc1fda        	jp	L353
7107  1df3               L272:
7108                     ; 3017 				 *control = 29;
7110  1df3 1e01          	ldw	x,(OFST+1,sp)
7111  1df5 a61d          	ld	a,#29
7112  1df7 f7            	ld	(x),a
7113                     ; 3018 				  state   = FINISH;	 
7115  1df8 35510000      	mov	_state,#81
7116  1dfc acda1fda      	jpf	L353
7117  1e00               L732:
7118                     ; 3024      case 78:
7118                     ; 3025 		   
7118                     ; 3026 			 if(!timerGetOverflow(4)){
7120  1e00 a604          	ld	a,#4
7121  1e02 cd0000        	call	_timerGetOverflow
7123  1e05 4d            	tnz	a
7124  1e06 2604          	jrne	L1511
7125                     ; 3028 				 ack = FALSE;
7127  1e08 3f0b          	clr	_ack
7128                     ; 3030 				 return;
7129  1e0a               L23:
7132  1e0a 85            	popw	x
7133  1e0b 81            	ret
7134  1e0c               L1511:
7135                     ; 3034 			 if(ack){
7137  1e0c 3d0b          	tnz	_ack
7138  1e0e 2732          	jreq	L3511
7139                     ; 3036 				  ack     = FALSE;
7141  1e10 3f0b          	clr	_ack
7142                     ; 3037 					state   = DELAY;
7144  1e12 35520000      	mov	_state,#82
7145                     ; 3038 				  stack   = 79;
7147  1e16 354f0001      	mov	_stack,#79
7148                     ; 3040 				 timerReset (1);
7150  1e1a a601          	ld	a,#1
7151  1e1c cd0000        	call	_timerReset
7153                     ; 3042 				 timerReset (3);
7155  1e1f a603          	ld	a,#3
7156  1e21 cd0000        	call	_timerReset
7158                     ; 3043 				 timerEnable(3, ENABLE);
7160  1e24 ae0301        	ldw	x,#769
7161  1e27 cd0000        	call	_timerEnable
7163                     ; 3045 				 timerReset (4);
7165  1e2a a604          	ld	a,#4
7166  1e2c cd0000        	call	_timerReset
7168                     ; 3046 				 timerEnable(4, ENABLE);
7170  1e2f ae0401        	ldw	x,#1025
7171  1e32 cd0000        	call	_timerEnable
7173                     ; 3048 				 ioCommSetDir(OUTPUT);
7175  1e35 4f            	clr	a
7176  1e36 cd0000        	call	_ioCommSetDir
7178                     ; 3050 				 GPIO_WriteHigh(COMM);
7180  1e39 4b20          	push	#32
7181  1e3b ae5000        	ldw	x,#20480
7182  1e3e cd0000        	call	_GPIO_WriteHigh
7184  1e41 84            	pop	a
7185  1e42               L3511:
7186                     ; 3054 			 if(timerGetOverflow(1)){
7188  1e42 a601          	ld	a,#1
7189  1e44 cd0000        	call	_timerGetOverflow
7191  1e47 4d            	tnz	a
7192  1e48 2603          	jrne	L472
7193  1e4a cc1fda        	jp	L353
7194  1e4d               L472:
7195                     ; 3056 				 *control = 29;
7197  1e4d 1e01          	ldw	x,(OFST+1,sp)
7198  1e4f a61d          	ld	a,#29
7199  1e51 f7            	ld	(x),a
7200                     ; 3057 				  state   = FINISH;	 
7202  1e52 35510000      	mov	_state,#81
7203  1e56 acda1fda      	jpf	L353
7204  1e5a               L142:
7205                     ; 3063      case 79:
7205                     ; 3064 		   
7205                     ; 3065 			 if(!timerGetOverflow(4)){
7207  1e5a a604          	ld	a,#4
7208  1e5c cd0000        	call	_timerGetOverflow
7210  1e5f 4d            	tnz	a
7211  1e60 2604          	jrne	L7511
7212                     ; 3067 				 ack = FALSE;
7214  1e62 3f0b          	clr	_ack
7215                     ; 3069 				 return;
7217  1e64 20a4          	jra	L23
7218  1e66               L7511:
7219                     ; 3073 			 if(ack){
7221  1e66 3d0b          	tnz	_ack
7222  1e68 2741          	jreq	L1611
7223                     ; 3075 				 ack     = FALSE;
7225  1e6a 3f0b          	clr	_ack
7226                     ; 3076 				 state   = DELAY;
7228  1e6c 35520000      	mov	_state,#82
7229                     ; 3077 				 stack   = 80;
7231  1e70 35500001      	mov	_stack,#80
7232                     ; 3079 				 timerReset           (1);
7234  1e74 a601          	ld	a,#1
7235  1e76 cd0000        	call	_timerReset
7237                     ; 3081 				 timerReset           (3);
7239  1e79 a603          	ld	a,#3
7240  1e7b cd0000        	call	_timerReset
7242                     ; 3082 				 timerEnable          (3, ENABLE);
7244  1e7e ae0301        	ldw	x,#769
7245  1e81 cd0000        	call	_timerEnable
7247                     ; 3084 				 timerSetOverflowValue(4, 220);
7249  1e84 ae00dc        	ldw	x,#220
7250  1e87 89            	pushw	x
7251  1e88 ae0000        	ldw	x,#0
7252  1e8b 89            	pushw	x
7253  1e8c a604          	ld	a,#4
7254  1e8e cd0000        	call	_timerSetOverflowValue
7256  1e91 5b04          	addw	sp,#4
7257                     ; 3085 				 timerReset           (4);
7259  1e93 a604          	ld	a,#4
7260  1e95 cd0000        	call	_timerReset
7262                     ; 3086 				 timerEnable          (4, ENABLE);
7264  1e98 ae0401        	ldw	x,#1025
7265  1e9b cd0000        	call	_timerEnable
7267                     ; 3088 				 ioCommSetDir(OUTPUT);
7269  1e9e 4f            	clr	a
7270  1e9f cd0000        	call	_ioCommSetDir
7272                     ; 3090 				 GPIO_WriteHigh(COMM);
7274  1ea2 4b20          	push	#32
7275  1ea4 ae5000        	ldw	x,#20480
7276  1ea7 cd0000        	call	_GPIO_WriteHigh
7278  1eaa 84            	pop	a
7279  1eab               L1611:
7280                     ; 3094 			 if(timerGetOverflow(1)){
7282  1eab a601          	ld	a,#1
7283  1ead cd0000        	call	_timerGetOverflow
7285  1eb0 4d            	tnz	a
7286  1eb1 2603          	jrne	L672
7287  1eb3 cc1fda        	jp	L353
7288  1eb6               L672:
7289                     ; 3096 				 *control = 29;
7291  1eb6 1e01          	ldw	x,(OFST+1,sp)
7292  1eb8 a61d          	ld	a,#29
7293  1eba f7            	ld	(x),a
7294                     ; 3097 				  state   = FINISH;
7296  1ebb 35510000      	mov	_state,#81
7297  1ebf acda1fda      	jpf	L353
7298  1ec3               L342:
7299                     ; 3103 		 case 80:
7299                     ; 3104 		 
7299                     ; 3105 		 if(!timerGetOverflow(4)){
7301  1ec3 a604          	ld	a,#4
7302  1ec5 cd0000        	call	_timerGetOverflow
7304  1ec8 4d            	tnz	a
7305  1ec9 2604          	jrne	L5611
7306                     ; 3107 			 ack = FALSE;
7308  1ecb 3f0b          	clr	_ack
7309                     ; 3109 			 return;
7312  1ecd 85            	popw	x
7313  1ece 81            	ret
7314  1ecf               L5611:
7315                     ; 3113 		 if(ack){
7317  1ecf 3d0b          	tnz	_ack
7318  1ed1 2721          	jreq	L7611
7319                     ; 3115 				  ack     = FALSE;					
7321  1ed3 3f0b          	clr	_ack
7322                     ; 3116 				 *control = 3;
7324  1ed5 1e01          	ldw	x,(OFST+1,sp)
7325  1ed7 a603          	ld	a,#3
7326  1ed9 f7            	ld	(x),a
7327                     ; 3117 				  state   = FINISH;
7329  1eda 35510000      	mov	_state,#81
7330                     ; 3119 				 timerEnable(1, DISABLE);
7332  1ede ae0100        	ldw	x,#256
7333  1ee1 cd0000        	call	_timerEnable
7335                     ; 3120 				 timerReset (1);
7337  1ee4 a601          	ld	a,#1
7338  1ee6 cd0000        	call	_timerReset
7340                     ; 3122 				 timerEnable(3, DISABLE);
7342  1ee9 ae0300        	ldw	x,#768
7343  1eec cd0000        	call	_timerEnable
7345                     ; 3123 				 timerReset (3);
7347  1eef a603          	ld	a,#3
7348  1ef1 cd0000        	call	_timerReset
7350  1ef4               L7611:
7351                     ; 3127 			 if(timerGetOverflow(1)){
7353  1ef4 a601          	ld	a,#1
7354  1ef6 cd0000        	call	_timerGetOverflow
7356  1ef9 4d            	tnz	a
7357  1efa 2603          	jrne	L003
7358  1efc cc1fda        	jp	L353
7359  1eff               L003:
7360                     ; 3129 				 *control = 30;
7362  1eff 1e01          	ldw	x,(OFST+1,sp)
7363  1f01 a61e          	ld	a,#30
7364  1f03 f7            	ld	(x),a
7365                     ; 3130 				  state   = FINISH;	 
7367  1f04 35510000      	mov	_state,#81
7368  1f08 acda1fda      	jpf	L353
7369  1f0c               L542:
7370                     ; 3137      case FINISH:
7370                     ; 3138 		   
7370                     ; 3139 		   if(timerDelay(500)){
7372  1f0c ae01f4        	ldw	x,#500
7373  1f0f 89            	pushw	x
7374  1f10 ae0000        	ldw	x,#0
7375  1f13 89            	pushw	x
7376  1f14 cd0000        	call	_timerDelay
7378  1f17 5b04          	addw	sp,#4
7379  1f19 4d            	tnz	a
7380  1f1a 2603          	jrne	L203
7381  1f1c cc1fda        	jp	L353
7382  1f1f               L203:
7383                     ; 3141 				 GPIO_WriteLow(CH1);
7385  1f1f 4b40          	push	#64
7386  1f21 ae500a        	ldw	x,#20490
7387  1f24 cd0000        	call	_GPIO_WriteLow
7389  1f27 84            	pop	a
7390                     ; 3142 		     GPIO_WriteLow(CH2);
7392  1f28 4b10          	push	#16
7393  1f2a ae500a        	ldw	x,#20490
7394  1f2d cd0000        	call	_GPIO_WriteLow
7396  1f30 84            	pop	a
7397                     ; 3143 		     GPIO_WriteLow(CH3);
7399  1f31 4b04          	push	#4
7400  1f33 ae500a        	ldw	x,#20490
7401  1f36 cd0000        	call	_GPIO_WriteLow
7403  1f39 84            	pop	a
7404                     ; 3144 		     GPIO_WriteLow(CH4);
7406  1f3a 4b20          	push	#32
7407  1f3c ae5014        	ldw	x,#20500
7408  1f3f cd0000        	call	_GPIO_WriteLow
7410  1f42 84            	pop	a
7411                     ; 3145 			   GPIO_WriteLow(IGN);
7413  1f43 4b08          	push	#8
7414  1f45 ae500a        	ldw	x,#20490
7415  1f48 cd0000        	call	_GPIO_WriteLow
7417  1f4b 84            	pop	a
7418                     ; 3146 			   GPIO_WriteLow(DOOR);
7420  1f4c 4b02          	push	#2
7421  1f4e ae5000        	ldw	x,#20480
7422  1f51 cd0000        	call	_GPIO_WriteLow
7424  1f54 84            	pop	a
7425                     ; 3147 			   GPIO_WriteLow(SETA);
7427  1f55 4b02          	push	#2
7428  1f57 ae500a        	ldw	x,#20490
7429  1f5a cd0000        	call	_GPIO_WriteLow
7431  1f5d 84            	pop	a
7432                     ; 3148 			   GPIO_WriteLow(SW_P);
7434  1f5e 4b20          	push	#32
7435  1f60 ae500a        	ldw	x,#20490
7436  1f63 cd0000        	call	_GPIO_WriteLow
7438  1f66 84            	pop	a
7439                     ; 3149 			   GPIO_WriteLow(SW_N);
7441  1f67 4b01          	push	#1
7442  1f69 ae501e        	ldw	x,#20510
7443  1f6c cd0000        	call	_GPIO_WriteLow
7445  1f6f 84            	pop	a
7446                     ; 3150 			   GPIO_WriteLow(I_MOT);
7448  1f70 4b08          	push	#8
7449  1f72 ae5000        	ldw	x,#20480
7450  1f75 cd0000        	call	_GPIO_WriteLow
7452  1f78 84            	pop	a
7453                     ; 3151 		     GPIO_WriteLow(CMD_DN);
7455  1f79 4b04          	push	#4
7456  1f7b ae5000        	ldw	x,#20480
7457  1f7e cd0000        	call	_GPIO_WriteLow
7459  1f81 84            	pop	a
7460                     ; 3152 		     GPIO_WriteLow(CMD_UP); 
7462  1f82 4b40          	push	#64
7463  1f84 ae5000        	ldw	x,#20480
7464  1f87 cd0000        	call	_GPIO_WriteLow
7466  1f8a 84            	pop	a
7467                     ; 3154 				 ack    = 0;
7469  1f8b 3f0b          	clr	_ack
7470                     ; 3155 				 state  = 0;			 
7472  1f8d 3f00          	clr	_state
7473                     ; 3156 				 buzzer = TRUE;
7475  1f8f 3501000c      	mov	_buzzer,#1
7476                     ; 3158 				 if(*control != 3){
7478  1f93 1e01          	ldw	x,(OFST+1,sp)
7479  1f95 f6            	ld	a,(x)
7480  1f96 a103          	cp	a,#3
7481  1f98 2704          	jreq	L5711
7482                     ; 3160 				   menu  = TRUE;
7484  1f9a 3501000e      	mov	_menu,#1
7485  1f9e               L5711:
7486                     ; 3164 				 timerEnable(2, DISABLE);
7488  1f9e ae0200        	ldw	x,#512
7489  1fa1 cd0000        	call	_timerEnable
7491                     ; 3165 				 timerReset (2);
7493  1fa4 a602          	ld	a,#2
7494  1fa6 cd0000        	call	_timerReset
7496  1fa9 202f          	jra	L353
7497  1fab               L742:
7498                     ; 3171 		 case DELAY:
7498                     ; 3172 		    
7498                     ; 3173 		   if(timerGetOverflow(3)){
7500  1fab a603          	ld	a,#3
7501  1fad cd0000        	call	_timerGetOverflow
7503  1fb0 4d            	tnz	a
7504  1fb1 2727          	jreq	L353
7505                     ; 3175 				 GPIO_WriteLow (COMM);
7507  1fb3 4b20          	push	#32
7508  1fb5 ae5000        	ldw	x,#20480
7509  1fb8 cd0000        	call	_GPIO_WriteLow
7511  1fbb 84            	pop	a
7512                     ; 3177 				 ioCommSetDir(INPUT);
7514  1fbc a601          	ld	a,#1
7515  1fbe cd0000        	call	_ioCommSetDir
7517                     ; 3179 				 timerEnable(2, DISABLE);
7519  1fc1 ae0200        	ldw	x,#512
7520  1fc4 cd0000        	call	_timerEnable
7522                     ; 3180 				 timerReset (2);
7524  1fc7 a602          	ld	a,#2
7525  1fc9 cd0000        	call	_timerReset
7527                     ; 3182 				 timerEnable(3, DISABLE);
7529  1fcc ae0300        	ldw	x,#768
7530  1fcf cd0000        	call	_timerEnable
7532                     ; 3183 				 timerReset (3);
7534  1fd2 a603          	ld	a,#3
7535  1fd4 cd0000        	call	_timerReset
7537                     ; 3185 				 state = stack;
7539  1fd7 450100        	mov	_state,_stack
7540  1fda               L353:
7541                     ; 3193   }
7544  1fda 85            	popw	x
7545  1fdb 81            	ret
7601                     ; 3205 void menuUpdate(uint8_t *control, uint8_t *model){
7602                     	switch	.text
7603  1fdc               _menuUpdate:
7605  1fdc 89            	pushw	x
7606       00000000      OFST:	set	0
7609                     ; 3207 	 *model = model_out;
7611  1fdd 1e05          	ldw	x,(OFST+5,sp)
7612  1fdf b603          	ld	a,_model_out
7613  1fe1 f7            	ld	(x),a
7614                     ; 3209 	 if(!menu){
7616  1fe2 3d0e          	tnz	_menu
7617  1fe4 2602          	jrne	L3321
7618                     ; 3211 		 return;
7621  1fe6 85            	popw	x
7622  1fe7 81            	ret
7623  1fe8               L3321:
7624                     ; 3215 	 switch(menuState){
7626  1fe8 b605          	ld	a,_menuState
7628                     ; 3271 		 break;
7629  1fea 4d            	tnz	a
7630  1feb 2706          	jreq	L1021
7631  1fed 4a            	dec	a
7632  1fee 275a          	jreq	L3021
7633  1ff0 cc2073        	jra	L7321
7634  1ff3               L1021:
7635                     ; 3217 		 case 0:
7635                     ; 3218 		   
7635                     ; 3219 		   if(*(buffer + 3) > 500){
7637  1ff3 be07          	ldw	x,_buffer
7638  1ff5 9093          	ldw	y,x
7639  1ff7 90ee06        	ldw	y,(6,y)
7640  1ffa 90a301f5      	cpw	y,#501
7641  1ffe 250f          	jrult	L1421
7642                     ; 3221 		     timerEnable(4, DISABLE);
7644  2000 ae0400        	ldw	x,#1024
7645  2003 cd0000        	call	_timerEnable
7647                     ; 3222 		     timerReset (4);
7649  2006 a604          	ld	a,#4
7650  2008 cd0000        	call	_timerReset
7652                     ; 3224 		     debouncing1 = FALSE;
7654  200b 3f09          	clr	_debouncing1
7656  200d 2064          	jra	L7321
7657  200f               L1421:
7658                     ; 3228 		     if(!debouncing1){
7660  200f 3d09          	tnz	_debouncing1
7661  2011 261e          	jrne	L5421
7662                     ; 3230 			     timerSetOverflowValue(4, 100);
7664  2013 ae0064        	ldw	x,#100
7665  2016 89            	pushw	x
7666  2017 ae0000        	ldw	x,#0
7667  201a 89            	pushw	x
7668  201b a604          	ld	a,#4
7669  201d cd0000        	call	_timerSetOverflowValue
7671  2020 5b04          	addw	sp,#4
7672                     ; 3231 					 timerReset           (4);
7674  2022 a604          	ld	a,#4
7675  2024 cd0000        	call	_timerReset
7677                     ; 3232 			     timerEnable          (4, ENABLE);
7679  2027 ae0401        	ldw	x,#1025
7680  202a cd0000        	call	_timerEnable
7682                     ; 3234 			     debouncing1 = TRUE;		 
7684  202d 35010009      	mov	_debouncing1,#1
7685  2031               L5421:
7686                     ; 3238 			   if(timerGetOverflow(4)){
7688  2031 a604          	ld	a,#4
7689  2033 cd0000        	call	_timerGetOverflow
7691  2036 4d            	tnz	a
7692  2037 273a          	jreq	L7321
7693                     ; 3240 			     debouncing1 = FALSE;
7695  2039 3f09          	clr	_debouncing1
7696                     ; 3242 					 timerEnable(4, DISABLE);
7698  203b ae0400        	ldw	x,#1024
7699  203e cd0000        	call	_timerEnable
7701                     ; 3243 		       timerReset (4);
7703  2041 a604          	ld	a,#4
7704  2043 cd0000        	call	_timerReset
7706                     ; 3245 			     menuState++;
7708  2046 3c05          	inc	_menuState
7709  2048 2029          	jra	L7321
7710  204a               L3021:
7711                     ; 3253 		 case 1:
7711                     ; 3254 		   
7711                     ; 3255 			 if(*(buffer + 3) > 500){
7713  204a be07          	ldw	x,_buffer
7714  204c 9093          	ldw	y,x
7715  204e 90ee06        	ldw	y,(6,y)
7716  2051 90a301f5      	cpw	y,#501
7717  2055 251c          	jrult	L7321
7718                     ; 3257 				 if((*control < 31)||(*control == 65)){
7720  2057 1e01          	ldw	x,(OFST+1,sp)
7721  2059 f6            	ld	a,(x)
7722  205a a11f          	cp	a,#31
7723  205c 2507          	jrult	L5521
7725  205e 1e01          	ldw	x,(OFST+1,sp)
7726  2060 f6            	ld	a,(x)
7727  2061 a141          	cp	a,#65
7728  2063 2609          	jrne	L3521
7729  2065               L5521:
7730                     ; 3259 					 *control = 31;
7732  2065 1e01          	ldw	x,(OFST+1,sp)
7733  2067 a61f          	ld	a,#31
7734  2069 f7            	ld	(x),a
7736  206a               L7521:
7737                     ; 3267          menuState = 0;
7739  206a 3f05          	clr	_menuState
7740  206c 2005          	jra	L7321
7741  206e               L3521:
7742                     ; 3263 					 *control += 1;
7744  206e 1e01          	ldw	x,(OFST+1,sp)
7745  2070 7c            	inc	(x)
7746  2071 20f7          	jra	L7521
7747  2073               L7321:
7748                     ; 3276 		switch(selectState){
7750  2073 b606          	ld	a,_selectState
7752                     ; 3326 		 break;
7753  2075 4d            	tnz	a
7754  2076 2705          	jreq	L5021
7755  2078 4a            	dec	a
7756  2079 2759          	jreq	L7021
7757  207b 2070          	jra	L3621
7758  207d               L5021:
7759                     ; 3278 		 case 0:
7759                     ; 3279 		   
7759                     ; 3280 		   if(*(buffer + 4) > 500){
7761  207d be07          	ldw	x,_buffer
7762  207f 9093          	ldw	y,x
7763  2081 90ee08        	ldw	y,(8,y)
7764  2084 90a301f5      	cpw	y,#501
7765  2088 250f          	jrult	L5621
7766                     ; 3282 		     timerEnable(5, DISABLE);
7768  208a ae0500        	ldw	x,#1280
7769  208d cd0000        	call	_timerEnable
7771                     ; 3283 		     timerReset (5);
7773  2090 a605          	ld	a,#5
7774  2092 cd0000        	call	_timerReset
7776                     ; 3285 		     debouncing2 = FALSE;
7778  2095 3f0a          	clr	_debouncing2
7780  2097 2054          	jra	L3621
7781  2099               L5621:
7782                     ; 3289 		     if(!debouncing2){
7784  2099 3d0a          	tnz	_debouncing2
7785  209b 261e          	jrne	L1721
7786                     ; 3291 			     timerSetOverflowValue(5, 100);
7788  209d ae0064        	ldw	x,#100
7789  20a0 89            	pushw	x
7790  20a1 ae0000        	ldw	x,#0
7791  20a4 89            	pushw	x
7792  20a5 a605          	ld	a,#5
7793  20a7 cd0000        	call	_timerSetOverflowValue
7795  20aa 5b04          	addw	sp,#4
7796                     ; 3292 					 timerReset           (5);
7798  20ac a605          	ld	a,#5
7799  20ae cd0000        	call	_timerReset
7801                     ; 3293 			     timerEnable          (5, ENABLE);
7803  20b1 ae0501        	ldw	x,#1281
7804  20b4 cd0000        	call	_timerEnable
7806                     ; 3295 			     debouncing2 = TRUE;		 
7808  20b7 3501000a      	mov	_debouncing2,#1
7809  20bb               L1721:
7810                     ; 3299 			   if(timerGetOverflow(5)){
7812  20bb a605          	ld	a,#5
7813  20bd cd0000        	call	_timerGetOverflow
7815  20c0 4d            	tnz	a
7816  20c1 272a          	jreq	L3621
7817                     ; 3301 			     debouncing2 = FALSE;
7819  20c3 3f0a          	clr	_debouncing2
7820                     ; 3303 					 timerEnable(5, DISABLE);
7822  20c5 ae0500        	ldw	x,#1280
7823  20c8 cd0000        	call	_timerEnable
7825                     ; 3304 		       timerReset (5);
7827  20cb a605          	ld	a,#5
7828  20cd cd0000        	call	_timerReset
7830                     ; 3306 			     selectState++;
7832  20d0 3c06          	inc	_selectState
7833  20d2 2019          	jra	L3621
7834  20d4               L7021:
7835                     ; 3314 		 case 1:
7835                     ; 3315 		   
7835                     ; 3316 			 if(*(buffer + 4) > 500){
7837  20d4 be07          	ldw	x,_buffer
7838  20d6 9093          	ldw	y,x
7839  20d8 90ee08        	ldw	y,(8,y)
7840  20db 90a301f5      	cpw	y,#501
7841  20df 250c          	jrult	L3621
7842                     ; 3318 				 model_out = *control - 30;
7844  20e1 1e01          	ldw	x,(OFST+1,sp)
7845  20e3 f6            	ld	a,(x)
7846  20e4 a01e          	sub	a,#30
7847  20e6 b703          	ld	_model_out,a
7848                     ; 3320 				 *control  = 0;
7850  20e8 1e01          	ldw	x,(OFST+1,sp)
7851  20ea 7f            	clr	(x)
7852                     ; 3322          selectState = 0;
7854  20eb 3f06          	clr	_selectState
7855  20ed               L3621:
7856                     ; 3333 	}
7859  20ed 85            	popw	x
7860  20ee 81            	ret
7896                     ; 3344 void testStop (uint8_t *control){
7897                     	switch	.text
7898  20ef               _testStop:
7902                     ; 3346 	 *control = 6;
7904  20ef a606          	ld	a,#6
7905  20f1 f7            	ld	(x),a
7906                     ; 3347 	    state = 0;
7908  20f2 3f00          	clr	_state
7909                     ; 3349 	}
7912  20f4 81            	ret
7948                     ; 3360 void testSetBuffer(uint16_t *bufferAddr){
7949                     	switch	.text
7950  20f5               _testSetBuffer:
7954                     ; 3362 	 buffer = bufferAddr; 
7956  20f5 bf07          	ldw	_buffer,x
7957                     ; 3364   }
7960  20f7 81            	ret
7989                     ; 3369 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3){
7991                     	switch	.text
7992  20f8               f_EXTI_PORTA_IRQHandler:
7994  20f8 8a            	push	cc
7995  20f9 84            	pop	a
7996  20fa a4bf          	and	a,#191
7997  20fc 88            	push	a
7998  20fd 86            	pop	cc
7999  20fe 3b0002        	push	c_x+2
8000  2101 be00          	ldw	x,c_x
8001  2103 89            	pushw	x
8002  2104 3b0002        	push	c_y+2
8003  2107 be00          	ldw	x,c_y
8004  2109 89            	pushw	x
8007                     ; 3371 	 timerSetOverflowValue(2, 10);
8009  210a ae000a        	ldw	x,#10
8010  210d 89            	pushw	x
8011  210e ae0000        	ldw	x,#0
8012  2111 89            	pushw	x
8013  2112 a602          	ld	a,#2
8014  2114 cd0000        	call	_timerSetOverflowValue
8016  2117 5b04          	addw	sp,#4
8017                     ; 3372 	 timerReset           (2);
8019  2119 a602          	ld	a,#2
8020  211b cd0000        	call	_timerReset
8022                     ; 3373 	 timerEnable          (2, ENABLE);
8024  211e ae0201        	ldw	x,#513
8025  2121 cd0000        	call	_timerEnable
8027                     ; 3375 	 if(state >= 48){
8029  2124 b600          	ld	a,_state
8030  2126 a130          	cp	a,#48
8031  2128 2509          	jrult	L3431
8032                     ; 3377 		 GPIO_WriteReverse(SW_P);
8034  212a 4b20          	push	#32
8035  212c ae500a        	ldw	x,#20490
8036  212f cd0000        	call	_GPIO_WriteReverse
8038  2132 84            	pop	a
8039  2133               L3431:
8040                     ; 3381   }
8043  2133 85            	popw	x
8044  2134 bf00          	ldw	c_y,x
8045  2136 320002        	pop	c_y+2
8046  2139 85            	popw	x
8047  213a bf00          	ldw	c_x,x
8048  213c 320002        	pop	c_x+2
8049  213f 80            	iret
8072                     ; 3383 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4){
8073                     	switch	.text
8074  2140               f_EXTI_PORTB_IRQHandler:
8078                     ; 3385   }
8081  2140 80            	iret
8104                     ; 3387 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5){
8105                     	switch	.text
8106  2141               f_EXTI_PORTC_IRQHandler:
8110                     ; 3389 	}
8113  2141 80            	iret
8136                     ; 3391 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6){
8137                     	switch	.text
8138  2142               f_EXTI_PORTD_IRQHandler:
8142                     ; 3393   }
8145  2142 80            	iret
8168                     ; 3395 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7){
8169                     	switch	.text
8170  2143               f_EXTI_PORTE_IRQHandler:
8174                     ; 3397   }
8177  2143 80            	iret
8364                     	xdef	f_EXTI_PORTE_IRQHandler
8365                     	xdef	f_EXTI_PORTD_IRQHandler
8366                     	xdef	f_EXTI_PORTC_IRQHandler
8367                     	xdef	f_EXTI_PORTB_IRQHandler
8368                     	xdef	f_EXTI_PORTA_IRQHandler
8369                     	xdef	_wait
8370                     	xdef	_start
8371                     	xdef	_menu
8372                     	xdef	_blink
8373                     	xdef	_buzzer
8374                     	xdef	_ack
8375                     	xdef	_debouncing2
8376                     	xdef	_debouncing1
8377                     	xdef	_buffer
8378                     	xdef	_selectState
8379                     	xdef	_menuState
8380                     	xdef	_model_in
8381                     	xdef	_model_out
8382                     	xdef	_delay
8383                     	xdef	_stack
8384                     	xdef	_state
8385                     	xdef	_testSetBuffer
8386                     	xdef	_testStop
8387                     	xdef	_menuUpdate
8388                     	xdef	_testUpdate
8389                     	xref	_timeBase210us
8390                     	xref	_timerDelay
8391                     	xref	_timerGetOverflow
8392                     	xref	_timerSetOverflowValue
8393                     	xref	_timerReset
8394                     	xref	_timerEnable
8395                     	xref	_ioCommSetDir
8396                     	xref	_GPIO_ReadInputPin
8397                     	xref	_GPIO_WriteReverse
8398                     	xref	_GPIO_WriteLow
8399                     	xref	_GPIO_WriteHigh
8400                     	xref.b	c_x
8401                     	xref.b	c_y
8420                     	end
