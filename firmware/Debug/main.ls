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
  23  0004               _n:
  24  0004 0000          	dc.w	0
  25  0006               _contador_debounce_sensor_entrada:
  26  0006 0000          	dc.w	0
  27  0008               _contador_debounce_sensor_saida:
  28  0008 0000          	dc.w	0
  29  000a               _contador_debounce_bt_incremento:
  30  000a 0000          	dc.w	0
  31  000c               _contador_debounce_bt_decremento:
  32  000c 0000          	dc.w	0
  33  000e               _contador_debounce_bt_confirma:
  34  000e 0000          	dc.w	0
  35  0010               _contador_buzzer:
  36  0010 0000          	dc.w	0
  37  0012               _tempo_buzzer_incremento:
  38  0012 0000          	dc.w	0
  39  0014               _tempo_buzzer_decremento:
  40  0014 0000          	dc.w	0
  41  0016               _eeprom:
  42  0016 00004000      	dc.l	16384
  43  001a               _sensor_entrada:
  44  001a 00            	dc.b	0
  45  001b               _last_sensor_entrada:
  46  001b 00            	dc.b	0
  47  001c               _sensor_saida:
  48  001c 00            	dc.b	0
  49  001d               _last_sensor_saida:
  50  001d 00            	dc.b	0
  51  001e               _bt_incremento:
  52  001e 00            	dc.b	0
  53  001f               _last_bt_incremento:
  54  001f 00            	dc.b	0
  55  0020               _bt_decremento:
  56  0020 00            	dc.b	0
  57  0021               _last_bt_decremento:
  58  0021 00            	dc.b	0
  59  0022               _bt_confirma:
  60  0022 00            	dc.b	0
  61  0023               _buzzer_incremento:
  62  0023 00            	dc.b	0
  63  0024               _buzzer_decremento:
  64  0024 00            	dc.b	0
 105                     ; 89 main(){
 107                     	switch	.text
 108  0000               _main:
 112                     ; 90 	CLK->CKDIVR = 0; 
 114  0000 725f50c6      	clr	20678
 115                     ; 91 	ioInit();
 117  0004 cd02c8        	call	_ioInit
 119                     ; 92 	timerInit();
 121  0007 cd034d        	call	_timerInit
 123                     ; 93 	FLASH_DeInit();
 125  000a cd0000        	call	_FLASH_DeInit
 127                     ; 94 	enableInterrupts();
 130  000d 9a            rim
 132                     ; 95 	lcdInit();
 135  000e cd0362        	call	_lcdInit
 137                     ; 96 	lcd_clear();
 139  0011 cd03f8        	call	_lcd_clear
 141                     ; 97 	mensagem_inicial_lcd();
 143  0014 cd01af        	call	_mensagem_inicial_lcd
 145                     ; 98 	checa_eeprom();
 147  0017 cd00ac        	call	_checa_eeprom
 149  001a               L12:
 150                     ; 100 		checa_entradas();
 152  001a cd01fa        	call	_checa_entradas
 154                     ; 101 		contagem_carros();
 156  001d cd01c5        	call	_contagem_carros
 158                     ; 102 		contagem_estacionamento();
 160  0020 ad04          	call	_contagem_estacionamento
 162                     ; 104 		sinalizacao_buzzer();
 164  0022 ad3d          	call	_sinalizacao_buzzer
 167  0024 20f4          	jra	L12
 196                     ; 108 void contagem_estacionamento(){
 197                     	switch	.text
 198  0026               _contagem_estacionamento:
 202                     ; 110 	if(last_bt_incremento != bt_incremento){
 204  0026 b61f          	ld	a,_last_bt_incremento
 205  0028 b11e          	cp	a,_bt_incremento
 206  002a 270f          	jreq	L53
 207                     ; 112 		last_bt_incremento 	= bt_incremento;
 209  002c 451e1f        	mov	_last_bt_incremento,_bt_incremento
 210                     ; 113 		if(bt_incremento){
 212  002f 3d1e          	tnz	_bt_incremento
 213  0031 2708          	jreq	L53
 214                     ; 115 			if (quantidade_vagas < 255){
 216  0033 b602          	ld	a,_quantidade_vagas
 217  0035 a1ff          	cp	a,#255
 218  0037 2402          	jruge	L53
 219                     ; 116 				quantidade_vagas++;
 221  0039 3c02          	inc	_quantidade_vagas
 223  003b               L53:
 224                     ; 124 	if(last_bt_decremento != bt_decremento){
 226  003b b621          	ld	a,_last_bt_decremento
 227  003d b120          	cp	a,_bt_decremento
 228  003f 270d          	jreq	L54
 229                     ; 126 		last_bt_decremento 	= bt_decremento;
 231  0041 452021        	mov	_last_bt_decremento,_bt_decremento
 232                     ; 127 		if(bt_decremento){
 234  0044 3d20          	tnz	_bt_decremento
 235  0046 2706          	jreq	L54
 236                     ; 129 			if (quantidade_vagas > 0){
 238  0048 3d02          	tnz	_quantidade_vagas
 239  004a 2702          	jreq	L54
 240                     ; 130 				quantidade_vagas--;
 242  004c 3a02          	dec	_quantidade_vagas
 244  004e               L54:
 245                     ; 138 }
 248  004e 81            	ret
 274                     ; 141 void incrementa_buzzer (){
 275                     	switch	.text
 276  004f               _incrementa_buzzer:
 280                     ; 142 	buzzer_incremento = TRUE;
 282  004f 35010023      	mov	_buzzer_incremento,#1
 283                     ; 143 	tempo_buzzer_incremento = contador_buzzer;
 285  0053 be10          	ldw	x,_contador_buzzer
 286  0055 bf12          	ldw	_tempo_buzzer_incremento,x
 287                     ; 144 }
 290  0057 81            	ret
 316                     ; 146 void decrementa_buzzer (){
 317                     	switch	.text
 318  0058               _decrementa_buzzer:
 322                     ; 147 	buzzer_decremento = TRUE;
 324  0058 35010024      	mov	_buzzer_decremento,#1
 325                     ; 148 	tempo_buzzer_decremento = contador_buzzer;
 327  005c be10          	ldw	x,_contador_buzzer
 328  005e bf14          	ldw	_tempo_buzzer_decremento,x
 329                     ; 149 }
 332  0060 81            	ret
 363                     ; 151 void sinalizacao_buzzer (){
 364                     	switch	.text
 365  0061               _sinalizacao_buzzer:
 369                     ; 152 	if (buzzer_incremento){
 371  0061 3d23          	tnz	_buzzer_incremento
 372  0063 2722          	jreq	L501
 373                     ; 154 		GPIO_WriteHigh(BUZZER);
 375  0065 4b08          	push	#8
 376  0067 ae5000        	ldw	x,#20480
 377  006a cd0000        	call	_GPIO_WriteHigh
 379  006d 84            	pop	a
 380                     ; 155 		if (contador_buzzer-tempo_buzzer_incremento <= 500){return;}
 382  006e be10          	ldw	x,_contador_buzzer
 383  0070 72b00012      	subw	x,_tempo_buzzer_incremento
 384  0074 a301f5        	cpw	x,#501
 385  0077 2401          	jruge	L701
 389  0079 81            	ret
 390  007a               L701:
 391                     ; 156 		GPIO_WriteLow(BUZZER);
 393  007a 4b08          	push	#8
 394  007c ae5000        	ldw	x,#20480
 395  007f cd0000        	call	_GPIO_WriteLow
 397  0082 84            	pop	a
 398                     ; 157 		buzzer_incremento = FALSE;
 400  0083 3f23          	clr	_buzzer_incremento
 401                     ; 158 		controle_buzzer = 0;
 403  0085 3f03          	clr	_controle_buzzer
 404  0087               L501:
 405                     ; 161 	if (buzzer_decremento){
 407  0087 3d24          	tnz	_buzzer_decremento
 408  0089 2720          	jreq	L111
 409                     ; 163 		GPIO_WriteHigh(BUZZER);
 411  008b 4b08          	push	#8
 412  008d ae5000        	ldw	x,#20480
 413  0090 cd0000        	call	_GPIO_WriteHigh
 415  0093 84            	pop	a
 416                     ; 164 		if (contador_buzzer-tempo_buzzer_decremento <= 100){return;}
 418  0094 be10          	ldw	x,_contador_buzzer
 419  0096 72b00014      	subw	x,_tempo_buzzer_decremento
 420  009a a30065        	cpw	x,#101
 421  009d 2401          	jruge	L311
 425  009f 81            	ret
 426  00a0               L311:
 427                     ; 165 		GPIO_WriteLow(BUZZER);
 429  00a0 4b08          	push	#8
 430  00a2 ae5000        	ldw	x,#20480
 431  00a5 cd0000        	call	_GPIO_WriteLow
 433  00a8 84            	pop	a
 434                     ; 166 		buzzer_decremento = FALSE;
 436  00a9 3f24          	clr	_buzzer_decremento
 437  00ab               L111:
 438                     ; 168 }
 441  00ab 81            	ret
 467                     .const:	section	.text
 468  0000               L02:
 469  0000 00004280      	dc.l	17024
 470                     ; 173 void checa_eeprom(){
 471                     	switch	.text
 472  00ac               _checa_eeprom:
 476                     ; 175 	eeprom = PRIMEIRO_ENDERECO_EEPROM;
 478  00ac ae4000        	ldw	x,#16384
 479  00af bf18          	ldw	_eeprom+2,x
 480  00b1 ae0000        	ldw	x,#0
 481  00b4 bf16          	ldw	_eeprom,x
 483  00b6 2008          	jra	L131
 484  00b8               L521:
 485                     ; 177 		eeprom++;
 487  00b8 ae0016        	ldw	x,#_eeprom
 488  00bb a601          	ld	a,#1
 489  00bd cd0000        	call	c_lgadc
 491  00c0               L131:
 492                     ; 176 	while( (FLASH_ReadByte(eeprom) == 0x00) && (eeprom <= ULTIMO_ENDERECO_EEPROM) ){
 492                     ; 177 		eeprom++;
 494  00c0 be18          	ldw	x,_eeprom+2
 495  00c2 89            	pushw	x
 496  00c3 be16          	ldw	x,_eeprom
 497  00c5 89            	pushw	x
 498  00c6 cd0000        	call	_FLASH_ReadByte
 500  00c9 5b04          	addw	sp,#4
 501  00cb 4d            	tnz	a
 502  00cc 260e          	jrne	L531
 504  00ce ae0016        	ldw	x,#_eeprom
 505  00d1 cd0000        	call	c_ltor
 507  00d4 ae0000        	ldw	x,#L02
 508  00d7 cd0000        	call	c_lcmp
 510  00da 25dc          	jrult	L521
 511  00dc               L531:
 512                     ; 180 	if(eeprom > ULTIMO_ENDERECO_EEPROM ){ // se estourou  e não achou nada, volta pro inicio
 514  00dc ae0016        	ldw	x,#_eeprom
 515  00df cd0000        	call	c_ltor
 517  00e2 ae0000        	ldw	x,#L02
 518  00e5 cd0000        	call	c_lcmp
 520  00e8 251b          	jrult	L731
 521                     ; 182 		eeprom = PRIMEIRO_ENDERECO_EEPROM; 
 523  00ea ae4000        	ldw	x,#16384
 524  00ed bf18          	ldw	_eeprom+2,x
 525  00ef ae0000        	ldw	x,#0
 526  00f2 bf16          	ldw	_eeprom,x
 527                     ; 183 		carros = FLASH_ReadByte(ULTIMO_ENDERECO_EEPROM);
 529  00f4 ae427f        	ldw	x,#17023
 530  00f7 89            	pushw	x
 531  00f8 ae0000        	ldw	x,#0
 532  00fb 89            	pushw	x
 533  00fc cd0000        	call	_FLASH_ReadByte
 535  00ff 5b04          	addw	sp,#4
 536  0101 b701          	ld	_carros,a
 538  0103 201b          	jra	L141
 539  0105               L731:
 540                     ; 186 		carros = FLASH_ReadByte(eeprom++);
 542  0105 ae0016        	ldw	x,#_eeprom
 543  0108 cd0000        	call	c_ltor
 545  010b ae0016        	ldw	x,#_eeprom
 546  010e a601          	ld	a,#1
 547  0110 cd0000        	call	c_lgadc
 549  0113 be02          	ldw	x,c_lreg+2
 550  0115 89            	pushw	x
 551  0116 be00          	ldw	x,c_lreg
 552  0118 89            	pushw	x
 553  0119 cd0000        	call	_FLASH_ReadByte
 555  011c 5b04          	addw	sp,#4
 556  011e b701          	ld	_carros,a
 557  0120               L141:
 558                     ; 188 }
 561  0120 81            	ret
 590                     	switch	.const
 591  0004               L42:
 592  0004 0000427f      	dc.l	17023
 593  0008               L62:
 594  0008 00004001      	dc.l	16385
 595                     ; 190 void grava_eeprom(){
 596                     	switch	.text
 597  0121               _grava_eeprom:
 601                     ; 192 	FLASH_Unlock(FLASH_MEMTYPE_DATA);
 603  0121 a6f7          	ld	a,#247
 604  0123 cd0000        	call	_FLASH_Unlock
 606                     ; 194 	if(eeprom==ULTIMO_ENDERECO_EEPROM){
 608  0126 ae0016        	ldw	x,#_eeprom
 609  0129 cd0000        	call	c_ltor
 611  012c ae0004        	ldw	x,#L42
 612  012f cd0000        	call	c_lcmp
 614  0132 2635          	jrne	L351
 615                     ; 196 		eeprom = PRIMEIRO_ENDERECO_EEPROM;
 617  0134 ae4000        	ldw	x,#16384
 618  0137 bf18          	ldw	_eeprom+2,x
 619  0139 ae0000        	ldw	x,#0
 620  013c bf16          	ldw	_eeprom,x
 621                     ; 197 		FLASH_ProgramByte(eeprom++ , carros);
 623  013e 3b0001        	push	_carros
 624  0141 ae0016        	ldw	x,#_eeprom
 625  0144 cd0000        	call	c_ltor
 627  0147 ae0016        	ldw	x,#_eeprom
 628  014a a601          	ld	a,#1
 629  014c cd0000        	call	c_lgadc
 631  014f be02          	ldw	x,c_lreg+2
 632  0151 89            	pushw	x
 633  0152 be00          	ldw	x,c_lreg
 634  0154 89            	pushw	x
 635  0155 cd0000        	call	_FLASH_ProgramByte
 637  0158 5b05          	addw	sp,#5
 638                     ; 198 		FLASH_EraseByte(ULTIMO_ENDERECO_EEPROM);
 640  015a ae427f        	ldw	x,#17023
 641  015d 89            	pushw	x
 642  015e ae0000        	ldw	x,#0
 643  0161 89            	pushw	x
 644  0162 cd0000        	call	_FLASH_EraseByte
 646  0165 5b04          	addw	sp,#4
 648  0167 2040          	jra	L551
 649  0169               L351:
 650                     ; 202 		FLASH_ProgramByte(eeprom++ , carros);
 652  0169 3b0001        	push	_carros
 653  016c ae0016        	ldw	x,#_eeprom
 654  016f cd0000        	call	c_ltor
 656  0172 ae0016        	ldw	x,#_eeprom
 657  0175 a601          	ld	a,#1
 658  0177 cd0000        	call	c_lgadc
 660  017a be02          	ldw	x,c_lreg+2
 661  017c 89            	pushw	x
 662  017d be00          	ldw	x,c_lreg
 663  017f 89            	pushw	x
 664  0180 cd0000        	call	_FLASH_ProgramByte
 666  0183 5b05          	addw	sp,#5
 667                     ; 204 		if (eeprom != PRIMEIRO_ENDERECO_EEPROM + 1){
 669  0185 ae0016        	ldw	x,#_eeprom
 670  0188 cd0000        	call	c_ltor
 672  018b ae0008        	ldw	x,#L62
 673  018e cd0000        	call	c_lcmp
 675  0191 2716          	jreq	L551
 676                     ; 205 			FLASH_EraseByte(eeprom - 2);
 678  0193 ae0016        	ldw	x,#_eeprom
 679  0196 cd0000        	call	c_ltor
 681  0199 a602          	ld	a,#2
 682  019b cd0000        	call	c_lsbc
 684  019e be02          	ldw	x,c_lreg+2
 685  01a0 89            	pushw	x
 686  01a1 be00          	ldw	x,c_lreg
 687  01a3 89            	pushw	x
 688  01a4 cd0000        	call	_FLASH_EraseByte
 690  01a7 5b04          	addw	sp,#4
 691  01a9               L551:
 692                     ; 209 	FLASH_Lock(FLASH_MEMTYPE_DATA);
 694  01a9 a6f7          	ld	a,#247
 695  01ab cd0000        	call	_FLASH_Lock
 697                     ; 211 }
 700  01ae 81            	ret
 727                     ; 213 void mensagem_inicial_lcd(){
 728                     	switch	.text
 729  01af               _mensagem_inicial_lcd:
 733                     ; 214 	lcd_write_string	 ("  UNIVERSIDADE  ");
 735  01af ae0021        	ldw	x,#L171
 736  01b2 cd0460        	call	_lcd_write_string
 738                     ; 215 	lcd_write(LINE_2, FALSE);
 740  01b5 aec000        	ldw	x,#49152
 741  01b8 cd03fe        	call	_lcd_write
 743                     ; 216 	lcd_write_string	 (" FEDERAL DO ABC ");
 745  01bb ae0010        	ldw	x,#L371
 746  01be cd0460        	call	_lcd_write_string
 748                     ; 217 	lcd_clear();
 750  01c1 cd03f8        	call	_lcd_clear
 752                     ; 218 }
 755  01c4 81            	ret
 786                     ; 220 void contagem_carros(){
 787                     	switch	.text
 788  01c5               _contagem_carros:
 792                     ; 222 	if(last_sensor_entrada != sensor_entrada){
 794  01c5 b61b          	ld	a,_last_sensor_entrada
 795  01c7 b11a          	cp	a,_sensor_entrada
 796  01c9 2715          	jreq	L502
 797                     ; 224 		last_sensor_entrada 	= sensor_entrada;
 799  01cb 451a1b        	mov	_last_sensor_entrada,_sensor_entrada
 800                     ; 225 		if(sensor_entrada){
 802  01ce 3d1a          	tnz	_sensor_entrada
 803  01d0 270e          	jreq	L502
 804                     ; 227 			if (carros < 255){
 806  01d2 b601          	ld	a,_carros
 807  01d4 a1ff          	cp	a,#255
 808  01d6 2405          	jruge	L312
 809                     ; 228 				carros++;
 811  01d8 3c01          	inc	_carros
 812                     ; 229 				incrementa_buzzer();
 814  01da cd004f        	call	_incrementa_buzzer
 817  01dd               L312:
 818                     ; 234 			grava_eeprom();
 820  01dd cd0121        	call	_grava_eeprom
 822  01e0               L502:
 823                     ; 238 	if(last_sensor_saida != sensor_saida){
 825  01e0 b61d          	ld	a,_last_sensor_saida
 826  01e2 b11c          	cp	a,_sensor_saida
 827  01e4 2713          	jreq	L512
 828                     ; 240 		last_sensor_saida 	= sensor_saida;
 830  01e6 451c1d        	mov	_last_sensor_saida,_sensor_saida
 831                     ; 241 		if(sensor_saida){
 833  01e9 3d1c          	tnz	_sensor_saida
 834  01eb 270c          	jreq	L512
 835                     ; 242 			if(carros > 0){
 837  01ed 3d01          	tnz	_carros
 838  01ef 2705          	jreq	L322
 839                     ; 243 				carros--;
 841  01f1 3a01          	dec	_carros
 842                     ; 244 				decrementa_buzzer();
 844  01f3 cd0058        	call	_decrementa_buzzer
 847  01f6               L322:
 848                     ; 249 			grava_eeprom();
 850  01f6 cd0121        	call	_grava_eeprom
 852  01f9               L512:
 853                     ; 253 }
 856  01f9 81            	ret
 890                     ; 266 void checa_entradas (void){
 891                     	switch	.text
 892  01fa               _checa_entradas:
 896                     ; 270 	if(!GPIO_ReadInputPin(SENSOR_ENTRADA)){
 898  01fa 4b10          	push	#16
 899  01fc ae500a        	ldw	x,#20490
 900  01ff cd0000        	call	_GPIO_ReadInputPin
 902  0202 5b01          	addw	sp,#1
 903  0204 4d            	tnz	a
 904  0205 2610          	jrne	L532
 905                     ; 272 		if(contador_debounce_sensor_entrada >= TEMPO_DEBOUNCE_ACIONA){
 907  0207 be06          	ldw	x,_contador_debounce_sensor_entrada
 908  0209 a302bc        	cpw	x,#700
 909  020c 2515          	jrult	L142
 910                     ; 274 			sensor_entrada = TRUE;	
 912  020e 3501001a      	mov	_sensor_entrada,#1
 913                     ; 275 			contador_debounce_sensor_entrada = 0;
 915  0212 5f            	clrw	x
 916  0213 bf06          	ldw	_contador_debounce_sensor_entrada,x
 917  0215 200c          	jra	L142
 918  0217               L532:
 919                     ; 280 		if(contador_debounce_sensor_entrada >= TEMPO_DEBOUNCE_DESACIONA){
 921  0217 be06          	ldw	x,_contador_debounce_sensor_entrada
 922  0219 a30064        	cpw	x,#100
 923  021c 2505          	jrult	L142
 924                     ; 282 			sensor_entrada = FALSE; 
 926  021e 3f1a          	clr	_sensor_entrada
 927                     ; 283 			contador_debounce_sensor_entrada = 0;
 929  0220 5f            	clrw	x
 930  0221 bf06          	ldw	_contador_debounce_sensor_entrada,x
 931  0223               L142:
 932                     ; 290 		if(!GPIO_ReadInputPin(SENSOR_SAIDA)){
 934  0223 4b08          	push	#8
 935  0225 ae500a        	ldw	x,#20490
 936  0228 cd0000        	call	_GPIO_ReadInputPin
 938  022b 5b01          	addw	sp,#1
 939  022d 4d            	tnz	a
 940  022e 2610          	jrne	L542
 941                     ; 292 		if(contador_debounce_sensor_saida >= TEMPO_DEBOUNCE_ACIONA){
 943  0230 be08          	ldw	x,_contador_debounce_sensor_saida
 944  0232 a302bc        	cpw	x,#700
 945  0235 2515          	jrult	L152
 946                     ; 294 			sensor_saida = TRUE;	
 948  0237 3501001c      	mov	_sensor_saida,#1
 949                     ; 295 			contador_debounce_sensor_saida = 0;
 951  023b 5f            	clrw	x
 952  023c bf08          	ldw	_contador_debounce_sensor_saida,x
 953  023e 200c          	jra	L152
 954  0240               L542:
 955                     ; 300 		if(contador_debounce_sensor_saida >= TEMPO_DEBOUNCE_DESACIONA){
 957  0240 be08          	ldw	x,_contador_debounce_sensor_saida
 958  0242 a30064        	cpw	x,#100
 959  0245 2505          	jrult	L152
 960                     ; 302 			sensor_saida = FALSE; 
 962  0247 3f1c          	clr	_sensor_saida
 963                     ; 303 			contador_debounce_sensor_saida = 0;
 965  0249 5f            	clrw	x
 966  024a bf08          	ldw	_contador_debounce_sensor_saida,x
 967  024c               L152:
 968                     ; 310 		if(!GPIO_ReadInputPin(BT_INCREMENTO)){
 970  024c 4b20          	push	#32
 971  024e ae500a        	ldw	x,#20490
 972  0251 cd0000        	call	_GPIO_ReadInputPin
 974  0254 5b01          	addw	sp,#1
 975  0256 4d            	tnz	a
 976  0257 2610          	jrne	L552
 977                     ; 312 		if(contador_debounce_bt_incremento >= TEMPO_DEBOUNCE_BT_INCREMENTO){
 979  0259 be0a          	ldw	x,_contador_debounce_bt_incremento
 980  025b a3001e        	cpw	x,#30
 981  025e 2515          	jrult	L162
 982                     ; 314 			bt_incremento = TRUE;	
 984  0260 3501001e      	mov	_bt_incremento,#1
 985                     ; 315 			contador_debounce_bt_incremento = 0;
 987  0264 5f            	clrw	x
 988  0265 bf0a          	ldw	_contador_debounce_bt_incremento,x
 989  0267 200c          	jra	L162
 990  0269               L552:
 991                     ; 320 		if(contador_debounce_bt_incremento >= TEMPO_DEBOUNCE_BT_INCREMENTO){
 993  0269 be0a          	ldw	x,_contador_debounce_bt_incremento
 994  026b a3001e        	cpw	x,#30
 995  026e 2505          	jrult	L162
 996                     ; 322 			bt_incremento = FALSE; 
 998  0270 3f1e          	clr	_bt_incremento
 999                     ; 323 			contador_debounce_bt_incremento = 0;
1001  0272 5f            	clrw	x
1002  0273 bf0a          	ldw	_contador_debounce_bt_incremento,x
1003  0275               L162:
1004                     ; 331 	if(!GPIO_ReadInputPin(BT_DECREMENTO)){
1006  0275 4b40          	push	#64
1007  0277 ae500a        	ldw	x,#20490
1008  027a cd0000        	call	_GPIO_ReadInputPin
1010  027d 5b01          	addw	sp,#1
1011  027f 4d            	tnz	a
1012  0280 2610          	jrne	L562
1013                     ; 333 		if(contador_debounce_bt_decremento >= TEMPO_DEBOUNCE_BT_DECREMENTO){
1015  0282 be0c          	ldw	x,_contador_debounce_bt_decremento
1016  0284 a3001e        	cpw	x,#30
1017  0287 2515          	jrult	L172
1018                     ; 335 			bt_decremento = TRUE;	
1020  0289 35010020      	mov	_bt_decremento,#1
1021                     ; 336 			contador_debounce_bt_decremento = 0;
1023  028d 5f            	clrw	x
1024  028e bf0c          	ldw	_contador_debounce_bt_decremento,x
1025  0290 200c          	jra	L172
1026  0292               L562:
1027                     ; 341 		if(contador_debounce_bt_decremento >= TEMPO_DEBOUNCE_BT_DECREMENTO){
1029  0292 be0c          	ldw	x,_contador_debounce_bt_decremento
1030  0294 a3001e        	cpw	x,#30
1031  0297 2505          	jrult	L172
1032                     ; 343 			bt_decremento = FALSE; 
1034  0299 3f20          	clr	_bt_decremento
1035                     ; 344 			contador_debounce_bt_decremento = 0;
1037  029b 5f            	clrw	x
1038  029c bf0c          	ldw	_contador_debounce_bt_decremento,x
1039  029e               L172:
1040                     ; 352 		if(!GPIO_ReadInputPin(BT_CONFIRMA)){
1042  029e 4b10          	push	#16
1043  02a0 ae5005        	ldw	x,#20485
1044  02a3 cd0000        	call	_GPIO_ReadInputPin
1046  02a6 5b01          	addw	sp,#1
1047  02a8 4d            	tnz	a
1048  02a9 2610          	jrne	L572
1049                     ; 354 		if(contador_debounce_bt_confirma >= TEMPO_DEBOUNCE_BT_CONFIRMA){
1051  02ab be0e          	ldw	x,_contador_debounce_bt_confirma
1052  02ad a3001e        	cpw	x,#30
1053  02b0 2515          	jrult	L103
1054                     ; 356 			bt_confirma = TRUE;	
1056  02b2 35010022      	mov	_bt_confirma,#1
1057                     ; 357 			contador_debounce_bt_confirma = 0;
1059  02b6 5f            	clrw	x
1060  02b7 bf0e          	ldw	_contador_debounce_bt_confirma,x
1061  02b9 200c          	jra	L103
1062  02bb               L572:
1063                     ; 362 		if(contador_debounce_bt_confirma >= TEMPO_DEBOUNCE_BT_CONFIRMA){
1065  02bb be0e          	ldw	x,_contador_debounce_bt_confirma
1066  02bd a3001e        	cpw	x,#30
1067  02c0 2505          	jrult	L103
1068                     ; 364 			bt_confirma = FALSE; 
1070  02c2 3f22          	clr	_bt_confirma
1071                     ; 365 			contador_debounce_bt_confirma = 0;
1073  02c4 5f            	clrw	x
1074  02c5 bf0e          	ldw	_contador_debounce_bt_confirma,x
1075  02c7               L103:
1076                     ; 370 }
1079  02c7 81            	ret
1103                     ; 379 void ioInit(void){	 
1104                     	switch	.text
1105  02c8               _ioInit:
1109                     ; 381 	GPIO_Init(BT_INCREMENTO,  	GPIO_MODE_IN_PU_NO_IT);
1111  02c8 4b40          	push	#64
1112  02ca 4b20          	push	#32
1113  02cc ae500a        	ldw	x,#20490
1114  02cf cd0000        	call	_GPIO_Init
1116  02d2 85            	popw	x
1117                     ; 382 	GPIO_Init(BT_DECREMENTO,  	GPIO_MODE_IN_PU_NO_IT);
1119  02d3 4b40          	push	#64
1120  02d5 4b40          	push	#64
1121  02d7 ae500a        	ldw	x,#20490
1122  02da cd0000        	call	_GPIO_Init
1124  02dd 85            	popw	x
1125                     ; 383 	GPIO_Init(BT_CONFIRMA,  		GPIO_MODE_IN_PU_NO_IT);
1127  02de 4b40          	push	#64
1128  02e0 4b10          	push	#16
1129  02e2 ae5005        	ldw	x,#20485
1130  02e5 cd0000        	call	_GPIO_Init
1132  02e8 85            	popw	x
1133                     ; 385 	GPIO_Init(SENSOR_SAIDA,  		GPIO_MODE_IN_PU_NO_IT);
1135  02e9 4b40          	push	#64
1136  02eb 4b08          	push	#8
1137  02ed ae500a        	ldw	x,#20490
1138  02f0 cd0000        	call	_GPIO_Init
1140  02f3 85            	popw	x
1141                     ; 386 	GPIO_Init(SENSOR_ENTRADA,		GPIO_MODE_IN_PU_NO_IT);
1143  02f4 4b40          	push	#64
1144  02f6 4b10          	push	#16
1145  02f8 ae500a        	ldw	x,#20490
1146  02fb cd0000        	call	_GPIO_Init
1148  02fe 85            	popw	x
1149                     ; 388 	GPIO_Init(BUZZER,    				GPIO_MODE_OUT_PP_LOW_SLOW);
1151  02ff 4bc0          	push	#192
1152  0301 4b08          	push	#8
1153  0303 ae5000        	ldw	x,#20480
1154  0306 cd0000        	call	_GPIO_Init
1156  0309 85            	popw	x
1157                     ; 390 	GPIO_Init(LCD_E,    				GPIO_MODE_OUT_PP_LOW_SLOW);
1159  030a 4bc0          	push	#192
1160  030c 4b40          	push	#64
1161  030e ae500f        	ldw	x,#20495
1162  0311 cd0000        	call	_GPIO_Init
1164  0314 85            	popw	x
1165                     ; 391 	GPIO_Init(LCD_RS,  				 	GPIO_MODE_OUT_PP_LOW_SLOW);
1167  0315 4bc0          	push	#192
1168  0317 4b80          	push	#128
1169  0319 ae500a        	ldw	x,#20490
1170  031c cd0000        	call	_GPIO_Init
1172  031f 85            	popw	x
1173                     ; 392 	GPIO_Init(LCD_DB4,  				GPIO_MODE_OUT_PP_LOW_SLOW);
1175  0320 4bc0          	push	#192
1176  0322 4b04          	push	#4
1177  0324 ae500f        	ldw	x,#20495
1178  0327 cd0000        	call	_GPIO_Init
1180  032a 85            	popw	x
1181                     ; 393 	GPIO_Init(LCD_DB5,  				GPIO_MODE_OUT_PP_LOW_SLOW);
1183  032b 4bc0          	push	#192
1184  032d 4b08          	push	#8
1185  032f ae500f        	ldw	x,#20495
1186  0332 cd0000        	call	_GPIO_Init
1188  0335 85            	popw	x
1189                     ; 394 	GPIO_Init(LCD_DB6,  				GPIO_MODE_OUT_PP_LOW_SLOW);
1191  0336 4bc0          	push	#192
1192  0338 4b10          	push	#16
1193  033a ae500f        	ldw	x,#20495
1194  033d cd0000        	call	_GPIO_Init
1196  0340 85            	popw	x
1197                     ; 395 	GPIO_Init(LCD_DB7,  				GPIO_MODE_OUT_PP_LOW_SLOW);
1199  0341 4bc0          	push	#192
1200  0343 4b20          	push	#32
1201  0345 ae500f        	ldw	x,#20495
1202  0348 cd0000        	call	_GPIO_Init
1204  034b 85            	popw	x
1205                     ; 396 }
1208  034c 81            	ret
1235                     ; 418 void timerInit(void){
1236                     	switch	.text
1237  034d               _timerInit:
1241                     ; 419 	TIM4_DeInit      ();                       
1243  034d cd0000        	call	_TIM4_DeInit
1245                     ; 420 	TIM4_TimeBaseInit(TIM4_PRESCALER_64, 249); 	
1247  0350 ae06f9        	ldw	x,#1785
1248  0353 cd0000        	call	_TIM4_TimeBaseInit
1250                     ; 421 	TIM4_ITConfig    (TIM4_IT_UPDATE, ENABLE);
1252  0356 ae0101        	ldw	x,#257
1253  0359 cd0000        	call	_TIM4_ITConfig
1255                     ; 422 	TIM4_Cmd         (ENABLE);
1257  035c a601          	ld	a,#1
1258  035e cd0000        	call	_TIM4_Cmd
1260                     ; 423 }
1263  0361 81            	ret
1292                     	switch	.const
1293  000c               L44:
1294  000c 0000c350      	dc.l	50000
1295                     ; 434 void lcdInit(void){
1296                     	switch	.text
1297  0362               _lcdInit:
1301                     ; 435 	GPIO_WriteLow(LCD_RS);
1303  0362 4b80          	push	#128
1304  0364 ae500a        	ldw	x,#20490
1305  0367 cd0000        	call	_GPIO_WriteLow
1307  036a 84            	pop	a
1308                     ; 436 	GPIO_WriteLow(LCD_E);   
1310  036b 4b40          	push	#64
1311  036d ae500f        	ldw	x,#20495
1312  0370 cd0000        	call	_GPIO_WriteLow
1314  0373 84            	pop	a
1315                     ; 438 	for(n = 0; n < 50000; n++){ nop(); }
1317  0374 5f            	clrw	x
1318  0375 bf04          	ldw	_n,x
1319  0377               L533:
1323  0377 9d            nop
1328  0378 be04          	ldw	x,_n
1329  037a 1c0001        	addw	x,#1
1330  037d bf04          	ldw	_n,x
1333  037f 9c            	rvf
1334  0380 be04          	ldw	x,_n
1335  0382 cd0000        	call	c_uitolx
1337  0385 ae000c        	ldw	x,#L44
1338  0388 cd0000        	call	c_lcmp
1340  038b 2fea          	jrslt	L533
1341                     ; 439 	for(n = 0; n < 50000; n++){ nop(); }
1343  038d 5f            	clrw	x
1344  038e bf04          	ldw	_n,x
1345  0390               L343:
1349  0390 9d            nop
1354  0391 be04          	ldw	x,_n
1355  0393 1c0001        	addw	x,#1
1356  0396 bf04          	ldw	_n,x
1359  0398 9c            	rvf
1360  0399 be04          	ldw	x,_n
1361  039b cd0000        	call	c_uitolx
1363  039e ae000c        	ldw	x,#L44
1364  03a1 cd0000        	call	c_lcmp
1366  03a4 2fea          	jrslt	L343
1367                     ; 441 	lcd_write_nibble(0x03, FALSE);	 
1369  03a6 ae0300        	ldw	x,#768
1370  03a9 ad7b          	call	_lcd_write_nibble
1372                     ; 442 	lcd_write_nibble(0x03, FALSE); 
1374  03ab ae0300        	ldw	x,#768
1375  03ae ad76          	call	_lcd_write_nibble
1377                     ; 444 	lcd_write(0x02, FALSE); //set to 4 bit interface, 1 line and 5*7 font
1379  03b0 ae0200        	ldw	x,#512
1380  03b3 ad49          	call	_lcd_write
1382                     ; 445 	lcd_write(0x28, FALSE); //set to 4 bit interface, 2 line and 5*10 font
1384  03b5 ae2800        	ldw	x,#10240
1385  03b8 ad44          	call	_lcd_write
1387                     ; 446 	lcd_write(0x0C, FALSE); //set to 4 bit interface, 2 line and 5*7 font
1389  03ba ae0c00        	ldw	x,#3072
1390  03bd ad3f          	call	_lcd_write
1392                     ; 447 	lcd_write(0x01, FALSE); //clear display
1394  03bf ae0100        	ldw	x,#256
1395  03c2 ad3a          	call	_lcd_write
1397                     ; 448 	lcd_write(0x06, FALSE); //move cursor right after write
1399  03c4 ae0600        	ldw	x,#1536
1400  03c7 ad35          	call	_lcd_write
1402                     ; 449 }
1405  03c9 81            	ret
1440                     ; 460 void lcd_set_line(uint8_t line){
1441                     	switch	.text
1442  03ca               _lcd_set_line:
1446                     ; 462 	switch(line){
1449                     ; 482 		break;
1450  03ca 4a            	dec	a
1451  03cb 2710          	jreq	L153
1452  03cd 4a            	dec	a
1453  03ce 2714          	jreq	L353
1454  03d0 4a            	dec	a
1455  03d1 2718          	jreq	L553
1456  03d3 4a            	dec	a
1457  03d4 271c          	jreq	L753
1458  03d6               L163:
1459                     ; 480 		default:
1459                     ; 481 			lcd_write(LINE_1, FALSE);
1461  03d6 ae8000        	ldw	x,#32768
1462  03d9 ad23          	call	_lcd_write
1464                     ; 482 		break;
1466  03db 201a          	jra	L304
1467  03dd               L153:
1468                     ; 464 		case 1:
1468                     ; 465 			lcd_write(LINE_1, FALSE);
1470  03dd ae8000        	ldw	x,#32768
1471  03e0 ad1c          	call	_lcd_write
1473                     ; 466 		break;
1475  03e2 2013          	jra	L304
1476  03e4               L353:
1477                     ; 468 		case 2:
1477                     ; 469 			lcd_write(LINE_2, FALSE);
1479  03e4 aec000        	ldw	x,#49152
1480  03e7 ad15          	call	_lcd_write
1482                     ; 470 		break;
1484  03e9 200c          	jra	L304
1485  03eb               L553:
1486                     ; 472 		case 3:
1486                     ; 473 			lcd_write(LINE_3, FALSE);
1488  03eb ae9000        	ldw	x,#36864
1489  03ee ad0e          	call	_lcd_write
1491                     ; 474 		break;
1493  03f0 2005          	jra	L304
1494  03f2               L753:
1495                     ; 476 		case 4:
1495                     ; 477 			lcd_write(LINE_4, FALSE);
1497  03f2 aed000        	ldw	x,#53248
1498  03f5 ad07          	call	_lcd_write
1500                     ; 478 		break;
1502  03f7               L304:
1503                     ; 485 }
1506  03f7 81            	ret
1530                     ; 496 void lcd_clear(void){
1531                     	switch	.text
1532  03f8               _lcd_clear:
1536                     ; 498 	lcd_write(0x01, FALSE);
1538  03f8 ae0100        	ldw	x,#256
1539  03fb ad01          	call	_lcd_write
1541                     ; 499 }
1544  03fd 81            	ret
1590                     ; 511 void lcd_write(uint8_t data, uint8_t type){
1591                     	switch	.text
1592  03fe               _lcd_write:
1594  03fe 89            	pushw	x
1595       00000000      OFST:	set	0
1598                     ; 513 	for(n = 0; n < 600; n++){ nop(); }
1600  03ff 5f            	clrw	x
1601  0400 bf04          	ldw	_n,x
1602  0402               L734:
1606  0402 9d            nop
1611  0403 be04          	ldw	x,_n
1612  0405 1c0001        	addw	x,#1
1613  0408 bf04          	ldw	_n,x
1616  040a be04          	ldw	x,_n
1617  040c a30258        	cpw	x,#600
1618  040f 25f1          	jrult	L734
1619                     ; 515 	lcd_write_nibble(data >> 4, type); //WRITE THE UPPER NIBBLE
1621  0411 7b02          	ld	a,(OFST+2,sp)
1622  0413 97            	ld	xl,a
1623  0414 7b01          	ld	a,(OFST+1,sp)
1624  0416 4e            	swap	a
1625  0417 a40f          	and	a,#15
1626  0419 95            	ld	xh,a
1627  041a ad0a          	call	_lcd_write_nibble
1629                     ; 516 	lcd_write_nibble(data,      type); //WRITE THE LOWER NIBBLE
1631  041c 7b02          	ld	a,(OFST+2,sp)
1632  041e 97            	ld	xl,a
1633  041f 7b01          	ld	a,(OFST+1,sp)
1634  0421 95            	ld	xh,a
1635  0422 ad02          	call	_lcd_write_nibble
1637                     ; 517 }
1640  0424 85            	popw	x
1641  0425 81            	ret
1687                     ; 529 void lcd_write_nibble(uint8_t data, uint8_t type){
1688                     	switch	.text
1689  0426               _lcd_write_nibble:
1691  0426 89            	pushw	x
1692       00000000      OFST:	set	0
1695                     ; 531 	GPIO_Write(LCD_PORT, (data << 2) & 0x3C);
1697  0427 9e            	ld	a,xh
1698  0428 48            	sll	a
1699  0429 48            	sll	a
1700  042a a43c          	and	a,#60
1701  042c 88            	push	a
1702  042d ae500f        	ldw	x,#20495
1703  0430 cd0000        	call	_GPIO_Write
1705  0433 84            	pop	a
1706                     ; 533 	if(type == 0){ 
1708  0434 0d02          	tnz	(OFST+2,sp)
1709  0436 260b          	jrne	L764
1710                     ; 535 		GPIO_WriteLow(LCD_RS);
1712  0438 4b80          	push	#128
1713  043a ae500a        	ldw	x,#20490
1714  043d cd0000        	call	_GPIO_WriteLow
1716  0440 84            	pop	a
1718  0441 2009          	jra	L174
1719  0443               L764:
1720                     ; 539 		GPIO_WriteHigh(LCD_RS);
1722  0443 4b80          	push	#128
1723  0445 ae500a        	ldw	x,#20490
1724  0448 cd0000        	call	_GPIO_WriteHigh
1726  044b 84            	pop	a
1727  044c               L174:
1728                     ; 542 	GPIO_WriteHigh(LCD_E);    
1730  044c 4b40          	push	#64
1731  044e ae500f        	ldw	x,#20495
1732  0451 cd0000        	call	_GPIO_WriteHigh
1734  0454 84            	pop	a
1735                     ; 543 	GPIO_WriteLow (LCD_E);
1737  0455 4b40          	push	#64
1738  0457 ae500f        	ldw	x,#20495
1739  045a cd0000        	call	_GPIO_WriteLow
1741  045d 84            	pop	a
1742                     ; 544 }
1745  045e 85            	popw	x
1746  045f 81            	ret
1782                     ; 555 void lcd_write_string(const uint8_t *string){
1783                     	switch	.text
1784  0460               _lcd_write_string:
1786  0460 89            	pushw	x
1787       00000000      OFST:	set	0
1790  0461 2011          	jra	L315
1791  0463               L115:
1792                     ; 559 		lcd_write(*string++, TRUE);
1794  0463 1e01          	ldw	x,(OFST+1,sp)
1795  0465 1c0001        	addw	x,#1
1796  0468 1f01          	ldw	(OFST+1,sp),x
1797  046a 1d0001        	subw	x,#1
1798  046d f6            	ld	a,(x)
1799  046e ae0001        	ldw	x,#1
1800  0471 95            	ld	xh,a
1801  0472 ad8a          	call	_lcd_write
1803  0474               L315:
1804                     ; 557 	while(*string){
1806  0474 1e01          	ldw	x,(OFST+1,sp)
1807  0476 7d            	tnz	(x)
1808  0477 26ea          	jrne	L115
1809                     ; 561 }
1812  0479 85            	popw	x
1813  047a 81            	ret
2092                     	xdef	_main
2093                     	xdef	_mensagem_inicial_lcd
2094                     	xdef	_lcd_write_nibble
2095                     	xdef	_lcd_write
2096                     	xdef	_lcd_set_line
2097                     	xdef	_lcd_write_string
2098                     	xdef	_lcd_clear
2099                     	xdef	_decrementa_buzzer
2100                     	xdef	_incrementa_buzzer
2101                     	xdef	_sinalizacao_buzzer
2102                     	xdef	_grava_eeprom
2103                     	xdef	_checa_eeprom
2104                     	xdef	_contagem_estacionamento
2105                     	xdef	_contagem_carros
2106                     	xdef	_checa_entradas
2107                     	xdef	_lcdInit
2108                     	xdef	_ioInit
2109                     	xdef	_timerInit
2110                     	xdef	_buzzer_decremento
2111                     	xdef	_buzzer_incremento
2112                     	xdef	_bt_confirma
2113                     	xdef	_last_bt_decremento
2114                     	xdef	_bt_decremento
2115                     	xdef	_last_bt_incremento
2116                     	xdef	_bt_incremento
2117                     	xdef	_last_sensor_saida
2118                     	xdef	_sensor_saida
2119                     	xdef	_last_sensor_entrada
2120                     	xdef	_sensor_entrada
2121                     	xdef	_eeprom
2122                     	xdef	_tempo_buzzer_decremento
2123                     	xdef	_tempo_buzzer_incremento
2124                     	xdef	_contador_buzzer
2125                     	xdef	_contador_debounce_bt_confirma
2126                     	xdef	_contador_debounce_bt_decremento
2127                     	xdef	_contador_debounce_bt_incremento
2128                     	xdef	_contador_debounce_sensor_saida
2129                     	xdef	_contador_debounce_sensor_entrada
2130                     	xdef	_n
2131                     	xdef	_controle_buzzer
2132                     	xdef	_quantidade_vagas
2133                     	xdef	_carros
2134                     	xdef	_controle
2135                     	xref	_FLASH_ReadByte
2136                     	xref	_FLASH_ProgramByte
2137                     	xref	_FLASH_EraseByte
2138                     	xref	_FLASH_DeInit
2139                     	xref	_FLASH_Lock
2140                     	xref	_FLASH_Unlock
2141                     	xref	_TIM4_ITConfig
2142                     	xref	_TIM4_Cmd
2143                     	xref	_TIM4_TimeBaseInit
2144                     	xref	_TIM4_DeInit
2145                     	xref	_GPIO_ReadInputPin
2146                     	xref	_GPIO_WriteLow
2147                     	xref	_GPIO_WriteHigh
2148                     	xref	_GPIO_Write
2149                     	xref	_GPIO_Init
2150                     	switch	.const
2151  0010               L371:
2152  0010 204645444552  	dc.b	" FEDERAL DO ABC ",0
2153  0021               L171:
2154  0021 2020554e4956  	dc.b	"  UNIVERSIDADE  ",0
2155                     	xref.b	c_lreg
2175                     	xref	c_uitolx
2176                     	xref	c_lsbc
2177                     	xref	c_lcmp
2178                     	xref	c_ltor
2179                     	xref	c_lgadc
2180                     	end
