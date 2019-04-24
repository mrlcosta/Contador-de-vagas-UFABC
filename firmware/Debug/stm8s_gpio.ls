   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.12 - 20 Jun 2018
   3                     ; Generator (Limited) V4.4.8 - 20 Jun 2018
 108                     ; 47 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
 108                     ; 48 {
 110                     	switch	.text
 111  0000               _GPIO_DeInit:
 115                     ; 49     GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 117  0000 7f            	clr	(x)
 118                     ; 50     GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 120  0001 6f02          	clr	(2,x)
 121                     ; 51     GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 123  0003 6f03          	clr	(3,x)
 124                     ; 52     GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 126  0005 6f04          	clr	(4,x)
 127                     ; 53 }
 130  0007 81            	ret
 370                     ; 65 void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
 370                     ; 66 {
 371                     	switch	.text
 372  0008               _GPIO_Init:
 374  0008 89            	pushw	x
 375       00000000      OFST:	set	0
 378                     ; 71     assert_param(IS_GPIO_MODE_OK(GPIO_Mode));
 380                     ; 72     assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
 382                     ; 75   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 384  0009 7b05          	ld	a,(OFST+5,sp)
 385  000b 43            	cpl	a
 386  000c e404          	and	a,(4,x)
 387  000e e704          	ld	(4,x),a
 388                     ; 81     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 390  0010 7b06          	ld	a,(OFST+6,sp)
 391  0012 a580          	bcp	a,#128
 392  0014 271d          	jreq	L771
 393                     ; 83         if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 395  0016 7b06          	ld	a,(OFST+6,sp)
 396  0018 a510          	bcp	a,#16
 397  001a 2706          	jreq	L102
 398                     ; 85             GPIOx->ODR |= (uint8_t)GPIO_Pin;
 400  001c f6            	ld	a,(x)
 401  001d 1a05          	or	a,(OFST+5,sp)
 402  001f f7            	ld	(x),a
 404  0020 2007          	jra	L302
 405  0022               L102:
 406                     ; 89             GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 408  0022 1e01          	ldw	x,(OFST+1,sp)
 409  0024 7b05          	ld	a,(OFST+5,sp)
 410  0026 43            	cpl	a
 411  0027 f4            	and	a,(x)
 412  0028 f7            	ld	(x),a
 413  0029               L302:
 414                     ; 92         GPIOx->DDR |= (uint8_t)GPIO_Pin;
 416  0029 1e01          	ldw	x,(OFST+1,sp)
 417  002b e602          	ld	a,(2,x)
 418  002d 1a05          	or	a,(OFST+5,sp)
 419  002f e702          	ld	(2,x),a
 421  0031 2009          	jra	L502
 422  0033               L771:
 423                     ; 97         GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 425  0033 1e01          	ldw	x,(OFST+1,sp)
 426  0035 7b05          	ld	a,(OFST+5,sp)
 427  0037 43            	cpl	a
 428  0038 e402          	and	a,(2,x)
 429  003a e702          	ld	(2,x),a
 430  003c               L502:
 431                     ; 104     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 433  003c 7b06          	ld	a,(OFST+6,sp)
 434  003e a540          	bcp	a,#64
 435  0040 270a          	jreq	L702
 436                     ; 106         GPIOx->CR1 |= (uint8_t)GPIO_Pin;
 438  0042 1e01          	ldw	x,(OFST+1,sp)
 439  0044 e603          	ld	a,(3,x)
 440  0046 1a05          	or	a,(OFST+5,sp)
 441  0048 e703          	ld	(3,x),a
 443  004a 2009          	jra	L112
 444  004c               L702:
 445                     ; 110         GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 447  004c 1e01          	ldw	x,(OFST+1,sp)
 448  004e 7b05          	ld	a,(OFST+5,sp)
 449  0050 43            	cpl	a
 450  0051 e403          	and	a,(3,x)
 451  0053 e703          	ld	(3,x),a
 452  0055               L112:
 453                     ; 117     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 455  0055 7b06          	ld	a,(OFST+6,sp)
 456  0057 a520          	bcp	a,#32
 457  0059 270a          	jreq	L312
 458                     ; 119         GPIOx->CR2 |= (uint8_t)GPIO_Pin;
 460  005b 1e01          	ldw	x,(OFST+1,sp)
 461  005d e604          	ld	a,(4,x)
 462  005f 1a05          	or	a,(OFST+5,sp)
 463  0061 e704          	ld	(4,x),a
 465  0063 2009          	jra	L512
 466  0065               L312:
 467                     ; 123         GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 469  0065 1e01          	ldw	x,(OFST+1,sp)
 470  0067 7b05          	ld	a,(OFST+5,sp)
 471  0069 43            	cpl	a
 472  006a e404          	and	a,(4,x)
 473  006c e704          	ld	(4,x),a
 474  006e               L512:
 475                     ; 125 }
 478  006e 85            	popw	x
 479  006f 81            	ret
 525                     ; 135 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t PortVal)
 525                     ; 136 {
 526                     	switch	.text
 527  0070               _GPIO_Write:
 529  0070 89            	pushw	x
 530       00000000      OFST:	set	0
 533                     ; 137     GPIOx->ODR = PortVal;
 535  0071 7b05          	ld	a,(OFST+5,sp)
 536  0073 1e01          	ldw	x,(OFST+1,sp)
 537  0075 f7            	ld	(x),a
 538                     ; 138 }
 541  0076 85            	popw	x
 542  0077 81            	ret
 589                     ; 148 void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 589                     ; 149 {
 590                     	switch	.text
 591  0078               _GPIO_WriteHigh:
 593  0078 89            	pushw	x
 594       00000000      OFST:	set	0
 597                     ; 150     GPIOx->ODR |= (uint8_t)PortPins;
 599  0079 f6            	ld	a,(x)
 600  007a 1a05          	or	a,(OFST+5,sp)
 601  007c f7            	ld	(x),a
 602                     ; 151 }
 605  007d 85            	popw	x
 606  007e 81            	ret
 653                     ; 161 void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 653                     ; 162 {
 654                     	switch	.text
 655  007f               _GPIO_WriteLow:
 657  007f 89            	pushw	x
 658       00000000      OFST:	set	0
 661                     ; 163     GPIOx->ODR &= (uint8_t)(~PortPins);
 663  0080 7b05          	ld	a,(OFST+5,sp)
 664  0082 43            	cpl	a
 665  0083 f4            	and	a,(x)
 666  0084 f7            	ld	(x),a
 667                     ; 164 }
 670  0085 85            	popw	x
 671  0086 81            	ret
 718                     ; 174 void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 718                     ; 175 {
 719                     	switch	.text
 720  0087               _GPIO_WriteReverse:
 722  0087 89            	pushw	x
 723       00000000      OFST:	set	0
 726                     ; 176     GPIOx->ODR ^= (uint8_t)PortPins;
 728  0088 f6            	ld	a,(x)
 729  0089 1805          	xor	a,	(OFST+5,sp)
 730  008b f7            	ld	(x),a
 731                     ; 177 }
 734  008c 85            	popw	x
 735  008d 81            	ret
 773                     ; 185 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
 773                     ; 186 {
 774                     	switch	.text
 775  008e               _GPIO_ReadOutputData:
 779                     ; 187     return ((uint8_t)GPIOx->ODR);
 781  008e f6            	ld	a,(x)
 784  008f 81            	ret
 821                     ; 196 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 821                     ; 197 {
 822                     	switch	.text
 823  0090               _GPIO_ReadInputData:
 827                     ; 198     return ((uint8_t)GPIOx->IDR);
 829  0090 e601          	ld	a,(1,x)
 832  0092 81            	ret
 910                     ; 207 BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
 910                     ; 208 {
 911                     	switch	.text
 912  0093               _GPIO_ReadInputPin:
 914  0093 89            	pushw	x
 915  0094 88            	push	a
 916       00000001      OFST:	set	1
 919                     ; 209    BitStatus bitData = RESET;
 921                     ; 211 	 if((GPIOx->IDR & (uint8_t)GPIO_Pin) == (uint8_t)GPIO_Pin){
 923  0095 e601          	ld	a,(1,x)
 924  0097 1406          	and	a,(OFST+5,sp)
 925  0099 1106          	cp	a,(OFST+5,sp)
 926  009b 2606          	jrne	L734
 927                     ; 213 		 bitData = SET;
 929  009d a601          	ld	a,#1
 930  009f 6b01          	ld	(OFST+0,sp),a
 933  00a1 2002          	jra	L144
 934  00a3               L734:
 935                     ; 217 		 bitData = RESET;
 937  00a3 0f01          	clr	(OFST+0,sp)
 939  00a5               L144:
 940                     ; 221 	 return bitData;
 942  00a5 7b01          	ld	a,(OFST+0,sp)
 945  00a7 5b03          	addw	sp,#3
 946  00a9 81            	ret
1024                     ; 231 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
1024                     ; 232 {
1025                     	switch	.text
1026  00aa               _GPIO_ExternalPullUpConfig:
1028  00aa 89            	pushw	x
1029       00000000      OFST:	set	0
1032                     ; 234     assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
1034                     ; 235     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1036                     ; 237     if (NewState != DISABLE) /* External Pull-Up Set*/
1038  00ab 0d06          	tnz	(OFST+6,sp)
1039  00ad 2708          	jreq	L305
1040                     ; 239         GPIOx->CR1 |= (uint8_t)GPIO_Pin;
1042  00af e603          	ld	a,(3,x)
1043  00b1 1a05          	or	a,(OFST+5,sp)
1044  00b3 e703          	ld	(3,x),a
1046  00b5 2009          	jra	L505
1047  00b7               L305:
1048                     ; 242         GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
1050  00b7 1e01          	ldw	x,(OFST+1,sp)
1051  00b9 7b05          	ld	a,(OFST+5,sp)
1052  00bb 43            	cpl	a
1053  00bc e403          	and	a,(3,x)
1054  00be e703          	ld	(3,x),a
1055  00c0               L505:
1056                     ; 244 }
1059  00c0 85            	popw	x
1060  00c1 81            	ret
1073                     	xdef	_GPIO_ExternalPullUpConfig
1074                     	xdef	_GPIO_ReadInputPin
1075                     	xdef	_GPIO_ReadOutputData
1076                     	xdef	_GPIO_ReadInputData
1077                     	xdef	_GPIO_WriteReverse
1078                     	xdef	_GPIO_WriteLow
1079                     	xdef	_GPIO_WriteHigh
1080                     	xdef	_GPIO_Write
1081                     	xdef	_GPIO_Init
1082                     	xdef	_GPIO_DeInit
1101                     	end
