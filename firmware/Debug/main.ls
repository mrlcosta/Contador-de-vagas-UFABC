   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.12 - 20 Jun 2018
   3                     ; Generator (Limited) V4.4.8 - 20 Jun 2018
  14                     	bsct
  15  0000               _controle:
  16  0000 00            	dc.b	0
  17  0001               _carros:
  18  0001 01            	dc.b	1
  19  0002               _quantidade_vagas:
  20  0002 01            	dc.b	1
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
  46  0019 00004000      	dc.l	16384
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
 119                     ; 95 main(){
 121                     	switch	.text
 122  0000               _main:
 126                     ; 96 	CLK->CKDIVR = 0; 
 128  0000 725f50c6      	clr	20678
 129                     ; 97 	ioInit();
 131  0004 cd0479        	call	_ioInit
 133                     ; 98 	timerInit();
 135  0007 cd0514        	call	_timerInit
 137                     ; 99 	FLASH_DeInit();
 139  000a cd0000        	call	_FLASH_DeInit
 141                     ; 100 	enableInterrupts();
 144  000d 9a            rim
 146                     ; 101 	lcdInit();
 149  000e cd0529        	call	_lcdInit
 151                     ; 102 	lcd_clear();
 153  0011 cd05bf        	call	_lcd_clear
 155                     ; 103 	mensagem_inicial_lcd();
 157  0014 cd0359        	call	_mensagem_inicial_lcd
 159                     ; 104 	checa_eeprom();
 161  0017 cd01f0        	call	_checa_eeprom
 163                     ; 105 	delay(2500);
 165  001a ae09c4        	ldw	x,#2500
 166  001d cd0103        	call	_delay
 168                     ; 106 	lcd_clear();
 170  0020 cd05bf        	call	_lcd_clear
 172  0023               L12:
 173                     ; 109 		checa_entradas();
 175  0023 cd03ab        	call	_checa_entradas
 177                     ; 110 		contagem_carros();
 179  0026 cd0372        	call	_contagem_carros
 181                     ; 111 		contagem_estacionamento();
 183  0029 cd0118        	call	_contagem_estacionamento
 185                     ; 112 		sinalizacao_buzzer();
 187  002c cd01a5        	call	_sinalizacao_buzzer
 189                     ; 113 		atualiza_display_carros();
 191  002f ad34          	call	_atualiza_display_carros
 193                     ; 114 		atualiza_display_vagas();
 195  0031 cd00b4        	call	_atualiza_display_vagas
 197                     ; 115 		sinaliza_semaforo();
 199  0034 ad02          	call	_sinaliza_semaforo
 202  0036 20eb          	jra	L12
 229                     ; 119 void sinaliza_semaforo(){
 230                     	switch	.text
 231  0038               _sinaliza_semaforo:
 235                     ; 121 	if(carros<quantidade_vagas){
 237  0038 b601          	ld	a,_carros
 238  003a b102          	cp	a,_quantidade_vagas
 239  003c 2414          	jruge	L53
 240                     ; 122 		GPIO_WriteHigh(SINAL_VERDE);
 242  003e 4b04          	push	#4
 243  0040 ae5000        	ldw	x,#20480
 244  0043 cd0000        	call	_GPIO_WriteHigh
 246  0046 84            	pop	a
 247                     ; 123 		GPIO_WriteLow(SINAL_VERMELHO);
 249  0047 4b02          	push	#2
 250  0049 ae5000        	ldw	x,#20480
 251  004c cd0000        	call	_GPIO_WriteLow
 253  004f 84            	pop	a
 255  0050 2012          	jra	L73
 256  0052               L53:
 257                     ; 125 		GPIO_WriteLow(SINAL_VERDE);
 259  0052 4b04          	push	#4
 260  0054 ae5000        	ldw	x,#20480
 261  0057 cd0000        	call	_GPIO_WriteLow
 263  005a 84            	pop	a
 264                     ; 126 		GPIO_WriteHigh(SINAL_VERMELHO);
 266  005b 4b02          	push	#2
 267  005d ae5000        	ldw	x,#20480
 268  0060 cd0000        	call	_GPIO_WriteHigh
 270  0063 84            	pop	a
 271  0064               L73:
 272                     ; 129 }
 275  0064 81            	ret
 306                     ; 140 void atualiza_display_carros(void){
 307                     	switch	.text
 308  0065               _atualiza_display_carros:
 312                     ; 142 	if(display_carros_atualizado){return;}
 314  0065 3d27          	tnz	_display_carros_atualizado
 315  0067 2701          	jreq	L15
 319  0069 81            	ret
 320  006a               L15:
 321                     ; 144 	sprintf(buf_carros, "%03d", (int) carros-1 );
 323  006a b601          	ld	a,_carros
 324  006c 5f            	clrw	x
 325  006d 97            	ld	xl,a
 326  006e 5a            	decw	x
 327  006f 89            	pushw	x
 328  0070 ae004d        	ldw	x,#L35
 329  0073 89            	pushw	x
 330  0074 ae0003        	ldw	x,#_buf_carros
 331  0077 cd0000        	call	_sprintf
 333  007a 5b04          	addw	sp,#4
 334                     ; 145 	lcd_write(LINE_1, FALSE);
 336  007c ae8000        	ldw	x,#32768
 337  007f cd05c5        	call	_lcd_write
 339                     ; 146 	lcd_write_string	 ("CARROS: ");
 341  0082 ae0044        	ldw	x,#L55
 342  0085 cd0627        	call	_lcd_write_string
 344                     ; 147 	lcd_write(buf_carros[0],TRUE);
 346  0088 b603          	ld	a,_buf_carros
 347  008a ae0001        	ldw	x,#1
 348  008d 95            	ld	xh,a
 349  008e cd05c5        	call	_lcd_write
 351                     ; 148 	lcd_write(buf_carros[1],TRUE);
 353  0091 b604          	ld	a,_buf_carros+1
 354  0093 ae0001        	ldw	x,#1
 355  0096 95            	ld	xh,a
 356  0097 cd05c5        	call	_lcd_write
 358                     ; 149 	lcd_write(buf_carros[2],TRUE);
 360  009a b605          	ld	a,_buf_carros+2
 361  009c ae0001        	ldw	x,#1
 362  009f 95            	ld	xh,a
 363  00a0 cd05c5        	call	_lcd_write
 365                     ; 150 	if (modo_operacao == CARROS){
 367  00a3 b604          	ld	a,_modo_operacao
 368  00a5 a102          	cp	a,#2
 369  00a7 2606          	jrne	L75
 370                     ; 151 		lcd_write_string	 (" <--");
 372  00a9 ae003f        	ldw	x,#L16
 373  00ac cd0627        	call	_lcd_write_string
 375  00af               L75:
 376                     ; 153 	display_carros_atualizado = TRUE;
 378  00af 35010027      	mov	_display_carros_atualizado,#1
 379                     ; 154 }
 382  00b3 81            	ret
 413                     ; 163 void atualiza_display_vagas(void){
 414                     	switch	.text
 415  00b4               _atualiza_display_vagas:
 419                     ; 165 	if(display_vagas_atualizado){return;}
 421  00b4 3d28          	tnz	_display_vagas_atualizado
 422  00b6 2701          	jreq	L37
 426  00b8 81            	ret
 427  00b9               L37:
 428                     ; 167 	sprintf(buf_vagas, "%03d", (int) quantidade_vagas-1 );
 430  00b9 b602          	ld	a,_quantidade_vagas
 431  00bb 5f            	clrw	x
 432  00bc 97            	ld	xl,a
 433  00bd 5a            	decw	x
 434  00be 89            	pushw	x
 435  00bf ae004d        	ldw	x,#L35
 436  00c2 89            	pushw	x
 437  00c3 ae0000        	ldw	x,#_buf_vagas
 438  00c6 cd0000        	call	_sprintf
 440  00c9 5b04          	addw	sp,#4
 441                     ; 168 	lcd_write(LINE_2, FALSE);
 443  00cb aec000        	ldw	x,#49152
 444  00ce cd05c5        	call	_lcd_write
 446                     ; 169 	lcd_write_string	 ("VAGAS : ");
 448  00d1 ae0036        	ldw	x,#L57
 449  00d4 cd0627        	call	_lcd_write_string
 451                     ; 170 	lcd_write(buf_vagas[0],TRUE);
 453  00d7 b600          	ld	a,_buf_vagas
 454  00d9 ae0001        	ldw	x,#1
 455  00dc 95            	ld	xh,a
 456  00dd cd05c5        	call	_lcd_write
 458                     ; 171 	lcd_write(buf_vagas[1],TRUE);
 460  00e0 b601          	ld	a,_buf_vagas+1
 461  00e2 ae0001        	ldw	x,#1
 462  00e5 95            	ld	xh,a
 463  00e6 cd05c5        	call	_lcd_write
 465                     ; 172 	lcd_write(buf_vagas[2],TRUE);
 467  00e9 b602          	ld	a,_buf_vagas+2
 468  00eb ae0001        	ldw	x,#1
 469  00ee 95            	ld	xh,a
 470  00ef cd05c5        	call	_lcd_write
 472                     ; 174 	if (modo_operacao == VAGAS){
 474  00f2 b604          	ld	a,_modo_operacao
 475  00f4 a101          	cp	a,#1
 476  00f6 2606          	jrne	L77
 477                     ; 175 		lcd_write_string	 (" <--");
 479  00f8 ae003f        	ldw	x,#L16
 480  00fb cd0627        	call	_lcd_write_string
 482  00fe               L77:
 483                     ; 178 	display_vagas_atualizado = TRUE;
 485  00fe 35010028      	mov	_display_vagas_atualizado,#1
 486                     ; 179 }
 489  0102 81            	ret
 534                     ; 189 void delay(int delay){
 535                     	switch	.text
 536  0103               _delay:
 538  0103 89            	pushw	x
 539  0104 89            	pushw	x
 540       00000002      OFST:	set	2
 543                     ; 190 	uint16_t tempo_atual_delay = contador_delay;
 545  0105 be11          	ldw	x,_contador_delay
 546  0107 1f01          	ldw	(OFST-1,sp),x
 549  0109 2001          	jra	L721
 550  010b               L321:
 551                     ; 191 	while(tempo_atual_delay + delay >= contador_delay){nop();}
 554  010b 9d            nop
 557  010c               L721:
 560  010c 1e03          	ldw	x,(OFST+1,sp)
 561  010e 72fb01        	addw	x,(OFST-1,sp)
 562  0111 b311          	cpw	x,_contador_delay
 563  0113 24f6          	jruge	L321
 564                     ; 192 }
 567  0115 5b04          	addw	sp,#4
 568  0117 81            	ret
 605                     ; 201 void contagem_estacionamento(){
 606                     	switch	.text
 607  0118               _contagem_estacionamento:
 611                     ; 203 	if(last_bt_confirma != bt_confirma){
 613  0118 b626          	ld	a,_last_bt_confirma
 614  011a b125          	cp	a,_bt_confirma
 615  011c 271d          	jreq	L341
 616                     ; 204 		last_bt_confirma 	= bt_confirma;
 618  011e 452526        	mov	_last_bt_confirma,_bt_confirma
 619                     ; 205 		if(bt_confirma){
 621  0121 3d25          	tnz	_bt_confirma
 622  0123 2716          	jreq	L341
 623                     ; 206 			display_vagas_atualizado = FALSE;
 625  0125 3f28          	clr	_display_vagas_atualizado
 626                     ; 207 			display_carros_atualizado = FALSE;
 628  0127 3f27          	clr	_display_carros_atualizado
 629                     ; 208 			lcd_clear();
 631  0129 cd05bf        	call	_lcd_clear
 633                     ; 209 			grava_eeprom();
 635  012c cd0281        	call	_grava_eeprom
 637                     ; 210 			if(modo_operacao < 2){
 639  012f b604          	ld	a,_modo_operacao
 640  0131 a102          	cp	a,#2
 641  0133 2404          	jruge	L741
 642                     ; 211 				modo_operacao++;
 644  0135 3c04          	inc	_modo_operacao
 646  0137 2002          	jra	L341
 647  0139               L741:
 648                     ; 213 				modo_operacao = 0;
 650  0139 3f04          	clr	_modo_operacao
 651  013b               L341:
 652                     ; 218 	if(	modo_operacao == TRAVA){return;}
 654  013b 3d04          	tnz	_modo_operacao
 655  013d 2601          	jrne	L351
 659  013f 81            	ret
 660  0140               L351:
 661                     ; 220 	if(last_bt_incremento != bt_incremento){
 663  0140 b622          	ld	a,_last_bt_incremento
 664  0142 b121          	cp	a,_bt_incremento
 665  0144 2723          	jreq	L551
 666                     ; 222 		last_bt_incremento 	= bt_incremento;
 668  0146 452122        	mov	_last_bt_incremento,_bt_incremento
 669                     ; 223 		if(bt_incremento){
 671  0149 3d21          	tnz	_bt_incremento
 672  014b 271c          	jreq	L551
 673                     ; 224 			if (modo_operacao == VAGAS){
 675  014d b604          	ld	a,_modo_operacao
 676  014f a101          	cp	a,#1
 677  0151 260c          	jrne	L161
 678                     ; 225 				if (quantidade_vagas < 253){
 680  0153 b602          	ld	a,_quantidade_vagas
 681  0155 a1fd          	cp	a,#253
 682  0157 2410          	jruge	L551
 683                     ; 226 					quantidade_vagas++;
 685  0159 3c02          	inc	_quantidade_vagas
 686                     ; 227 					display_vagas_atualizado = FALSE;
 688  015b 3f28          	clr	_display_vagas_atualizado
 689  015d 200a          	jra	L551
 690  015f               L161:
 691                     ; 230 				if (carros < 253){
 693  015f b601          	ld	a,_carros
 694  0161 a1fd          	cp	a,#253
 695  0163 2404          	jruge	L551
 696                     ; 231 					carros++;
 698  0165 3c01          	inc	_carros
 699                     ; 232 					display_carros_atualizado = FALSE;
 701  0167 3f27          	clr	_display_carros_atualizado
 702  0169               L551:
 703                     ; 239 	if(last_bt_decremento != bt_decremento){
 705  0169 b624          	ld	a,_last_bt_decremento
 706  016b b123          	cp	a,_bt_decremento
 707  016d 2723          	jreq	L171
 708                     ; 241 		last_bt_decremento 	= bt_decremento;
 710  016f 452324        	mov	_last_bt_decremento,_bt_decremento
 711                     ; 242 		if(bt_decremento){
 713  0172 3d23          	tnz	_bt_decremento
 714  0174 271c          	jreq	L171
 715                     ; 243 			if (modo_operacao == VAGAS){
 717  0176 b604          	ld	a,_modo_operacao
 718  0178 a101          	cp	a,#1
 719  017a 260c          	jrne	L571
 720                     ; 244 				if (quantidade_vagas > 1){
 722  017c b602          	ld	a,_quantidade_vagas
 723  017e a102          	cp	a,#2
 724  0180 2510          	jrult	L171
 725                     ; 245 					quantidade_vagas--;
 727  0182 3a02          	dec	_quantidade_vagas
 728                     ; 246 					display_vagas_atualizado = FALSE;
 730  0184 3f28          	clr	_display_vagas_atualizado
 731  0186 200a          	jra	L171
 732  0188               L571:
 733                     ; 249 				if (carros > 1){
 735  0188 b601          	ld	a,_carros
 736  018a a102          	cp	a,#2
 737  018c 2504          	jrult	L171
 738                     ; 250 					carros--;
 740  018e 3a01          	dec	_carros
 741                     ; 251 					display_carros_atualizado = FALSE;
 743  0190 3f27          	clr	_display_carros_atualizado
 744  0192               L171:
 745                     ; 258 }
 748  0192 81            	ret
 774                     ; 268 void incrementa_buzzer (){
 775                     	switch	.text
 776  0193               _incrementa_buzzer:
 780                     ; 269 	buzzer_incremento = TRUE;
 782  0193 35010029      	mov	_buzzer_incremento,#1
 783                     ; 270 	tempo_buzzer_incremento = contador_buzzer;
 785  0197 be13          	ldw	x,_contador_buzzer
 786  0199 bf15          	ldw	_tempo_buzzer_incremento,x
 787                     ; 271 }
 790  019b 81            	ret
 816                     ; 281 void decrementa_buzzer (){
 817                     	switch	.text
 818  019c               _decrementa_buzzer:
 822                     ; 282 	buzzer_decremento = TRUE;
 824  019c 3501002a      	mov	_buzzer_decremento,#1
 825                     ; 283 	tempo_buzzer_decremento = contador_buzzer;
 827  01a0 be13          	ldw	x,_contador_buzzer
 828  01a2 bf17          	ldw	_tempo_buzzer_decremento,x
 829                     ; 284 }
 832  01a4 81            	ret
 863                     ; 294 void sinalizacao_buzzer (){
 864                     	switch	.text
 865  01a5               _sinalizacao_buzzer:
 869                     ; 295 	if (buzzer_incremento){
 871  01a5 3d29          	tnz	_buzzer_incremento
 872  01a7 2722          	jreq	L532
 873                     ; 297 		GPIO_WriteHigh(BUZZER);
 875  01a9 4b08          	push	#8
 876  01ab ae5000        	ldw	x,#20480
 877  01ae cd0000        	call	_GPIO_WriteHigh
 879  01b1 84            	pop	a
 880                     ; 298 		if (contador_buzzer-tempo_buzzer_incremento <= TEMPO_BUZZER_INCREMENTO){return;}
 882  01b2 be13          	ldw	x,_contador_buzzer
 883  01b4 72b00015      	subw	x,_tempo_buzzer_incremento
 884  01b8 a301f5        	cpw	x,#501
 885  01bb 2401          	jruge	L732
 889  01bd 81            	ret
 890  01be               L732:
 891                     ; 299 		GPIO_WriteLow(BUZZER);
 893  01be 4b08          	push	#8
 894  01c0 ae5000        	ldw	x,#20480
 895  01c3 cd0000        	call	_GPIO_WriteLow
 897  01c6 84            	pop	a
 898                     ; 300 		buzzer_incremento = FALSE;
 900  01c7 3f29          	clr	_buzzer_incremento
 901                     ; 301 		controle_buzzer = 0;
 903  01c9 3f03          	clr	_controle_buzzer
 904  01cb               L532:
 905                     ; 304 	if (buzzer_decremento){
 907  01cb 3d2a          	tnz	_buzzer_decremento
 908  01cd 2720          	jreq	L142
 909                     ; 306 		GPIO_WriteHigh(BUZZER);
 911  01cf 4b08          	push	#8
 912  01d1 ae5000        	ldw	x,#20480
 913  01d4 cd0000        	call	_GPIO_WriteHigh
 915  01d7 84            	pop	a
 916                     ; 307 		if (contador_buzzer-tempo_buzzer_decremento <= TEMPO_BUZZER_DECREMENTO){return;}
 918  01d8 be13          	ldw	x,_contador_buzzer
 919  01da 72b00017      	subw	x,_tempo_buzzer_decremento
 920  01de a30065        	cpw	x,#101
 921  01e1 2401          	jruge	L342
 925  01e3 81            	ret
 926  01e4               L342:
 927                     ; 308 		GPIO_WriteLow(BUZZER);
 929  01e4 4b08          	push	#8
 930  01e6 ae5000        	ldw	x,#20480
 931  01e9 cd0000        	call	_GPIO_WriteLow
 933  01ec 84            	pop	a
 934                     ; 309 		buzzer_decremento = FALSE;
 936  01ed 3f2a          	clr	_buzzer_decremento
 937  01ef               L142:
 938                     ; 311 }
 941  01ef 81            	ret
 968                     .const:	section	.text
 969  0000               L03:
 970  0000 00004280      	dc.l	17024
 971  0004               L23:
 972  0004 0000427f      	dc.l	17023
 973                     ; 321 void checa_eeprom(){
 974                     	switch	.text
 975  01f0               _checa_eeprom:
 979                     ; 323 	eeprom = PRIMEIRO_ENDERECO_EEPROM;
 981  01f0 ae4000        	ldw	x,#16384
 982  01f3 bf1b          	ldw	_eeprom+2,x
 983  01f5 ae0000        	ldw	x,#0
 984  01f8 bf19          	ldw	_eeprom,x
 986  01fa 2008          	jra	L162
 987  01fc               L552:
 988                     ; 325 		eeprom++;
 990  01fc ae0019        	ldw	x,#_eeprom
 991  01ff a601          	ld	a,#1
 992  0201 cd0000        	call	c_lgadc
 994  0204               L162:
 995                     ; 324 	while( (FLASH_ReadByte(eeprom) == 0x00) && (eeprom <= ULTIMO_ENDERECO_EEPROM) ){
 995                     ; 325 		eeprom++;
 997  0204 be1b          	ldw	x,_eeprom+2
 998  0206 89            	pushw	x
 999  0207 be19          	ldw	x,_eeprom
1000  0209 89            	pushw	x
1001  020a cd0000        	call	_FLASH_ReadByte
1003  020d 5b04          	addw	sp,#4
1004  020f 4d            	tnz	a
1005  0210 260e          	jrne	L562
1007  0212 ae0019        	ldw	x,#_eeprom
1008  0215 cd0000        	call	c_ltor
1010  0218 ae0000        	ldw	x,#L03
1011  021b cd0000        	call	c_lcmp
1013  021e 25dc          	jrult	L552
1014  0220               L562:
1015                     ; 328 	if(eeprom >= ULTIMO_ENDERECO_EEPROM ){ // se estourou  e não achou nada, volta pro inicio
1017  0220 ae0019        	ldw	x,#_eeprom
1018  0223 cd0000        	call	c_ltor
1020  0226 ae0004        	ldw	x,#L23
1021  0229 cd0000        	call	c_lcmp
1023  022c 2530          	jrult	L762
1024                     ; 329 		eeprom = PRIMEIRO_ENDERECO_EEPROM; 
1026  022e ae4000        	ldw	x,#16384
1027  0231 bf1b          	ldw	_eeprom+2,x
1028  0233 ae0000        	ldw	x,#0
1029  0236 bf19          	ldw	_eeprom,x
1030                     ; 330 		carros = FLASH_ReadByte(eeprom);
1032  0238 ae4000        	ldw	x,#16384
1033  023b 89            	pushw	x
1034  023c ae0000        	ldw	x,#0
1035  023f 89            	pushw	x
1036  0240 cd0000        	call	_FLASH_ReadByte
1038  0243 5b04          	addw	sp,#4
1039  0245 b701          	ld	_carros,a
1040                     ; 331 		quantidade_vagas = FLASH_ReadByte(++eeprom);
1042  0247 ae0019        	ldw	x,#_eeprom
1043  024a a601          	ld	a,#1
1044  024c cd0000        	call	c_lgadc
1046  024f be1b          	ldw	x,_eeprom+2
1047  0251 89            	pushw	x
1048  0252 be19          	ldw	x,_eeprom
1049  0254 89            	pushw	x
1050  0255 cd0000        	call	_FLASH_ReadByte
1052  0258 5b04          	addw	sp,#4
1053  025a b702          	ld	_quantidade_vagas,a
1055  025c 2022          	jra	L172
1056  025e               L762:
1057                     ; 333 		carros = FLASH_ReadByte(eeprom);
1059  025e be1b          	ldw	x,_eeprom+2
1060  0260 89            	pushw	x
1061  0261 be19          	ldw	x,_eeprom
1062  0263 89            	pushw	x
1063  0264 cd0000        	call	_FLASH_ReadByte
1065  0267 5b04          	addw	sp,#4
1066  0269 b701          	ld	_carros,a
1067                     ; 334 		quantidade_vagas = FLASH_ReadByte(++eeprom);
1069  026b ae0019        	ldw	x,#_eeprom
1070  026e a601          	ld	a,#1
1071  0270 cd0000        	call	c_lgadc
1073  0273 be1b          	ldw	x,_eeprom+2
1074  0275 89            	pushw	x
1075  0276 be19          	ldw	x,_eeprom
1076  0278 89            	pushw	x
1077  0279 cd0000        	call	_FLASH_ReadByte
1079  027c 5b04          	addw	sp,#4
1080  027e b702          	ld	_quantidade_vagas,a
1081  0280               L172:
1082                     ; 337 }
1085  0280 81            	ret
1115                     	switch	.const
1116  0008               L63:
1117  0008 0000427e      	dc.l	17022
1118  000c               L04:
1119  000c 00004003      	dc.l	16387
1120                     ; 346 void grava_eeprom(){
1121                     	switch	.text
1122  0281               _grava_eeprom:
1126                     ; 348 	FLASH_Unlock(FLASH_MEMTYPE_DATA);
1128  0281 a6f7          	ld	a,#247
1129  0283 cd0000        	call	_FLASH_Unlock
1131                     ; 349 	if(eeprom>=ULTIMO_ENDERECO_EEPROM-1){
1133  0286 ae0019        	ldw	x,#_eeprom
1134  0289 cd0000        	call	c_ltor
1136  028c ae0008        	ldw	x,#L63
1137  028f cd0000        	call	c_lcmp
1139  0292 2559          	jrult	L303
1140                     ; 351 		eeprom = PRIMEIRO_ENDERECO_EEPROM;
1142  0294 ae4000        	ldw	x,#16384
1143  0297 bf1b          	ldw	_eeprom+2,x
1144  0299 ae0000        	ldw	x,#0
1145  029c bf19          	ldw	_eeprom,x
1146                     ; 352 		FLASH_ProgramByte(eeprom, carros);
1148  029e 3b0001        	push	_carros
1149  02a1 ae4000        	ldw	x,#16384
1150  02a4 89            	pushw	x
1151  02a5 ae0000        	ldw	x,#0
1152  02a8 89            	pushw	x
1153  02a9 cd0000        	call	_FLASH_ProgramByte
1155  02ac 5b05          	addw	sp,#5
1156                     ; 353 		FLASH_ProgramByte(++eeprom , quantidade_vagas);
1158  02ae 3b0002        	push	_quantidade_vagas
1159  02b1 ae0019        	ldw	x,#_eeprom
1160  02b4 a601          	ld	a,#1
1161  02b6 cd0000        	call	c_lgadc
1163  02b9 be1b          	ldw	x,_eeprom+2
1164  02bb 89            	pushw	x
1165  02bc be19          	ldw	x,_eeprom
1166  02be 89            	pushw	x
1167  02bf cd0000        	call	_FLASH_ProgramByte
1169  02c2 5b05          	addw	sp,#5
1170                     ; 354 		FLASH_EraseByte(ULTIMO_ENDERECO_EEPROM);
1172  02c4 ae427f        	ldw	x,#17023
1173  02c7 89            	pushw	x
1174  02c8 ae0000        	ldw	x,#0
1175  02cb 89            	pushw	x
1176  02cc cd0000        	call	_FLASH_EraseByte
1178  02cf 5b04          	addw	sp,#4
1179                     ; 355 		FLASH_EraseByte(ULTIMO_ENDERECO_EEPROM-1);
1181  02d1 ae427e        	ldw	x,#17022
1182  02d4 89            	pushw	x
1183  02d5 ae0000        	ldw	x,#0
1184  02d8 89            	pushw	x
1185  02d9 cd0000        	call	_FLASH_EraseByte
1187  02dc 5b04          	addw	sp,#4
1188                     ; 356 		FLASH_EraseByte(ULTIMO_ENDERECO_EEPROM-2);
1190  02de ae427d        	ldw	x,#17021
1191  02e1 89            	pushw	x
1192  02e2 ae0000        	ldw	x,#0
1193  02e5 89            	pushw	x
1194  02e6 cd0000        	call	_FLASH_EraseByte
1196  02e9 5b04          	addw	sp,#4
1198  02eb 2066          	jra	L503
1199  02ed               L303:
1200                     ; 360 		FLASH_ProgramByte(++eeprom, carros);
1202  02ed 3b0001        	push	_carros
1203  02f0 ae0019        	ldw	x,#_eeprom
1204  02f3 a601          	ld	a,#1
1205  02f5 cd0000        	call	c_lgadc
1207  02f8 be1b          	ldw	x,_eeprom+2
1208  02fa 89            	pushw	x
1209  02fb be19          	ldw	x,_eeprom
1210  02fd 89            	pushw	x
1211  02fe cd0000        	call	_FLASH_ProgramByte
1213  0301 5b05          	addw	sp,#5
1214                     ; 361 		FLASH_ProgramByte(++eeprom , quantidade_vagas);
1216  0303 3b0002        	push	_quantidade_vagas
1217  0306 ae0019        	ldw	x,#_eeprom
1218  0309 a601          	ld	a,#1
1219  030b cd0000        	call	c_lgadc
1221  030e be1b          	ldw	x,_eeprom+2
1222  0310 89            	pushw	x
1223  0311 be19          	ldw	x,_eeprom
1224  0313 89            	pushw	x
1225  0314 cd0000        	call	_FLASH_ProgramByte
1227  0317 5b05          	addw	sp,#5
1228                     ; 363 		if (eeprom >= PRIMEIRO_ENDERECO_EEPROM + 3){
1230  0319 ae0019        	ldw	x,#_eeprom
1231  031c cd0000        	call	c_ltor
1233  031f ae000c        	ldw	x,#L04
1234  0322 cd0000        	call	c_lcmp
1236  0325 252c          	jrult	L503
1237                     ; 364 			FLASH_EraseByte(eeprom - 2);
1239  0327 ae0019        	ldw	x,#_eeprom
1240  032a cd0000        	call	c_ltor
1242  032d a602          	ld	a,#2
1243  032f cd0000        	call	c_lsbc
1245  0332 be02          	ldw	x,c_lreg+2
1246  0334 89            	pushw	x
1247  0335 be00          	ldw	x,c_lreg
1248  0337 89            	pushw	x
1249  0338 cd0000        	call	_FLASH_EraseByte
1251  033b 5b04          	addw	sp,#4
1252                     ; 365 			FLASH_EraseByte(eeprom - 3);
1254  033d ae0019        	ldw	x,#_eeprom
1255  0340 cd0000        	call	c_ltor
1257  0343 a603          	ld	a,#3
1258  0345 cd0000        	call	c_lsbc
1260  0348 be02          	ldw	x,c_lreg+2
1261  034a 89            	pushw	x
1262  034b be00          	ldw	x,c_lreg
1263  034d 89            	pushw	x
1264  034e cd0000        	call	_FLASH_EraseByte
1266  0351 5b04          	addw	sp,#4
1267  0353               L503:
1268                     ; 369 	FLASH_Lock(FLASH_MEMTYPE_DATA);
1270  0353 a6f7          	ld	a,#247
1271  0355 cd0000        	call	_FLASH_Lock
1273                     ; 371 }
1276  0358 81            	ret
1302                     ; 380 void mensagem_inicial_lcd(){
1303                     	switch	.text
1304  0359               _mensagem_inicial_lcd:
1308                     ; 381 	lcd_write(LINE_1, FALSE);
1310  0359 ae8000        	ldw	x,#32768
1311  035c cd05c5        	call	_lcd_write
1313                     ; 382 	lcd_write_string	 ("  UNIVERSIDADE  ");
1315  035f ae0025        	ldw	x,#L123
1316  0362 cd0627        	call	_lcd_write_string
1318                     ; 383 	lcd_write(LINE_2, FALSE);
1320  0365 aec000        	ldw	x,#49152
1321  0368 cd05c5        	call	_lcd_write
1323                     ; 384 	lcd_write_string	 (" FEDERAL DO ABC ");
1325  036b ae0014        	ldw	x,#L323
1326  036e cd0627        	call	_lcd_write_string
1328                     ; 385 }
1331  0371 81            	ret
1363                     ; 394 void contagem_carros(){
1364                     	switch	.text
1365  0372               _contagem_carros:
1369                     ; 396 	if(last_sensor_entrada != sensor_entrada){
1371  0372 b61e          	ld	a,_last_sensor_entrada
1372  0374 b11d          	cp	a,_sensor_entrada
1373  0376 2717          	jreq	L533
1374                     ; 398 		last_sensor_entrada 	= sensor_entrada;
1376  0378 451d1e        	mov	_last_sensor_entrada,_sensor_entrada
1377                     ; 399 		if(sensor_entrada){
1379  037b 3d1d          	tnz	_sensor_entrada
1380  037d 2710          	jreq	L533
1381                     ; 401 			if (carros < 255){
1383  037f b601          	ld	a,_carros
1384  0381 a1ff          	cp	a,#255
1385  0383 2407          	jruge	L343
1386                     ; 402 				carros++;
1388  0385 3c01          	inc	_carros
1389                     ; 403 				incrementa_buzzer();
1391  0387 cd0193        	call	_incrementa_buzzer
1393                     ; 404 				display_carros_atualizado = FALSE;
1395  038a 3f27          	clr	_display_carros_atualizado
1397  038c               L343:
1398                     ; 409 			grava_eeprom();
1400  038c cd0281        	call	_grava_eeprom
1402  038f               L533:
1403                     ; 413 	if(last_sensor_saida != sensor_saida){
1405  038f b620          	ld	a,_last_sensor_saida
1406  0391 b11f          	cp	a,_sensor_saida
1407  0393 2715          	jreq	L543
1408                     ; 415 		last_sensor_saida 	= sensor_saida;
1410  0395 451f20        	mov	_last_sensor_saida,_sensor_saida
1411                     ; 416 		if(sensor_saida){
1413  0398 3d1f          	tnz	_sensor_saida
1414  039a 270e          	jreq	L543
1415                     ; 417 			if(carros > 0){
1417  039c 3d01          	tnz	_carros
1418  039e 2707          	jreq	L353
1419                     ; 418 				carros--;
1421  03a0 3a01          	dec	_carros
1422                     ; 419 				decrementa_buzzer();
1424  03a2 cd019c        	call	_decrementa_buzzer
1426                     ; 420 				display_carros_atualizado = FALSE;
1428  03a5 3f27          	clr	_display_carros_atualizado
1430  03a7               L353:
1431                     ; 425 			grava_eeprom();
1433  03a7 cd0281        	call	_grava_eeprom
1435  03aa               L543:
1436                     ; 429 }
1439  03aa 81            	ret
1473                     ; 440 void checa_entradas (void){
1474                     	switch	.text
1475  03ab               _checa_entradas:
1479                     ; 444 	if(!GPIO_ReadInputPin(SENSOR_ENTRADA)){
1481  03ab 4b10          	push	#16
1482  03ad ae500a        	ldw	x,#20490
1483  03b0 cd0000        	call	_GPIO_ReadInputPin
1485  03b3 5b01          	addw	sp,#1
1486  03b5 4d            	tnz	a
1487  03b6 2610          	jrne	L563
1488                     ; 446 		if(contador_debounce_sensor_entrada >= TEMPO_DEBOUNCE_ACIONA){
1490  03b8 be07          	ldw	x,_contador_debounce_sensor_entrada
1491  03ba a302bc        	cpw	x,#700
1492  03bd 2515          	jrult	L173
1493                     ; 448 			sensor_entrada = TRUE;	
1495  03bf 3501001d      	mov	_sensor_entrada,#1
1496                     ; 449 			contador_debounce_sensor_entrada = 0;
1498  03c3 5f            	clrw	x
1499  03c4 bf07          	ldw	_contador_debounce_sensor_entrada,x
1500  03c6 200c          	jra	L173
1501  03c8               L563:
1502                     ; 454 		if(contador_debounce_sensor_entrada >= TEMPO_DEBOUNCE_DESACIONA){
1504  03c8 be07          	ldw	x,_contador_debounce_sensor_entrada
1505  03ca a30064        	cpw	x,#100
1506  03cd 2505          	jrult	L173
1507                     ; 456 			sensor_entrada = FALSE; 
1509  03cf 3f1d          	clr	_sensor_entrada
1510                     ; 457 			contador_debounce_sensor_entrada = 0;
1512  03d1 5f            	clrw	x
1513  03d2 bf07          	ldw	_contador_debounce_sensor_entrada,x
1514  03d4               L173:
1515                     ; 463 	if(!GPIO_ReadInputPin(SENSOR_SAIDA)){
1517  03d4 4b08          	push	#8
1518  03d6 ae500a        	ldw	x,#20490
1519  03d9 cd0000        	call	_GPIO_ReadInputPin
1521  03dc 5b01          	addw	sp,#1
1522  03de 4d            	tnz	a
1523  03df 2610          	jrne	L573
1524                     ; 465 		if(contador_debounce_sensor_saida >= TEMPO_DEBOUNCE_ACIONA){
1526  03e1 be09          	ldw	x,_contador_debounce_sensor_saida
1527  03e3 a302bc        	cpw	x,#700
1528  03e6 2515          	jrult	L104
1529                     ; 467 			sensor_saida = TRUE;	
1531  03e8 3501001f      	mov	_sensor_saida,#1
1532                     ; 468 			contador_debounce_sensor_saida = 0;
1534  03ec 5f            	clrw	x
1535  03ed bf09          	ldw	_contador_debounce_sensor_saida,x
1536  03ef 200c          	jra	L104
1537  03f1               L573:
1538                     ; 473 		if(contador_debounce_sensor_saida >= TEMPO_DEBOUNCE_DESACIONA){
1540  03f1 be09          	ldw	x,_contador_debounce_sensor_saida
1541  03f3 a30064        	cpw	x,#100
1542  03f6 2505          	jrult	L104
1543                     ; 475 			sensor_saida = FALSE; 
1545  03f8 3f1f          	clr	_sensor_saida
1546                     ; 476 			contador_debounce_sensor_saida = 0;
1548  03fa 5f            	clrw	x
1549  03fb bf09          	ldw	_contador_debounce_sensor_saida,x
1550  03fd               L104:
1551                     ; 482 	if(!GPIO_ReadInputPin(BT_INCREMENTO)){
1553  03fd 4b20          	push	#32
1554  03ff ae500a        	ldw	x,#20490
1555  0402 cd0000        	call	_GPIO_ReadInputPin
1557  0405 5b01          	addw	sp,#1
1558  0407 4d            	tnz	a
1559  0408 2610          	jrne	L504
1560                     ; 484 		if(contador_debounce_bt_incremento >= TEMPO_DEBOUNCE_BT_INCREMENTO){
1562  040a be0b          	ldw	x,_contador_debounce_bt_incremento
1563  040c a3001e        	cpw	x,#30
1564  040f 2515          	jrult	L114
1565                     ; 486 			bt_incremento = TRUE;	
1567  0411 35010021      	mov	_bt_incremento,#1
1568                     ; 487 			contador_debounce_bt_incremento = 0;
1570  0415 5f            	clrw	x
1571  0416 bf0b          	ldw	_contador_debounce_bt_incremento,x
1572  0418 200c          	jra	L114
1573  041a               L504:
1574                     ; 492 		if(contador_debounce_bt_incremento >= TEMPO_DEBOUNCE_BT_INCREMENTO){
1576  041a be0b          	ldw	x,_contador_debounce_bt_incremento
1577  041c a3001e        	cpw	x,#30
1578  041f 2505          	jrult	L114
1579                     ; 494 			bt_incremento = FALSE; 
1581  0421 3f21          	clr	_bt_incremento
1582                     ; 495 			contador_debounce_bt_incremento = 0;
1584  0423 5f            	clrw	x
1585  0424 bf0b          	ldw	_contador_debounce_bt_incremento,x
1586  0426               L114:
1587                     ; 501 	if(!GPIO_ReadInputPin(BT_DECREMENTO)){
1589  0426 4b40          	push	#64
1590  0428 ae500a        	ldw	x,#20490
1591  042b cd0000        	call	_GPIO_ReadInputPin
1593  042e 5b01          	addw	sp,#1
1594  0430 4d            	tnz	a
1595  0431 2610          	jrne	L514
1596                     ; 503 		if(contador_debounce_bt_decremento >= TEMPO_DEBOUNCE_BT_DECREMENTO){
1598  0433 be0d          	ldw	x,_contador_debounce_bt_decremento
1599  0435 a3001e        	cpw	x,#30
1600  0438 2515          	jrult	L124
1601                     ; 505 			bt_decremento = TRUE;	
1603  043a 35010023      	mov	_bt_decremento,#1
1604                     ; 506 			contador_debounce_bt_decremento = 0;
1606  043e 5f            	clrw	x
1607  043f bf0d          	ldw	_contador_debounce_bt_decremento,x
1608  0441 200c          	jra	L124
1609  0443               L514:
1610                     ; 511 		if(contador_debounce_bt_decremento >= TEMPO_DEBOUNCE_BT_DECREMENTO){
1612  0443 be0d          	ldw	x,_contador_debounce_bt_decremento
1613  0445 a3001e        	cpw	x,#30
1614  0448 2505          	jrult	L124
1615                     ; 513 			bt_decremento = FALSE; 
1617  044a 3f23          	clr	_bt_decremento
1618                     ; 514 			contador_debounce_bt_decremento = 0;
1620  044c 5f            	clrw	x
1621  044d bf0d          	ldw	_contador_debounce_bt_decremento,x
1622  044f               L124:
1623                     ; 520 	if(!GPIO_ReadInputPin(BT_CONFIRMA)){
1625  044f 4b10          	push	#16
1626  0451 ae5005        	ldw	x,#20485
1627  0454 cd0000        	call	_GPIO_ReadInputPin
1629  0457 5b01          	addw	sp,#1
1630  0459 4d            	tnz	a
1631  045a 2610          	jrne	L524
1632                     ; 522 		if(contador_debounce_bt_confirma >= TEMPO_DEBOUNCE_BT_CONFIRMA){
1634  045c be0f          	ldw	x,_contador_debounce_bt_confirma
1635  045e a3001e        	cpw	x,#30
1636  0461 2515          	jrult	L134
1637                     ; 524 			bt_confirma = TRUE;	
1639  0463 35010025      	mov	_bt_confirma,#1
1640                     ; 525 			contador_debounce_bt_confirma = 0;
1642  0467 5f            	clrw	x
1643  0468 bf0f          	ldw	_contador_debounce_bt_confirma,x
1644  046a 200c          	jra	L134
1645  046c               L524:
1646                     ; 530 		if(contador_debounce_bt_confirma >= TEMPO_DEBOUNCE_BT_CONFIRMA){
1648  046c be0f          	ldw	x,_contador_debounce_bt_confirma
1649  046e a3001e        	cpw	x,#30
1650  0471 2505          	jrult	L134
1651                     ; 532 			bt_confirma = FALSE; 
1653  0473 3f25          	clr	_bt_confirma
1654                     ; 533 			contador_debounce_bt_confirma = 0;
1656  0475 5f            	clrw	x
1657  0476 bf0f          	ldw	_contador_debounce_bt_confirma,x
1658  0478               L134:
1659                     ; 537 }
1662  0478 81            	ret
1686                     ; 545 void ioInit(void){	 
1687                     	switch	.text
1688  0479               _ioInit:
1692                     ; 547 	GPIO_Init(BT_INCREMENTO,  	GPIO_MODE_IN_PU_NO_IT);
1694  0479 4b40          	push	#64
1695  047b 4b20          	push	#32
1696  047d ae500a        	ldw	x,#20490
1697  0480 cd0000        	call	_GPIO_Init
1699  0483 85            	popw	x
1700                     ; 548 	GPIO_Init(BT_DECREMENTO,  	GPIO_MODE_IN_PU_NO_IT);
1702  0484 4b40          	push	#64
1703  0486 4b40          	push	#64
1704  0488 ae500a        	ldw	x,#20490
1705  048b cd0000        	call	_GPIO_Init
1707  048e 85            	popw	x
1708                     ; 549 	GPIO_Init(BT_CONFIRMA,  		GPIO_MODE_IN_PU_NO_IT);
1710  048f 4b40          	push	#64
1711  0491 4b10          	push	#16
1712  0493 ae5005        	ldw	x,#20485
1713  0496 cd0000        	call	_GPIO_Init
1715  0499 85            	popw	x
1716                     ; 551 	GPIO_Init(SENSOR_SAIDA,  		GPIO_MODE_IN_PU_NO_IT);
1718  049a 4b40          	push	#64
1719  049c 4b08          	push	#8
1720  049e ae500a        	ldw	x,#20490
1721  04a1 cd0000        	call	_GPIO_Init
1723  04a4 85            	popw	x
1724                     ; 552 	GPIO_Init(SENSOR_ENTRADA,		GPIO_MODE_IN_PU_NO_IT);
1726  04a5 4b40          	push	#64
1727  04a7 4b10          	push	#16
1728  04a9 ae500a        	ldw	x,#20490
1729  04ac cd0000        	call	_GPIO_Init
1731  04af 85            	popw	x
1732                     ; 554 	GPIO_Init(BUZZER,    				GPIO_MODE_OUT_PP_LOW_SLOW);
1734  04b0 4bc0          	push	#192
1735  04b2 4b08          	push	#8
1736  04b4 ae5000        	ldw	x,#20480
1737  04b7 cd0000        	call	_GPIO_Init
1739  04ba 85            	popw	x
1740                     ; 555 	GPIO_Init(SINAL_VERMELHO,   GPIO_MODE_OUT_PP_LOW_SLOW);
1742  04bb 4bc0          	push	#192
1743  04bd 4b02          	push	#2
1744  04bf ae5000        	ldw	x,#20480
1745  04c2 cd0000        	call	_GPIO_Init
1747  04c5 85            	popw	x
1748                     ; 556 	GPIO_Init(SINAL_VERDE,    	GPIO_MODE_OUT_PP_LOW_SLOW);
1750  04c6 4bc0          	push	#192
1751  04c8 4b04          	push	#4
1752  04ca ae5000        	ldw	x,#20480
1753  04cd cd0000        	call	_GPIO_Init
1755  04d0 85            	popw	x
1756                     ; 558 	GPIO_Init(LCD_E,    				GPIO_MODE_OUT_PP_LOW_SLOW);
1758  04d1 4bc0          	push	#192
1759  04d3 4b40          	push	#64
1760  04d5 ae500f        	ldw	x,#20495
1761  04d8 cd0000        	call	_GPIO_Init
1763  04db 85            	popw	x
1764                     ; 559 	GPIO_Init(LCD_RS,  				 	GPIO_MODE_OUT_PP_LOW_SLOW);
1766  04dc 4bc0          	push	#192
1767  04de 4b80          	push	#128
1768  04e0 ae500a        	ldw	x,#20490
1769  04e3 cd0000        	call	_GPIO_Init
1771  04e6 85            	popw	x
1772                     ; 560 	GPIO_Init(LCD_DB4,  				GPIO_MODE_OUT_PP_LOW_SLOW);
1774  04e7 4bc0          	push	#192
1775  04e9 4b04          	push	#4
1776  04eb ae500f        	ldw	x,#20495
1777  04ee cd0000        	call	_GPIO_Init
1779  04f1 85            	popw	x
1780                     ; 561 	GPIO_Init(LCD_DB5,  				GPIO_MODE_OUT_PP_LOW_SLOW);
1782  04f2 4bc0          	push	#192
1783  04f4 4b08          	push	#8
1784  04f6 ae500f        	ldw	x,#20495
1785  04f9 cd0000        	call	_GPIO_Init
1787  04fc 85            	popw	x
1788                     ; 562 	GPIO_Init(LCD_DB6,  				GPIO_MODE_OUT_PP_LOW_SLOW);
1790  04fd 4bc0          	push	#192
1791  04ff 4b10          	push	#16
1792  0501 ae500f        	ldw	x,#20495
1793  0504 cd0000        	call	_GPIO_Init
1795  0507 85            	popw	x
1796                     ; 563 	GPIO_Init(LCD_DB7,  				GPIO_MODE_OUT_PP_LOW_SLOW);
1798  0508 4bc0          	push	#192
1799  050a 4b20          	push	#32
1800  050c ae500f        	ldw	x,#20495
1801  050f cd0000        	call	_GPIO_Init
1803  0512 85            	popw	x
1804                     ; 564 }
1807  0513 81            	ret
1834                     ; 586 void timerInit(void){
1835                     	switch	.text
1836  0514               _timerInit:
1840                     ; 587 	TIM4_DeInit      ();                       
1842  0514 cd0000        	call	_TIM4_DeInit
1844                     ; 588 	TIM4_TimeBaseInit(TIM4_PRESCALER_64, 249); 	
1846  0517 ae06f9        	ldw	x,#1785
1847  051a cd0000        	call	_TIM4_TimeBaseInit
1849                     ; 589 	TIM4_ITConfig    (TIM4_IT_UPDATE, ENABLE);
1851  051d ae0101        	ldw	x,#257
1852  0520 cd0000        	call	_TIM4_ITConfig
1854                     ; 590 	TIM4_Cmd         (ENABLE);
1856  0523 a601          	ld	a,#1
1857  0525 cd0000        	call	_TIM4_Cmd
1859                     ; 591 }
1862  0528 81            	ret
1891                     	switch	.const
1892  0010               L65:
1893  0010 0000c350      	dc.l	50000
1894                     ; 602 void lcdInit(void){
1895                     	switch	.text
1896  0529               _lcdInit:
1900                     ; 603 	GPIO_WriteLow(LCD_RS);
1902  0529 4b80          	push	#128
1903  052b ae500a        	ldw	x,#20490
1904  052e cd0000        	call	_GPIO_WriteLow
1906  0531 84            	pop	a
1907                     ; 604 	GPIO_WriteLow(LCD_E);   
1909  0532 4b40          	push	#64
1910  0534 ae500f        	ldw	x,#20495
1911  0537 cd0000        	call	_GPIO_WriteLow
1913  053a 84            	pop	a
1914                     ; 606 	for(n = 0; n < 50000; n++){ nop(); }
1916  053b 5f            	clrw	x
1917  053c bf05          	ldw	_n,x
1918  053e               L564:
1922  053e 9d            nop
1927  053f be05          	ldw	x,_n
1928  0541 1c0001        	addw	x,#1
1929  0544 bf05          	ldw	_n,x
1932  0546 9c            	rvf
1933  0547 be05          	ldw	x,_n
1934  0549 cd0000        	call	c_uitolx
1936  054c ae0010        	ldw	x,#L65
1937  054f cd0000        	call	c_lcmp
1939  0552 2fea          	jrslt	L564
1940                     ; 607 	for(n = 0; n < 50000; n++){ nop(); }
1942  0554 5f            	clrw	x
1943  0555 bf05          	ldw	_n,x
1944  0557               L374:
1948  0557 9d            nop
1953  0558 be05          	ldw	x,_n
1954  055a 1c0001        	addw	x,#1
1955  055d bf05          	ldw	_n,x
1958  055f 9c            	rvf
1959  0560 be05          	ldw	x,_n
1960  0562 cd0000        	call	c_uitolx
1962  0565 ae0010        	ldw	x,#L65
1963  0568 cd0000        	call	c_lcmp
1965  056b 2fea          	jrslt	L374
1966                     ; 609 	lcd_write_nibble(0x03, FALSE);	 
1968  056d ae0300        	ldw	x,#768
1969  0570 ad7b          	call	_lcd_write_nibble
1971                     ; 610 	lcd_write_nibble(0x03, FALSE); 
1973  0572 ae0300        	ldw	x,#768
1974  0575 ad76          	call	_lcd_write_nibble
1976                     ; 612 	lcd_write(0x02, FALSE); //set to 4 bit interface, 1 line and 5*7 font
1978  0577 ae0200        	ldw	x,#512
1979  057a ad49          	call	_lcd_write
1981                     ; 613 	lcd_write(0x28, FALSE); //set to 4 bit interface, 2 line and 5*10 font
1983  057c ae2800        	ldw	x,#10240
1984  057f ad44          	call	_lcd_write
1986                     ; 614 	lcd_write(0x0C, FALSE); //set to 4 bit interface, 2 line and 5*7 font
1988  0581 ae0c00        	ldw	x,#3072
1989  0584 ad3f          	call	_lcd_write
1991                     ; 615 	lcd_write(0x01, FALSE); //clear display
1993  0586 ae0100        	ldw	x,#256
1994  0589 ad3a          	call	_lcd_write
1996                     ; 616 	lcd_write(0x06, FALSE); //move cursor right after write
1998  058b ae0600        	ldw	x,#1536
1999  058e ad35          	call	_lcd_write
2001                     ; 617 }
2004  0590 81            	ret
2039                     ; 628 void lcd_set_line(uint8_t line){
2040                     	switch	.text
2041  0591               _lcd_set_line:
2045                     ; 630 	switch(line){
2048                     ; 650 		break;
2049  0591 4a            	dec	a
2050  0592 2710          	jreq	L105
2051  0594 4a            	dec	a
2052  0595 2714          	jreq	L305
2053  0597 4a            	dec	a
2054  0598 2718          	jreq	L505
2055  059a 4a            	dec	a
2056  059b 271c          	jreq	L705
2057  059d               L115:
2058                     ; 648 		default:
2058                     ; 649 			lcd_write(LINE_1, FALSE);
2060  059d ae8000        	ldw	x,#32768
2061  05a0 ad23          	call	_lcd_write
2063                     ; 650 		break;
2065  05a2 201a          	jra	L335
2066  05a4               L105:
2067                     ; 632 		case 1:
2067                     ; 633 			lcd_write(LINE_1, FALSE);
2069  05a4 ae8000        	ldw	x,#32768
2070  05a7 ad1c          	call	_lcd_write
2072                     ; 634 		break;
2074  05a9 2013          	jra	L335
2075  05ab               L305:
2076                     ; 636 		case 2:
2076                     ; 637 			lcd_write(LINE_2, FALSE);
2078  05ab aec000        	ldw	x,#49152
2079  05ae ad15          	call	_lcd_write
2081                     ; 638 		break;
2083  05b0 200c          	jra	L335
2084  05b2               L505:
2085                     ; 640 		case 3:
2085                     ; 641 			lcd_write(LINE_3, FALSE);
2087  05b2 ae9000        	ldw	x,#36864
2088  05b5 ad0e          	call	_lcd_write
2090                     ; 642 		break;
2092  05b7 2005          	jra	L335
2093  05b9               L705:
2094                     ; 644 		case 4:
2094                     ; 645 			lcd_write(LINE_4, FALSE);
2096  05b9 aed000        	ldw	x,#53248
2097  05bc ad07          	call	_lcd_write
2099                     ; 646 		break;
2101  05be               L335:
2102                     ; 652 }
2105  05be 81            	ret
2129                     ; 663 void lcd_clear(void){
2130                     	switch	.text
2131  05bf               _lcd_clear:
2135                     ; 665 	lcd_write(0x01, FALSE);
2137  05bf ae0100        	ldw	x,#256
2138  05c2 ad01          	call	_lcd_write
2140                     ; 666 }
2143  05c4 81            	ret
2189                     ; 678 void lcd_write(uint8_t data, uint8_t type){
2190                     	switch	.text
2191  05c5               _lcd_write:
2193  05c5 89            	pushw	x
2194       00000000      OFST:	set	0
2197                     ; 680 	for(n = 0; n < 920; n++){ nop(); }
2199  05c6 5f            	clrw	x
2200  05c7 bf05          	ldw	_n,x
2201  05c9               L765:
2205  05c9 9d            nop
2210  05ca be05          	ldw	x,_n
2211  05cc 1c0001        	addw	x,#1
2212  05cf bf05          	ldw	_n,x
2215  05d1 be05          	ldw	x,_n
2216  05d3 a30398        	cpw	x,#920
2217  05d6 25f1          	jrult	L765
2218                     ; 682 	lcd_write_nibble(data >> 4, type); //WRITE THE UPPER NIBBLE
2220  05d8 7b02          	ld	a,(OFST+2,sp)
2221  05da 97            	ld	xl,a
2222  05db 7b01          	ld	a,(OFST+1,sp)
2223  05dd 4e            	swap	a
2224  05de a40f          	and	a,#15
2225  05e0 95            	ld	xh,a
2226  05e1 ad0a          	call	_lcd_write_nibble
2228                     ; 683 	lcd_write_nibble(data,      type); //WRITE THE LOWER NIBBLE
2230  05e3 7b02          	ld	a,(OFST+2,sp)
2231  05e5 97            	ld	xl,a
2232  05e6 7b01          	ld	a,(OFST+1,sp)
2233  05e8 95            	ld	xh,a
2234  05e9 ad02          	call	_lcd_write_nibble
2236                     ; 684 }
2239  05eb 85            	popw	x
2240  05ec 81            	ret
2286                     ; 696 void lcd_write_nibble(uint8_t data, uint8_t type){
2287                     	switch	.text
2288  05ed               _lcd_write_nibble:
2290  05ed 89            	pushw	x
2291       00000000      OFST:	set	0
2294                     ; 698 	GPIO_Write(LCD_PORT, (data << 2) & 0x3C);
2296  05ee 9e            	ld	a,xh
2297  05ef 48            	sll	a
2298  05f0 48            	sll	a
2299  05f1 a43c          	and	a,#60
2300  05f3 88            	push	a
2301  05f4 ae500f        	ldw	x,#20495
2302  05f7 cd0000        	call	_GPIO_Write
2304  05fa 84            	pop	a
2305                     ; 700 	if(type == 0){ 
2307  05fb 0d02          	tnz	(OFST+2,sp)
2308  05fd 260b          	jrne	L716
2309                     ; 702 		GPIO_WriteLow(LCD_RS);
2311  05ff 4b80          	push	#128
2312  0601 ae500a        	ldw	x,#20490
2313  0604 cd0000        	call	_GPIO_WriteLow
2315  0607 84            	pop	a
2317  0608 2009          	jra	L126
2318  060a               L716:
2319                     ; 706 		GPIO_WriteHigh(LCD_RS);
2321  060a 4b80          	push	#128
2322  060c ae500a        	ldw	x,#20490
2323  060f cd0000        	call	_GPIO_WriteHigh
2325  0612 84            	pop	a
2326  0613               L126:
2327                     ; 709 	GPIO_WriteHigh(LCD_E);    
2329  0613 4b40          	push	#64
2330  0615 ae500f        	ldw	x,#20495
2331  0618 cd0000        	call	_GPIO_WriteHigh
2333  061b 84            	pop	a
2334                     ; 710 	GPIO_WriteLow (LCD_E);
2336  061c 4b40          	push	#64
2337  061e ae500f        	ldw	x,#20495
2338  0621 cd0000        	call	_GPIO_WriteLow
2340  0624 84            	pop	a
2341                     ; 711 }
2344  0625 85            	popw	x
2345  0626 81            	ret
2381                     ; 722 void lcd_write_string(const uint8_t *string){
2382                     	switch	.text
2383  0627               _lcd_write_string:
2385  0627 89            	pushw	x
2386       00000000      OFST:	set	0
2389  0628 2011          	jra	L346
2390  062a               L146:
2391                     ; 726 		lcd_write(*string++, TRUE);
2393  062a 1e01          	ldw	x,(OFST+1,sp)
2394  062c 1c0001        	addw	x,#1
2395  062f 1f01          	ldw	(OFST+1,sp),x
2396  0631 1d0001        	subw	x,#1
2397  0634 f6            	ld	a,(x)
2398  0635 ae0001        	ldw	x,#1
2399  0638 95            	ld	xh,a
2400  0639 ad8a          	call	_lcd_write
2402  063b               L346:
2403                     ; 724 	while(*string){
2405  063b 1e01          	ldw	x,(OFST+1,sp)
2406  063d 7d            	tnz	(x)
2407  063e 26ea          	jrne	L146
2408                     ; 728 }
2411  0640 85            	popw	x
2412  0641 81            	ret
2761                     	xdef	_main
2762                     	xdef	_mensagem_inicial_lcd
2763                     	xdef	_lcd_write_nibble
2764                     	xdef	_lcd_write
2765                     	xdef	_lcd_set_line
2766                     	xdef	_lcd_write_string
2767                     	xdef	_lcd_clear
2768                     	xdef	_decrementa_buzzer
2769                     	xdef	_incrementa_buzzer
2770                     	xdef	_sinalizacao_buzzer
2771                     	xdef	_grava_eeprom
2772                     	xdef	_checa_eeprom
2773                     	xdef	_contagem_estacionamento
2774                     	xdef	_contagem_carros
2775                     	xdef	_checa_entradas
2776                     	xdef	_sinaliza_semaforo
2777                     	xdef	_delay
2778                     	xdef	_atualiza_display_vagas
2779                     	xdef	_atualiza_display_carros
2780                     	xdef	_lcdInit
2781                     	xdef	_ioInit
2782                     	xdef	_timerInit
2783                     	xdef	_buzzer_decremento
2784                     	xdef	_buzzer_incremento
2785                     	xdef	_display_vagas_atualizado
2786                     	xdef	_display_carros_atualizado
2787                     	xdef	_last_bt_confirma
2788                     	xdef	_bt_confirma
2789                     	xdef	_last_bt_decremento
2790                     	xdef	_bt_decremento
2791                     	xdef	_last_bt_incremento
2792                     	xdef	_bt_incremento
2793                     	xdef	_last_sensor_saida
2794                     	xdef	_sensor_saida
2795                     	xdef	_last_sensor_entrada
2796                     	xdef	_sensor_entrada
2797                     	switch	.ubsct
2798  0000               _buf_vagas:
2799  0000 000000        	ds.b	3
2800                     	xdef	_buf_vagas
2801  0003               _buf_carros:
2802  0003 000000        	ds.b	3
2803                     	xdef	_buf_carros
2804                     	xdef	_eeprom
2805                     	xdef	_tempo_buzzer_decremento
2806                     	xdef	_tempo_buzzer_incremento
2807                     	xdef	_contador_buzzer
2808                     	xdef	_contador_delay
2809                     	xdef	_contador_debounce_bt_confirma
2810                     	xdef	_contador_debounce_bt_decremento
2811                     	xdef	_contador_debounce_bt_incremento
2812                     	xdef	_contador_debounce_sensor_saida
2813                     	xdef	_contador_debounce_sensor_entrada
2814                     	xdef	_n
2815                     	xdef	_modo_operacao
2816                     	xdef	_controle_buzzer
2817                     	xdef	_quantidade_vagas
2818                     	xdef	_carros
2819                     	xdef	_controle
2820                     	xref	_sprintf
2821                     	xref	_FLASH_ReadByte
2822                     	xref	_FLASH_ProgramByte
2823                     	xref	_FLASH_EraseByte
2824                     	xref	_FLASH_DeInit
2825                     	xref	_FLASH_Lock
2826                     	xref	_FLASH_Unlock
2827                     	xref	_TIM4_ITConfig
2828                     	xref	_TIM4_Cmd
2829                     	xref	_TIM4_TimeBaseInit
2830                     	xref	_TIM4_DeInit
2831                     	xref	_GPIO_ReadInputPin
2832                     	xref	_GPIO_WriteLow
2833                     	xref	_GPIO_WriteHigh
2834                     	xref	_GPIO_Write
2835                     	xref	_GPIO_Init
2836                     	switch	.const
2837  0014               L323:
2838  0014 204645444552  	dc.b	" FEDERAL DO ABC ",0
2839  0025               L123:
2840  0025 2020554e4956  	dc.b	"  UNIVERSIDADE  ",0
2841  0036               L57:
2842  0036 564147415320  	dc.b	"VAGAS : ",0
2843  003f               L16:
2844  003f 203c2d2d00    	dc.b	" <--",0
2845  0044               L55:
2846  0044 434152524f53  	dc.b	"CARROS: ",0
2847  004d               L35:
2848  004d 2530336400    	dc.b	"%03d",0
2849                     	xref.b	c_lreg
2869                     	xref	c_uitolx
2870                     	xref	c_lsbc
2871                     	xref	c_lcmp
2872                     	xref	c_ltor
2873                     	xref	c_lgadc
2874                     	end
