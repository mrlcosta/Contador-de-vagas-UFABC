   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  15                     	bsct
  16  0000               _state:
  17  0000 00            	dc.b	0
  54                     ; 32 void out1(void){
  56                     	switch	.text
  57  0000               _out1:
  61                     ; 34 	 switch (state){
  63  0000 b600          	ld	a,_state
  65                     ; 61 		 break;
  66  0002 4d            	tnz	a
  67  0003 2705          	jreq	L3
  68  0005 4a            	dec	a
  69  0006 2755          	jreq	L5
  70  0008 205d          	jra	L72
  71  000a               L3:
  72                     ; 36 		 case 0:
  72                     ; 37 		   
  72                     ; 38 		   GPIO_WriteLow (DN1);
  74  000a 4b04          	push	#4
  75  000c ae500a        	ldw	x,#20490
  76  000f cd0000        	call	_GPIO_WriteLow
  78  0012 84            	pop	a
  79                     ; 39 	     GPIO_WriteLow (UP1);
  81  0013 4b40          	push	#64
  82  0015 ae5000        	ldw	x,#20480
  83  0018 cd0000        	call	_GPIO_WriteLow
  85  001b 84            	pop	a
  86                     ; 40 			 GPIO_WriteHigh(LED);
  88  001c 4b10          	push	#16
  89  001e ae500f        	ldw	x,#20495
  90  0021 cd0000        	call	_GPIO_WriteHigh
  92  0024 84            	pop	a
  93                     ; 42 		   if(sw1()){ 
  95  0025 cd0000        	call	_sw1
  97  0028 4d            	tnz	a
  98  0029 273c          	jreq	L72
  99                     ; 44 			   state = 1; 
 101  002b 35010000      	mov	_state,#1
 102                     ; 46 				 GPIO_WriteHigh(UP1);
 104  002f 4b40          	push	#64
 105  0031 ae5000        	ldw	x,#20480
 106  0034 cd0000        	call	_GPIO_WriteHigh
 108  0037 84            	pop	a
 109                     ; 47 			   GPIO_WriteLow (LED);
 111  0038 4b10          	push	#16
 112  003a ae500f        	ldw	x,#20495
 113  003d cd0000        	call	_GPIO_WriteLow
 115  0040 84            	pop	a
 116                     ; 49 			   timerSetOverflowValue(1, TIME_BASE_1S);
 118  0041 ae03e8        	ldw	x,#1000
 119  0044 89            	pushw	x
 120  0045 ae0000        	ldw	x,#0
 121  0048 89            	pushw	x
 122  0049 a601          	ld	a,#1
 123  004b cd0000        	call	_timerSetOverflowValue
 125  004e 5b04          	addw	sp,#4
 126                     ; 50 	       timerReset           (1);
 128  0050 a601          	ld	a,#1
 129  0052 cd0000        	call	_timerReset
 131                     ; 51 	       timerEnable          (1, ENABLE);
 133  0055 ae0101        	ldw	x,#257
 134  0058 cd0000        	call	_timerEnable
 136  005b 200a          	jra	L72
 137  005d               L5:
 138                     ; 57 		 case 1:
 138                     ; 58 			 
 138                     ; 59 		   if(timerGetOverflow(1)){ state = 0; } 	
 140  005d a601          	ld	a,#1
 141  005f cd0000        	call	_timerGetOverflow
 143  0062 4d            	tnz	a
 144  0063 2702          	jreq	L72
 147  0065 3f00          	clr	_state
 148  0067               L72:
 149                     ; 64 	}
 152  0067 81            	ret
 176                     	xdef	_state
 177                     	xdef	_out1
 178                     	xref	_sw1
 179                     	xref	_timerGetOverflow
 180                     	xref	_timerSetOverflowValue
 181                     	xref	_timerReset
 182                     	xref	_timerEnable
 183                     	xref	_GPIO_WriteLow
 184                     	xref	_GPIO_WriteHigh
 203                     	end
