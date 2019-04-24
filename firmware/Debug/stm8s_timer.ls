   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.3 - 27 Jul 2015
   3                     ; Generator (Limited) V4.4.2 - 04 Jun 2015
  15                     	bsct
  16  0000               _i:
  17  0000 00            	dc.b	0
  18  0001               _time1ms:
  19  0001 00            	dc.b	0
  20  0002               _time100us:
  21  0002 00            	dc.b	0
  22  0003               _time210us:
  23  0003 00            	dc.b	0
  64                     ; 49 void timerInit(void){
  66                     	switch	.text
  67  0000               _timerInit:
  71                     ; 51 	TIM4_DeInit      ();                       
  73  0000 cd0000        	call	_TIM4_DeInit
  75                     ; 52   TIM4_TimeBaseInit(TIM4_PRESCALER_64, 249); 	
  77  0003 ae06f9        	ldw	x,#1785
  78  0006 cd0000        	call	_TIM4_TimeBaseInit
  80                     ; 53   TIM4_ITConfig    (TIM4_IT_UPDATE, ENABLE);
  82  0009 ae0101        	ldw	x,#257
  83  000c cd0000        	call	_TIM4_ITConfig
  85                     ; 54   TIM4_Cmd         (ENABLE);
  87  000f a601          	ld	a,#1
  88  0011 cd0000        	call	_TIM4_Cmd
  90                     ; 56 	TIM2_DeInit      ();                       
  92  0014 cd0000        	call	_TIM2_DeInit
  94                     ; 57   TIM2_TimeBaseInit(TIM2_PRESCALER_64, 24); 	
  96  0017 ae0018        	ldw	x,#24
  97  001a 89            	pushw	x
  98  001b a606          	ld	a,#6
  99  001d cd0000        	call	_TIM2_TimeBaseInit
 101  0020 85            	popw	x
 102                     ; 58   TIM2_ITConfig    (TIM2_IT_UPDATE, ENABLE);
 104  0021 ae0101        	ldw	x,#257
 105  0024 cd0000        	call	_TIM2_ITConfig
 107                     ; 59   TIM2_Cmd         (ENABLE);
 109  0027 a601          	ld	a,#1
 110  0029 cd0000        	call	_TIM2_Cmd
 112                     ; 61 	TIM3_DeInit      ();                       
 114  002c cd0000        	call	_TIM3_DeInit
 116                     ; 62   TIM3_TimeBaseInit(TIM3_PRESCALER_16, 210); 	
 118  002f ae00d2        	ldw	x,#210
 119  0032 89            	pushw	x
 120  0033 a604          	ld	a,#4
 121  0035 cd0000        	call	_TIM3_TimeBaseInit
 123  0038 85            	popw	x
 124                     ; 63   TIM3_ITConfig    (TIM3_IT_UPDATE, ENABLE);
 126  0039 ae0101        	ldw	x,#257
 127  003c cd0000        	call	_TIM3_ITConfig
 129                     ; 64   TIM3_Cmd         (ENABLE);
 131  003f a601          	ld	a,#1
 132  0041 cd0000        	call	_TIM3_Cmd
 134                     ; 66 }
 137  0044 81            	ret
 182                     ; 78 void timerEnable(uint8_t unit, _Bool enableTimer){
 183                     	switch	.text
 184  0045               _timerEnable:
 186  0045 89            	pushw	x
 187       00000000      OFST:	set	0
 190                     ; 80 	if(enableTimer){
 192  0046 7b02          	ld	a,(OFST+2,sp)
 193  0048 a501          	bcp	a,#1
 194  004a 270b          	jreq	L34
 195                     ; 82 		timerUnit[unit].enable = 1;
 197  004c 9e            	ld	a,xh
 198  004d 97            	ld	xl,a
 199  004e a60a          	ld	a,#10
 200  0050 42            	mul	x,a
 201  0051 a601          	ld	a,#1
 202  0053 e708          	ld	(_timerUnit+8,x),a
 204  0055 2008          	jra	L54
 205  0057               L34:
 206                     ; 86 		timerUnit[unit].enable = 0;
 208  0057 7b01          	ld	a,(OFST+1,sp)
 209  0059 97            	ld	xl,a
 210  005a a60a          	ld	a,#10
 211  005c 42            	mul	x,a
 212  005d 6f08          	clr	(_timerUnit+8,x)
 213  005f               L54:
 214                     ; 90 }
 217  005f 85            	popw	x
 218  0060 81            	ret
 274                     ; 101 bool timerGetOverflow(uint8_t unit){
 275                     	switch	.text
 276  0061               _timerGetOverflow:
 278  0061 88            	push	a
 279       00000000      OFST:	set	0
 282                     ; 103 	if(timerUnit[unit].overflow == 1){
 284  0062 97            	ld	xl,a
 285  0063 a60a          	ld	a,#10
 286  0065 42            	mul	x,a
 287  0066 e609          	ld	a,(_timerUnit+9,x)
 288  0068 a101          	cp	a,#1
 289  006a 2605          	jrne	L57
 290                     ; 105 		return 1;
 292  006c a601          	ld	a,#1
 295  006e 5b01          	addw	sp,#1
 296  0070 81            	ret
 297  0071               L57:
 298                     ; 109 		return timerUnit[unit].overflow;
 300  0071 7b01          	ld	a,(OFST+1,sp)
 301  0073 97            	ld	xl,a
 302  0074 a60a          	ld	a,#10
 303  0076 42            	mul	x,a
 304  0077 e609          	ld	a,(_timerUnit+9,x)
 307  0079 5b01          	addw	sp,#1
 308  007b 81            	ret
 343                     ; 124 uint32_t timerGetCount(uint8_t unit){
 344                     	switch	.text
 345  007c               _timerGetCount:
 349                     ; 126 	return timerUnit[unit].count;
 351  007c 97            	ld	xl,a
 352  007d a60a          	ld	a,#10
 353  007f 42            	mul	x,a
 354  0080 1c0000        	addw	x,#_timerUnit
 355  0083 cd0000        	call	c_ltor
 359  0086 81            	ret
 404                     ; 140 void timerSetOverflowValue(uint8_t unit, uint32_t maxValue){
 405                     	switch	.text
 406  0087               _timerSetOverflowValue:
 408  0087 88            	push	a
 409       00000000      OFST:	set	0
 412                     ; 142 	timerUnit[unit].maxCount = maxValue;
 414  0088 97            	ld	xl,a
 415  0089 a60a          	ld	a,#10
 416  008b 42            	mul	x,a
 417  008c 7b07          	ld	a,(OFST+7,sp)
 418  008e e707          	ld	(_timerUnit+7,x),a
 419  0090 7b06          	ld	a,(OFST+6,sp)
 420  0092 e706          	ld	(_timerUnit+6,x),a
 421  0094 7b05          	ld	a,(OFST+5,sp)
 422  0096 e705          	ld	(_timerUnit+5,x),a
 423  0098 7b04          	ld	a,(OFST+4,sp)
 424  009a e704          	ld	(_timerUnit+4,x),a
 425                     ; 144 }
 428  009c 84            	pop	a
 429  009d 81            	ret
 464                     ; 155 void timerReset(uint8_t unit){
 465                     	switch	.text
 466  009e               _timerReset:
 468  009e 88            	push	a
 469       00000000      OFST:	set	0
 472                     ; 157 	timerUnit[unit].count    = 0;
 474  009f 97            	ld	xl,a
 475  00a0 a60a          	ld	a,#10
 476  00a2 42            	mul	x,a
 477  00a3 a600          	ld	a,#0
 478  00a5 e703          	ld	(_timerUnit+3,x),a
 479  00a7 a600          	ld	a,#0
 480  00a9 e702          	ld	(_timerUnit+2,x),a
 481  00ab a600          	ld	a,#0
 482  00ad e701          	ld	(_timerUnit+1,x),a
 483  00af a600          	ld	a,#0
 484  00b1 e700          	ld	(_timerUnit,x),a
 485                     ; 158 	timerUnit[unit].overflow = 0;
 487  00b3 7b01          	ld	a,(OFST+1,sp)
 488  00b5 97            	ld	xl,a
 489  00b6 a60a          	ld	a,#10
 490  00b8 42            	mul	x,a
 491  00b9 6f09          	clr	(_timerUnit+9,x)
 492                     ; 160 }
 495  00bb 84            	pop	a
 496  00bc 81            	ret
 536                     ; 171 bool timerDelay(uint32_t delay){
 537                     	switch	.text
 538  00bd               _timerDelay:
 540       00000000      OFST:	set	0
 543                     ; 173 	if(timerUnit[0].count == 0){
 545  00bd ae0000        	ldw	x,#_timerUnit
 546  00c0 cd0000        	call	c_lzmp
 548  00c3 2614          	jrne	L571
 549                     ; 175 		timerSetOverflowValue(0, delay);
 551  00c5 1e05          	ldw	x,(OFST+5,sp)
 552  00c7 89            	pushw	x
 553  00c8 1e05          	ldw	x,(OFST+5,sp)
 554  00ca 89            	pushw	x
 555  00cb 4f            	clr	a
 556  00cc adb9          	call	_timerSetOverflowValue
 558  00ce 5b04          	addw	sp,#4
 559                     ; 176 	  timerReset           (0);
 561  00d0 4f            	clr	a
 562  00d1 adcb          	call	_timerReset
 564                     ; 177 	  timerEnable          (0, ENABLE);
 566  00d3 ae0001        	ldw	x,#1
 567  00d6 cd0045        	call	_timerEnable
 569  00d9               L571:
 570                     ; 181 	if(timerGetOverflow(0)){
 572  00d9 4f            	clr	a
 573  00da ad85          	call	_timerGetOverflow
 575  00dc 4d            	tnz	a
 576  00dd 270a          	jreq	L771
 577                     ; 183 		timerEnable(0, DISABLE);
 579  00df 5f            	clrw	x
 580  00e0 cd0045        	call	_timerEnable
 582                     ; 184 		timerReset (0);
 584  00e3 4f            	clr	a
 585  00e4 adb8          	call	_timerReset
 587                     ; 186 		return TRUE;
 589  00e6 a601          	ld	a,#1
 592  00e8 81            	ret
 593  00e9               L771:
 594                     ; 190 		return FALSE;
 596  00e9 4f            	clr	a
 599  00ea 81            	ret
 624                     ; 204 void timerDelayReset(void){
 625                     	switch	.text
 626  00eb               _timerDelayReset:
 630                     ; 206 	 timerEnable          (0, DISABLE);
 632  00eb 5f            	clrw	x
 633  00ec cd0045        	call	_timerEnable
 635                     ; 207 	 timerReset           (0);
 637  00ef 4f            	clr	a
 638  00f0 adac          	call	_timerReset
 640                     ; 209   }
 643  00f2 81            	ret
 668                     ; 218 bool timeBase1ms(void){
 669                     	switch	.text
 670  00f3               _timeBase1ms:
 674                     ; 220 	if(time1ms){
 676  00f3 3d01          	tnz	_time1ms
 677  00f5 2705          	jreq	L322
 678                     ; 222 		time1ms = FALSE;
 680  00f7 3f01          	clr	_time1ms
 681                     ; 224 		return TRUE;
 683  00f9 a601          	ld	a,#1
 686  00fb 81            	ret
 687  00fc               L322:
 688                     ; 228 		return FALSE;
 690  00fc 4f            	clr	a
 693  00fd 81            	ret
 718                     ; 241 bool timeBase100us(void){
 719                     	switch	.text
 720  00fe               _timeBase100us:
 724                     ; 243 	if(time100us){
 726  00fe 3d02          	tnz	_time100us
 727  0100 2705          	jreq	L732
 728                     ; 245 		time100us = FALSE;
 730  0102 3f02          	clr	_time100us
 731                     ; 247 		return TRUE;
 733  0104 a601          	ld	a,#1
 736  0106 81            	ret
 737  0107               L732:
 738                     ; 251 		return FALSE;
 740  0107 4f            	clr	a
 743  0108 81            	ret
 768                     ; 264 bool timeBase210us(void){
 769                     	switch	.text
 770  0109               _timeBase210us:
 774                     ; 266 	if(time210us){
 776  0109 3d03          	tnz	_time210us
 777  010b 2705          	jreq	L352
 778                     ; 268 		time210us = FALSE;
 780  010d 3f03          	clr	_time210us
 781                     ; 270 		return TRUE;
 783  010f a601          	ld	a,#1
 786  0111 81            	ret
 787  0112               L352:
 788                     ; 274 		return FALSE;
 790  0112 4f            	clr	a
 793  0113 81            	ret
 821                     ; 301 INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 821                     ; 302  	{		
 823                     	switch	.text
 824  0114               f_TIM4_UPD_OVF_IRQHandler:
 826  0114 8a            	push	cc
 827  0115 84            	pop	a
 828  0116 a4bf          	and	a,#191
 829  0118 88            	push	a
 830  0119 86            	pop	cc
 831  011a 3b0002        	push	c_x+2
 832  011d be00          	ldw	x,c_x
 833  011f 89            	pushw	x
 834  0120 3b0002        	push	c_y+2
 835  0123 be00          	ldw	x,c_y
 836  0125 89            	pushw	x
 837  0126 be02          	ldw	x,c_lreg+2
 838  0128 89            	pushw	x
 839  0129 be00          	ldw	x,c_lreg
 840  012b 89            	pushw	x
 843                     ; 304 		TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
 845  012c a601          	ld	a,#1
 846  012e cd0000        	call	_TIM4_ClearITPendingBit
 848                     ; 306 		time1ms = TRUE;
 850  0131 35010001      	mov	_time1ms,#1
 851                     ; 308 		for(i = 0; i < TIMER_QTY; i++){
 853  0135 3f00          	clr	_i
 854  0137               L762:
 855                     ; 310 			if(timerUnit[i].enable == 1){
 857  0137 b600          	ld	a,_i
 858  0139 97            	ld	xl,a
 859  013a a60a          	ld	a,#10
 860  013c 42            	mul	x,a
 861  013d e608          	ld	a,(_timerUnit+8,x)
 862  013f a101          	cp	a,#1
 863  0141 2632          	jrne	L572
 864                     ; 312 				if(timerUnit[i].count >= timerUnit[i].maxCount){
 866  0143 b600          	ld	a,_i
 867  0145 97            	ld	xl,a
 868  0146 a60a          	ld	a,#10
 869  0148 42            	mul	x,a
 870  0149 1c0000        	addw	x,#_timerUnit
 871  014c cd0000        	call	c_ltor
 873  014f b600          	ld	a,_i
 874  0151 97            	ld	xl,a
 875  0152 a60a          	ld	a,#10
 876  0154 42            	mul	x,a
 877  0155 1c0004        	addw	x,#_timerUnit+4
 878  0158 cd0000        	call	c_lcmp
 880  015b 250a          	jrult	L772
 881                     ; 314 					timerUnit[i].overflow = 1;
 883  015d b600          	ld	a,_i
 884  015f 97            	ld	xl,a
 885  0160 a60a          	ld	a,#10
 886  0162 42            	mul	x,a
 887  0163 a601          	ld	a,#1
 888  0165 e709          	ld	(_timerUnit+9,x),a
 889  0167               L772:
 890                     ; 318 			  timerUnit[i].count++;
 892  0167 b600          	ld	a,_i
 893  0169 97            	ld	xl,a
 894  016a a60a          	ld	a,#10
 895  016c 42            	mul	x,a
 896  016d 1c0000        	addw	x,#_timerUnit
 897  0170 a601          	ld	a,#1
 898  0172 cd0000        	call	c_lgadc
 900  0175               L572:
 901                     ; 308 		for(i = 0; i < TIMER_QTY; i++){
 903  0175 3c00          	inc	_i
 906  0177 b600          	ld	a,_i
 907  0179 a107          	cp	a,#7
 908  017b 25ba          	jrult	L762
 909                     ; 322 	}
 912  017d 85            	popw	x
 913  017e bf00          	ldw	c_lreg,x
 914  0180 85            	popw	x
 915  0181 bf02          	ldw	c_lreg+2,x
 916  0183 85            	popw	x
 917  0184 bf00          	ldw	c_y,x
 918  0186 320002        	pop	c_y+2
 919  0189 85            	popw	x
 920  018a bf00          	ldw	c_x,x
 921  018c 320002        	pop	c_x+2
 922  018f 80            	iret
 947                     ; 329 INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13){
 948                     	switch	.text
 949  0190               f_TIM2_UPD_OVF_BRK_IRQHandler:
 951  0190 8a            	push	cc
 952  0191 84            	pop	a
 953  0192 a4bf          	and	a,#191
 954  0194 88            	push	a
 955  0195 86            	pop	cc
 956  0196 3b0002        	push	c_x+2
 957  0199 be00          	ldw	x,c_x
 958  019b 89            	pushw	x
 959  019c 3b0002        	push	c_y+2
 960  019f be00          	ldw	x,c_y
 961  01a1 89            	pushw	x
 964                     ; 331 	 TIM2_ClearITPendingBit(TIM2_IT_UPDATE);
 966  01a2 a601          	ld	a,#1
 967  01a4 cd0000        	call	_TIM2_ClearITPendingBit
 969                     ; 333 	 time100us = TRUE;		
 971  01a7 35010002      	mov	_time100us,#1
 972                     ; 335   }
 975  01ab 85            	popw	x
 976  01ac bf00          	ldw	c_y,x
 977  01ae 320002        	pop	c_y+2
 978  01b1 85            	popw	x
 979  01b2 bf00          	ldw	c_x,x
 980  01b4 320002        	pop	c_x+2
 981  01b7 80            	iret
1006                     ; 340 INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15){
1007                     	switch	.text
1008  01b8               f_TIM3_UPD_OVF_BRK_IRQHandler:
1010  01b8 8a            	push	cc
1011  01b9 84            	pop	a
1012  01ba a4bf          	and	a,#191
1013  01bc 88            	push	a
1014  01bd 86            	pop	cc
1015  01be 3b0002        	push	c_x+2
1016  01c1 be00          	ldw	x,c_x
1017  01c3 89            	pushw	x
1018  01c4 3b0002        	push	c_y+2
1019  01c7 be00          	ldw	x,c_y
1020  01c9 89            	pushw	x
1023                     ; 342 	 TIM3_ClearITPendingBit(TIM3_IT_UPDATE);
1025  01ca a601          	ld	a,#1
1026  01cc cd0000        	call	_TIM3_ClearITPendingBit
1028                     ; 344 	 time210us = TRUE;
1030  01cf 35010003      	mov	_time210us,#1
1031                     ; 346 	}
1034  01d3 85            	popw	x
1035  01d4 bf00          	ldw	c_y,x
1036  01d6 320002        	pop	c_y+2
1037  01d9 85            	popw	x
1038  01da bf00          	ldw	c_x,x
1039  01dc 320002        	pop	c_x+2
1040  01df 80            	iret
1146                     	xdef	f_TIM3_UPD_OVF_BRK_IRQHandler
1147                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
1148                     	xdef	f_TIM4_UPD_OVF_IRQHandler
1149                     	switch	.ubsct
1150  0000               _timerUnit:
1151  0000 000000000000  	ds.b	70
1152                     	xdef	_timerUnit
1153                     	xdef	_time210us
1154                     	xdef	_time100us
1155                     	xdef	_time1ms
1156                     	xdef	_i
1157                     	xdef	_timeBase210us
1158                     	xdef	_timeBase100us
1159                     	xdef	_timeBase1ms
1160                     	xdef	_timerDelayReset
1161                     	xdef	_timerDelay
1162                     	xdef	_timerGetCount
1163                     	xdef	_timerGetOverflow
1164                     	xdef	_timerSetOverflowValue
1165                     	xdef	_timerReset
1166                     	xdef	_timerEnable
1167                     	xdef	_timerInit
1168                     	xref	_TIM4_ClearITPendingBit
1169                     	xref	_TIM4_ITConfig
1170                     	xref	_TIM4_Cmd
1171                     	xref	_TIM4_TimeBaseInit
1172                     	xref	_TIM4_DeInit
1173                     	xref	_TIM3_ClearITPendingBit
1174                     	xref	_TIM3_ITConfig
1175                     	xref	_TIM3_Cmd
1176                     	xref	_TIM3_TimeBaseInit
1177                     	xref	_TIM3_DeInit
1178                     	xref	_TIM2_ClearITPendingBit
1179                     	xref	_TIM2_ITConfig
1180                     	xref	_TIM2_Cmd
1181                     	xref	_TIM2_TimeBaseInit
1182                     	xref	_TIM2_DeInit
1183                     	xref.b	c_lreg
1184                     	xref.b	c_x
1185                     	xref.b	c_y
1205                     	xref	c_lgadc
1206                     	xref	c_lcmp
1207                     	xref	c_lzmp
1208                     	xref	c_ltor
1209                     	end
