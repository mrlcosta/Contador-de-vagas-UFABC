   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.12 - 20 Jun 2018
   3                     ; Generator (Limited) V4.4.8 - 20 Jun 2018
  14                     	bsct
  15  0000               _sample:
  16  0000 00            	dc.b	0
  17  0001               _channel:
  18  0001 00            	dc.b	0
  19  0002               _dataStatus:
  20  0002 00            	dc.b	0
  21  0003               _adcValue:
  22  0003 0000          	dc.w	0
  23  0005               _analog_buffer:
  24  0005 0000          	dc.w	0
  25  0007               _analog_buffer_reset:
  26  0007 0000          	dc.w	0
  69                     ; 38 void ADC1_Enable(uint8_t ch){
  71                     	switch	.text
  72  0000               _ADC1_Enable:
  76                     ; 40     ADC1_ConversionConfig(ADC1_CONVERSIONMODE_SINGLE, ch, ADC1_ALIGN_RIGHT);		
  78  0000 4b08          	push	#8
  79  0002 5f            	clrw	x
  80  0003 97            	ld	xl,a
  81  0004 cd0000        	call	_ADC1_ConversionConfig
  83  0007 84            	pop	a
  84                     ; 41 	  ADC1_Cmd             (ENABLE);
  86  0008 a601          	ld	a,#1
  87  000a cd0000        	call	_ADC1_Cmd
  89                     ; 42 		ADC1_StartConversion ();
  91  000d cd0000        	call	_ADC1_StartConversion
  93                     ; 44 	} 
  96  0010 81            	ret
 133                     ; 55 void analogSetBuffer(uint16_t * buffer_addr){
 134                     	switch	.text
 135  0011               _analogSetBuffer:
 139                     ; 57 	 analog_buffer       = buffer_addr;
 141  0011 bf05          	ldw	_analog_buffer,x
 142                     ; 58 	 analog_buffer_reset = buffer_addr;
 144  0013 bf07          	ldw	_analog_buffer_reset,x
 145                     ; 60   }
 148  0015 81            	ret
 190                     .const:	section	.text
 191  0000               L21:
 192  0000 000003ff      	dc.l	1023
 193                     ; 69  void analogRun(void){
 194                     	switch	.text
 195  0016               _analogRun:
 197  0016 89            	pushw	x
 198       00000002      OFST:	set	2
 201                     ; 73 	 table[sample] = (uint32_t)ADC1_GetConversionValue() * (uint16_t)5000 / (uint16_t)1023;
 203  0017 cd0000        	call	_ADC1_GetConversionValue
 205  001a 90ae1388      	ldw	y,#5000
 206  001e cd0000        	call	c_umul
 208  0021 ae0000        	ldw	x,#L21
 209  0024 cd0000        	call	c_ludv
 211  0027 b600          	ld	a,_sample
 212  0029 5f            	clrw	x
 213  002a 97            	ld	xl,a
 214  002b 58            	sllw	x
 215  002c 90be02        	ldw	y,c_lreg+2
 216  002f ef00          	ldw	(_table,x),y
 217                     ; 75 	 if(sample > 0){
 219  0031 3d00          	tnz	_sample
 220  0033 273a          	jreq	L36
 221                     ; 77 		 aux = table[sample] - table[sample-1];
 223  0035 b600          	ld	a,_sample
 224  0037 5f            	clrw	x
 225  0038 97            	ld	xl,a
 226  0039 58            	sllw	x
 227  003a ee00          	ldw	x,(_table,x)
 228  003c b600          	ld	a,_sample
 229  003e 905f          	clrw	y
 230  0040 9097          	ld	yl,a
 231  0042 9058          	sllw	y
 232  0044 905a          	decw	y
 233  0046 905a          	decw	y
 234  0048 01            	rrwa	x,a
 235  0049 90e001        	sub	a,(_table+1,y)
 236  004c 01            	rrwa	x,a
 237  004d 90e200        	sbc	a,(_table,y)
 238  0050 01            	rrwa	x,a
 239  0051 1f01          	ldw	(OFST-1,sp),x
 241                     ; 79 		 if((aux > NOISE_REJECTION)||(aux < (-NOISE_REJECTION))){
 243  0053 9c            	rvf
 244  0054 1e01          	ldw	x,(OFST-1,sp)
 245  0056 a301f5        	cpw	x,#501
 246  0059 2e08          	jrsge	L76
 248  005b 9c            	rvf
 249  005c 1e01          	ldw	x,(OFST-1,sp)
 250  005e a3fe0c        	cpw	x,#65036
 251  0061 2e0c          	jrsge	L36
 252  0063               L76:
 253                     ; 81 			 channel       = 0;
 255  0063 3f01          	clr	_channel
 256                     ; 82 			 sample        = 0;			 
 258  0065 3f00          	clr	_sample
 259                     ; 83 			 dataStatus    = DATA_UNAVAILABLE;
 261  0067 3f02          	clr	_dataStatus
 262                     ; 84 			 analog_buffer = analog_buffer_reset;
 264  0069 be07          	ldw	x,_analog_buffer_reset
 265  006b bf05          	ldw	_analog_buffer,x
 266                     ; 86 			 return;
 268  006d 203c          	jra	L41
 269  006f               L36:
 270                     ; 92 	 sample++;
 272  006f 3c00          	inc	_sample
 273                     ; 94 	 if(sample == SAMPLE_QTY){
 275  0071 b600          	ld	a,_sample
 276  0073 a105          	cp	a,#5
 277  0075 261f          	jrne	L17
 278                     ; 96 		 *analog_buffer++ = table[sample - 1];
 280  0077 b600          	ld	a,_sample
 281  0079 5f            	clrw	x
 282  007a 97            	ld	xl,a
 283  007b 58            	sllw	x
 284  007c 5a            	decw	x
 285  007d 5a            	decw	x
 286  007e 90be05        	ldw	y,_analog_buffer
 287  0081 72a90002      	addw	y,#2
 288  0085 90bf05        	ldw	_analog_buffer,y
 289  0088 72a20002      	subw	y,#2
 290  008c 89            	pushw	x
 291  008d ee00          	ldw	x,(_table,x)
 292  008f 90ff          	ldw	(y),x
 293  0091 85            	popw	x
 294                     ; 98 		 sample = 0;
 296  0092 3f00          	clr	_sample
 297                     ; 100 		 channel++;
 299  0094 3c01          	inc	_channel
 300  0096               L17:
 301                     ; 105 	 if(channel == CHANNEL_QTY){
 303  0096 b601          	ld	a,_channel
 304  0098 a106          	cp	a,#6
 305  009a 260a          	jrne	L37
 306                     ; 107 		 channel = 0;
 308  009c 3f01          	clr	_channel
 309                     ; 109 		 dataStatus = DATA_AVAILABLE;
 311  009e 35010002      	mov	_dataStatus,#1
 312                     ; 111 		 analog_buffer = analog_buffer_reset;
 314  00a2 be07          	ldw	x,_analog_buffer_reset
 315  00a4 bf05          	ldw	_analog_buffer,x
 316  00a6               L37:
 317                     ; 115 	 ADC1_Enable(channel);
 319  00a6 b601          	ld	a,_channel
 320  00a8 cd0000        	call	_ADC1_Enable
 322                     ; 117   }	
 323  00ab               L41:
 326  00ab 85            	popw	x
 327  00ac 81            	ret
 419                     	xdef	_ADC1_Enable
 420                     	switch	.ubsct
 421  0000               _table:
 422  0000 000000000000  	ds.b	10
 423                     	xdef	_table
 424  000a               _ponteiro:
 425  000a 0000          	ds.b	2
 426                     	xdef	_ponteiro
 427                     	xdef	_analog_buffer_reset
 428                     	xdef	_analog_buffer
 429                     	xdef	_adcValue
 430                     	xdef	_dataStatus
 431                     	xdef	_channel
 432                     	xdef	_sample
 433                     	xdef	_analogRun
 434                     	xdef	_analogSetBuffer
 435                     	xref	_ADC1_GetConversionValue
 436                     	xref	_ADC1_StartConversion
 437                     	xref	_ADC1_ConversionConfig
 438                     	xref	_ADC1_Cmd
 439                     	xref.b	c_lreg
 440                     	xref.b	c_x
 441                     	xref.b	c_y
 461                     	xref	c_ludv
 462                     	xref	c_umul
 463                     	end
