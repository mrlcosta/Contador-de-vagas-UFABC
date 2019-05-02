   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.12 - 20 Jun 2018
   3                     ; Generator (Limited) V4.4.8 - 20 Jun 2018
  14                     	bsct
  15  0000               _controle:
  16  0000 00            	dc.b	0
  17  0001               _carros:
  18  0001 00            	dc.b	0
  19  0002               _quantidade_vagas:
  20  0002 00            	dc.b	0
  21  0003               _controle_buzzer:
  22  0003 00            	dc.b	0
  23  0004               _modo_operacao:
  24  0004 00            	dc.b	0
  25  0005               _n:
  26  0005 0000          	dc.w	0
  27  0007               _contador_debounce_sensor_entrada:
  28  0007 0000          	dc.w	0
  29  0009               _contador_debounce_sensor_saida:
  30  0009 0000          	dc.w	0
  31  000b               _contador_debounce_bt_incremento:
  32  000b 0000          	dc.w	0
  33  000d               _contador_debounce_bt_decremento:
  34  000d 0000          	dc.w	0
  35  000f               _contador_debounce_bt_confirma:
  36  000f 0000          	dc.w	0
  37  0011               _contador_delay:
  38  0011 0000          	dc.w	0
  39  0013               _contador_buzzer:
  40  0013 0000          	dc.w	0
  41  0015               _tempo_buzzer_incremento:
  42  0015 0000          	dc.w	0
  43  0017               _tempo_buzzer_decremento:
  44  0017 0000          	dc.w	0
  45  0019               _eeprom:
  46  0019 0000427b      	dc.l	17019
  47  001d               _sensor_entrada:
  48  001d 00            	dc.b	0
  49  001e               _last_sensor_entrada:
  50  001e 00            	dc.b	0
  51  001f               _sensor_saida:
  52  001f 00            	dc.b	0
  53  0020               _last_sensor_saida:
  54  0020 00            	dc.b	0
  55  0021               _bt_incremento:
  56  0021 00            	dc.b	0
  57  0022               _last_bt_incremento:
  58  0022 00            	dc.b	0
  59  0023               _bt_decremento:
  60  0023 00            	dc.b	0
  61  0024               _last_bt_decremento:
  62  0024 00            	dc.b	0
  63  0025               _bt_confirma:
  64  0025 00            	dc.b	0
  65  0026               _last_bt_confirma:
  66  0026 00            	dc.b	0
  67  0027               _display_carros_atualizado:
  68  0027 00            	dc.b	0
  69  0028               _display_vagas_atualizado:
  70  0028 00            	dc.b	0
  71  0029               _buzzer_incremento:
  72  0029 00            	dc.b	0
  73  002a               _buzzer_decremento:
  74  002a 00            	dc.b	0
 117                     ; 100 main(){
 119                     	switch	.text
 120  0000               _main:
 124                     ; 101 	CLK->CKDIVR = 0; 
 126  0000 725f50c6      	clr	20678
 127                     ; 102 	ioInit();
 129  0004 cd0437        	call	_ioInit
 131                     ; 103 	timerInit();
 133  0007 cd04bc        	call	_timerInit
 135                     ; 104 	FLASH_DeInit();
 137  000a cd0000        	call	_FLASH_DeInit
 139                     ; 105 	enableInterrupts();
 142  000d 9a            rim
 144                     ; 106 	lcdInit();
 147  000e cd04d1        	call	_lcdInit
 149                     ; 107 	lcd_clear();
 151  0011 cd0567        	call	_lcd_clear
 153                     ; 108 	mensagem_inicial_lcd();
 155  0014 cd0317        	call	_mensagem_inicial_lcd
 157                     ; 110 	delay(2500);
 159  0017 ae09c4        	ldw	x,#2500
 160  001a cd00ce        	call	_delay
 162                     ; 111 	lcd_clear();
 164  001d cd0567        	call	_lcd_clear
 166  0020               L12:
 167                     ; 113 		checa_entradas();
 169  0020 cd0369        	call	_checa_entradas
 171                     ; 114 		contagem_carros();
 173  0023 cd0330        	call	_contagem_carros
 175                     ; 115 		contagem_estacionamento();
 177  0026 cd00e3        	call	_contagem_estacionamento
 179                     ; 116 		sinalizacao_buzzer();
 181  0029 cd0169        	call	_sinalizacao_buzzer
 183                     ; 117 		atualiza_display_carros();
 185  002c ad04          	call	_atualiza_display_carros
 187                     ; 118 		atualiza_display_vagas();
 189  002e ad50          	call	_atualiza_display_vagas
 192  0030 20ee          	jra	L12
 223                     ; 131 void atualiza_display_carros(void){
 224                     	switch	.text
 225  0032               _atualiza_display_carros:
 229                     ; 133 	if(display_carros_atualizado){return;}
 231  0032 3d27          	tnz	_display_carros_atualizado
 232  0034 2701          	jreq	L53
 236  0036 81            	ret
 237  0037               L53:
 238                     ; 135 	sprintf(buf_carros, "%03d", (int) carros );
 240  0037 b601          	ld	a,_carros
 241  0039 5f            	clrw	x
 242  003a 97            	ld	xl,a
 243  003b 89            	pushw	x
 244  003c ae0048        	ldw	x,#L73
 245  003f 89            	pushw	x
 246  0040 ae0003        	ldw	x,#_buf_carros
 247  0043 cd0000        	call	_sprintf
 249  0046 5b04          	addw	sp,#4
 250                     ; 136 	lcd_write(LINE_1, FALSE);
 252  0048 ae8000        	ldw	x,#32768
 253  004b cd056d        	call	_lcd_write
 255                     ; 137 	lcd_write_string	 ("CARROS: ");
 257  004e ae003f        	ldw	x,#L14
 258  0051 cd05cf        	call	_lcd_write_string
 260                     ; 138 	lcd_write(buf_carros[0],TRUE);
 262  0054 b603          	ld	a,_buf_carros
 263  0056 ae0001        	ldw	x,#1
 264  0059 95            	ld	xh,a
 265  005a cd056d        	call	_lcd_write
 267                     ; 139 	lcd_write(buf_carros[1],TRUE);
 269  005d b604          	ld	a,_buf_carros+1
 270  005f ae0001        	ldw	x,#1
 271  0062 95            	ld	xh,a
 272  0063 cd056d        	call	_lcd_write
 274                     ; 140 	lcd_write(buf_carros[2],TRUE);
 276  0066 b605          	ld	a,_buf_carros+2
 277  0068 ae0001        	ldw	x,#1
 278  006b 95            	ld	xh,a
 279  006c cd056d        	call	_lcd_write
 281                     ; 141 	if (modo_operacao == CARROS){
 283  006f b604          	ld	a,_modo_operacao
 284  0071 a102          	cp	a,#2
 285  0073 2606          	jrne	L34
 286                     ; 142 		lcd_write_string	 ("<--");
 288  0075 ae003b        	ldw	x,#L54
 289  0078 cd05cf        	call	_lcd_write_string
 291  007b               L34:
 292                     ; 144 	display_carros_atualizado = TRUE;
 294  007b 35010027      	mov	_display_carros_atualizado,#1
 295                     ; 146 }
 298  007f 81            	ret
 329                     ; 158 void atualiza_display_vagas(void){
 330                     	switch	.text
 331  0080               _atualiza_display_vagas:
 335                     ; 160 	if(display_vagas_atualizado){return;}
 337  0080 3d28          	tnz	_display_vagas_atualizado
 338  0082 2701          	jreq	L75
 342  0084 81            	ret
 343  0085               L75:
 344                     ; 162 	sprintf(buf_vagas, "%03d", (int) quantidade_vagas );
 346  0085 b602          	ld	a,_quantidade_vagas
 347  0087 5f            	clrw	x
 348  0088 97            	ld	xl,a
 349  0089 89            	pushw	x
 350  008a ae0048        	ldw	x,#L73
 351  008d 89            	pushw	x
 352  008e ae0000        	ldw	x,#_buf_vagas
 353  0091 cd0000        	call	_sprintf
 355  0094 5b04          	addw	sp,#4
 356                     ; 163 	lcd_write(LINE_2, FALSE);
 358  0096 aec000        	ldw	x,#49152
 359  0099 cd056d        	call	_lcd_write
 361                     ; 164 	lcd_write_string	 ("VAGAS : ");
 363  009c ae0032        	ldw	x,#L16
 364  009f cd05cf        	call	_lcd_write_string
 366                     ; 165 	lcd_write(buf_vagas[0],TRUE);
 368  00a2 b600          	ld	a,_buf_vagas
 369  00a4 ae0001        	ldw	x,#1
 370  00a7 95            	ld	xh,a
 371  00a8 cd056d        	call	_lcd_write
 373                     ; 166 	lcd_write(buf_vagas[1],TRUE);
 375  00ab b601          	ld	a,_buf_vagas+1
 376  00ad ae0001        	ldw	x,#1
 377  00b0 95            	ld	xh,a
 378  00b1 cd056d        	call	_lcd_write
 380                     ; 167 	lcd_write(buf_vagas[2],TRUE);
 382  00b4 b602          	ld	a,_buf_vagas+2
 383  00b6 ae0001        	ldw	x,#1
 384  00b9 95            	ld	xh,a
 385  00ba cd056d        	call	_lcd_write
 387                     ; 169 	if (modo_operacao == VAGAS){
 389  00bd b604          	ld	a,_modo_operacao
 390  00bf a101          	cp	a,#1
 391  00c1 2606          	jrne	L36
 392                     ; 170 		lcd_write_string	 ("<--");
 394  00c3 ae003b        	ldw	x,#L54
 395  00c6 cd05cf        	call	_lcd_write_string
 397  00c9               L36:
 398                     ; 173 	display_vagas_atualizado = TRUE;
 400  00c9 35010028      	mov	_display_vagas_atualizado,#1
 401                     ; 174 }
 404  00cd 81            	ret
 449                     ; 176 void delay(int delay){
 450                     	switch	.text
 451  00ce               _delay:
 453  00ce 89            	pushw	x
 454  00cf 89            	pushw	x
 455       00000002      OFST:	set	2
 458                     ; 177 	uint16_t tempo_atual_delay = contador_delay;
 460  00d0 be11          	ldw	x,_contador_delay
 461  00d2 1f01          	ldw	(OFST-1,sp),x
 464  00d4 2001          	jra	L311
 465  00d6               L701:
 466                     ; 178 	while(tempo_atual_delay + delay >= contador_delay){nop();}
 469  00d6 9d            nop
 472  00d7               L311:
 475  00d7 1e03          	ldw	x,(OFST+1,sp)
 476  00d9 72fb01        	addw	x,(OFST-1,sp)
 477  00dc b311          	cpw	x,_contador_delay
 478  00de 24f6          	jruge	L701
 479                     ; 179 }
 482  00e0 5b04          	addw	sp,#4
 483  00e2 81            	ret
 519                     ; 181 void contagem_estacionamento(){
 520                     	switch	.text
 521  00e3               _contagem_estacionamento:
 525                     ; 183 	if(last_bt_confirma != bt_confirma){
 527  00e3 b626          	ld	a,_last_bt_confirma
 528  00e5 b125          	cp	a,_bt_confirma
 529  00e7 271a          	jreq	L721
 530                     ; 184 		last_bt_confirma 	= bt_confirma;
 532  00e9 452526        	mov	_last_bt_confirma,_bt_confirma
 533                     ; 185 		if(bt_confirma){
 535  00ec 3d25          	tnz	_bt_confirma
 536  00ee 2713          	jreq	L721
 537                     ; 186 			display_vagas_atualizado = FALSE;
 539  00f0 3f28          	clr	_display_vagas_atualizado
 540                     ; 187 			display_carros_atualizado = FALSE;
 542  00f2 3f27          	clr	_display_carros_atualizado
 543                     ; 188 			lcd_clear();
 545  00f4 cd0567        	call	_lcd_clear
 547                     ; 189 			if(modo_operacao < 2){
 549  00f7 b604          	ld	a,_modo_operacao
 550  00f9 a102          	cp	a,#2
 551  00fb 2404          	jruge	L331
 552                     ; 190 				modo_operacao++;
 554  00fd 3c04          	inc	_modo_operacao
 556  00ff 2002          	jra	L721
 557  0101               L331:
 558                     ; 192 				modo_operacao = 0;
 560  0101 3f04          	clr	_modo_operacao
 561  0103               L721:
 562                     ; 197 	if(	modo_operacao == TRAVA){return;}
 564  0103 3d04          	tnz	_modo_operacao
 565  0105 2601          	jrne	L731
 569  0107 81            	ret
 570  0108               L731:
 571                     ; 200 	if(last_bt_incremento != bt_incremento){
 573  0108 b622          	ld	a,_last_bt_incremento
 574  010a b121          	cp	a,_bt_incremento
 575  010c 2723          	jreq	L141
 576                     ; 202 		last_bt_incremento 	= bt_incremento;
 578  010e 452122        	mov	_last_bt_incremento,_bt_incremento
 579                     ; 203 		if(bt_incremento){
 581  0111 3d21          	tnz	_bt_incremento
 582  0113 271c          	jreq	L141
 583                     ; 204 			if (modo_operacao == VAGAS){
 585  0115 b604          	ld	a,_modo_operacao
 586  0117 a101          	cp	a,#1
 587  0119 260c          	jrne	L541
 588                     ; 205 				if (quantidade_vagas < 255){
 590  011b b602          	ld	a,_quantidade_vagas
 591  011d a1ff          	cp	a,#255
 592  011f 2410          	jruge	L141
 593                     ; 206 					quantidade_vagas++;
 595  0121 3c02          	inc	_quantidade_vagas
 596                     ; 207 					display_vagas_atualizado = FALSE;
 598  0123 3f28          	clr	_display_vagas_atualizado
 599  0125 200a          	jra	L141
 600  0127               L541:
 601                     ; 210 				if (carros < 255){
 603  0127 b601          	ld	a,_carros
 604  0129 a1ff          	cp	a,#255
 605  012b 2404          	jruge	L141
 606                     ; 211 					carros++;
 608  012d 3c01          	inc	_carros
 609                     ; 212 					display_carros_atualizado = FALSE;
 611  012f 3f27          	clr	_display_carros_atualizado
 612  0131               L141:
 613                     ; 219 	if(last_bt_decremento != bt_decremento){
 615  0131 b624          	ld	a,_last_bt_decremento
 616  0133 b123          	cp	a,_bt_decremento
 617  0135 271f          	jreq	L551
 618                     ; 221 		last_bt_decremento 	= bt_decremento;
 620  0137 452324        	mov	_last_bt_decremento,_bt_decremento
 621                     ; 222 		if(bt_decremento){
 623  013a 3d23          	tnz	_bt_decremento
 624  013c 2718          	jreq	L551
 625                     ; 223 			if (modo_operacao == VAGAS){
 627  013e b604          	ld	a,_modo_operacao
 628  0140 a101          	cp	a,#1
 629  0142 260a          	jrne	L161
 630                     ; 224 				if (quantidade_vagas > 0){
 632  0144 3d02          	tnz	_quantidade_vagas
 633  0146 270e          	jreq	L551
 634                     ; 225 					quantidade_vagas--;
 636  0148 3a02          	dec	_quantidade_vagas
 637                     ; 226 					display_vagas_atualizado = FALSE;
 639  014a 3f28          	clr	_display_vagas_atualizado
 640  014c 2008          	jra	L551
 641  014e               L161:
 642                     ; 229 				if (carros > 0){
 644  014e 3d01          	tnz	_carros
 645  0150 2704          	jreq	L551
 646                     ; 230 					carros--;
 648  0152 3a01          	dec	_carros
 649                     ; 231 					display_carros_atualizado = FALSE;
 651  0154 3f27          	clr	_display_carros_atualizado
 652  0156               L551:
 653                     ; 238 }
 656  0156 81            	ret
 682                     ; 241 void incrementa_buzzer (){
 683                     	switch	.text
 684  0157               _incrementa_buzzer:
 688                     ; 242 	buzzer_incremento = TRUE;
 690  0157 35010029      	mov	_buzzer_incremento,#1
 691                     ; 243 	tempo_buzzer_incremento = contador_buzzer;
 693  015b be13          	ldw	x,_contador_buzzer
 694  015d bf15          	ldw	_tempo_buzzer_incremento,x
 695                     ; 244 }
 698  015f 81            	ret
 724                     ; 246 void decrementa_buzzer (){
 725                     	switch	.text
 726  0160               _decrementa_buzzer:
 730                     ; 247 	buzzer_decremento = TRUE;
 732  0160 3501002a      	mov	_buzzer_decremento,#1
 733                     ; 248 	tempo_buzzer_decremento = contador_buzzer;
 735  0164 be13          	ldw	x,_contador_buzzer
 736  0166 bf17          	ldw	_tempo_buzzer_decremento,x
 737                     ; 249 }
 740  0168 81            	ret
 771                     ; 251 void sinalizacao_buzzer (){
 772                     	switch	.text
 773  0169               _sinalizacao_buzzer:
 777                     ; 252 	if (buzzer_incremento){
 779  0169 3d29          	tnz	_buzzer_incremento
 780  016b 2722          	jreq	L122
 781                     ; 254 		GPIO_WriteHigh(BUZZER);
 783  016d 4b08          	push	#8
 784  016f ae5000        	ldw	x,#20480
 785  0172 cd0000        	call	_GPIO_WriteHigh
 787  0175 84            	pop	a
 788                     ; 255 		if (contador_buzzer-tempo_buzzer_incremento <= 500){return;}
 790  0176 be13          	ldw	x,_contador_buzzer
 791  0178 72b00015      	subw	x,_tempo_buzzer_incremento
 792  017c a301f5        	cpw	x,#501
 793  017f 2401          	jruge	L322
 797  0181 81            	ret
 798  0182               L322:
 799                     ; 256 		GPIO_WriteLow(BUZZER);
 801  0182 4b08          	push	#8
 802  0184 ae5000        	ldw	x,#20480
 803  0187 cd0000        	call	_GPIO_WriteLow
 805  018a 84            	pop	a
 806                     ; 257 		buzzer_incremento = FALSE;
 808  018b 3f29          	clr	_buzzer_incremento
 809                     ; 258 		controle_buzzer = 0;
 811  018d 3f03          	clr	_controle_buzzer
 812  018f               L122:
 813                     ; 261 	if (buzzer_decremento){
 815  018f 3d2a          	tnz	_buzzer_decremento
 816  0191 2720          	jreq	L522
 817                     ; 263 		GPIO_WriteHigh(BUZZER);
 819  0193 4b08          	push	#8
 820  0195 ae5000        	ldw	x,#20480
 821  0198 cd0000        	call	_GPIO_WriteHigh
 823  019b 84            	pop	a
 824                     ; 264 		if (contador_buzzer-tempo_buzzer_decremento <= 100){return;}
 826  019c be13          	ldw	x,_contador_buzzer
 827  019e 72b00017      	subw	x,_tempo_buzzer_decremento
 828  01a2 a30065        	cpw	x,#101
 829  01a5 2401          	jruge	L722
 833  01a7 81            	ret
 834  01a8               L722:
 835                     ; 265 		GPIO_WriteLow(BUZZER);
 837  01a8 4b08          	push	#8
 838  01aa ae5000        	ldw	x,#20480
 839  01ad cd0000        	call	_GPIO_WriteLow
 841  01b0 84            	pop	a
 842                     ; 266 		buzzer_decremento = FALSE;
 844  01b1 3f2a          	clr	_buzzer_decremento
 845  01b3               L522:
 846                     ; 268 }
 849  01b3 81            	ret
 876                     .const:	section	.text
 877  0000               L62:
 878  0000 00004280      	dc.l	17024
 879                     ; 273 void checa_eeprom(){
 880                     	switch	.text
 881  01b4               _checa_eeprom:
 885                     ; 275 	eeprom = PRIMEIRO_ENDERECO_EEPROM;
 887  01b4 ae4000        	ldw	x,#16384
 888  01b7 bf1b          	ldw	_eeprom+2,x
 889  01b9 ae0000        	ldw	x,#0
 890  01bc bf19          	ldw	_eeprom,x
 892  01be 2008          	jra	L542
 893  01c0               L142:
 894                     ; 277 		eeprom++;
 896  01c0 ae0019        	ldw	x,#_eeprom
 897  01c3 a601          	ld	a,#1
 898  01c5 cd0000        	call	c_lgadc
 900  01c8               L542:
 901                     ; 276 	while( (FLASH_ReadByte(eeprom) == 0x00) && (eeprom <= ULTIMO_ENDERECO_EEPROM) ){
 901                     ; 277 		eeprom++;
 903  01c8 be1b          	ldw	x,_eeprom+2
 904  01ca 89            	pushw	x
 905  01cb be19          	ldw	x,_eeprom
 906  01cd 89            	pushw	x
 907  01ce cd0000        	call	_FLASH_ReadByte
 909  01d1 5b04          	addw	sp,#4
 910  01d3 4d            	tnz	a
 911  01d4 260e          	jrne	L152
 913  01d6 ae0019        	ldw	x,#_eeprom
 914  01d9 cd0000        	call	c_ltor
 916  01dc ae0000        	ldw	x,#L62
 917  01df cd0000        	call	c_lcmp
 919  01e2 25dc          	jrult	L142
 920  01e4               L152:
 921                     ; 280 	if(eeprom > ULTIMO_ENDERECO_EEPROM ){ // se estourou  e não achou nada, volta pro inicio
 923  01e4 ae0019        	ldw	x,#_eeprom
 924  01e7 cd0000        	call	c_ltor
 926  01ea ae0000        	ldw	x,#L62
 927  01ed cd0000        	call	c_lcmp
 929  01f0 252a          	jrult	L352
 930                     ; 281 		eeprom = PRIMEIRO_ENDERECO_EEPROM; 
 932  01f2 ae4000        	ldw	x,#16384
 933  01f5 bf1b          	ldw	_eeprom+2,x
 934  01f7 ae0000        	ldw	x,#0
 935  01fa bf19          	ldw	_eeprom,x
 936                     ; 282 		carros = FLASH_ReadByte(PRIMEIRO_ENDERECO_EEPROM);
 938  01fc ae4000        	ldw	x,#16384
 939  01ff 89            	pushw	x
 940  0200 ae0000        	ldw	x,#0
 941  0203 89            	pushw	x
 942  0204 cd0000        	call	_FLASH_ReadByte
 944  0207 5b04          	addw	sp,#4
 945  0209 b701          	ld	_carros,a
 946                     ; 283 		quantidade_vagas = FLASH_ReadByte(PRIMEIRO_ENDERECO_EEPROM+1);
 948  020b ae4001        	ldw	x,#16385
 949  020e 89            	pushw	x
 950  020f ae0000        	ldw	x,#0
 951  0212 89            	pushw	x
 952  0213 cd0000        	call	_FLASH_ReadByte
 954  0216 5b04          	addw	sp,#4
 955  0218 b702          	ld	_quantidade_vagas,a
 957  021a 2022          	jra	L552
 958  021c               L352:
 959                     ; 285 		carros = FLASH_ReadByte(eeprom);
 961  021c be1b          	ldw	x,_eeprom+2
 962  021e 89            	pushw	x
 963  021f be19          	ldw	x,_eeprom
 964  0221 89            	pushw	x
 965  0222 cd0000        	call	_FLASH_ReadByte
 967  0225 5b04          	addw	sp,#4
 968  0227 b701          	ld	_carros,a
 969                     ; 286 		quantidade_vagas = FLASH_ReadByte(++eeprom);
 971  0229 ae0019        	ldw	x,#_eeprom
 972  022c a601          	ld	a,#1
 973  022e cd0000        	call	c_lgadc
 975  0231 be1b          	ldw	x,_eeprom+2
 976  0233 89            	pushw	x
 977  0234 be19          	ldw	x,_eeprom
 978  0236 89            	pushw	x
 979  0237 cd0000        	call	_FLASH_ReadByte
 981  023a 5b04          	addw	sp,#4
 982  023c b702          	ld	_quantidade_vagas,a
 983  023e               L552:
 984                     ; 289 }
 987  023e 81            	ret
1017                     	switch	.const
1018  0004               L23:
1019  0004 0000427e      	dc.l	17022
1020  0008               L43:
1021  0008 00004003      	dc.l	16387
1022                     ; 291 void grava_eeprom(){
1023                     	switch	.text
1024  023f               _grava_eeprom:
1028                     ; 293 	FLASH_Unlock(FLASH_MEMTYPE_DATA);
1030  023f a6f7          	ld	a,#247
1031  0241 cd0000        	call	_FLASH_Unlock
1033                     ; 295 	if(eeprom>=ULTIMO_ENDERECO_EEPROM-1){
1035  0244 ae0019        	ldw	x,#_eeprom
1036  0247 cd0000        	call	c_ltor
1038  024a ae0004        	ldw	x,#L23
1039  024d cd0000        	call	c_lcmp
1041  0250 2559          	jrult	L762
1042                     ; 297 		eeprom = PRIMEIRO_ENDERECO_EEPROM;
1044  0252 ae4000        	ldw	x,#16384
1045  0255 bf1b          	ldw	_eeprom+2,x
1046  0257 ae0000        	ldw	x,#0
1047  025a bf19          	ldw	_eeprom,x
1048                     ; 298 		FLASH_ProgramByte(eeprom, carros);
1050  025c 3b0001        	push	_carros
1051  025f ae4000        	ldw	x,#16384
1052  0262 89            	pushw	x
1053  0263 ae0000        	ldw	x,#0
1054  0266 89            	pushw	x
1055  0267 cd0000        	call	_FLASH_ProgramByte
1057  026a 5b05          	addw	sp,#5
1058                     ; 299 		FLASH_ProgramByte(++eeprom , quantidade_vagas);
1060  026c 3b0002        	push	_quantidade_vagas
1061  026f ae0019        	ldw	x,#_eeprom
1062  0272 a601          	ld	a,#1
1063  0274 cd0000        	call	c_lgadc
1065  0277 be1b          	ldw	x,_eeprom+2
1066  0279 89            	pushw	x
1067  027a be19          	ldw	x,_eeprom
1068  027c 89            	pushw	x
1069  027d cd0000        	call	_FLASH_ProgramByte
1071  0280 5b05          	addw	sp,#5
1072                     ; 300 		FLASH_EraseByte(ULTIMO_ENDERECO_EEPROM);
1074  0282 ae427f        	ldw	x,#17023
1075  0285 89            	pushw	x
1076  0286 ae0000        	ldw	x,#0
1077  0289 89            	pushw	x
1078  028a cd0000        	call	_FLASH_EraseByte
1080  028d 5b04          	addw	sp,#4
1081                     ; 301 		FLASH_EraseByte(ULTIMO_ENDERECO_EEPROM-1);
1083  028f ae427e        	ldw	x,#17022
1084  0292 89            	pushw	x
1085  0293 ae0000        	ldw	x,#0
1086  0296 89            	pushw	x
1087  0297 cd0000        	call	_FLASH_EraseByte
1089  029a 5b04          	addw	sp,#4
1090                     ; 302 		FLASH_EraseByte(ULTIMO_ENDERECO_EEPROM-2);
1092  029c ae427d        	ldw	x,#17021
1093  029f 89            	pushw	x
1094  02a0 ae0000        	ldw	x,#0
1095  02a3 89            	pushw	x
1096  02a4 cd0000        	call	_FLASH_EraseByte
1098  02a7 5b04          	addw	sp,#4
1100  02a9 2066          	jra	L172
1101  02ab               L762:
1102                     ; 306 		FLASH_ProgramByte(++eeprom, carros);
1104  02ab 3b0001        	push	_carros
1105  02ae ae0019        	ldw	x,#_eeprom
1106  02b1 a601          	ld	a,#1
1107  02b3 cd0000        	call	c_lgadc
1109  02b6 be1b          	ldw	x,_eeprom+2
1110  02b8 89            	pushw	x
1111  02b9 be19          	ldw	x,_eeprom
1112  02bb 89            	pushw	x
1113  02bc cd0000        	call	_FLASH_ProgramByte
1115  02bf 5b05          	addw	sp,#5
1116                     ; 307 		FLASH_ProgramByte(++eeprom , quantidade_vagas);
1118  02c1 3b0002        	push	_quantidade_vagas
1119  02c4 ae0019        	ldw	x,#_eeprom
1120  02c7 a601          	ld	a,#1
1121  02c9 cd0000        	call	c_lgadc
1123  02cc be1b          	ldw	x,_eeprom+2
1124  02ce 89            	pushw	x
1125  02cf be19          	ldw	x,_eeprom
1126  02d1 89            	pushw	x
1127  02d2 cd0000        	call	_FLASH_ProgramByte
1129  02d5 5b05          	addw	sp,#5
1130                     ; 309 		if (eeprom >= PRIMEIRO_ENDERECO_EEPROM + 3){
1132  02d7 ae0019        	ldw	x,#_eeprom
1133  02da cd0000        	call	c_ltor
1135  02dd ae0008        	ldw	x,#L43
1136  02e0 cd0000        	call	c_lcmp
1138  02e3 252c          	jrult	L172
1139                     ; 310 			FLASH_EraseByte(eeprom - 2);
1141  02e5 ae0019        	ldw	x,#_eeprom
1142  02e8 cd0000        	call	c_ltor
1144  02eb a602          	ld	a,#2
1145  02ed cd0000        	call	c_lsbc
1147  02f0 be02          	ldw	x,c_lreg+2
1148  02f2 89            	pushw	x
1149  02f3 be00          	ldw	x,c_lreg
1150  02f5 89            	pushw	x
1151  02f6 cd0000        	call	_FLASH_EraseByte
1153  02f9 5b04          	addw	sp,#4
1154                     ; 311 			FLASH_EraseByte(eeprom - 3);
1156  02fb ae0019        	ldw	x,#_eeprom
1157  02fe cd0000        	call	c_ltor
1159  0301 a603          	ld	a,#3
1160  0303 cd0000        	call	c_lsbc
1162  0306 be02          	ldw	x,c_lreg+2
1163  0308 89            	pushw	x
1164  0309 be00          	ldw	x,c_lreg
1165  030b 89            	pushw	x
1166  030c cd0000        	call	_FLASH_EraseByte
1168  030f 5b04          	addw	sp,#4
1169  0311               L172:
1170                     ; 315 	FLASH_Lock(FLASH_MEMTYPE_DATA);
1172  0311 a6f7          	ld	a,#247
1173  0313 cd0000        	call	_FLASH_Lock
1175                     ; 317 }
1178  0316 81            	ret
1204                     ; 319 void mensagem_inicial_lcd(){
1205                     	switch	.text
1206  0317               _mensagem_inicial_lcd:
1210                     ; 320 	lcd_write(LINE_1, FALSE);
1212  0317 ae8000        	ldw	x,#32768
1213  031a cd056d        	call	_lcd_write
1215                     ; 321 	lcd_write_string	 ("  UNIVERSIDADE  ");
1217  031d ae0021        	ldw	x,#L503
1218  0320 cd05cf        	call	_lcd_write_string
1220                     ; 322 	lcd_write(LINE_2, FALSE);
1222  0323 aec000        	ldw	x,#49152
1223  0326 cd056d        	call	_lcd_write
1225                     ; 323 	lcd_write_string	 (" FEDERAL DO ABC ");
1227  0329 ae0010        	ldw	x,#L703
1228  032c cd05cf        	call	_lcd_write_string
1230                     ; 324 }
1233  032f 81            	ret
1265                     ; 326 void contagem_carros(){
1266                     	switch	.text
1267  0330               _contagem_carros:
1271                     ; 328 	if(last_sensor_entrada != sensor_entrada){
1273  0330 b61e          	ld	a,_last_sensor_entrada
1274  0332 b11d          	cp	a,_sensor_entrada
1275  0334 2717          	jreq	L123
1276                     ; 330 		last_sensor_entrada 	= sensor_entrada;
1278  0336 451d1e        	mov	_last_sensor_entrada,_sensor_entrada
1279                     ; 331 		if(sensor_entrada){
1281  0339 3d1d          	tnz	_sensor_entrada
1282  033b 2710          	jreq	L123
1283                     ; 333 			if (carros < 255){
1285  033d b601          	ld	a,_carros
1286  033f a1ff          	cp	a,#255
1287  0341 2407          	jruge	L723
1288                     ; 334 				carros++;
1290  0343 3c01          	inc	_carros
1291                     ; 335 				incrementa_buzzer();
1293  0345 cd0157        	call	_incrementa_buzzer
1295                     ; 336 				display_carros_atualizado = FALSE;
1297  0348 3f27          	clr	_display_carros_atualizado
1299  034a               L723:
1300                     ; 341 			grava_eeprom();
1302  034a cd023f        	call	_grava_eeprom
1304  034d               L123:
1305                     ; 345 	if(last_sensor_saida != sensor_saida){
1307  034d b620          	ld	a,_last_sensor_saida
1308  034f b11f          	cp	a,_sensor_saida
1309  0351 2715          	jreq	L133
1310                     ; 347 		last_sensor_saida 	= sensor_saida;
1312  0353 451f20        	mov	_last_sensor_saida,_sensor_saida
1313                     ; 348 		if(sensor_saida){
1315  0356 3d1f          	tnz	_sensor_saida
1316  0358 270e          	jreq	L133
1317                     ; 349 			if(carros > 0){
1319  035a 3d01          	tnz	_carros
1320  035c 2707          	jreq	L733
1321                     ; 350 				carros--;
1323  035e 3a01          	dec	_carros
1324                     ; 351 				decrementa_buzzer();
1326  0360 cd0160        	call	_decrementa_buzzer
1328                     ; 352 				display_carros_atualizado = FALSE;
1330  0363 3f27          	clr	_display_carros_atualizado
1332  0365               L733:
1333                     ; 357 			grava_eeprom();
1335  0365 cd023f        	call	_grava_eeprom
1337  0368               L133:
1338                     ; 361 }
1341  0368 81            	ret
1375                     ; 374 void checa_entradas (void){
1376                     	switch	.text
1377  0369               _checa_entradas:
1381                     ; 378 	if(!GPIO_ReadInputPin(SENSOR_ENTRADA)){
1383  0369 4b10          	push	#16
1384  036b ae500a        	ldw	x,#20490
1385  036e cd0000        	call	_GPIO_ReadInputPin
1387  0371 5b01          	addw	sp,#1
1388  0373 4d            	tnz	a
1389  0374 2610          	jrne	L153
1390                     ; 380 		if(contador_debounce_sensor_entrada >= TEMPO_DEBOUNCE_ACIONA){
1392  0376 be07          	ldw	x,_contador_debounce_sensor_entrada
1393  0378 a302bc        	cpw	x,#700
1394  037b 2515          	jrult	L553
1395                     ; 382 			sensor_entrada = TRUE;	
1397  037d 3501001d      	mov	_sensor_entrada,#1
1398                     ; 383 			contador_debounce_sensor_entrada = 0;
1400  0381 5f            	clrw	x
1401  0382 bf07          	ldw	_contador_debounce_sensor_entrada,x
1402  0384 200c          	jra	L553
1403  0386               L153:
1404                     ; 388 		if(contador_debounce_sensor_entrada >= TEMPO_DEBOUNCE_DESACIONA){
1406  0386 be07          	ldw	x,_contador_debounce_sensor_entrada
1407  0388 a30064        	cpw	x,#100
1408  038b 2505          	jrult	L553
1409                     ; 390 			sensor_entrada = FALSE; 
1411  038d 3f1d          	clr	_sensor_entrada
1412                     ; 391 			contador_debounce_sensor_entrada = 0;
1414  038f 5f            	clrw	x
1415  0390 bf07          	ldw	_contador_debounce_sensor_entrada,x
1416  0392               L553:
1417                     ; 398 		if(!GPIO_ReadInputPin(SENSOR_SAIDA)){
1419  0392 4b08          	push	#8
1420  0394 ae500a        	ldw	x,#20490
1421  0397 cd0000        	call	_GPIO_ReadInputPin
1423  039a 5b01          	addw	sp,#1
1424  039c 4d            	tnz	a
1425  039d 2610          	jrne	L163
1426                     ; 400 		if(contador_debounce_sensor_saida >= TEMPO_DEBOUNCE_ACIONA){
1428  039f be09          	ldw	x,_contador_debounce_sensor_saida
1429  03a1 a302bc        	cpw	x,#700
1430  03a4 2515          	jrult	L563
1431                     ; 402 			sensor_saida = TRUE;	
1433  03a6 3501001f      	mov	_sensor_saida,#1
1434                     ; 403 			contador_debounce_sensor_saida = 0;
1436  03aa 5f            	clrw	x
1437  03ab bf09          	ldw	_contador_debounce_sensor_saida,x
1438  03ad 200c          	jra	L563
1439  03af               L163:
1440                     ; 408 		if(contador_debounce_sensor_saida >= TEMPO_DEBOUNCE_DESACIONA){
1442  03af be09          	ldw	x,_contador_debounce_sensor_saida
1443  03b1 a30064        	cpw	x,#100
1444  03b4 2505          	jrult	L563
1445                     ; 410 			sensor_saida = FALSE; 
1447  03b6 3f1f          	clr	_sensor_saida
1448                     ; 411 			contador_debounce_sensor_saida = 0;
1450  03b8 5f            	clrw	x
1451  03b9 bf09          	ldw	_contador_debounce_sensor_saida,x
1452  03bb               L563:
1453                     ; 418 		if(!GPIO_ReadInputPin(BT_INCREMENTO)){
1455  03bb 4b20          	push	#32
1456  03bd ae500a        	ldw	x,#20490
1457  03c0 cd0000        	call	_GPIO_ReadInputPin
1459  03c3 5b01          	addw	sp,#1
1460  03c5 4d            	tnz	a
1461  03c6 2610          	jrne	L173
1462                     ; 420 		if(contador_debounce_bt_incremento >= TEMPO_DEBOUNCE_BT_INCREMENTO){
1464  03c8 be0b          	ldw	x,_contador_debounce_bt_incremento
1465  03ca a3001e        	cpw	x,#30
1466  03cd 2515          	jrult	L573
1467                     ; 422 			bt_incremento = TRUE;	
1469  03cf 35010021      	mov	_bt_incremento,#1
1470                     ; 423 			contador_debounce_bt_incremento = 0;
1472  03d3 5f            	clrw	x
1473  03d4 bf0b          	ldw	_contador_debounce_bt_incremento,x
1474  03d6 200c          	jra	L573
1475  03d8               L173:
1476                     ; 428 		if(contador_debounce_bt_incremento >= TEMPO_DEBOUNCE_BT_INCREMENTO){
1478  03d8 be0b          	ldw	x,_contador_debounce_bt_incremento
1479  03da a3001e        	cpw	x,#30
1480  03dd 2505          	jrult	L573
1481                     ; 430 			bt_incremento = FALSE; 
1483  03df 3f21          	clr	_bt_incremento
1484                     ; 431 			contador_debounce_bt_incremento = 0;
1486  03e1 5f            	clrw	x
1487  03e2 bf0b          	ldw	_contador_debounce_bt_incremento,x
1488  03e4               L573:
1489                     ; 439 	if(!GPIO_ReadInputPin(BT_DECREMENTO)){
1491  03e4 4b40          	push	#64
1492  03e6 ae500a        	ldw	x,#20490
1493  03e9 cd0000        	call	_GPIO_ReadInputPin
1495  03ec 5b01          	addw	sp,#1
1496  03ee 4d            	tnz	a
1497  03ef 2610          	jrne	L104
1498                     ; 441 		if(contador_debounce_bt_decremento >= TEMPO_DEBOUNCE_BT_DECREMENTO){
1500  03f1 be0d          	ldw	x,_contador_debounce_bt_decremento
1501  03f3 a3001e        	cpw	x,#30
1502  03f6 2515          	jrult	L504
1503                     ; 443 			bt_decremento = TRUE;	
1505  03f8 35010023      	mov	_bt_decremento,#1
1506                     ; 444 			contador_debounce_bt_decremento = 0;
1508  03fc 5f            	clrw	x
1509  03fd bf0d          	ldw	_contador_debounce_bt_decremento,x
1510  03ff 200c          	jra	L504
1511  0401               L104:
1512                     ; 449 		if(contador_debounce_bt_decremento >= TEMPO_DEBOUNCE_BT_DECREMENTO){
1514  0401 be0d          	ldw	x,_contador_debounce_bt_decremento
1515  0403 a3001e        	cpw	x,#30
1516  0406 2505          	jrult	L504
1517                     ; 451 			bt_decremento = FALSE; 
1519  0408 3f23          	clr	_bt_decremento
1520                     ; 452 			contador_debounce_bt_decremento = 0;
1522  040a 5f            	clrw	x
1523  040b bf0d          	ldw	_contador_debounce_bt_decremento,x
1524  040d               L504:
1525                     ; 460 		if(!GPIO_ReadInputPin(BT_CONFIRMA)){
1527  040d 4b10          	push	#16
1528  040f ae5005        	ldw	x,#20485
1529  0412 cd0000        	call	_GPIO_ReadInputPin
1531  0415 5b01          	addw	sp,#1
1532  0417 4d            	tnz	a
1533  0418 2610          	jrne	L114
1534                     ; 462 		if(contador_debounce_bt_confirma >= TEMPO_DEBOUNCE_BT_CONFIRMA){
1536  041a be0f          	ldw	x,_contador_debounce_bt_confirma
1537  041c a3001e        	cpw	x,#30
1538  041f 2515          	jrult	L514
1539                     ; 464 			bt_confirma = TRUE;	
1541  0421 35010025      	mov	_bt_confirma,#1
1542                     ; 465 			contador_debounce_bt_confirma = 0;
1544  0425 5f            	clrw	x
1545  0426 bf0f          	ldw	_contador_debounce_bt_confirma,x
1546  0428 200c          	jra	L514
1547  042a               L114:
1548                     ; 470 		if(contador_debounce_bt_confirma >= TEMPO_DEBOUNCE_BT_CONFIRMA){
1550  042a be0f          	ldw	x,_contador_debounce_bt_confirma
1551  042c a3001e        	cpw	x,#30
1552  042f 2505          	jrult	L514
1553                     ; 472 			bt_confirma = FALSE; 
1555  0431 3f25          	clr	_bt_confirma
1556                     ; 473 			contador_debounce_bt_confirma = 0;
1558  0433 5f            	clrw	x
1559  0434 bf0f          	ldw	_contador_debounce_bt_confirma,x
1560  0436               L514:
1561                     ; 478 }
1564  0436 81            	ret
1588                     ; 487 void ioInit(void){	 
1589                     	switch	.text
1590  0437               _ioInit:
1594                     ; 489 	GPIO_Init(BT_INCREMENTO,  	GPIO_MODE_IN_PU_NO_IT);
1596  0437 4b40          	push	#64
1597  0439 4b20          	push	#32
1598  043b ae500a        	ldw	x,#20490
1599  043e cd0000        	call	_GPIO_Init
1601  0441 85            	popw	x
1602                     ; 490 	GPIO_Init(BT_DECREMENTO,  	GPIO_MODE_IN_PU_NO_IT);
1604  0442 4b40          	push	#64
1605  0444 4b40          	push	#64
1606  0446 ae500a        	ldw	x,#20490
1607  0449 cd0000        	call	_GPIO_Init
1609  044c 85            	popw	x
1610                     ; 491 	GPIO_Init(BT_CONFIRMA,  		GPIO_MODE_IN_PU_NO_IT);
1612  044d 4b40          	push	#64
1613  044f 4b10          	push	#16
1614  0451 ae5005        	ldw	x,#20485
1615  0454 cd0000        	call	_GPIO_Init
1617  0457 85            	popw	x
1618                     ; 493 	GPIO_Init(SENSOR_SAIDA,  		GPIO_MODE_IN_PU_NO_IT);
1620  0458 4b40          	push	#64
1621  045a 4b08          	push	#8
1622  045c ae500a        	ldw	x,#20490
1623  045f cd0000        	call	_GPIO_Init
1625  0462 85            	popw	x
1626                     ; 494 	GPIO_Init(SENSOR_ENTRADA,		GPIO_MODE_IN_PU_NO_IT);
1628  0463 4b40          	push	#64
1629  0465 4b10          	push	#16
1630  0467 ae500a        	ldw	x,#20490
1631  046a cd0000        	call	_GPIO_Init
1633  046d 85            	popw	x
1634                     ; 496 	GPIO_Init(BUZZER,    				GPIO_MODE_OUT_PP_LOW_SLOW);
1636  046e 4bc0          	push	#192
1637  0470 4b08          	push	#8
1638  0472 ae5000        	ldw	x,#20480
1639  0475 cd0000        	call	_GPIO_Init
1641  0478 85            	popw	x
1642                     ; 498 	GPIO_Init(LCD_E,    				GPIO_MODE_OUT_PP_LOW_SLOW);
1644  0479 4bc0          	push	#192
1645  047b 4b40          	push	#64
1646  047d ae500f        	ldw	x,#20495
1647  0480 cd0000        	call	_GPIO_Init
1649  0483 85            	popw	x
1650                     ; 499 	GPIO_Init(LCD_RS,  				 	GPIO_MODE_OUT_PP_LOW_SLOW);
1652  0484 4bc0          	push	#192
1653  0486 4b80          	push	#128
1654  0488 ae500a        	ldw	x,#20490
1655  048b cd0000        	call	_GPIO_Init
1657  048e 85            	popw	x
1658                     ; 500 	GPIO_Init(LCD_DB4,  				GPIO_MODE_OUT_PP_LOW_SLOW);
1660  048f 4bc0          	push	#192
1661  0491 4b04          	push	#4
1662  0493 ae500f        	ldw	x,#20495
1663  0496 cd0000        	call	_GPIO_Init
1665  0499 85            	popw	x
1666                     ; 501 	GPIO_Init(LCD_DB5,  				GPIO_MODE_OUT_PP_LOW_SLOW);
1668  049a 4bc0          	push	#192
1669  049c 4b08          	push	#8
1670  049e ae500f        	ldw	x,#20495
1671  04a1 cd0000        	call	_GPIO_Init
1673  04a4 85            	popw	x
1674                     ; 502 	GPIO_Init(LCD_DB6,  				GPIO_MODE_OUT_PP_LOW_SLOW);
1676  04a5 4bc0          	push	#192
1677  04a7 4b10          	push	#16
1678  04a9 ae500f        	ldw	x,#20495
1679  04ac cd0000        	call	_GPIO_Init
1681  04af 85            	popw	x
1682                     ; 503 	GPIO_Init(LCD_DB7,  				GPIO_MODE_OUT_PP_LOW_SLOW);
1684  04b0 4bc0          	push	#192
1685  04b2 4b20          	push	#32
1686  04b4 ae500f        	ldw	x,#20495
1687  04b7 cd0000        	call	_GPIO_Init
1689  04ba 85            	popw	x
1690                     ; 504 }
1693  04bb 81            	ret
1720                     ; 526 void timerInit(void){
1721                     	switch	.text
1722  04bc               _timerInit:
1726                     ; 527 	TIM4_DeInit      ();                       
1728  04bc cd0000        	call	_TIM4_DeInit
1730                     ; 528 	TIM4_TimeBaseInit(TIM4_PRESCALER_64, 249); 	
1732  04bf ae06f9        	ldw	x,#1785
1733  04c2 cd0000        	call	_TIM4_TimeBaseInit
1735                     ; 529 	TIM4_ITConfig    (TIM4_IT_UPDATE, ENABLE);
1737  04c5 ae0101        	ldw	x,#257
1738  04c8 cd0000        	call	_TIM4_ITConfig
1740                     ; 530 	TIM4_Cmd         (ENABLE);
1742  04cb a601          	ld	a,#1
1743  04cd cd0000        	call	_TIM4_Cmd
1745                     ; 531 }
1748  04d0 81            	ret
1777                     	switch	.const
1778  000c               L25:
1779  000c 0000c350      	dc.l	50000
1780                     ; 542 void lcdInit(void){
1781                     	switch	.text
1782  04d1               _lcdInit:
1786                     ; 543 	GPIO_WriteLow(LCD_RS);
1788  04d1 4b80          	push	#128
1789  04d3 ae500a        	ldw	x,#20490
1790  04d6 cd0000        	call	_GPIO_WriteLow
1792  04d9 84            	pop	a
1793                     ; 544 	GPIO_WriteLow(LCD_E);   
1795  04da 4b40          	push	#64
1796  04dc ae500f        	ldw	x,#20495
1797  04df cd0000        	call	_GPIO_WriteLow
1799  04e2 84            	pop	a
1800                     ; 546 	for(n = 0; n < 50000; n++){ nop(); }
1802  04e3 5f            	clrw	x
1803  04e4 bf05          	ldw	_n,x
1804  04e6               L154:
1808  04e6 9d            nop
1813  04e7 be05          	ldw	x,_n
1814  04e9 1c0001        	addw	x,#1
1815  04ec bf05          	ldw	_n,x
1818  04ee 9c            	rvf
1819  04ef be05          	ldw	x,_n
1820  04f1 cd0000        	call	c_uitolx
1822  04f4 ae000c        	ldw	x,#L25
1823  04f7 cd0000        	call	c_lcmp
1825  04fa 2fea          	jrslt	L154
1826                     ; 547 	for(n = 0; n < 50000; n++){ nop(); }
1828  04fc 5f            	clrw	x
1829  04fd bf05          	ldw	_n,x
1830  04ff               L754:
1834  04ff 9d            nop
1839  0500 be05          	ldw	x,_n
1840  0502 1c0001        	addw	x,#1
1841  0505 bf05          	ldw	_n,x
1844  0507 9c            	rvf
1845  0508 be05          	ldw	x,_n
1846  050a cd0000        	call	c_uitolx
1848  050d ae000c        	ldw	x,#L25
1849  0510 cd0000        	call	c_lcmp
1851  0513 2fea          	jrslt	L754
1852                     ; 549 	lcd_write_nibble(0x03, FALSE);	 
1854  0515 ae0300        	ldw	x,#768
1855  0518 ad7b          	call	_lcd_write_nibble
1857                     ; 550 	lcd_write_nibble(0x03, FALSE); 
1859  051a ae0300        	ldw	x,#768
1860  051d ad76          	call	_lcd_write_nibble
1862                     ; 552 	lcd_write(0x02, FALSE); //set to 4 bit interface, 1 line and 5*7 font
1864  051f ae0200        	ldw	x,#512
1865  0522 ad49          	call	_lcd_write
1867                     ; 553 	lcd_write(0x28, FALSE); //set to 4 bit interface, 2 line and 5*10 font
1869  0524 ae2800        	ldw	x,#10240
1870  0527 ad44          	call	_lcd_write
1872                     ; 554 	lcd_write(0x0C, FALSE); //set to 4 bit interface, 2 line and 5*7 font
1874  0529 ae0c00        	ldw	x,#3072
1875  052c ad3f          	call	_lcd_write
1877                     ; 555 	lcd_write(0x01, FALSE); //clear display
1879  052e ae0100        	ldw	x,#256
1880  0531 ad3a          	call	_lcd_write
1882                     ; 556 	lcd_write(0x06, FALSE); //move cursor right after write
1884  0533 ae0600        	ldw	x,#1536
1885  0536 ad35          	call	_lcd_write
1887                     ; 557 }
1890  0538 81            	ret
1925                     ; 568 void lcd_set_line(uint8_t line){
1926                     	switch	.text
1927  0539               _lcd_set_line:
1931                     ; 570 	switch(line){
1934                     ; 590 		break;
1935  0539 4a            	dec	a
1936  053a 2710          	jreq	L564
1937  053c 4a            	dec	a
1938  053d 2714          	jreq	L764
1939  053f 4a            	dec	a
1940  0540 2718          	jreq	L174
1941  0542 4a            	dec	a
1942  0543 271c          	jreq	L374
1943  0545               L574:
1944                     ; 588 		default:
1944                     ; 589 			lcd_write(LINE_1, FALSE);
1946  0545 ae8000        	ldw	x,#32768
1947  0548 ad23          	call	_lcd_write
1949                     ; 590 		break;
1951  054a 201a          	jra	L715
1952  054c               L564:
1953                     ; 572 		case 1:
1953                     ; 573 			lcd_write(LINE_1, FALSE);
1955  054c ae8000        	ldw	x,#32768
1956  054f ad1c          	call	_lcd_write
1958                     ; 574 		break;
1960  0551 2013          	jra	L715
1961  0553               L764:
1962                     ; 576 		case 2:
1962                     ; 577 			lcd_write(LINE_2, FALSE);
1964  0553 aec000        	ldw	x,#49152
1965  0556 ad15          	call	_lcd_write
1967                     ; 578 		break;
1969  0558 200c          	jra	L715
1970  055a               L174:
1971                     ; 580 		case 3:
1971                     ; 581 			lcd_write(LINE_3, FALSE);
1973  055a ae9000        	ldw	x,#36864
1974  055d ad0e          	call	_lcd_write
1976                     ; 582 		break;
1978  055f 2005          	jra	L715
1979  0561               L374:
1980                     ; 584 		case 4:
1980                     ; 585 			lcd_write(LINE_4, FALSE);
1982  0561 aed000        	ldw	x,#53248
1983  0564 ad07          	call	_lcd_write
1985                     ; 586 		break;
1987  0566               L715:
1988                     ; 593 }
1991  0566 81            	ret
2015                     ; 604 void lcd_clear(void){
2016                     	switch	.text
2017  0567               _lcd_clear:
2021                     ; 606 	lcd_write(0x01, FALSE);
2023  0567 ae0100        	ldw	x,#256
2024  056a ad01          	call	_lcd_write
2026                     ; 607 }
2029  056c 81            	ret
2075                     ; 619 void lcd_write(uint8_t data, uint8_t type){
2076                     	switch	.text
2077  056d               _lcd_write:
2079  056d 89            	pushw	x
2080       00000000      OFST:	set	0
2083                     ; 621 	for(n = 0; n < 920; n++){ nop(); }
2085  056e 5f            	clrw	x
2086  056f bf05          	ldw	_n,x
2087  0571               L355:
2091  0571 9d            nop
2096  0572 be05          	ldw	x,_n
2097  0574 1c0001        	addw	x,#1
2098  0577 bf05          	ldw	_n,x
2101  0579 be05          	ldw	x,_n
2102  057b a30398        	cpw	x,#920
2103  057e 25f1          	jrult	L355
2104                     ; 623 	lcd_write_nibble(data >> 4, type); //WRITE THE UPPER NIBBLE
2106  0580 7b02          	ld	a,(OFST+2,sp)
2107  0582 97            	ld	xl,a
2108  0583 7b01          	ld	a,(OFST+1,sp)
2109  0585 4e            	swap	a
2110  0586 a40f          	and	a,#15
2111  0588 95            	ld	xh,a
2112  0589 ad0a          	call	_lcd_write_nibble
2114                     ; 624 	lcd_write_nibble(data,      type); //WRITE THE LOWER NIBBLE
2116  058b 7b02          	ld	a,(OFST+2,sp)
2117  058d 97            	ld	xl,a
2118  058e 7b01          	ld	a,(OFST+1,sp)
2119  0590 95            	ld	xh,a
2120  0591 ad02          	call	_lcd_write_nibble
2122                     ; 625 }
2125  0593 85            	popw	x
2126  0594 81            	ret
2172                     ; 637 void lcd_write_nibble(uint8_t data, uint8_t type){
2173                     	switch	.text
2174  0595               _lcd_write_nibble:
2176  0595 89            	pushw	x
2177       00000000      OFST:	set	0
2180                     ; 639 	GPIO_Write(LCD_PORT, (data << 2) & 0x3C);
2182  0596 9e            	ld	a,xh
2183  0597 48            	sll	a
2184  0598 48            	sll	a
2185  0599 a43c          	and	a,#60
2186  059b 88            	push	a
2187  059c ae500f        	ldw	x,#20495
2188  059f cd0000        	call	_GPIO_Write
2190  05a2 84            	pop	a
2191                     ; 641 	if(type == 0){ 
2193  05a3 0d02          	tnz	(OFST+2,sp)
2194  05a5 260b          	jrne	L306
2195                     ; 643 		GPIO_WriteLow(LCD_RS);
2197  05a7 4b80          	push	#128
2198  05a9 ae500a        	ldw	x,#20490
2199  05ac cd0000        	call	_GPIO_WriteLow
2201  05af 84            	pop	a
2203  05b0 2009          	jra	L506
2204  05b2               L306:
2205                     ; 647 		GPIO_WriteHigh(LCD_RS);
2207  05b2 4b80          	push	#128
2208  05b4 ae500a        	ldw	x,#20490
2209  05b7 cd0000        	call	_GPIO_WriteHigh
2211  05ba 84            	pop	a
2212  05bb               L506:
2213                     ; 650 	GPIO_WriteHigh(LCD_E);    
2215  05bb 4b40          	push	#64
2216  05bd ae500f        	ldw	x,#20495
2217  05c0 cd0000        	call	_GPIO_WriteHigh
2219  05c3 84            	pop	a
2220                     ; 651 	GPIO_WriteLow (LCD_E);
2222  05c4 4b40          	push	#64
2223  05c6 ae500f        	ldw	x,#20495
2224  05c9 cd0000        	call	_GPIO_WriteLow
2226  05cc 84            	pop	a
2227                     ; 652 }
2230  05cd 85            	popw	x
2231  05ce 81            	ret
2267                     ; 663 void lcd_write_string(const uint8_t *string){
2268                     	switch	.text
2269  05cf               _lcd_write_string:
2271  05cf 89            	pushw	x
2272       00000000      OFST:	set	0
2275  05d0 2011          	jra	L726
2276  05d2               L526:
2277                     ; 667 		lcd_write(*string++, TRUE);
2279  05d2 1e01          	ldw	x,(OFST+1,sp)
2280  05d4 1c0001        	addw	x,#1
2281  05d7 1f01          	ldw	(OFST+1,sp),x
2282  05d9 1d0001        	subw	x,#1
2283  05dc f6            	ld	a,(x)
2284  05dd ae0001        	ldw	x,#1
2285  05e0 95            	ld	xh,a
2286  05e1 ad8a          	call	_lcd_write
2288  05e3               L726:
2289                     ; 665 	while(*string){
2291  05e3 1e01          	ldw	x,(OFST+1,sp)
2292  05e5 7d            	tnz	(x)
2293  05e6 26ea          	jrne	L526
2294                     ; 669 }
2297  05e8 85            	popw	x
2298  05e9 81            	ret
2647                     	xdef	_main
2648                     	xdef	_mensagem_inicial_lcd
2649                     	xdef	_lcd_write_nibble
2650                     	xdef	_lcd_write
2651                     	xdef	_lcd_set_line
2652                     	xdef	_lcd_write_string
2653                     	xdef	_lcd_clear
2654                     	xdef	_decrementa_buzzer
2655                     	xdef	_incrementa_buzzer
2656                     	xdef	_sinalizacao_buzzer
2657                     	xdef	_grava_eeprom
2658                     	xdef	_checa_eeprom
2659                     	xdef	_contagem_estacionamento
2660                     	xdef	_contagem_carros
2661                     	xdef	_checa_entradas
2662                     	xdef	_delay
2663                     	xdef	_atualiza_display_vagas
2664                     	xdef	_atualiza_display_carros
2665                     	xdef	_lcdInit
2666                     	xdef	_ioInit
2667                     	xdef	_timerInit
2668                     	xdef	_buzzer_decremento
2669                     	xdef	_buzzer_incremento
2670                     	xdef	_display_vagas_atualizado
2671                     	xdef	_display_carros_atualizado
2672                     	xdef	_last_bt_confirma
2673                     	xdef	_bt_confirma
2674                     	xdef	_last_bt_decremento
2675                     	xdef	_bt_decremento
2676                     	xdef	_last_bt_incremento
2677                     	xdef	_bt_incremento
2678                     	xdef	_last_sensor_saida
2679                     	xdef	_sensor_saida
2680                     	xdef	_last_sensor_entrada
2681                     	xdef	_sensor_entrada
2682                     	switch	.ubsct
2683  0000               _buf_vagas:
2684  0000 000000        	ds.b	3
2685                     	xdef	_buf_vagas
2686  0003               _buf_carros:
2687  0003 000000        	ds.b	3
2688                     	xdef	_buf_carros
2689                     	xdef	_eeprom
2690                     	xdef	_tempo_buzzer_decremento
2691                     	xdef	_tempo_buzzer_incremento
2692                     	xdef	_contador_buzzer
2693                     	xdef	_contador_delay
2694                     	xdef	_contador_debounce_bt_confirma
2695                     	xdef	_contador_debounce_bt_decremento
2696                     	xdef	_contador_debounce_bt_incremento
2697                     	xdef	_contador_debounce_sensor_saida
2698                     	xdef	_contador_debounce_sensor_entrada
2699                     	xdef	_n
2700                     	xdef	_modo_operacao
2701                     	xdef	_controle_buzzer
2702                     	xdef	_quantidade_vagas
2703                     	xdef	_carros
2704                     	xdef	_controle
2705                     	xref	_sprintf
2706                     	xref	_FLASH_ReadByte
2707                     	xref	_FLASH_ProgramByte
2708                     	xref	_FLASH_EraseByte
2709                     	xref	_FLASH_DeInit
2710                     	xref	_FLASH_Lock
2711                     	xref	_FLASH_Unlock
2712                     	xref	_TIM4_ITConfig
2713                     	xref	_TIM4_Cmd
2714                     	xref	_TIM4_TimeBaseInit
2715                     	xref	_TIM4_DeInit
2716                     	xref	_GPIO_ReadInputPin
2717                     	xref	_GPIO_WriteLow
2718                     	xref	_GPIO_WriteHigh
2719                     	xref	_GPIO_Write
2720                     	xref	_GPIO_Init
2721                     	switch	.const
2722  0010               L703:
2723  0010 204645444552  	dc.b	" FEDERAL DO ABC ",0
2724  0021               L503:
2725  0021 2020554e4956  	dc.b	"  UNIVERSIDADE  ",0
2726  0032               L16:
2727  0032 564147415320  	dc.b	"VAGAS : ",0
2728  003b               L54:
2729  003b 3c2d2d00      	dc.b	"<--",0
2730  003f               L14:
2731  003f 434152524f53  	dc.b	"CARROS: ",0
2732  0048               L73:
2733  0048 2530336400    	dc.b	"%03d",0
2734                     	xref.b	c_lreg
2754                     	xref	c_uitolx
2755                     	xref	c_lsbc
2756                     	xref	c_lcmp
2757                     	xref	c_ltor
2758                     	xref	c_lgadc
2759                     	end
