   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.12 - 20 Jun 2018
   3                     ; Generator (Limited) V4.4.8 - 20 Jun 2018
  74                     ; 81 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
  74                     ; 82 {
  76                     	switch	.text
  77  0000               _FLASH_Unlock:
  81                     ; 84     assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
  83                     ; 87     if (FLASH_MemType == FLASH_MEMTYPE_PROG)
  85  0000 a1fd          	cp	a,#253
  86  0002 260a          	jrne	L73
  87                     ; 89         FLASH->PUKR = FLASH_RASS_KEY1;
  89  0004 35565062      	mov	20578,#86
  90                     ; 90         FLASH->PUKR = FLASH_RASS_KEY2;
  92  0008 35ae5062      	mov	20578,#174
  94  000c 2008          	jra	L14
  95  000e               L73:
  96                     ; 95         FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
  98  000e 35ae5064      	mov	20580,#174
  99                     ; 96         FLASH->DUKR = FLASH_RASS_KEY1;
 101  0012 35565064      	mov	20580,#86
 102  0016               L14:
 103                     ; 98 }
 106  0016 81            	ret
 141                     ; 106 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 141                     ; 107 {
 142                     	switch	.text
 143  0017               _FLASH_Lock:
 147                     ; 109     assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
 149                     ; 112   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 151  0017 c4505f        	and	a,20575
 152  001a c7505f        	ld	20575,a
 153                     ; 113 }
 156  001d 81            	ret
 179                     ; 120 void FLASH_DeInit(void)
 179                     ; 121 {
 180                     	switch	.text
 181  001e               _FLASH_DeInit:
 185                     ; 122     FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 187  001e 725f505a      	clr	20570
 188                     ; 123     FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 190  0022 725f505b      	clr	20571
 191                     ; 124     FLASH->NCR2 = FLASH_NCR2_RESET_VALUE;
 193  0026 35ff505c      	mov	20572,#255
 194                     ; 125     FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_DUL);
 196  002a 7217505f      	bres	20575,#3
 197                     ; 126     FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_PUL);
 199  002e 7213505f      	bres	20575,#1
 200                     ; 127     (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 202  0032 c6505f        	ld	a,20575
 203                     ; 128 }
 206  0035 81            	ret
 261                     ; 136 void FLASH_ITConfig(FunctionalState NewState)
 261                     ; 137 {
 262                     	switch	.text
 263  0036               _FLASH_ITConfig:
 267                     ; 139   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 269                     ; 141     if (NewState != DISABLE)
 271  0036 4d            	tnz	a
 272  0037 2706          	jreq	L711
 273                     ; 143         FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
 275  0039 7212505a      	bset	20570,#1
 277  003d 2004          	jra	L121
 278  003f               L711:
 279                     ; 147         FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE); /* Disables the interrupt sources */
 281  003f 7213505a      	bres	20570,#1
 282  0043               L121:
 283                     ; 149 }
 286  0043 81            	ret
 320                     ; 158 void FLASH_EraseByte(uint32_t Address)
 320                     ; 159 {
 321                     	switch	.text
 322  0044               _FLASH_EraseByte:
 324       00000000      OFST:	set	0
 327                     ; 161     assert_param(IS_FLASH_ADDRESS_OK(Address));
 329                     ; 164    *(PointerAttr uint8_t*) (uint16_t)Address = FLASH_CLEAR_BYTE; 
 331  0044 1e05          	ldw	x,(OFST+5,sp)
 332  0046 7f            	clr	(x)
 333                     ; 166 }
 336  0047 81            	ret
 379                     ; 176 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
 379                     ; 177 {
 380                     	switch	.text
 381  0048               _FLASH_ProgramByte:
 383       00000000      OFST:	set	0
 386                     ; 179     assert_param(IS_FLASH_ADDRESS_OK(Address));
 388                     ; 180     *(PointerAttr uint8_t*) (uint16_t)Address = Data;
 390  0048 7b07          	ld	a,(OFST+7,sp)
 391  004a 1e05          	ldw	x,(OFST+5,sp)
 392  004c f7            	ld	(x),a
 393                     ; 181 }
 396  004d 81            	ret
 430                     ; 190 uint8_t FLASH_ReadByte(uint32_t Address)
 430                     ; 191 {
 431                     	switch	.text
 432  004e               _FLASH_ReadByte:
 434       00000000      OFST:	set	0
 437                     ; 193     assert_param(IS_FLASH_ADDRESS_OK(Address));
 439                     ; 196     return(*(PointerAttr uint8_t *) (uint16_t)Address); 
 441  004e 1e05          	ldw	x,(OFST+5,sp)
 442  0050 f6            	ld	a,(x)
 445  0051 81            	ret
 488                     ; 207 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
 488                     ; 208 {
 489                     	switch	.text
 490  0052               _FLASH_ProgramWord:
 492       00000000      OFST:	set	0
 495                     ; 210     assert_param(IS_FLASH_ADDRESS_OK(Address));
 497                     ; 213     FLASH->CR2 |= FLASH_CR2_WPRG;
 499  0052 721c505b      	bset	20571,#6
 500                     ; 214     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NWPRG);
 502  0056 721d505c      	bres	20572,#6
 503                     ; 217     *((PointerAttr uint8_t*)(uint16_t)Address)       = *((uint8_t*)(&Data));
 505  005a 7b07          	ld	a,(OFST+7,sp)
 506  005c 1e05          	ldw	x,(OFST+5,sp)
 507  005e f7            	ld	(x),a
 508                     ; 219     *(((PointerAttr uint8_t*)(uint16_t)Address) + 1) = *((uint8_t*)(&Data)+1); 
 510  005f 7b08          	ld	a,(OFST+8,sp)
 511  0061 1e05          	ldw	x,(OFST+5,sp)
 512  0063 e701          	ld	(1,x),a
 513                     ; 221     *(((PointerAttr uint8_t*)(uint16_t)Address) + 2) = *((uint8_t*)(&Data)+2); 
 515  0065 7b09          	ld	a,(OFST+9,sp)
 516  0067 1e05          	ldw	x,(OFST+5,sp)
 517  0069 e702          	ld	(2,x),a
 518                     ; 223     *(((PointerAttr uint8_t*)(uint16_t)Address) + 3) = *((uint8_t*)(&Data)+3); 
 520  006b 7b0a          	ld	a,(OFST+10,sp)
 521  006d 1e05          	ldw	x,(OFST+5,sp)
 522  006f e703          	ld	(3,x),a
 523                     ; 224 }
 526  0071 81            	ret
 571                     ; 232 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
 571                     ; 233 {
 572                     	switch	.text
 573  0072               _FLASH_ProgramOptionByte:
 575  0072 89            	pushw	x
 576       00000000      OFST:	set	0
 579                     ; 235     assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 581                     ; 238     FLASH->CR2 |= FLASH_CR2_OPT;
 583  0073 721e505b      	bset	20571,#7
 584                     ; 239     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 586  0077 721f505c      	bres	20572,#7
 587                     ; 242     if (Address == 0x4800)
 589  007b a34800        	cpw	x,#18432
 590  007e 2607          	jrne	L542
 591                     ; 245        *((NEAR uint8_t*)Address) = Data;
 593  0080 7b05          	ld	a,(OFST+5,sp)
 594  0082 1e01          	ldw	x,(OFST+1,sp)
 595  0084 f7            	ld	(x),a
 597  0085 200c          	jra	L742
 598  0087               L542:
 599                     ; 250        *((NEAR uint8_t*)Address) = Data;
 601  0087 7b05          	ld	a,(OFST+5,sp)
 602  0089 1e01          	ldw	x,(OFST+1,sp)
 603  008b f7            	ld	(x),a
 604                     ; 251        *((NEAR uint8_t*)((uint16_t)(Address + 1))) = (uint8_t)(~Data);
 606  008c 7b05          	ld	a,(OFST+5,sp)
 607  008e 43            	cpl	a
 608  008f 1e01          	ldw	x,(OFST+1,sp)
 609  0091 e701          	ld	(1,x),a
 610  0093               L742:
 611                     ; 253     FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 613  0093 a6fd          	ld	a,#253
 614  0095 cd017d        	call	_FLASH_WaitForLastOperation
 616                     ; 256     FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 618  0098 721f505b      	bres	20571,#7
 619                     ; 257     FLASH->NCR2 |= FLASH_NCR2_NOPT;
 621  009c 721e505c      	bset	20572,#7
 622                     ; 258 }
 625  00a0 85            	popw	x
 626  00a1 81            	ret
 662                     ; 265 void FLASH_EraseOptionByte(uint16_t Address)
 662                     ; 266 {
 663                     	switch	.text
 664  00a2               _FLASH_EraseOptionByte:
 666  00a2 89            	pushw	x
 667       00000000      OFST:	set	0
 670                     ; 268     assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 672                     ; 271     FLASH->CR2 |= FLASH_CR2_OPT;
 674  00a3 721e505b      	bset	20571,#7
 675                     ; 272     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 677  00a7 721f505c      	bres	20572,#7
 678                     ; 275      if (Address == 0x4800)
 680  00ab a34800        	cpw	x,#18432
 681  00ae 2603          	jrne	L762
 682                     ; 278        *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 684  00b0 7f            	clr	(x)
 686  00b1 2009          	jra	L172
 687  00b3               L762:
 688                     ; 283        *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 690  00b3 1e01          	ldw	x,(OFST+1,sp)
 691  00b5 7f            	clr	(x)
 692                     ; 284        *((NEAR uint8_t*)((uint16_t)(Address + (uint16_t)1 ))) = FLASH_SET_BYTE;
 694  00b6 1e01          	ldw	x,(OFST+1,sp)
 695  00b8 a6ff          	ld	a,#255
 696  00ba e701          	ld	(1,x),a
 697  00bc               L172:
 698                     ; 286     FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 700  00bc a6fd          	ld	a,#253
 701  00be cd017d        	call	_FLASH_WaitForLastOperation
 703                     ; 289     FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 705  00c1 721f505b      	bres	20571,#7
 706                     ; 290     FLASH->NCR2 |= FLASH_NCR2_NOPT;
 708  00c5 721e505c      	bset	20572,#7
 709                     ; 291 }
 712  00c9 85            	popw	x
 713  00ca 81            	ret
 776                     ; 297 uint16_t FLASH_ReadOptionByte(uint16_t Address)
 776                     ; 298 {
 777                     	switch	.text
 778  00cb               _FLASH_ReadOptionByte:
 780  00cb 5204          	subw	sp,#4
 781       00000004      OFST:	set	4
 784                     ; 299     uint8_t value_optbyte, value_optbyte_complement = 0;
 786                     ; 300     uint16_t res_value = 0;
 788                     ; 303     assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 790                     ; 306     value_optbyte = *((NEAR uint8_t*)Address); /* Read option byte */
 792  00cd f6            	ld	a,(x)
 793  00ce 6b01          	ld	(OFST-3,sp),a
 795                     ; 307     value_optbyte_complement = *(((NEAR uint8_t*)Address) + 1); /* Read option byte complement */
 797  00d0 e601          	ld	a,(1,x)
 798  00d2 6b02          	ld	(OFST-2,sp),a
 800                     ; 310     if (Address == 0x4800)	 
 802  00d4 a34800        	cpw	x,#18432
 803  00d7 2608          	jrne	L523
 804                     ; 312         res_value =	 value_optbyte;
 806  00d9 7b01          	ld	a,(OFST-3,sp)
 807  00db 5f            	clrw	x
 808  00dc 97            	ld	xl,a
 809  00dd 1f03          	ldw	(OFST-1,sp),x
 812  00df 2023          	jra	L723
 813  00e1               L523:
 814                     ; 316         if (value_optbyte == (uint8_t)(~value_optbyte_complement))
 816  00e1 7b02          	ld	a,(OFST-2,sp)
 817  00e3 43            	cpl	a
 818  00e4 1101          	cp	a,(OFST-3,sp)
 819  00e6 2617          	jrne	L133
 820                     ; 318             res_value = (uint16_t)((uint16_t)value_optbyte << 8);
 822  00e8 7b01          	ld	a,(OFST-3,sp)
 823  00ea 5f            	clrw	x
 824  00eb 97            	ld	xl,a
 825  00ec 4f            	clr	a
 826  00ed 02            	rlwa	x,a
 827  00ee 1f03          	ldw	(OFST-1,sp),x
 829                     ; 319             res_value = res_value | (uint16_t)value_optbyte_complement;
 831  00f0 7b02          	ld	a,(OFST-2,sp)
 832  00f2 5f            	clrw	x
 833  00f3 97            	ld	xl,a
 834  00f4 01            	rrwa	x,a
 835  00f5 1a04          	or	a,(OFST+0,sp)
 836  00f7 01            	rrwa	x,a
 837  00f8 1a03          	or	a,(OFST-1,sp)
 838  00fa 01            	rrwa	x,a
 839  00fb 1f03          	ldw	(OFST-1,sp),x
 842  00fd 2005          	jra	L723
 843  00ff               L133:
 844                     ; 323             res_value = FLASH_OPTIONBYTE_ERROR;
 846  00ff ae5555        	ldw	x,#21845
 847  0102 1f03          	ldw	(OFST-1,sp),x
 849  0104               L723:
 850                     ; 326     return(res_value);
 852  0104 1e03          	ldw	x,(OFST-1,sp)
 855  0106 5b04          	addw	sp,#4
 856  0108 81            	ret
 930                     ; 335 void FLASH_SetLowPowerMode(FLASH_LPMode_TypeDef FLASH_LPMode)
 930                     ; 336 {
 931                     	switch	.text
 932  0109               _FLASH_SetLowPowerMode:
 934  0109 88            	push	a
 935       00000000      OFST:	set	0
 938                     ; 338     assert_param(IS_FLASH_LOW_POWER_MODE_OK(FLASH_LPMode));
 940                     ; 341     FLASH->CR1 &= (uint8_t)(~(FLASH_CR1_HALT | FLASH_CR1_AHALT)); 
 942  010a c6505a        	ld	a,20570
 943  010d a4f3          	and	a,#243
 944  010f c7505a        	ld	20570,a
 945                     ; 344     FLASH->CR1 |= (uint8_t)FLASH_LPMode; 
 947  0112 c6505a        	ld	a,20570
 948  0115 1a01          	or	a,(OFST+1,sp)
 949  0117 c7505a        	ld	20570,a
 950                     ; 345 }
 953  011a 84            	pop	a
 954  011b 81            	ret
1012                     ; 353 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
1012                     ; 354 {
1013                     	switch	.text
1014  011c               _FLASH_SetProgrammingTime:
1018                     ; 356     assert_param(IS_FLASH_PROGRAM_TIME_OK(FLASH_ProgTime));
1020                     ; 358     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
1022  011c 7211505a      	bres	20570,#0
1023                     ; 359     FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
1025  0120 ca505a        	or	a,20570
1026  0123 c7505a        	ld	20570,a
1027                     ; 360 }
1030  0126 81            	ret
1055                     ; 367 FLASH_LPMode_TypeDef FLASH_GetLowPowerMode(void)
1055                     ; 368 {
1056                     	switch	.text
1057  0127               _FLASH_GetLowPowerMode:
1061                     ; 369     return((FLASH_LPMode_TypeDef)(FLASH->CR1 & (uint8_t)(FLASH_CR1_HALT | FLASH_CR1_AHALT)));
1063  0127 c6505a        	ld	a,20570
1064  012a a40c          	and	a,#12
1067  012c 81            	ret
1092                     ; 377 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
1092                     ; 378 {
1093                     	switch	.text
1094  012d               _FLASH_GetProgrammingTime:
1098                     ; 379     return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
1100  012d c6505a        	ld	a,20570
1101  0130 a401          	and	a,#1
1104  0132 81            	ret
1138                     ; 387 uint32_t FLASH_GetBootSize(void)
1138                     ; 388 {
1139                     	switch	.text
1140  0133               _FLASH_GetBootSize:
1142  0133 5204          	subw	sp,#4
1143       00000004      OFST:	set	4
1146                     ; 389     uint32_t temp = 0;
1148                     ; 392     temp = (uint32_t)((uint32_t)FLASH->FPR * (uint32_t)512);
1150  0135 c6505d        	ld	a,20573
1151  0138 5f            	clrw	x
1152  0139 97            	ld	xl,a
1153  013a 90ae0200      	ldw	y,#512
1154  013e cd0000        	call	c_umul
1156  0141 96            	ldw	x,sp
1157  0142 1c0001        	addw	x,#OFST-3
1158  0145 cd0000        	call	c_rtol
1161                     ; 395     if (FLASH->FPR == 0xFF)
1163  0148 c6505d        	ld	a,20573
1164  014b a1ff          	cp	a,#255
1165  014d 2611          	jrne	L354
1166                     ; 397         temp += 512;
1168  014f ae0200        	ldw	x,#512
1169  0152 bf02          	ldw	c_lreg+2,x
1170  0154 ae0000        	ldw	x,#0
1171  0157 bf00          	ldw	c_lreg,x
1172  0159 96            	ldw	x,sp
1173  015a 1c0001        	addw	x,#OFST-3
1174  015d cd0000        	call	c_lgadd
1177  0160               L354:
1178                     ; 401     return(temp);
1180  0160 96            	ldw	x,sp
1181  0161 1c0001        	addw	x,#OFST-3
1182  0164 cd0000        	call	c_ltor
1186  0167 5b04          	addw	sp,#4
1187  0169 81            	ret
1289                     ; 412 FlagStatus FLASH_GetFlagStatus(FLASH_Flag_TypeDef FLASH_FLAG)
1289                     ; 413 {
1290                     	switch	.text
1291  016a               _FLASH_GetFlagStatus:
1293  016a 88            	push	a
1294       00000001      OFST:	set	1
1297                     ; 414     FlagStatus status = RESET;
1299                     ; 416     assert_param(IS_FLASH_FLAGS_OK(FLASH_FLAG));
1301                     ; 419     if ((FLASH->IAPSR & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
1303  016b c4505f        	and	a,20575
1304  016e 2706          	jreq	L325
1305                     ; 421         status = SET; /* FLASH_FLAG is set */
1307  0170 a601          	ld	a,#1
1308  0172 6b01          	ld	(OFST+0,sp),a
1311  0174 2002          	jra	L525
1312  0176               L325:
1313                     ; 425         status = RESET; /* FLASH_FLAG is reset*/
1315  0176 0f01          	clr	(OFST+0,sp)
1317  0178               L525:
1318                     ; 429     return status;
1320  0178 7b01          	ld	a,(OFST+0,sp)
1323  017a 5b01          	addw	sp,#1
1324  017c 81            	ret
1409                     ; 531 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType)) 
1409                     ; 532 {
1410                     	switch	.text
1411  017d               _FLASH_WaitForLastOperation:
1413  017d 5205          	subw	sp,#5
1414       00000005      OFST:	set	5
1417                     ; 533     uint8_t flagstatus = 0x00;
1419  017f 0f05          	clr	(OFST+0,sp)
1421                     ; 534     uint32_t timeout = OPERATION_TIMEOUT;
1423  0181 aeffff        	ldw	x,#65535
1424  0184 1f03          	ldw	(OFST-2,sp),x
1425  0186 ae000f        	ldw	x,#15
1426  0189 1f01          	ldw	(OFST-4,sp),x
1429  018b 2010          	jra	L375
1430  018d               L765:
1431                     ; 560         flagstatus = (uint8_t)(FLASH->IAPSR & (FLASH_IAPSR_EOP | FLASH_IAPSR_WR_PG_DIS));
1433  018d c6505f        	ld	a,20575
1434  0190 a405          	and	a,#5
1435  0192 6b05          	ld	(OFST+0,sp),a
1437                     ; 561         timeout--;
1439  0194 96            	ldw	x,sp
1440  0195 1c0001        	addw	x,#OFST-4
1441  0198 a601          	ld	a,#1
1442  019a cd0000        	call	c_lgsbc
1445  019d               L375:
1446                     ; 558     while ((flagstatus == 0x00) && (timeout != 0x00))
1448  019d 0d05          	tnz	(OFST+0,sp)
1449  019f 2609          	jrne	L775
1451  01a1 96            	ldw	x,sp
1452  01a2 1c0001        	addw	x,#OFST-4
1453  01a5 cd0000        	call	c_lzmp
1455  01a8 26e3          	jrne	L765
1456  01aa               L775:
1457                     ; 566     if (timeout == 0x00 )
1459  01aa 96            	ldw	x,sp
1460  01ab 1c0001        	addw	x,#OFST-4
1461  01ae cd0000        	call	c_lzmp
1463  01b1 2604          	jrne	L106
1464                     ; 568         flagstatus = FLASH_STATUS_TIMEOUT;
1466  01b3 a602          	ld	a,#2
1467  01b5 6b05          	ld	(OFST+0,sp),a
1469  01b7               L106:
1470                     ; 571     return((FLASH_Status_TypeDef)flagstatus);
1472  01b7 7b05          	ld	a,(OFST+0,sp)
1475  01b9 5b05          	addw	sp,#5
1476  01bb 81            	ret
1539                     ; 581 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
1539                     ; 582 {
1540                     	switch	.text
1541  01bc               _FLASH_EraseBlock:
1543  01bc 89            	pushw	x
1544  01bd 5206          	subw	sp,#6
1545       00000006      OFST:	set	6
1548                     ; 583   uint32_t startaddress = 0;
1550                     ; 593   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
1552                     ; 594   if (FLASH_MemType == FLASH_MEMTYPE_PROG)
1554  01bf 7b0b          	ld	a,(OFST+5,sp)
1555  01c1 a1fd          	cp	a,#253
1556  01c3 260c          	jrne	L536
1557                     ; 596       assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
1559                     ; 597       startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
1561  01c5 ae8000        	ldw	x,#32768
1562  01c8 1f05          	ldw	(OFST-1,sp),x
1563  01ca ae0000        	ldw	x,#0
1564  01cd 1f03          	ldw	(OFST-3,sp),x
1567  01cf 200a          	jra	L736
1568  01d1               L536:
1569                     ; 601       assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
1571                     ; 602       startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
1573  01d1 ae4000        	ldw	x,#16384
1574  01d4 1f05          	ldw	(OFST-1,sp),x
1575  01d6 ae0000        	ldw	x,#0
1576  01d9 1f03          	ldw	(OFST-3,sp),x
1578  01db               L736:
1579                     ; 610     pwFlash = (PointerAttr uint32_t *)(uint16_t)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
1581  01db 1e07          	ldw	x,(OFST+1,sp)
1582  01dd a640          	ld	a,#64
1583  01df cd0000        	call	c_cmulx
1585  01e2 96            	ldw	x,sp
1586  01e3 1c0003        	addw	x,#OFST-3
1587  01e6 cd0000        	call	c_ladd
1589  01e9 be02          	ldw	x,c_lreg+2
1590  01eb 1f01          	ldw	(OFST-5,sp),x
1592                     ; 614     FLASH->CR2 |= FLASH_CR2_ERASE;
1594  01ed 721a505b      	bset	20571,#5
1595                     ; 615     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NERASE);
1597  01f1 721b505c      	bres	20572,#5
1598                     ; 619     *pwFlash = (uint32_t)0;
1600  01f5 1e01          	ldw	x,(OFST-5,sp)
1601  01f7 a600          	ld	a,#0
1602  01f9 e703          	ld	(3,x),a
1603  01fb a600          	ld	a,#0
1604  01fd e702          	ld	(2,x),a
1605  01ff a600          	ld	a,#0
1606  0201 e701          	ld	(1,x),a
1607  0203 a600          	ld	a,#0
1608  0205 f7            	ld	(x),a
1609                     ; 627 }
1612  0206 5b08          	addw	sp,#8
1613  0208 81            	ret
1717                     ; 638 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType, 
1717                     ; 639                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
1717                     ; 640 {
1718                     	switch	.text
1719  0209               _FLASH_ProgramBlock:
1721  0209 89            	pushw	x
1722  020a 5206          	subw	sp,#6
1723       00000006      OFST:	set	6
1726                     ; 641     uint16_t Count = 0;
1728                     ; 642     uint32_t startaddress = 0;
1730                     ; 645     assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
1732                     ; 646     assert_param(IS_FLASH_PROGRAM_MODE_OK(FLASH_ProgMode));
1734                     ; 647     if (FLASH_MemType == FLASH_MEMTYPE_PROG)
1736  020c 7b0b          	ld	a,(OFST+5,sp)
1737  020e a1fd          	cp	a,#253
1738  0210 260c          	jrne	L317
1739                     ; 649         assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
1741                     ; 650         startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
1743  0212 ae8000        	ldw	x,#32768
1744  0215 1f03          	ldw	(OFST-3,sp),x
1745  0217 ae0000        	ldw	x,#0
1746  021a 1f01          	ldw	(OFST-5,sp),x
1749  021c 200a          	jra	L517
1750  021e               L317:
1751                     ; 654         assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
1753                     ; 655         startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
1755  021e ae4000        	ldw	x,#16384
1756  0221 1f03          	ldw	(OFST-3,sp),x
1757  0223 ae0000        	ldw	x,#0
1758  0226 1f01          	ldw	(OFST-5,sp),x
1760  0228               L517:
1761                     ; 659     startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
1763  0228 1e07          	ldw	x,(OFST+1,sp)
1764  022a a640          	ld	a,#64
1765  022c cd0000        	call	c_cmulx
1767  022f 96            	ldw	x,sp
1768  0230 1c0001        	addw	x,#OFST-5
1769  0233 cd0000        	call	c_lgadd
1772                     ; 662     if (FLASH_ProgMode == FLASH_PROGRAMMODE_STANDARD)
1774  0236 0d0c          	tnz	(OFST+6,sp)
1775  0238 260a          	jrne	L717
1776                     ; 665         FLASH->CR2 |= FLASH_CR2_PRG;
1778  023a 7210505b      	bset	20571,#0
1779                     ; 666         FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NPRG);
1781  023e 7211505c      	bres	20572,#0
1783  0242 2008          	jra	L127
1784  0244               L717:
1785                     ; 671         FLASH->CR2 |= FLASH_CR2_FPRG;
1787  0244 7218505b      	bset	20571,#4
1788                     ; 672         FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NFPRG);
1790  0248 7219505c      	bres	20572,#4
1791  024c               L127:
1792                     ; 676     for (Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1794  024c 5f            	clrw	x
1795  024d 1f05          	ldw	(OFST-1,sp),x
1797  024f               L327:
1798                     ; 682   *((PointerAttr uint8_t*) (uint16_t)startaddress + Count) = ((uint8_t)(Buffer[Count]));
1800  024f 1e0d          	ldw	x,(OFST+7,sp)
1801  0251 72fb05        	addw	x,(OFST-1,sp)
1802  0254 f6            	ld	a,(x)
1803  0255 1e03          	ldw	x,(OFST-3,sp)
1804  0257 72fb05        	addw	x,(OFST-1,sp)
1805  025a f7            	ld	(x),a
1806                     ; 676     for (Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1808  025b 1e05          	ldw	x,(OFST-1,sp)
1809  025d 1c0001        	addw	x,#1
1810  0260 1f05          	ldw	(OFST-1,sp),x
1814  0262 1e05          	ldw	x,(OFST-1,sp)
1815  0264 a30040        	cpw	x,#64
1816  0267 25e6          	jrult	L327
1817                     ; 685 }
1820  0269 5b08          	addw	sp,#8
1821  026b 81            	ret
1834                     	xdef	_FLASH_WaitForLastOperation
1835                     	xdef	_FLASH_ProgramBlock
1836                     	xdef	_FLASH_EraseBlock
1837                     	xdef	_FLASH_GetFlagStatus
1838                     	xdef	_FLASH_GetBootSize
1839                     	xdef	_FLASH_GetProgrammingTime
1840                     	xdef	_FLASH_GetLowPowerMode
1841                     	xdef	_FLASH_SetProgrammingTime
1842                     	xdef	_FLASH_SetLowPowerMode
1843                     	xdef	_FLASH_EraseOptionByte
1844                     	xdef	_FLASH_ProgramOptionByte
1845                     	xdef	_FLASH_ReadOptionByte
1846                     	xdef	_FLASH_ProgramWord
1847                     	xdef	_FLASH_ReadByte
1848                     	xdef	_FLASH_ProgramByte
1849                     	xdef	_FLASH_EraseByte
1850                     	xdef	_FLASH_ITConfig
1851                     	xdef	_FLASH_DeInit
1852                     	xdef	_FLASH_Lock
1853                     	xdef	_FLASH_Unlock
1854                     	xref.b	c_lreg
1855                     	xref.b	c_x
1856                     	xref.b	c_y
1875                     	xref	c_ladd
1876                     	xref	c_cmulx
1877                     	xref	c_lzmp
1878                     	xref	c_lgsbc
1879                     	xref	c_ltor
1880                     	xref	c_lgadd
1881                     	xref	c_rtol
1882                     	xref	c_umul
1883                     	end
