   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.3 - 27 Jul 2015
   3                     ; Generator (Limited) V4.4.2 - 04 Jun 2015
  15                     	bsct
  16  0000               _i:
  17  0000 00            	dc.b	0
  50                     ; 38 void timerInit(void){
  52                     	switch	.text
  53  0000               _timerInit:
  57                     ; 40 	TIM4_DeInit      ();                       
  59  0000 cd0000        	call	_TIM4_DeInit
  61                     ; 41   TIM4_TimeBaseInit(TIM4_PRESCALER_16, 100); 	
  63  0003 ae0464        	ldw	x,#1124
  64  0006 cd0000        	call	_TIM4_TimeBaseInit
  66                     ; 42   TIM4_ITConfig    (TIM4_IT_UPDATE, ENABLE);
  68  0009 ae0101        	ldw	x,#257
  69  000c cd0000        	call	_TIM4_ITConfig
  71                     ; 43   TIM4_Cmd         (ENABLE);
  73  000f a601          	ld	a,#1
  74  0011 cd0000        	call	_TIM4_Cmd
  76                     ; 45 }
  79  0014 81            	ret
 124                     ; 57 void timerEnable(uint8_t unit, _Bool enableTimer){
 125                     	switch	.text
 126  0015               _timerEnable:
 128  0015 89            	pushw	x
 129       00000000      OFST:	set	0
 132                     ; 59 	if(enableTimer){
 134  0016 7b02          	ld	a,(OFST+2,sp)
 135  0018 a501          	bcp	a,#1
 136  001a 270d          	jreq	L34
 137                     ; 61 		timerUnit[unit].enable = 1;
 139  001c 9e            	ld	a,xh
 140  001d 97            	ld	xl,a
 141  001e a605          	ld	a,#5
 142  0020 42            	mul	x,a
 143  0021 e604          	ld	a,(_timerUnit+4,x)
 144  0023 aa01          	or	a,#1
 145  0025 e704          	ld	(_timerUnit+4,x),a
 147  0027 200c          	jra	L54
 148  0029               L34:
 149                     ; 65 		timerUnit[unit].enable = 0;
 151  0029 7b01          	ld	a,(OFST+1,sp)
 152  002b 97            	ld	xl,a
 153  002c a605          	ld	a,#5
 154  002e 42            	mul	x,a
 155  002f e604          	ld	a,(_timerUnit+4,x)
 156  0031 a4fe          	and	a,#254
 157  0033 e704          	ld	(_timerUnit+4,x),a
 158  0035               L54:
 159                     ; 69 }
 162  0035 85            	popw	x
 163  0036 81            	ret
 199                     ; 80 _Bool timerGetOverflow(uint8_t unit){
 200                     	switch	.text
 201  0037               _timerGetOverflow:
 203  0037 88            	push	a
 204       00000000      OFST:	set	0
 207                     ; 82 	if(timerUnit[unit].overflow == 1){
 209  0038 97            	ld	xl,a
 210  0039 a605          	ld	a,#5
 211  003b 42            	mul	x,a
 212  003c e604          	ld	a,(_timerUnit+4,x)
 213  003e a502          	bcp	a,#2
 214  0040 2711          	jreq	L56
 215                     ; 84 		timerUnit[unit].overflow = 0;
 217  0042 7b01          	ld	a,(OFST+1,sp)
 218  0044 97            	ld	xl,a
 219  0045 a605          	ld	a,#5
 220  0047 42            	mul	x,a
 221  0048 e604          	ld	a,(_timerUnit+4,x)
 222  004a a4fd          	and	a,#253
 223  004c e704          	ld	(_timerUnit+4,x),a
 224                     ; 86 		return 1;
 226  004e a601          	ld	a,#1
 229  0050 5b01          	addw	sp,#1
 230  0052 81            	ret
 231  0053               L56:
 232                     ; 90 		return timerUnit[unit].overflow;
 234  0053 7b01          	ld	a,(OFST+1,sp)
 235  0055 97            	ld	xl,a
 236  0056 a605          	ld	a,#5
 237  0058 42            	mul	x,a
 238  0059 e604          	ld	a,(_timerUnit+4,x)
 239  005b a502          	bcp	a,#2
 240  005d 2704          	jreq	L21
 241  005f a601          	ld	a,#1
 242  0061 2001          	jra	L41
 243  0063               L21:
 244  0063 4f            	clr	a
 245  0064               L41:
 248  0064 5b01          	addw	sp,#1
 249  0066 81            	ret
 294                     ; 106 void timerSetOverflowValue(uint8_t unit, int maxValue){
 295                     	switch	.text
 296  0067               _timerSetOverflowValue:
 298  0067 88            	push	a
 299       00000000      OFST:	set	0
 302                     ; 108 	timerUnit[unit].maxCount = maxValue;
 304  0068 97            	ld	xl,a
 305  0069 a605          	ld	a,#5
 306  006b 42            	mul	x,a
 307  006c 1604          	ldw	y,(OFST+4,sp)
 308  006e ef02          	ldw	(_timerUnit+2,x),y
 309                     ; 110 }
 312  0070 84            	pop	a
 313  0071 81            	ret
 348                     ; 121 void timerReset(uint8_t unit){
 349                     	switch	.text
 350  0072               _timerReset:
 354                     ; 123 	timerUnit[unit].count = 0;
 356  0072 97            	ld	xl,a
 357  0073 a605          	ld	a,#5
 358  0075 42            	mul	x,a
 359  0076 905f          	clrw	y
 360  0078 ef00          	ldw	(_timerUnit,x),y
 361                     ; 125 }
 364  007a 81            	ret
 391                     ; 149 INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 391                     ; 150  	{		
 393                     	switch	.text
 394  007b               f_TIM4_UPD_OVF_IRQHandler:
 396  007b 8a            	push	cc
 397  007c 84            	pop	a
 398  007d a4bf          	and	a,#191
 399  007f 88            	push	a
 400  0080 86            	pop	cc
 401       00000002      OFST:	set	2
 402  0081 3b0002        	push	c_x+2
 403  0084 be00          	ldw	x,c_x
 404  0086 89            	pushw	x
 405  0087 3b0002        	push	c_y+2
 406  008a be00          	ldw	x,c_y
 407  008c 89            	pushw	x
 408  008d 89            	pushw	x
 411                     ; 152 		TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
 413  008e a601          	ld	a,#1
 414  0090 cd0000        	call	_TIM4_ClearITPendingBit
 416                     ; 154 		for(i = 0; i < TIMER_QTY; i++){
 418  0093 3f00          	clr	_i
 419  0095               L141:
 420                     ; 156 			if(timerUnit[i].enable == 1){
 422  0095 b600          	ld	a,_i
 423  0097 97            	ld	xl,a
 424  0098 a605          	ld	a,#5
 425  009a 42            	mul	x,a
 426  009b e604          	ld	a,(_timerUnit+4,x)
 427  009d a501          	bcp	a,#1
 428  009f 2737          	jreq	L741
 429                     ; 158 				if(timerUnit[i].count >= timerUnit[i].maxCount){
 431  00a1 9c            	rvf
 432  00a2 b600          	ld	a,_i
 433  00a4 97            	ld	xl,a
 434  00a5 a605          	ld	a,#5
 435  00a7 42            	mul	x,a
 436  00a8 ee02          	ldw	x,(_timerUnit+2,x)
 437  00aa 1f01          	ldw	(OFST-1,sp),x
 439  00ac b600          	ld	a,_i
 440  00ae 97            	ld	xl,a
 441  00af a605          	ld	a,#5
 442  00b1 42            	mul	x,a
 443  00b2 9093          	ldw	y,x
 444  00b4 51            	exgw	x,y
 445  00b5 ee00          	ldw	x,(_timerUnit,x)
 446  00b7 1301          	cpw	x,(OFST-1,sp)
 447  00b9 51            	exgw	x,y
 448  00ba 2f0c          	jrslt	L151
 449                     ; 160 					timerUnit[i].overflow = 1;
 451  00bc b600          	ld	a,_i
 452  00be 97            	ld	xl,a
 453  00bf a605          	ld	a,#5
 454  00c1 42            	mul	x,a
 455  00c2 e604          	ld	a,(_timerUnit+4,x)
 456  00c4 aa02          	or	a,#2
 457  00c6 e704          	ld	(_timerUnit+4,x),a
 458  00c8               L151:
 459                     ; 164 			  timerUnit[i].count++;
 461  00c8 b600          	ld	a,_i
 462  00ca 97            	ld	xl,a
 463  00cb a605          	ld	a,#5
 464  00cd 42            	mul	x,a
 465  00ce 9093          	ldw	y,x
 466  00d0 ee00          	ldw	x,(_timerUnit,x)
 467  00d2 1c0001        	addw	x,#1
 468  00d5 90ef00        	ldw	(_timerUnit,y),x
 469  00d8               L741:
 470                     ; 154 		for(i = 0; i < TIMER_QTY; i++){
 472  00d8 3c00          	inc	_i
 475  00da b600          	ld	a,_i
 476  00dc a104          	cp	a,#4
 477  00de 25b5          	jrult	L141
 478                     ; 168 	}
 481  00e0 5b02          	addw	sp,#2
 482  00e2 85            	popw	x
 483  00e3 bf00          	ldw	c_y,x
 484  00e5 320002        	pop	c_y+2
 485  00e8 85            	popw	x
 486  00e9 bf00          	ldw	c_x,x
 487  00eb 320002        	pop	c_x+2
 488  00ee 80            	iret
 564                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 565                     	switch	.ubsct
 566  0000               _timerUnit:
 567  0000 000000000000  	ds.b	20
 568                     	xdef	_timerUnit
 569                     	xdef	_i
 570                     	xdef	_timerGetOverflow
 571                     	xdef	_timerSetOverflowValue
 572                     	xdef	_timerReset
 573                     	xdef	_timerEnable
 574                     	xdef	_timerInit
 575                     	xref	_TIM4_ClearITPendingBit
 576                     	xref	_TIM4_ITConfig
 577                     	xref	_TIM4_Cmd
 578                     	xref	_TIM4_TimeBaseInit
 579                     	xref	_TIM4_DeInit
 580                     	xref.b	c_x
 581                     	xref.b	c_y
 601                     	end
