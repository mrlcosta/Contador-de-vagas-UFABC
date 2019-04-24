   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  42                     ; 47 void UART2_DeInit(void)
  42                     ; 48 {
  44                     	switch	.text
  45  0000               _UART2_DeInit:
  49                     ; 51     (void) UART2->SR;
  51  0000 c65240        	ld	a,21056
  52                     ; 52     (void)UART2->DR;
  54  0003 c65241        	ld	a,21057
  55                     ; 54     UART2->BRR2 = UART2_BRR2_RESET_VALUE;  /*  Set UART2_BRR2 to reset value 0x00 */
  57  0006 725f5243      	clr	21059
  58                     ; 55     UART2->BRR1 = UART2_BRR1_RESET_VALUE;  /*  Set UART2_BRR1 to reset value 0x00 */
  60  000a 725f5242      	clr	21058
  61                     ; 57     UART2->CR1 = UART2_CR1_RESET_VALUE; /*  Set UART2_CR1 to reset value 0x00  */
  63  000e 725f5244      	clr	21060
  64                     ; 58     UART2->CR2 = UART2_CR2_RESET_VALUE; /*  Set UART2_CR2 to reset value 0x00  */
  66  0012 725f5245      	clr	21061
  67                     ; 59     UART2->CR3 = UART2_CR3_RESET_VALUE; /*  Set UART2_CR3 to reset value 0x00  */
  69  0016 725f5246      	clr	21062
  70                     ; 60     UART2->CR4 = UART2_CR4_RESET_VALUE; /*  Set UART2_CR4 to reset value 0x00  */
  72  001a 725f5247      	clr	21063
  73                     ; 61     UART2->CR5 = UART2_CR5_RESET_VALUE; /*  Set UART2_CR5 to reset value 0x00  */
  75  001e 725f5248      	clr	21064
  76                     ; 62     UART2->CR6 = UART2_CR6_RESET_VALUE; /*  Set UART2_CR6 to reset value 0x00  */
  78  0022 725f5249      	clr	21065
  79                     ; 64 }
  82  0026 81            	ret
 403                     .const:	section	.text
 404  0000               L01:
 405  0000 00000064      	dc.l	100
 406                     ; 80 void UART2_Init(uint32_t BaudRate, UART2_WordLength_TypeDef WordLength, UART2_StopBits_TypeDef StopBits, UART2_Parity_TypeDef Parity, UART2_SyncMode_TypeDef SyncMode, UART2_Mode_TypeDef Mode)
 406                     ; 81 {
 407                     	switch	.text
 408  0027               _UART2_Init:
 410  0027 520e          	subw	sp,#14
 411       0000000e      OFST:	set	14
 414                     ; 82     uint8_t BRR2_1 = 0, BRR2_2 = 0;
 418                     ; 83     uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
 422                     ; 86     assert_param(IS_UART2_BAUDRATE_OK(BaudRate));
 424                     ; 87     assert_param(IS_UART2_WORDLENGTH_OK(WordLength));
 426                     ; 88     assert_param(IS_UART2_STOPBITS_OK(StopBits));
 428                     ; 89     assert_param(IS_UART2_PARITY_OK(Parity));
 430                     ; 90     assert_param(IS_UART2_MODE_OK((uint8_t)Mode));
 432                     ; 91     assert_param(IS_UART2_SYNCMODE_OK((uint8_t)SyncMode));
 434                     ; 94     UART2->CR1 &= (uint8_t)(~UART2_CR1_M);
 436  0029 72195244      	bres	21060,#4
 437                     ; 96     UART2->CR1 |= (uint8_t)WordLength; 
 439  002d c65244        	ld	a,21060
 440  0030 1a15          	or	a,(OFST+7,sp)
 441  0032 c75244        	ld	21060,a
 442                     ; 99     UART2->CR3 &= (uint8_t)(~UART2_CR3_STOP);
 444  0035 c65246        	ld	a,21062
 445  0038 a4cf          	and	a,#207
 446  003a c75246        	ld	21062,a
 447                     ; 101     UART2->CR3 |= (uint8_t)StopBits; 
 449  003d c65246        	ld	a,21062
 450  0040 1a16          	or	a,(OFST+8,sp)
 451  0042 c75246        	ld	21062,a
 452                     ; 104     UART2->CR1 &= (uint8_t)(~(UART2_CR1_PCEN | UART2_CR1_PS  ));
 454  0045 c65244        	ld	a,21060
 455  0048 a4f9          	and	a,#249
 456  004a c75244        	ld	21060,a
 457                     ; 106     UART2->CR1 |= (uint8_t)Parity;
 459  004d c65244        	ld	a,21060
 460  0050 1a17          	or	a,(OFST+9,sp)
 461  0052 c75244        	ld	21060,a
 462                     ; 109     UART2->BRR1 &= (uint8_t)(~UART2_BRR1_DIVM);
 464  0055 725f5242      	clr	21058
 465                     ; 111     UART2->BRR2 &= (uint8_t)(~UART2_BRR2_DIVM);
 467  0059 c65243        	ld	a,21059
 468  005c a40f          	and	a,#15
 469  005e c75243        	ld	21059,a
 470                     ; 113     UART2->BRR2 &= (uint8_t)(~UART2_BRR2_DIVF);
 472  0061 c65243        	ld	a,21059
 473  0064 a4f0          	and	a,#240
 474  0066 c75243        	ld	21059,a
 475                     ; 116     BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
 477  0069 96            	ldw	x,sp
 478  006a 1c0011        	addw	x,#OFST+3
 479  006d cd0000        	call	c_ltor
 481  0070 a604          	ld	a,#4
 482  0072 cd0000        	call	c_llsh
 484  0075 96            	ldw	x,sp
 485  0076 1c0001        	addw	x,#OFST-13
 486  0079 cd0000        	call	c_rtol
 489  007c cd0000        	call	_CLK_GetClockFreq
 491  007f 96            	ldw	x,sp
 492  0080 1c0001        	addw	x,#OFST-13
 493  0083 cd0000        	call	c_ludv
 495  0086 96            	ldw	x,sp
 496  0087 1c000b        	addw	x,#OFST-3
 497  008a cd0000        	call	c_rtol
 500                     ; 117     BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 502  008d 96            	ldw	x,sp
 503  008e 1c0011        	addw	x,#OFST+3
 504  0091 cd0000        	call	c_ltor
 506  0094 a604          	ld	a,#4
 507  0096 cd0000        	call	c_llsh
 509  0099 96            	ldw	x,sp
 510  009a 1c0001        	addw	x,#OFST-13
 511  009d cd0000        	call	c_rtol
 514  00a0 cd0000        	call	_CLK_GetClockFreq
 516  00a3 a664          	ld	a,#100
 517  00a5 cd0000        	call	c_smul
 519  00a8 96            	ldw	x,sp
 520  00a9 1c0001        	addw	x,#OFST-13
 521  00ac cd0000        	call	c_ludv
 523  00af 96            	ldw	x,sp
 524  00b0 1c0007        	addw	x,#OFST-7
 525  00b3 cd0000        	call	c_rtol
 528                     ; 121     BRR2_1 = (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100))
 528                     ; 122                         << 4) / 100) & (uint8_t)0x0F); 
 530  00b6 96            	ldw	x,sp
 531  00b7 1c000b        	addw	x,#OFST-3
 532  00ba cd0000        	call	c_ltor
 534  00bd a664          	ld	a,#100
 535  00bf cd0000        	call	c_smul
 537  00c2 96            	ldw	x,sp
 538  00c3 1c0001        	addw	x,#OFST-13
 539  00c6 cd0000        	call	c_rtol
 542  00c9 96            	ldw	x,sp
 543  00ca 1c0007        	addw	x,#OFST-7
 544  00cd cd0000        	call	c_ltor
 546  00d0 96            	ldw	x,sp
 547  00d1 1c0001        	addw	x,#OFST-13
 548  00d4 cd0000        	call	c_lsub
 550  00d7 a604          	ld	a,#4
 551  00d9 cd0000        	call	c_llsh
 553  00dc ae0000        	ldw	x,#L01
 554  00df cd0000        	call	c_ludv
 556  00e2 b603          	ld	a,c_lreg+3
 557  00e4 a40f          	and	a,#15
 558  00e6 6b05          	ld	(OFST-9,sp),a
 560                     ; 123     BRR2_2 = (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0);
 562  00e8 96            	ldw	x,sp
 563  00e9 1c000b        	addw	x,#OFST-3
 564  00ec cd0000        	call	c_ltor
 566  00ef a604          	ld	a,#4
 567  00f1 cd0000        	call	c_lursh
 569  00f4 b603          	ld	a,c_lreg+3
 570  00f6 a4f0          	and	a,#240
 571  00f8 b703          	ld	c_lreg+3,a
 572  00fa 3f02          	clr	c_lreg+2
 573  00fc 3f01          	clr	c_lreg+1
 574  00fe 3f00          	clr	c_lreg
 575  0100 b603          	ld	a,c_lreg+3
 576  0102 6b06          	ld	(OFST-8,sp),a
 578                     ; 125     UART2->BRR2 = (uint8_t)(BRR2_1 | BRR2_2);
 580  0104 7b05          	ld	a,(OFST-9,sp)
 581  0106 1a06          	or	a,(OFST-8,sp)
 582  0108 c75243        	ld	21059,a
 583                     ; 127     UART2->BRR1 = (uint8_t)BaudRate_Mantissa;           
 585  010b 7b0e          	ld	a,(OFST+0,sp)
 586  010d c75242        	ld	21058,a
 587                     ; 130     UART2->CR2 &= (uint8_t)~(UART2_CR2_TEN | UART2_CR2_REN);
 589  0110 c65245        	ld	a,21061
 590  0113 a4f3          	and	a,#243
 591  0115 c75245        	ld	21061,a
 592                     ; 132     UART2->CR3 &= (uint8_t)~(UART2_CR3_CPOL | UART2_CR3_CPHA | UART2_CR3_LBCL);
 594  0118 c65246        	ld	a,21062
 595  011b a4f8          	and	a,#248
 596  011d c75246        	ld	21062,a
 597                     ; 134     UART2->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART2_CR3_CPOL | \
 597                     ; 135                                               UART2_CR3_CPHA | UART2_CR3_LBCL));
 599  0120 7b18          	ld	a,(OFST+10,sp)
 600  0122 a407          	and	a,#7
 601  0124 ca5246        	or	a,21062
 602  0127 c75246        	ld	21062,a
 603                     ; 137     if ((uint8_t)(Mode & UART2_MODE_TX_ENABLE))
 605  012a 7b19          	ld	a,(OFST+11,sp)
 606  012c a504          	bcp	a,#4
 607  012e 2706          	jreq	L302
 608                     ; 140         UART2->CR2 |= (uint8_t)UART2_CR2_TEN;
 610  0130 72165245      	bset	21061,#3
 612  0134 2004          	jra	L502
 613  0136               L302:
 614                     ; 145         UART2->CR2 &= (uint8_t)(~UART2_CR2_TEN);
 616  0136 72175245      	bres	21061,#3
 617  013a               L502:
 618                     ; 147     if ((uint8_t)(Mode & UART2_MODE_RX_ENABLE))
 620  013a 7b19          	ld	a,(OFST+11,sp)
 621  013c a508          	bcp	a,#8
 622  013e 2706          	jreq	L702
 623                     ; 150         UART2->CR2 |= (uint8_t)UART2_CR2_REN;
 625  0140 72145245      	bset	21061,#2
 627  0144 2004          	jra	L112
 628  0146               L702:
 629                     ; 155         UART2->CR2 &= (uint8_t)(~UART2_CR2_REN);
 631  0146 72155245      	bres	21061,#2
 632  014a               L112:
 633                     ; 159     if ((uint8_t)(SyncMode & UART2_SYNCMODE_CLOCK_DISABLE))
 635  014a 7b18          	ld	a,(OFST+10,sp)
 636  014c a580          	bcp	a,#128
 637  014e 2706          	jreq	L312
 638                     ; 162         UART2->CR3 &= (uint8_t)(~UART2_CR3_CKEN); 
 640  0150 72175246      	bres	21062,#3
 642  0154 200a          	jra	L512
 643  0156               L312:
 644                     ; 166         UART2->CR3 |= (uint8_t)((uint8_t)SyncMode & UART2_CR3_CKEN);
 646  0156 7b18          	ld	a,(OFST+10,sp)
 647  0158 a408          	and	a,#8
 648  015a ca5246        	or	a,21062
 649  015d c75246        	ld	21062,a
 650  0160               L512:
 651                     ; 168 }
 654  0160 5b0e          	addw	sp,#14
 655  0162 81            	ret
 710                     ; 176 void UART2_Cmd(FunctionalState NewState)
 710                     ; 177 {
 711                     	switch	.text
 712  0163               _UART2_Cmd:
 716                     ; 179     if (NewState != DISABLE)
 718  0163 4d            	tnz	a
 719  0164 2706          	jreq	L542
 720                     ; 182         UART2->CR1 &= (uint8_t)(~UART2_CR1_UARTD);
 722  0166 721b5244      	bres	21060,#5
 724  016a 2004          	jra	L742
 725  016c               L542:
 726                     ; 187         UART2->CR1 |= UART2_CR1_UARTD; 
 728  016c 721a5244      	bset	21060,#5
 729  0170               L742:
 730                     ; 189 }
 733  0170 81            	ret
 865                     ; 206 void UART2_ITConfig(UART2_IT_TypeDef UART2_IT, FunctionalState NewState)
 865                     ; 207 {
 866                     	switch	.text
 867  0171               _UART2_ITConfig:
 869  0171 89            	pushw	x
 870  0172 89            	pushw	x
 871       00000002      OFST:	set	2
 874                     ; 208     uint8_t uartreg = 0, itpos = 0x00;
 878                     ; 211     assert_param(IS_UART2_CONFIG_IT_OK(UART2_IT));
 880                     ; 212     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 882                     ; 215     uartreg = (uint8_t)((uint16_t)UART2_IT >> 0x08);
 884  0173 9e            	ld	a,xh
 885  0174 6b01          	ld	(OFST-1,sp),a
 887                     ; 218     itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART2_IT & (uint8_t)0x0F));
 889  0176 9f            	ld	a,xl
 890  0177 a40f          	and	a,#15
 891  0179 5f            	clrw	x
 892  017a 97            	ld	xl,a
 893  017b a601          	ld	a,#1
 894  017d 5d            	tnzw	x
 895  017e 2704          	jreq	L61
 896  0180               L02:
 897  0180 48            	sll	a
 898  0181 5a            	decw	x
 899  0182 26fc          	jrne	L02
 900  0184               L61:
 901  0184 6b02          	ld	(OFST+0,sp),a
 903                     ; 220     if (NewState != DISABLE)
 905  0186 0d07          	tnz	(OFST+5,sp)
 906  0188 273a          	jreq	L133
 907                     ; 223         if (uartreg == 0x01)
 909  018a 7b01          	ld	a,(OFST-1,sp)
 910  018c a101          	cp	a,#1
 911  018e 260a          	jrne	L333
 912                     ; 225             UART2->CR1 |= itpos;
 914  0190 c65244        	ld	a,21060
 915  0193 1a02          	or	a,(OFST+0,sp)
 916  0195 c75244        	ld	21060,a
 918  0198 2066          	jra	L743
 919  019a               L333:
 920                     ; 227         else if (uartreg == 0x02)
 922  019a 7b01          	ld	a,(OFST-1,sp)
 923  019c a102          	cp	a,#2
 924  019e 260a          	jrne	L733
 925                     ; 229             UART2->CR2 |= itpos;
 927  01a0 c65245        	ld	a,21061
 928  01a3 1a02          	or	a,(OFST+0,sp)
 929  01a5 c75245        	ld	21061,a
 931  01a8 2056          	jra	L743
 932  01aa               L733:
 933                     ; 231         else if (uartreg == 0x03)
 935  01aa 7b01          	ld	a,(OFST-1,sp)
 936  01ac a103          	cp	a,#3
 937  01ae 260a          	jrne	L343
 938                     ; 233             UART2->CR4 |= itpos;
 940  01b0 c65247        	ld	a,21063
 941  01b3 1a02          	or	a,(OFST+0,sp)
 942  01b5 c75247        	ld	21063,a
 944  01b8 2046          	jra	L743
 945  01ba               L343:
 946                     ; 237             UART2->CR6 |= itpos;
 948  01ba c65249        	ld	a,21065
 949  01bd 1a02          	or	a,(OFST+0,sp)
 950  01bf c75249        	ld	21065,a
 951  01c2 203c          	jra	L743
 952  01c4               L133:
 953                     ; 243         if (uartreg == 0x01)
 955  01c4 7b01          	ld	a,(OFST-1,sp)
 956  01c6 a101          	cp	a,#1
 957  01c8 260b          	jrne	L153
 958                     ; 245             UART2->CR1 &= (uint8_t)(~itpos);
 960  01ca 7b02          	ld	a,(OFST+0,sp)
 961  01cc 43            	cpl	a
 962  01cd c45244        	and	a,21060
 963  01d0 c75244        	ld	21060,a
 965  01d3 202b          	jra	L743
 966  01d5               L153:
 967                     ; 247         else if (uartreg == 0x02)
 969  01d5 7b01          	ld	a,(OFST-1,sp)
 970  01d7 a102          	cp	a,#2
 971  01d9 260b          	jrne	L553
 972                     ; 249             UART2->CR2 &= (uint8_t)(~itpos);
 974  01db 7b02          	ld	a,(OFST+0,sp)
 975  01dd 43            	cpl	a
 976  01de c45245        	and	a,21061
 977  01e1 c75245        	ld	21061,a
 979  01e4 201a          	jra	L743
 980  01e6               L553:
 981                     ; 251         else if (uartreg == 0x03)
 983  01e6 7b01          	ld	a,(OFST-1,sp)
 984  01e8 a103          	cp	a,#3
 985  01ea 260b          	jrne	L163
 986                     ; 253             UART2->CR4 &= (uint8_t)(~itpos);
 988  01ec 7b02          	ld	a,(OFST+0,sp)
 989  01ee 43            	cpl	a
 990  01ef c45247        	and	a,21063
 991  01f2 c75247        	ld	21063,a
 993  01f5 2009          	jra	L743
 994  01f7               L163:
 995                     ; 257             UART2->CR6 &= (uint8_t)(~itpos);
 997  01f7 7b02          	ld	a,(OFST+0,sp)
 998  01f9 43            	cpl	a
 999  01fa c45249        	and	a,21065
