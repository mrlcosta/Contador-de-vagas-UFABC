   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  15                     .bit:	section	.data,bit
  16  0000               _deboucing1:
  17  0000 00            	dc.b	0
  18  0001               _deboucing2:
  19  0001 00            	dc.b	0
  20  0002               _deboucing3:
  21  0002 00            	dc.b	0
  57                     ; 31 _Bool sw1(void){
  59                     	switch	.text
  60  0000               _sw1:
  64                     ; 33 	 if(GPIO_ReadInputPin(SW1) == FALSE){
  66  0000 4b40          	push	#64
  67  0002 ae500f        	ldw	x,#20495
  68  0005 cd0000        	call	_GPIO_ReadInputPin
  70  0008 5b01          	addw	sp,#1
  71  000a 4d            	tnz	a
  72  000b 2638          	jrne	L12
  73                     ; 35 		 if(!deboucing1){
  75                     	btst	_deboucing1
  76  0012 2520          	jrult	L32
  77                     ; 37 			 timerReset           (2);
  79  0014 a602          	ld	a,#2
  80  0016 cd0000        	call	_timerReset
  82                     ; 38 		   timerSetOverflowValue(2, TIME_BASE_DEBOUCING);
  84  0019 ae0064        	ldw	x,#100
  85  001c 89            	pushw	x
  86  001d ae0000        	ldw	x,#0
  87  0020 89            	pushw	x
  88  0021 a602          	ld	a,#2
  89  0023 cd0000        	call	_timerSetOverflowValue
  91  0026 5b04          	addw	sp,#4
  92                     ; 39 		   timerEnable          (2, ENABLE); 
  94  0028 ae0201        	ldw	x,#513
  95  002b cd0000        	call	_timerEnable
  97                     ; 41 			 deboucing1 = TRUE;
  99  002e 72100000      	bset	_deboucing1
 100                     ; 43 			  return FALSE;		
 102  0032 4f            	clr	a
 105  0033 81            	ret
 106  0034               L32:
 107                     ; 47 			if(timerGetOverflow(2)){
 109  0034 a602          	ld	a,#2
 110  0036 cd0000        	call	_timerGetOverflow
 112  0039 4d            	tnz	a
 113  003a 271d          	jreq	L72
 114                     ; 49 			 timerEnable(2, DISABLE);
 116  003c ae0200        	ldw	x,#512
 117  003f cd0000        	call	_timerEnable
 119                     ; 51 			 return TRUE;
 121  0042 a601          	ld	a,#1
 124  0044 81            	ret
 125  0045               L12:
 126                     ; 57 		 if(timerGetOverflow(2)){
 128  0045 a602          	ld	a,#2
 129  0047 cd0000        	call	_timerGetOverflow
 131  004a 4d            	tnz	a
 132  004b 270c          	jreq	L72
 133                     ; 59 		   timerEnable(2, DISABLE);
 135  004d ae0200        	ldw	x,#512
 136  0050 cd0000        	call	_timerEnable
 138                     ; 61 			 deboucing1 = FALSE;
 140  0053 72110000      	bres	_deboucing1
 141                     ; 63 			 return FALSE;
 143  0057 4f            	clr	a
 146  0058 81            	ret
 147  0059               L72:
 148                     ; 69   }
 151  0059 81            	ret
 196                     	xdef	_sw1
 197                     	xdef	_deboucing3
 198                     	xdef	_deboucing2
 199                     	xdef	_deboucing1
 200                     	xref	_timerGetOverflow
 201                     	xref	_timerSetOverflowValue
 202                     	xref	_timerReset
 203                     	xref	_timerEnable
 204                     	xref	_GPIO_ReadInputPin
 223                     	end
