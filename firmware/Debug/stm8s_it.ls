   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.12 - 20 Jun 2018
   3                     ; Generator (Limited) V4.4.8 - 20 Jun 2018
  43                     ; 58 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
  43                     ; 59 {
  44                     	switch	.text
  45  0000               f_NonHandledInterrupt:
  49                     ; 63 }
  52  0000 80            	iret
  74                     ; 71 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  74                     ; 72 {
  75                     	switch	.text
  76  0001               f_TRAP_IRQHandler:
  80                     ; 76 }
  83  0001 80            	iret
 105                     ; 83 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 105                     ; 84 
 105                     ; 85 {
 106                     	switch	.text
 107  0002               f_TLI_IRQHandler:
 111                     ; 89 }
 114  0002 80            	iret
 136                     ; 96 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 136                     ; 97 {
 137                     	switch	.text
 138  0003               f_AWU_IRQHandler:
 142                     ; 101 }
 145  0003 80            	iret
 167                     ; 108 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 167                     ; 109 {
 168                     	switch	.text
 169  0004               f_CLK_IRQHandler:
 173                     ; 113 }
 176  0004 80            	iret
 199                     ; 116 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3){
 200                     	switch	.text
 201  0005               f_EXTI_PORTA_IRQHandler:
 205                     ; 120   }
 208  0005 80            	iret
 231                     ; 122 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4){
 232                     	switch	.text
 233  0006               f_EXTI_PORTB_IRQHandler:
 237                     ; 124   }
 240  0006 80            	iret
 263                     ; 126 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5){
 264                     	switch	.text
 265  0007               f_EXTI_PORTC_IRQHandler:
 269                     ; 128 	}
 272  0007 80            	iret
 295                     ; 130 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6){
 296                     	switch	.text
 297  0008               f_EXTI_PORTD_IRQHandler:
 301                     ; 132   }
 304  0008 80            	iret
 327                     ; 134 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7){
 328                     	switch	.text
 329  0009               f_EXTI_PORTE_IRQHandler:
 333                     ; 136   }
 336  0009 80            	iret
 358                     ; 185 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 358                     ; 186 {
 359                     	switch	.text
 360  000a               f_SPI_IRQHandler:
 364                     ; 190 }
 367  000a 80            	iret
 390                     ; 197 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 390                     ; 198 {
 391                     	switch	.text
 392  000b               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 396                     ; 202 }
 399  000b 80            	iret
 422                     ; 209 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 422                     ; 210 {
 423                     	switch	.text
 424  000c               f_TIM1_CAP_COM_IRQHandler:
 428                     ; 214 }
 431  000c 80            	iret
 454                     ; 247 INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 454                     ; 248   {
 455                     	switch	.text
 456  000d               f_TIM2_UPD_OVF_BRK_IRQHandler:
 460                     ; 252   } 
 463  000d 80            	iret
 486                     ; 259  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 486                     ; 260  {
 487                     	switch	.text
 488  000e               f_TIM2_CAP_COM_IRQHandler:
 492                     ; 264  }
 495  000e 80            	iret
 518                     ; 303  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 518                     ; 304  {
 519                     	switch	.text
 520  000f               f_UART1_TX_IRQHandler:
 524                     ; 308  }
 527  000f 80            	iret
 550                     ; 315  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 550                     ; 316  {
 551                     	switch	.text
 552  0010               f_UART1_RX_IRQHandler:
 556                     ; 320  }
 559  0010 80            	iret
 581                     ; 328 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 581                     ; 329 {
 582                     	switch	.text
 583  0011               f_I2C_IRQHandler:
 587                     ; 333 }
 590  0011 80            	iret
 612                     ; 407  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 612                     ; 408  {
 613                     	switch	.text
 614  0012               f_ADC1_IRQHandler:
 618                     ; 412  }
 621  0012 80            	iret
 651                     ; 433 INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 651                     ; 434 {		
 652                     	switch	.text
 653  0013               f_TIM4_UPD_OVF_IRQHandler:
 655  0013 8a            	push	cc
 656  0014 84            	pop	a
 657  0015 a4bf          	and	a,#191
 658  0017 88            	push	a
 659  0018 86            	pop	cc
 660  0019 3b0002        	push	c_x+2
 661  001c be00          	ldw	x,c_x
 662  001e 89            	pushw	x
 663  001f 3b0002        	push	c_y+2
 664  0022 be00          	ldw	x,c_y
 665  0024 89            	pushw	x
 668                     ; 436 	TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
 670  0025 a601          	ld	a,#1
 671  0027 cd0000        	call	_TIM4_ClearITPendingBit
 673                     ; 438 	contador_debounce_sensor_saida++;
 675  002a be00          	ldw	x,_contador_debounce_sensor_saida
 676  002c 1c0001        	addw	x,#1
 677  002f bf00          	ldw	_contador_debounce_sensor_saida,x
 678                     ; 439 	contador_debounce_sensor_entrada++;
 680  0031 be00          	ldw	x,_contador_debounce_sensor_entrada
 681  0033 1c0001        	addw	x,#1
 682  0036 bf00          	ldw	_contador_debounce_sensor_entrada,x
 683                     ; 440 	contador_buzzer++;
 685  0038 be00          	ldw	x,_contador_buzzer
 686  003a 1c0001        	addw	x,#1
 687  003d bf00          	ldw	_contador_buzzer,x
 688                     ; 441 	contador_debounce_bt_incremento++;
 690  003f be00          	ldw	x,_contador_debounce_bt_incremento
 691  0041 1c0001        	addw	x,#1
 692  0044 bf00          	ldw	_contador_debounce_bt_incremento,x
 693                     ; 442 	contador_debounce_bt_decremento++;
 695  0046 be00          	ldw	x,_contador_debounce_bt_decremento
 696  0048 1c0001        	addw	x,#1
 697  004b bf00          	ldw	_contador_debounce_bt_decremento,x
 698                     ; 443 	contador_debounce_bt_confirma++;
 700  004d be00          	ldw	x,_contador_debounce_bt_confirma
 701  004f 1c0001        	addw	x,#1
 702  0052 bf00          	ldw	_contador_debounce_bt_confirma,x
 703                     ; 447 }
 706  0054 85            	popw	x
 707  0055 bf00          	ldw	c_y,x
 708  0057 320002        	pop	c_y+2
 709  005a 85            	popw	x
 710  005b bf00          	ldw	c_x,x
 711  005d 320002        	pop	c_x+2
 712  0060 80            	iret
 735                     ; 456 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 735                     ; 457 {
 736                     	switch	.text
 737  0061               f_EEPROM_EEC_IRQHandler:
 741                     ; 461 }
 744  0061 80            	iret
 756                     	xref.b	_contador_buzzer
 757                     	xref.b	_contador_debounce_bt_decremento
 758                     	xref.b	_contador_debounce_bt_incremento
 759                     	xref.b	_contador_debounce_bt_confirma
 760                     	xref.b	_contador_debounce_sensor_entrada
 761                     	xref.b	_contador_debounce_sensor_saida
 762                     	xdef	f_EEPROM_EEC_IRQHandler
 763                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 764                     	xdef	f_ADC1_IRQHandler
 765                     	xdef	f_I2C_IRQHandler
 766                     	xdef	f_UART1_RX_IRQHandler
 767                     	xdef	f_UART1_TX_IRQHandler
 768                     	xdef	f_TIM2_CAP_COM_IRQHandler
 769                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 770                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 771                     	xdef	f_TIM1_CAP_COM_IRQHandler
 772                     	xdef	f_SPI_IRQHandler
 773                     	xdef	f_EXTI_PORTE_IRQHandler
 774                     	xdef	f_EXTI_PORTD_IRQHandler
 775                     	xdef	f_EXTI_PORTC_IRQHandler
 776                     	xdef	f_EXTI_PORTB_IRQHandler
 777                     	xdef	f_EXTI_PORTA_IRQHandler
 778                     	xdef	f_CLK_IRQHandler
 779                     	xdef	f_AWU_IRQHandler
 780                     	xdef	f_TLI_IRQHandler
 781                     	xdef	f_TRAP_IRQHandler
 782                     	xdef	f_NonHandledInterrupt
 783                     	xref	_TIM4_ClearITPendingBit
 784                     	xref.b	c_x
 785                     	xref.b	c_y
 804                     	end