1000  01fd c75249        	ld	21065,a
1001  0200               L743:
1002                     ; 260 }
1005  0200 5b04          	addw	sp,#4
1006  0202 81            	ret
1063                     ; 267 void UART2_IrDAConfig(UART2_IrDAMode_TypeDef UART2_IrDAMode)
1063                     ; 268 {
1064                     	switch	.text
1065  0203               _UART2_IrDAConfig:
1069                     ; 269     assert_param(IS_UART2_IRDAMODE_OK(UART2_IrDAMode));
1071                     ; 271     if (UART2_IrDAMode != UART2_IRDAMODE_NORMAL)
1073  0203 4d            	tnz	a
1074  0204 2706          	jreq	L314
1075                     ; 273         UART2->CR5 |= UART2_CR5_IRLP;
1077  0206 72145248      	bset	21064,#2
1079  020a 2004          	jra	L514
1080  020c               L314:
1081                     ; 277         UART2->CR5 &= ((uint8_t)~UART2_CR5_IRLP);
1083  020c 72155248      	bres	21064,#2
1084  0210               L514:
1085                     ; 279 }
1088  0210 81            	ret
1123                     ; 287 void UART2_IrDACmd(FunctionalState NewState)
1123                     ; 288 {
1124                     	switch	.text
1125  0211               _UART2_IrDACmd:
1129                     ; 290     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1131                     ; 292     if (NewState != DISABLE)
1133  0211 4d            	tnz	a
1134  0212 2706          	jreq	L534
1135                     ; 295         UART2->CR5 |= UART2_CR5_IREN;
1137  0214 72125248      	bset	21064,#1
1139  0218 2004          	jra	L734
1140  021a               L534:
1141                     ; 300         UART2->CR5 &= ((uint8_t)~UART2_CR5_IREN);
1143  021a 72135248      	bres	21064,#1
1144  021e               L734:
1145                     ; 302 }
1148  021e 81            	ret
1207                     ; 311 void UART2_LINBreakDetectionConfig(UART2_LINBreakDetectionLength_TypeDef UART2_LINBreakDetectionLength)
1207                     ; 312 {
1208                     	switch	.text
1209  021f               _UART2_LINBreakDetectionConfig:
1213                     ; 314     assert_param(IS_UART2_LINBREAKDETECTIONLENGTH_OK(UART2_LINBreakDetectionLength));
1215                     ; 316     if (UART2_LINBreakDetectionLength != UART2_LINBREAKDETECTIONLENGTH_10BITS)
1217  021f 4d            	tnz	a
1218  0220 2706          	jreq	L764
1219                     ; 318         UART2->CR4 |= UART2_CR4_LBDL;
1221  0222 721a5247      	bset	21063,#5
1223  0226 2004          	jra	L174
1224  0228               L764:
1225                     ; 322         UART2->CR4 &= ((uint8_t)~UART2_CR4_LBDL);
1227  0228 721b5247      	bres	21063,#5
1228  022c               L174:
1229                     ; 324 }
1232  022c 81            	ret
1353                     ; 336 void UART2_LINConfig(UART2_LinMode_TypeDef UART2_Mode, 
1353                     ; 337                      UART2_LinAutosync_TypeDef UART2_Autosync, 
1353                     ; 338                      UART2_LinDivUp_TypeDef UART2_DivUp)
1353                     ; 339 {
1354                     	switch	.text
1355  022d               _UART2_LINConfig:
1357  022d 89            	pushw	x
1358       00000000      OFST:	set	0
1361                     ; 341     assert_param(IS_UART2_SLAVE_OK(UART2_Mode));
1363                     ; 342     assert_param(IS_UART2_AUTOSYNC_OK(UART2_Autosync));
1365                     ; 343     assert_param(IS_UART2_DIVUP_OK(UART2_DivUp));
1367                     ; 345     if (UART2_Mode != UART2_LIN_MODE_MASTER)
1369  022e 9e            	ld	a,xh
1370  022f 4d            	tnz	a
1371  0230 2706          	jreq	L155
1372                     ; 347         UART2->CR6 |=  UART2_CR6_LSLV;
1374  0232 721a5249      	bset	21065,#5
1376  0236 2004          	jra	L355
1377  0238               L155:
1378                     ; 351         UART2->CR6 &= ((uint8_t)~UART2_CR6_LSLV);
1380  0238 721b5249      	bres	21065,#5
1381  023c               L355:
1382                     ; 354     if (UART2_Autosync != UART2_LIN_AUTOSYNC_DISABLE)
1384  023c 0d02          	tnz	(OFST+2,sp)
1385  023e 2706          	jreq	L555
1386                     ; 356         UART2->CR6 |=  UART2_CR6_LASE ;
1388  0240 72185249      	bset	21065,#4
1390  0244 2004          	jra	L755
1391  0246               L555:
1392                     ; 360         UART2->CR6 &= ((uint8_t)~ UART2_CR6_LASE );
1394  0246 72195249      	bres	21065,#4
1395  024a               L755:
1396                     ; 363     if (UART2_DivUp != UART2_LIN_DIVUP_LBRR1)
1398  024a 0d05          	tnz	(OFST+5,sp)
1399  024c 2706          	jreq	L165
1400                     ; 365         UART2->CR6 |=  UART2_CR6_LDUM;
1402  024e 721e5249      	bset	21065,#7
1404  0252 2004          	jra	L365
1405  0254               L165:
1406                     ; 369         UART2->CR6 &= ((uint8_t)~ UART2_CR6_LDUM);
1408  0254 721f5249      	bres	21065,#7
1409  0258               L365:
1410                     ; 371 }
1413  0258 85            	popw	x
1414  0259 81            	ret
1449                     ; 379 void UART2_LINCmd(FunctionalState NewState)
1449                     ; 380 {
1450                     	switch	.text
1451  025a               _UART2_LINCmd:
1455                     ; 381     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1457                     ; 383     if (NewState != DISABLE)
1459  025a 4d            	tnz	a
1460  025b 2706          	jreq	L306
1461                     ; 386         UART2->CR3 |= UART2_CR3_LINEN;
1463  025d 721c5246      	bset	21062,#6
1465  0261 2004          	jra	L506
1466  0263               L306:
1467                     ; 391         UART2->CR3 &= ((uint8_t)~UART2_CR3_LINEN);
1469  0263 721d5246      	bres	21062,#6
1470  0267               L506:
1471                     ; 393 }
1474  0267 81            	ret
1509                     ; 400 void UART2_SmartCardCmd(FunctionalState NewState)
1509                     ; 401 {
1510                     	switch	.text
1511  0268               _UART2_SmartCardCmd:
1515                     ; 403     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1517                     ; 405     if (NewState != DISABLE)
1519  0268 4d            	tnz	a
1520  0269 2706          	jreq	L526
1521                     ; 408         UART2->CR5 |= UART2_CR5_SCEN;
1523  026b 721a5248      	bset	21064,#5
1525  026f 2004          	jra	L726
1526  0271               L526:
1527                     ; 413         UART2->CR5 &= ((uint8_t)(~UART2_CR5_SCEN));
1529  0271 721b5248      	bres	21064,#5
1530  0275               L726:
1531                     ; 415 }
1534  0275 81            	ret
1570                     ; 423 void UART2_SmartCardNACKCmd(FunctionalState NewState)
1570                     ; 424 {
1571                     	switch	.text
1572  0276               _UART2_SmartCardNACKCmd:
1576                     ; 426     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1578                     ; 428     if (NewState != DISABLE)
1580  0276 4d            	tnz	a
1581  0277 2706          	jreq	L746
1582                     ; 431         UART2->CR5 |= UART2_CR5_NACK;
1584  0279 72185248      	bset	21064,#4
1586  027d 2004          	jra	L156
1587  027f               L746:
1588                     ; 436         UART2->CR5 &= ((uint8_t)~(UART2_CR5_NACK));
1590  027f 72195248      	bres	21064,#4
1591  0283               L156:
1592                     ; 438 }
1595  0283 81            	ret
1652                     ; 446 void UART2_WakeUpConfig(UART2_WakeUp_TypeDef UART2_WakeUp)
1652                     ; 447 {
1653                     	switch	.text
1654  0284               _UART2_WakeUpConfig:
1658                     ; 448     assert_param(IS_UART2_WAKEUP_OK(UART2_WakeUp));
1660                     ; 450     UART2->CR1 &= ((uint8_t)~UART2_CR1_WAKE);
1662  0284 72175244      	bres	21060,#3
1663                     ; 451     UART2->CR1 |= (uint8_t)UART2_WakeUp;
1665  0288 ca5244        	or	a,21060
1666  028b c75244        	ld	21060,a
1667                     ; 452 }
1670  028e 81            	ret
1706                     ; 460 void UART2_ReceiverWakeUpCmd(FunctionalState NewState)
1706                     ; 461 {
1707                     	switch	.text
1708  028f               _UART2_ReceiverWakeUpCmd:
1712                     ; 462     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1714                     ; 464     if (NewState != DISABLE)
1716  028f 4d            	tnz	a
1717  0290 2706          	jreq	L717
1718                     ; 467         UART2->CR2 |= UART2_CR2_RWU;
1720  0292 72125245      	bset	21061,#1
1722  0296 2004          	jra	L127
1723  0298               L717:
1724                     ; 472         UART2->CR2 &= ((uint8_t)~UART2_CR2_RWU);
1726  0298 72135245      	bres	21061,#1
1727  029c               L127:
1728                     ; 474 }
1731  029c 81            	ret
1754                     ; 481 uint8_t UART2_ReceiveData8(void)
1754                     ; 482 {
1755                     	switch	.text
1756  029d               _UART2_ReceiveData8:
1760                     ; 483     return ((uint8_t)UART2->DR);
1762  029d c65241        	ld	a,21057
1765  02a0 81            	ret
1799                     ; 491 uint16_t UART2_ReceiveData9(void)
1799                     ; 492 {
1800                     	switch	.text
1801  02a1               _UART2_ReceiveData9:
1803  02a1 89            	pushw	x
1804       00000002      OFST:	set	2
1807                     ; 493   uint16_t temp = 0;
1809                     ; 495   temp = ((uint16_t)(((uint16_t)((uint16_t)UART2->CR1 & (uint16_t)UART2_CR1_R8)) << 1));
1811  02a2 c65244        	ld	a,21060
1812  02a5 5f            	clrw	x
1813  02a6 a480          	and	a,#128
1814  02a8 5f            	clrw	x
1815  02a9 02            	rlwa	x,a
1816  02aa 58            	sllw	x
1817  02ab 1f01          	ldw	(OFST-1,sp),x
1819                     ; 497   return (uint16_t)((((uint16_t)UART2->DR) | temp) & ((uint16_t)0x01FF));
1821  02ad c65241        	ld	a,21057
1822  02b0 5f            	clrw	x
1823  02b1 97            	ld	xl,a
1824  02b2 01            	rrwa	x,a
1825  02b3 1a02          	or	a,(OFST+0,sp)
1826  02b5 01            	rrwa	x,a
1827  02b6 1a01          	or	a,(OFST-1,sp)
1828  02b8 01            	rrwa	x,a
1829  02b9 01            	rrwa	x,a
1830  02ba a4ff          	and	a,#255
1831  02bc 01            	rrwa	x,a
1832  02bd a401          	and	a,#1
1833  02bf 01            	rrwa	x,a
1836  02c0 5b02          	addw	sp,#2
1837  02c2 81            	ret
1871                     ; 505 void UART2_SendData8(uint8_t Data)
1871                     ; 506 {
1872                     	switch	.text
1873  02c3               _UART2_SendData8:
1877                     ; 508     UART2->DR = Data;
1879  02c3 c75241        	ld	21057,a
1880                     ; 509 }
1883  02c6 81            	ret
1917                     ; 516 void UART2_SendData9(uint16_t Data)
1917                     ; 517 {
1918                     	switch	.text
1919  02c7               _UART2_SendData9:
1921  02c7 89            	pushw	x
1922       00000000      OFST:	set	0
1925                     ; 519     UART2->CR1 &= ((uint8_t)~UART2_CR1_T8);                  
1927  02c8 721d5244      	bres	21060,#6
1928                     ; 522     UART2->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART2_CR1_T8); 
1930  02cc 54            	srlw	x
1931  02cd 54            	srlw	x
1932  02ce 9f            	ld	a,xl
1933  02cf a440          	and	a,#64
1934  02d1 ca5244        	or	a,21060
1935  02d4 c75244        	ld	21060,a
1936                     ; 525     UART2->DR   = (uint8_t)(Data);                    
1938  02d7 7b02          	ld	a,(OFST+2,sp)
1939  02d9 c75241        	ld	21057,a
1940                     ; 527 }
1943  02dc 85            	popw	x
1944  02dd 81            	ret
1967                     ; 534 void UART2_SendBreak(void)
1967                     ; 535 {
1968                     	switch	.text
1969  02de               _UART2_SendBreak:
1973                     ; 536     UART2->CR2 |= UART2_CR2_SBK;
1975  02de 72105245      	bset	21061,#0
1976                     ; 537 }
1979  02e2 81            	ret
2013                     ; 544 void UART2_SetAddress(uint8_t UART2_Address)
2013                     ; 545 {
2014                     	switch	.text
2015  02e3               _UART2_SetAddress:
2017  02e3 88            	push	a
2018       00000000      OFST:	set	0
2021                     ; 547     assert_param(IS_UART2_ADDRESS_OK(UART2_Address));
2023                     ; 550     UART2->CR4 &= ((uint8_t)~UART2_CR4_ADD);
2025  02e4 c65247        	ld	a,21063
2026  02e7 a4f0          	and	a,#240
2027  02e9 c75247        	ld	21063,a
2028                     ; 552     UART2->CR4 |= UART2_Address;
2030  02ec c65247        	ld	a,21063
2031  02ef 1a01          	or	a,(OFST+1,sp)
2032  02f1 c75247        	ld	21063,a
2033                     ; 553 }
2036  02f4 84            	pop	a
2037  02f5 81            	ret
2071                     ; 561 void UART2_SetGuardTime(uint8_t UART2_GuardTime)
2071                     ; 562 {
2072                     	switch	.text
2073  02f6               _UART2_SetGuardTime:
2077                     ; 564     UART2->GTR = UART2_GuardTime;
2079  02f6 c7524a        	ld	21066,a
2080                     ; 565 }
2083  02f9 81            	ret
2117                     ; 589 void UART2_SetPrescaler(uint8_t UART2_Prescaler)
2117                     ; 590 {
2118                     	switch	.text
2119  02fa               _UART2_SetPrescaler:
2123                     ; 592     UART2->PSCR = UART2_Prescaler;
2125  02fa c7524b        	ld	21067,a
2126                     ; 593 }
2129  02fd 81            	ret
2286                     ; 601 FlagStatus UART2_GetFlagStatus(UART2_Flag_TypeDef UART2_FLAG)
2286                     ; 602 {
2287                     	switch	.text
2288  02fe               _UART2_GetFlagStatus:
2290  02fe 89            	pushw	x
2291  02ff 88            	push	a
2292       00000001      OFST:	set	1
2295                     ; 603     FlagStatus status = RESET;
2297                     ; 606     assert_param(IS_UART2_FLAG_OK(UART2_FLAG));
2299                     ; 609     if (UART2_FLAG == UART2_FLAG_LBDF)
2301  0300 a30210        	cpw	x,#528
2302  0303 2610          	jrne	L5511
2303                     ; 611         if ((UART2->CR4 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2305  0305 9f            	ld	a,xl
2306  0306 c45247        	and	a,21063
2307  0309 2706          	jreq	L7511
2308                     ; 614             status = SET;
2310  030b a601          	ld	a,#1
2311  030d 6b01          	ld	(OFST+0,sp),a
2314  030f 2039          	jra	L3611
2315  0311               L7511:
2316                     ; 619             status = RESET;
2318  0311 0f01          	clr	(OFST+0,sp)
2320  0313 2035          	jra	L3611
2321  0315               L5511:
2322                     ; 622     else if (UART2_FLAG == UART2_FLAG_SBK)
2324  0315 1e02          	ldw	x,(OFST+1,sp)
2325  0317 a30101        	cpw	x,#257
2326  031a 2611          	jrne	L5611
2327                     ; 624         if ((UART2->CR2 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2329  031c c65245        	ld	a,21061
2330  031f 1503          	bcp	a,(OFST+2,sp)
2331  0321 2706          	jreq	L7611
2332                     ; 627             status = SET;
2334  0323 a601          	ld	a,#1
2335  0325 6b01          	ld	(OFST+0,sp),a
2338  0327 2021          	jra	L3611
2339  0329               L7611:
2340                     ; 632             status = RESET;
2342  0329 0f01          	clr	(OFST+0,sp)
2344  032b 201d          	jra	L3611
2345  032d               L5611:
2346                     ; 635     else if ((UART2_FLAG == UART2_FLAG_LHDF) || (UART2_FLAG == UART2_FLAG_LSF))
2348  032d 1e02          	ldw	x,(OFST+1,sp)
2349  032f a30302        	cpw	x,#770
2350  0332 2707          	jreq	L7711
2352  0334 1e02          	ldw	x,(OFST+1,sp)
2353  0336 a30301        	cpw	x,#769
2354  0339 2614          	jrne	L5711
2355  033b               L7711:
2356                     ; 637         if ((UART2->CR6 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2358  033b c65249        	ld	a,21065
2359  033e 1503          	bcp	a,(OFST+2,sp)
2360  0340 2706          	jreq	L1021
2361                     ; 640             status = SET;
2363  0342 a601          	ld	a,#1
2364  0344 6b01          	ld	(OFST+0,sp),a
2367  0346 2002          	jra	L3611
2368  0348               L1021:
2369                     ; 645             status = RESET;
2371  0348 0f01          	clr	(OFST+0,sp)
2373  034a               L3611:
2374                     ; 663     return  status;
2376  034a 7b01          	ld	a,(OFST+0,sp)
2379  034c 5b03          	addw	sp,#3
2380  034e 81            	ret
2381  034f               L5711:
2382                     ; 650         if ((UART2->SR & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2384  034f c65240        	ld	a,21056
2385  0352 1503          	bcp	a,(OFST+2,sp)
2386  0354 2706          	jreq	L7021
2387                     ; 653             status = SET;
2389  0356 a601          	ld	a,#1
2390  0358 6b01          	ld	(OFST+0,sp),a
2393  035a 20ee          	jra	L3611
2394  035c               L7021:
2395                     ; 658             status = RESET;
2397  035c 0f01          	clr	(OFST+0,sp)
2399  035e 20ea          	jra	L3611
2434                     ; 693 void UART2_ClearFlag(UART2_Flag_TypeDef UART2_FLAG)
2434                     ; 694 {
2435                     	switch	.text
2436  0360               _UART2_ClearFlag:
2438  0360 89            	pushw	x
2439       00000000      OFST:	set	0
2442                     ; 695     assert_param(IS_UART2_CLEAR_FLAG_OK(UART2_FLAG));
2444                     ; 698     if (UART2_FLAG == UART2_FLAG_RXNE)
2446  0361 a30020        	cpw	x,#32
2447  0364 2606          	jrne	L1321
2448                     ; 700         UART2->SR = (uint8_t)~(UART2_SR_RXNE);
2450  0366 35df5240      	mov	21056,#223
2452  036a 201e          	jra	L3321
2453  036c               L1321:
2454                     ; 703     else if (UART2_FLAG == UART2_FLAG_LBDF)
2456  036c 1e01          	ldw	x,(OFST+1,sp)
2457  036e a30210        	cpw	x,#528
2458  0371 2606          	jrne	L5321
2459                     ; 705         UART2->CR4 &= (uint8_t)(~UART2_CR4_LBDF);
2461  0373 72195247      	bres	21063,#4
2463  0377 2011          	jra	L3321
2464  0379               L5321:
2465                     ; 708     else if (UART2_FLAG == UART2_FLAG_LHDF)
2467  0379 1e01          	ldw	x,(OFST+1,sp)
2468  037b a30302        	cpw	x,#770
2469  037e 2606          	jrne	L1421
2470                     ; 710         UART2->CR6 &= (uint8_t)(~UART2_CR6_LHDF);
2472  0380 72135249      	bres	21065,#1
2474  0384 2004          	jra	L3321
2475  0386               L1421:
2476                     ; 715         UART2->CR6 &= (uint8_t)(~UART2_CR6_LSF);
2478  0386 72115249      	bres	21065,#0
2479  038a               L3321:
2480                     ; 717 }
2483  038a 85            	popw	x
2484  038b 81            	ret
2566                     ; 732 ITStatus UART2_GetITStatus(UART2_IT_TypeDef UART2_IT)
2566                     ; 733 {
2567                     	switch	.text
2568  038c               _UART2_GetITStatus:
2570  038c 89            	pushw	x
2571  038d 89            	pushw	x
2572       00000002      OFST:	set	2
2575                     ; 734     ITStatus pendingbitstatus = RESET;
2577                     ; 735     uint8_t itpos = 0;
2579                     ; 736     uint8_t itmask1 = 0;
2581                     ; 737     uint8_t itmask2 = 0;
2583                     ; 738     uint8_t enablestatus = 0;
2585                     ; 741     assert_param(IS_UART2_GET_IT_OK(UART2_IT));
2587                     ; 744     itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART2_IT & (uint8_t)0x0F));
2589  038e 9f            	ld	a,xl
2590  038f a40f          	and	a,#15
2591  0391 5f            	clrw	x
2592  0392 97            	ld	xl,a
2593  0393 a601          	ld	a,#1
2594  0395 5d            	tnzw	x
2595  0396 2704          	jreq	L27
2596  0398               L47:
2597  0398 48            	sll	a
2598  0399 5a            	decw	x
2599  039a 26fc          	jrne	L47
2600  039c               L27:
2601  039c 6b01          	ld	(OFST-1,sp),a
2603                     ; 746     itmask1 = (uint8_t)((uint8_t)UART2_IT >> (uint8_t)4);
2605  039e 7b04          	ld	a,(OFST+2,sp)
2606  03a0 4e            	swap	a
2607  03a1 a40f          	and	a,#15
2608  03a3 6b02          	ld	(OFST+0,sp),a
2610                     ; 748     itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2612  03a5 7b02          	ld	a,(OFST+0,sp)
2613  03a7 5f            	clrw	x
2614  03a8 97            	ld	xl,a
2615  03a9 a601          	ld	a,#1
2616  03ab 5d            	tnzw	x
2617  03ac 2704          	jreq	L67
2618  03ae               L001:
2619  03ae 48            	sll	a
2620  03af 5a            	decw	x
2621  03b0 26fc          	jrne	L001
2622  03b2               L67:
2623  03b2 6b02          	ld	(OFST+0,sp),a
2625                     ; 751     if (UART2_IT == UART2_IT_PE)
2627  03b4 1e03          	ldw	x,(OFST+1,sp)
2628  03b6 a30100        	cpw	x,#256
2629  03b9 261c          	jrne	L7031
2630                     ; 754         enablestatus = (uint8_t)((uint8_t)UART2->CR1 & itmask2);
2632  03bb c65244        	ld	a,21060
2633  03be 1402          	and	a,(OFST+0,sp)
2634  03c0 6b02          	ld	(OFST+0,sp),a
2636                     ; 757         if (((UART2->SR & itpos) != (uint8_t)0x00) && enablestatus)
2638  03c2 c65240        	ld	a,21056
2639  03c5 1501          	bcp	a,(OFST-1,sp)
2640  03c7 270a          	jreq	L1131
2642  03c9 0d02          	tnz	(OFST+0,sp)
2643  03cb 2706          	jreq	L1131
2644                     ; 760             pendingbitstatus = SET;
2646  03cd a601          	ld	a,#1
2647  03cf 6b02          	ld	(OFST+0,sp),a
2650  03d1 2064          	jra	L5131
2651  03d3               L1131:
2652                     ; 765             pendingbitstatus = RESET;
2654  03d3 0f02          	clr	(OFST+0,sp)
2656  03d5 2060          	jra	L5131
2657  03d7               L7031:
2658                     ; 768     else if (UART2_IT == UART2_IT_LBDF)
2660  03d7 1e03          	ldw	x,(OFST+1,sp)
2661  03d9 a30346        	cpw	x,#838
2662  03dc 261c          	jrne	L7131
2663                     ; 771         enablestatus = (uint8_t)((uint8_t)UART2->CR4 & itmask2);
2665  03de c65247        	ld	a,21063
2666  03e1 1402          	and	a,(OFST+0,sp)
2667  03e3 6b02          	ld	(OFST+0,sp),a
2669                     ; 773         if (((UART2->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
2671  03e5 c65247        	ld	a,21063
2672  03e8 1501          	bcp	a,(OFST-1,sp)
2673  03ea 270a          	jreq	L1231
2675  03ec 0d02          	tnz	(OFST+0,sp)
2676  03ee 2706          	jreq	L1231
2677                     ; 776             pendingbitstatus = SET;
2679  03f0 a601          	ld	a,#1
2680  03f2 6b02          	ld	(OFST+0,sp),a
2683  03f4 2041          	jra	L5131
2684  03f6               L1231:
2685                     ; 781             pendingbitstatus = RESET;
2687  03f6 0f02          	clr	(OFST+0,sp)
2689  03f8 203d          	jra	L5131
2690  03fa               L7131:
2691                     ; 784     else if (UART2_IT == UART2_IT_LHDF)
2693  03fa 1e03          	ldw	x,(OFST+1,sp)
2694  03fc a30412        	cpw	x,#1042
2695  03ff 261c          	jrne	L7231
2696                     ; 787         enablestatus = (uint8_t)((uint8_t)UART2->CR6 & itmask2);
2698  0401 c65249        	ld	a,21065
2699  0404 1402          	and	a,(OFST+0,sp)
2700  0406 6b02          	ld	(OFST+0,sp),a
2702                     ; 789         if (((UART2->CR6 & itpos) != (uint8_t)0x00) && enablestatus)
2704  0408 c65249        	ld	a,21065
2705  040b 1501          	bcp	a,(OFST-1,sp)
2706  040d 270a          	jreq	L1331
2708  040f 0d02          	tnz	(OFST+0,sp)
2709  0411 2706          	jreq	L1331
2710                     ; 792             pendingbitstatus = SET;
2712  0413 a601          	ld	a,#1
2713  0415 6b02          	ld	(OFST+0,sp),a
2716  0417 201e          	jra	L5131
2717  0419               L1331:
2718                     ; 797             pendingbitstatus = RESET;
2720  0419 0f02          	clr	(OFST+0,sp)
2722  041b 201a          	jra	L5131
2723  041d               L7231:
2724                     ; 803         enablestatus = (uint8_t)((uint8_t)UART2->CR2 & itmask2);
2726  041d c65245        	ld	a,21061
2727  0420 1402          	and	a,(OFST+0,sp)
2728  0422 6b02          	ld	(OFST+0,sp),a
2730                     ; 805         if (((UART2->SR & itpos) != (uint8_t)0x00) && enablestatus)
2732  0424 c65240        	ld	a,21056
2733  0427 1501          	bcp	a,(OFST-1,sp)
2734  0429 270a          	jreq	L7331
2736  042b 0d02          	tnz	(OFST+0,sp)
2737  042d 2706          	jreq	L7331
2738                     ; 808             pendingbitstatus = SET;
2740  042f a601          	ld	a,#1
2741  0431 6b02          	ld	(OFST+0,sp),a
2744  0433 2002          	jra	L5131
2745  0435               L7331:
2746                     ; 813             pendingbitstatus = RESET;
2748  0435 0f02          	clr	(OFST+0,sp)
2750  0437               L5131:
2751                     ; 817     return  pendingbitstatus;
2753  0437 7b02          	ld	a,(OFST+0,sp)
2756  0439 5b04          	addw	sp,#4
2757  043b 81            	ret
2793                     ; 846 void UART2_ClearITPendingBit(UART2_IT_TypeDef UART2_IT)
2793                     ; 847 {
2794                     	switch	.text
2795  043c               _UART2_ClearITPendingBit:
2797  043c 89            	pushw	x
2798       00000000      OFST:	set	0
2801                     ; 848     assert_param(IS_UART2_CLEAR_IT_OK(UART2_IT));
2803                     ; 851     if (UART2_IT == UART2_IT_RXNE)
2805  043d a30255        	cpw	x,#597
2806  0440 2606          	jrne	L1631
2807                     ; 853         UART2->SR = (uint8_t)~(UART2_SR_RXNE);
2809  0442 35df5240      	mov	21056,#223
2811  0446 2011          	jra	L3631
2812  0448               L1631:
2813                     ; 856     else if (UART2_IT == UART2_IT_LBDF)
2815  0448 1e01          	ldw	x,(OFST+1,sp)
2816  044a a30346        	cpw	x,#838
2817  044d 2606          	jrne	L5631
2818                     ; 858         UART2->CR4 &= (uint8_t)~(UART2_CR4_LBDF);
2820  044f 72195247      	bres	21063,#4
2822  0453 2004          	jra	L3631
2823  0455               L5631:
2824                     ; 863         UART2->CR6 &= (uint8_t)(~UART2_CR6_LHDF);
2826  0455 72135249      	bres	21065,#1
2827  0459               L3631:
2828                     ; 865 }
2831  0459 85            	popw	x
2832  045a 81            	ret
2845                     	xdef	_UART2_ClearITPendingBit
2846                     	xdef	_UART2_GetITStatus
2847                     	xdef	_UART2_ClearFlag
2848                     	xdef	_UART2_GetFlagStatus
2849                     	xdef	_UART2_SetPrescaler
2850                     	xdef	_UART2_SetGuardTime
2851                     	xdef	_UART2_SetAddress
2852                     	xdef	_UART2_SendBreak
2853                     	xdef	_UART2_SendData9
2854                     	xdef	_UART2_SendData8
2855                     	xdef	_UART2_ReceiveData9
2856                     	xdef	_UART2_ReceiveData8
2857                     	xdef	_UART2_ReceiverWakeUpCmd
2858                     	xdef	_UART2_WakeUpConfig
2859                     	xdef	_UART2_SmartCardNACKCmd
2860                     	xdef	_UART2_SmartCardCmd
2861                     	xdef	_UART2_LINCmd
2862                     	xdef	_UART2_LINConfig
2863                     	xdef	_UART2_LINBreakDetectionConfig
2864                     	xdef	_UART2_IrDACmd
2865                     	xdef	_UART2_IrDAConfig
2866                     	xdef	_UART2_ITConfig
2867                     	xdef	_UART2_Cmd
2868                     	xdef	_UART2_Init
2869                     	xdef	_UART2_DeInit
2870                     	xref	_CLK_GetClockFreq
2871                     	xref.b	c_lreg
2872                     	xref.b	c_x
2891                     	xref	c_lursh
2892                     	xref	c_lsub
2893                     	xref	c_smul
2894                     	xref	c_ludv
2895                     	xref	c_rtol
2896                     	xref	c_llsh
2897                     	xref	c_ltor
2898                     	end
