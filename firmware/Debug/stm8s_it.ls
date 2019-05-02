   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.12 - 20 Jun 2018
   3                     ; Generator (Limited) V4.4.8 - 20 Jun 2018
  43                     ; 59 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
  43                     ; 60 {
  44                     	switch	.text
  45  0000               f_NonHandledInterrupt:
  49                     ; 64 }
  52  0000 80            	iret
  74                     ; 72 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  74                     ; 73 {
  75                     	switch	.text
  76  0001               f_TRAP_IRQHandler:
  80                     ; 77 }
  83  0001 80            	iret
 105                     ; 84 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 105                     ; 85 
 105                     ; 86 {
 106                     	switch	.text
 107  0002               f_TLI_IRQHandler:
 111                     ; 90 }
 114  0002 80            	iret
 136                     ; 97 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 136                     ; 98 {
 137                     	switch	.text
 138  0003               f_AWU_IRQHandler:
 142                     ; 102 }
 145  0003 80            	iret
 167                     ; 109 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 167                     ; 110 {
 168                     	switch	.text
 169  0004               f_CLK_IRQHandler:
 173                     ; 114 }
 176  0004 80            	iret
 199                     ; 117 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3){
 200                     	switch	.text
 201  0005               f_EXTI_PORTA_IRQHandler:
 205                     ; 121   }
 208  0005 80            	iret
 231                     ; 123 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4){
 232                     	switch	.text
 233  0006               f_EXTI_PORTB_IRQHandler:
 237                     ; 125   }
 240  0006 80            	iret
 263                     ; 127 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5){
 264                     	switch	.text
 265  0007               f_EXTI_PORTC_IRQHandler:
 269                     ; 129 	}
 272  0007 80            	iret
 295                     ; 131 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6){
 296                     	switch	.text
 297  0008               f_EXTI_PORTD_IRQHandler:
 301                     ; 133   }
 304  0008 80            	iret
 327                     ; 135 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7){
 328                     	switch	.text
 329  0009               f_EXTI_PORTE_IRQHandler:
 333                     ; 137   }
 336  0009 80            	iret
 358                     ; 186 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 358                     ; 187 {
 359                     	switch	.text
 360  000a               f_SPI_IRQHandler:
 364                     ; 191 }
 367  000a 80            	iret
 390                     ; 198 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 390                     ; 199 {
 391                     	switch	.text
 392  000b               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 396                     ; 203 }
 399  000b 80            	iret
 422                     ; 210 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 422                     ; 211 {
 423                     	switch	.text
 424  000c               f_TIM1_CAP_COM_IRQHandler:
 428                     ; 215 }
 431  000c 80            	iret
 454                     ; 248 INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 454                     ; 249   {
 455                     	switch	.text
 456  000d               f_TIM2_UPD_OVF_BRK_IRQHandler:
 460                     ; 253   } 
 463  000d 80            	iret
 486                     ; 260  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 486                     ; 261  {
 487                     	switch	.text
 488  000e               f_TIM2_CAP_COM_IRQHandler:
 492                     ; 265  }
 495  000e 80            	iret
 518                     ; 304  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 518                     ; 305  {
 519                     	switch	.text
 520  000f               f_UART1_TX_IRQHandler:
 524                     ; 309  }
 527  000f 80            	iret
 550                     ; 316  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 550                     ; 317  {
 551                     	switch	.text
 552  0010               f_UART1_RX_IRQHandler:
 556                     ; 321  }
 559  0010 80            	iret
 581                     ; 329 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 581                     ; 330 {
 582                     	switch	.text
 583  0011               f_I2C_IRQHandler:
 587                     ; 334 }
 590  0011 80            	iret
 612                     ; 408  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 612                     ; 409  {
 613                     	switch	.text
 614  0012               f_ADC1_IRQHandler:
 618                     ; 413  }
 621  0012 80            	iret
 652                     ; 434 INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 652                     ; 435 {		
 653                     	switch	.text
 654  0013               f_TIM4_UPD_OVF_IRQHandler:
 656  0013 8a            	push	cc
 657  0014 84            	pop	a
 658  0015 a4bf          	and	a,#191
 659  0017 88            	push	a
 660  0018 86            	pop	cc
 661  0019 3b0002        	push	c_x+2
 662  001c be00          	ldw	x,c_x
 663  001e 89            	pushw	x
 664  001f 3b0002        	push	c_y+2
 665  0022 be00          	ldw	x,c_y
 666  0024 89            	pushw	x
 669                     ; 437 	TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
 671  0025 a601          	ld	a,#1
 672  0027 cd0000        	call	_TIM4_ClearITPendingBit
 674                     ; 439 	contador_debounce_sensor_saida++;
 676  002a be00          	ldw	x,_contador_debounce_sensor_saida
 677  002c 1c0001        	addw	x,#1
 678  002f bf00          	ldw	_contador_debounce_sensor_saida,x
 679                     ; 440 	contador_debounce_sensor_entrada++;
 681  0031 be00          	ldw	x,_contador_debounce_sensor_entrada
 682  0033 1c0001        	addw	x,#1
 683  0036 bf00          	ldw	_contador_debounce_sensor_entrada,x
 684                     ; 441 	contador_buzzer++;
 686  0038 be00          	ldw	x,_contador_buzzer
 687  003a 1c0001        	addw	x,#1
 688  003d bf00          	ldw	_contador_buzzer,x
 689                     ; 442 	contador_debounce_bt_incremento++;
 691  003f be00          	ldw	x,_contador_debounce_bt_incremento
 692  0041 1c0001        	addw	x,#1
 693  0044 bf00          	ldw	_contador_debounce_bt_incremento,x
 694                     ; 443 	contador_debounce_bt_decremento++;
 696  0046 be00          	ldw	x,_contador_debounce_bt_decremento
 697  0048 1c0001        	addw	x,#1
 698  004b bf00          	ldw	_contador_debounce_bt_decremento,x
 699                     ; 444 	contador_debounce_bt_confirma++;
 701  004d be00          	ldw	x,_contador_debounce_bt_confirma
 702  004f 1c0001        	addw	x,#1
 703  0052 bf00          	ldw	_contador_debounce_bt_confirma,x
 704                     ; 445 	contador_delay++;
 706  0054 be00          	ldw	x,_contador_delay
 707  0056 1c0001        	addw	x,#1
 708  0059 bf00          	ldw	_contador_delay,x
 709                     ; 449 }
 712  005b 85            	popw	x
 713  005c bf00          	ldw	c_y,x
 714  005e 320002        	pop	c_y+2
 715  0061 85            	popw	x
 716  0062 bf00          	ldw	c_x,x
 717  0064 320002        	pop	c_x+2
 718  0067 80            	iret
 741                     ; 458 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 741                     ; 459 {
 742                     	switch	.text
 743  0068               f_EEPROM_EEC_IRQHandler:
 747                     ; 463 }
 750  0068 80            	iret
 762                     	xref.b	_contador_delay
 763                     	xref.b	_contador_buzzer
 764                     	xref.b	_contador_debounce_bt_decremento
 765                     	xref.b	_contador_debounce_bt_incremento
 766                     	xref.b	_contador_debounce_bt_confirma
 767                     	xref.b	_contador_debounce_sensor_entrada
 768                     	xref.b	_contador_debounce_sensor_saida
 769                     	xdef	f_EEPROM_EEC_IRQHandler
 770                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 771                     	xdef	f_ADC1_IRQHandler
 772                     	xdef	f_I2C_IRQHandler
 773                     	xdef	f_UART1_RX_IRQHandler
 774                     	xdef	f_UART1_TX_IRQHandler
 775                     	xdef	f_TIM2_CAP_COM_IRQHandler
 776                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 777                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 778                     	xdef	f_TIM1_CAP_COM_IRQHandler
 779                     	xdef	f_SPI_IRQHandler
 780                     	xdef	f_EXTI_PORTE_IRQHandler
 781                     	xdef	f_EXTI_PORTD_IRQHandler
 782                     	xdef	f_EXTI_PORTC_IRQHandler
 783                     	xdef	f_EXTI_PORTB_IRQHandler
 784                     	xdef	f_EXTI_PORTA_IRQHandler
 785                     	xdef	f_CLK_IRQHandler
 786                     	xdef	f_AWU_IRQHandler
 787                     	xdef	f_TLI_IRQHandler
 788                     	xdef	f_TRAP_IRQHandler
 789                     	xdef	f_NonHandledInterrupt
 790                     	xref	_TIM4_ClearITPendingBit
 791                     	xref.b	c_x
 792                     	xref.b	c_y
 811                     	end
