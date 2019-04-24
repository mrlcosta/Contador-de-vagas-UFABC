   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  15                     	bsct
  16  0000               _ch1_cnt:
  17  0000 0000          	dc.w	0
  18  0002               _pulse_cnt:
  19  0002 0000          	dc.w	0
  20  0004               _pulse_width:
  21  0004 0000          	dc.w	0
  22  0006               _pulse_dt:
  23  0006 00000000      	dc.l	0
  24  000a               _ch1_dt:
  25  000a 00000000      	dc.l	0
  26  000e               _dataAvailable:
  27  000e 00            	dc.b	0
  28  000f               _pulseCheck:
  29  000f 01            	dc.b	1
  62                     ; 33  void counterInit(void){
  64                     	switch	.text
  65  0000               _counterInit:
  69                     ; 35 	 TIM1_DeInit();
  71  0000 cd0000        	call	_TIM1_DeInit
  73                     ; 37 	 TIM1_TimeBaseInit(99, TIM1_COUNTERMODE_UP, 1600, 0);
  75  0003 4b00          	push	#0
  76  0005 ae0640        	ldw	x,#1600
  77  0008 89            	pushw	x
  78  0009 4b00          	push	#0
  79  000b ae0063        	ldw	x,#99
  80  000e cd0000        	call	_TIM1_TimeBaseInit
  82  0011 5b04          	addw	sp,#4
  83                     ; 39    TIM1_ICInit(TIM1_CHANNEL_4, TIM1_ICPOLARITY_RISING, TIM1_ICSELECTION_DIRECTTI,  TIM1_ICPSC_DIV1, 0x00);
  85  0013 4b00          	push	#0
  86  0015 4b00          	push	#0
  87  0017 4b01          	push	#1
  88  0019 ae0300        	ldw	x,#768
  89  001c cd0000        	call	_TIM1_ICInit
  91  001f 5b03          	addw	sp,#3
  92                     ; 41 	 TIM1_SelectInputTrigger(TIM1_TS_TI1FP1);
  94  0021 a650          	ld	a,#80
  95  0023 cd0000        	call	_TIM1_SelectInputTrigger
  97                     ; 43   }
 100  0026 81            	ret
 146                     ; 51 bool counterDataAvailable(void){
 147                     	switch	.text
 148  0027               _counterDataAvailable:
 152                     ; 53 	 if(dataAvailable) return TRUE; else return FALSE;
 154  0027 3d0e          	tnz	_dataAvailable
 155  0029 2703          	jreq	L14
 158  002b a601          	ld	a,#1
 161  002d 81            	ret
 162  002e               L14:
 165  002e 4f            	clr	a
 168  002f 81            	ret
 203                     ; 63 uint16_t counterGetCount(void){
 204                     	switch	.text
 205  0030               _counterGetCount:
 207  0030 89            	pushw	x
 208       00000002      OFST:	set	2
 211                     ; 65 	 uint16_t cntRetValue = pulse_cnt;
 213  0031 be02          	ldw	x,_pulse_cnt
 214  0033 1f01          	ldw	(OFST-1,sp),x
 216                     ; 67 	 pulse_cnt = 0;
 218  0035 5f            	clrw	x
 219  0036 bf02          	ldw	_pulse_cnt,x
 220                     ; 69 	 return cntRetValue;
 222  0038 1e01          	ldw	x,(OFST-1,sp)
 225  003a 5b02          	addw	sp,#2
 226  003c 81            	ret
 261                     ; 79 uint32_t counterGetTime(void){
 262                     	switch	.text
 263  003d               _counterGetTime:
 265  003d 5204          	subw	sp,#4
 266       00000004      OFST:	set	4
 269                     ; 81 	 uint32_t dtRetValue = pulse_dt;
 271  003f be08          	ldw	x,_pulse_dt+2
 272  0041 1f03          	ldw	(OFST-1,sp),x
 273  0043 be06          	ldw	x,_pulse_dt
 274  0045 1f01          	ldw	(OFST-3,sp),x
 276                     ; 83 	 pulse_dt = 0;
 278  0047 ae0000        	ldw	x,#0
 279  004a bf08          	ldw	_pulse_dt+2,x
 280  004c ae0000        	ldw	x,#0
 281  004f bf06          	ldw	_pulse_dt,x
 282                     ; 85 	 return dtRetValue;
 284  0051 96            	ldw	x,sp
 285  0052 1c0001        	addw	x,#OFST-3
 286  0055 cd0000        	call	c_ltor
 290  0058 5b04          	addw	sp,#4
 291  005a 81            	ret
 316                     ; 95 void counterEnable(void){
 317                     	switch	.text
 318  005b               _counterEnable:
 322                     ; 97 	 TIM1_ITConfig(TIM1_IT_CC4,    ENABLE);
 324  005b ae1001        	ldw	x,#4097
 325  005e cd0000        	call	_TIM1_ITConfig
 327                     ; 98 	 TIM1_ITConfig(TIM1_IT_UPDATE, ENABLE);
 329  0061 ae0101        	ldw	x,#257
 330  0064 cd0000        	call	_TIM1_ITConfig
 332                     ; 100 	 TIM1_Cmd(ENABLE);
 334  0067 a601          	ld	a,#1
 335  0069 cd0000        	call	_TIM1_Cmd
 337                     ; 102 }
 340  006c 81            	ret
 371                     ; 107  INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12){
 373                     	switch	.text
 374  006d               f_TIM1_CAP_COM_IRQHandler:
 376  006d 8a            	push	cc
 377  006e 84            	pop	a
 378  006f a4bf          	and	a,#191
 379  0071 88            	push	a
 380  0072 86            	pop	cc
 381  0073 3b0002        	push	c_x+2
 382  0076 be00          	ldw	x,c_x
 383  0078 89            	pushw	x
 384  0079 3b0002        	push	c_y+2
 385  007c be00          	ldw	x,c_y
 386  007e 89            	pushw	x
 387  007f be02          	ldw	x,c_lreg+2
 388  0081 89            	pushw	x
 389  0082 be00          	ldw	x,c_lreg
 390  0084 89            	pushw	x
 393                     ; 109 	 TIM1_ClearITPendingBit(TIM1_IT_CC4);
 395  0085 a610          	ld	a,#16
 396  0087 cd0000        	call	_TIM1_ClearITPendingBit
 398                     ; 111 	 pulse_width  = TIM1_GetCapture4();
 400  008a cd0000        	call	_TIM1_GetCapture4
 402  008d bf04          	ldw	_pulse_width,x
 403                     ; 112 	 ch1_dt      += TIM1_GetCapture4();
 405  008f cd0000        	call	_TIM1_GetCapture4
 407  0092 cd0000        	call	c_uitolx
 409  0095 ae000a        	ldw	x,#_ch1_dt
 410  0098 cd0000        	call	c_lgadd
 412                     ; 113 	 ch1_cnt++;
 414  009b be00          	ldw	x,_ch1_cnt
 415  009d 1c0001        	addw	x,#1
 416  00a0 bf00          	ldw	_ch1_cnt,x
 417                     ; 115 	 TIM1_SetCounter(0);
 419  00a2 5f            	clrw	x
 420  00a3 cd0000        	call	_TIM1_SetCounter
 422                     ; 117 	 dataAvailable = FALSE;
 424  00a6 3f0e          	clr	_dataAvailable
 425                     ; 119   }
 428  00a8 85            	popw	x
 429  00a9 bf00          	ldw	c_lreg,x
 430  00ab 85            	popw	x
 431  00ac bf02          	ldw	c_lreg+2,x
 432  00ae 85            	popw	x
 433  00af bf00          	ldw	c_y,x
 434  00b1 320002        	pop	c_y+2
 435  00b4 85            	popw	x
 436  00b5 bf00          	ldw	c_x,x
 437  00b7 320002        	pop	c_x+2
 438  00ba 80            	iret
 470                     ; 121  INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11){
 471                     	switch	.text
 472  00bb               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 474  00bb 8a            	push	cc
 475  00bc 84            	pop	a
 476  00bd a4bf          	and	a,#191
 477  00bf 88            	push	a
 478  00c0 86            	pop	cc
 479       00000002      OFST:	set	2
 480  00c1 3b0002        	push	c_x+2
 481  00c4 be00          	ldw	x,c_x
 482  00c6 89            	pushw	x
 483  00c7 3b0002        	push	c_y+2
 484  00ca be00          	ldw	x,c_y
 485  00cc 89            	pushw	x
 486  00cd 89            	pushw	x
 489                     ; 123 	 if((ch1_cnt > 50)&(TIM1_GetFlagStatus(TIM1_FLAG_UPDATE))){
 491  00ce ae0001        	ldw	x,#1
 492  00d1 cd0000        	call	_TIM1_GetFlagStatus
 494  00d4 5f            	clrw	x
 495  00d5 97            	ld	xl,a
 496  00d6 1f01          	ldw	(OFST-1,sp),x
 498  00d8 be00          	ldw	x,_ch1_cnt
 499  00da a30033        	cpw	x,#51
 500  00dd 2505          	jrult	L22
 501  00df ae0001        	ldw	x,#1
 502  00e2 2001          	jra	L42
 503  00e4               L22:
 504  00e4 5f            	clrw	x
 505  00e5               L42:
 506  00e5 01            	rrwa	x,a
 507  00e6 1402          	and	a,(OFST+0,sp)
 508  00e8 01            	rrwa	x,a
 509  00e9 1401          	and	a,(OFST-1,sp)
 510  00eb 01            	rrwa	x,a
 511  00ec a30000        	cpw	x,#0
 512  00ef 272d          	jreq	L131
 513                     ; 125 		 pulse_cnt = ch1_cnt;
 515  00f1 be00          	ldw	x,_ch1_cnt
 516  00f3 bf02          	ldw	_pulse_cnt,x
 517                     ; 126 		 pulse_dt  = ch1_dt;
 519  00f5 be0c          	ldw	x,_ch1_dt+2
 520  00f7 bf08          	ldw	_pulse_dt+2,x
 521  00f9 be0a          	ldw	x,_ch1_dt
 522  00fb bf06          	ldw	_pulse_dt,x
 523                     ; 128      ch1_cnt = 0;
 525  00fd 5f            	clrw	x
 526  00fe bf00          	ldw	_ch1_cnt,x
 527                     ; 129 		 ch1_dt  = 0;
 529  0100 ae0000        	ldw	x,#0
 530  0103 bf0c          	ldw	_ch1_dt+2,x
 531  0105 ae0000        	ldw	x,#0
 532  0108 bf0a          	ldw	_ch1_dt,x
 533                     ; 131 		 dataAvailable = TRUE;
 535  010a 3501000e      	mov	_dataAvailable,#1
 536                     ; 133 	   TIM1_Cmd(DISABLE);
 538  010e 4f            	clr	a
 539  010f cd0000        	call	_TIM1_Cmd
 541                     ; 135 	   TIM1_ITConfig(TIM1_IT_CC4,    DISABLE);
 543  0112 ae1000        	ldw	x,#4096
 544  0115 cd0000        	call	_TIM1_ITConfig
 546                     ; 136      TIM1_ITConfig(TIM1_IT_UPDATE, DISABLE);
 548  0118 ae0100        	ldw	x,#256
 549  011b cd0000        	call	_TIM1_ITConfig
 551  011e               L131:
 552                     ; 140 	 TIM1_ClearITPendingBit(TIM1_IT_UPDATE);
 554  011e a601          	ld	a,#1
 555  0120 cd0000        	call	_TIM1_ClearITPendingBit
 557                     ; 143   }
 560  0123 5b02          	addw	sp,#2
 561  0125 85            	popw	x
 562  0126 bf00          	ldw	c_y,x
 563  0128 320002        	pop	c_y+2
 564  012b 85            	popw	x
 565  012c bf00          	ldw	c_x,x
 566  012e 320002        	pop	c_x+2
 567  0131 80            	iret
 646                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 647                     	xdef	f_TIM1_CAP_COM_IRQHandler
 648                     	xdef	_pulseCheck
 649                     	xdef	_dataAvailable
 650                     	xdef	_ch1_dt
 651                     	xdef	_pulse_dt
 652                     	xdef	_pulse_width
 653                     	xdef	_pulse_cnt
 654                     	xdef	_ch1_cnt
 655                     	xdef	_counterEnable
 656                     	xdef	_counterGetTime
 657                     	xdef	_counterGetCount
 658                     	xdef	_counterDataAvailable
 659                     	xdef	_counterInit
 660                     	xref	_TIM1_ClearITPendingBit
 661                     	xref	_TIM1_GetFlagStatus
 662                     	xref	_TIM1_GetCapture4
 663                     	xref	_TIM1_SetCounter
 664                     	xref	_TIM1_SelectInputTrigger
 665                     	xref	_TIM1_ITConfig
 666                     	xref	_TIM1_Cmd
 667                     	xref	_TIM1_ICInit
 668                     	xref	_TIM1_TimeBaseInit
 669                     	xref	_TIM1_DeInit
 670                     	xref.b	c_lreg
 671                     	xref.b	c_x
 672                     	xref.b	c_y
 691                     	xref	c_lgadd
 692                     	xref	c_uitolx
 693                     	xref	c_ltor
 694                     	end
