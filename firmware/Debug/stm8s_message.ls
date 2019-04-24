   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.3 - 27 Jul 2015
   3                     ; Generator (Limited) V4.4.2 - 04 Jun 2015
  15                     .const:	section	.text
  16  0000               _fail:
  17  0000 202020436f6d  	dc.b	"   Comunicacao  ",0
  18  0011 20437572746f  	dc.b	" Curto Circuito ",0
  19  0022 20202054494d  	dc.b	"   TIMER/PROT   ",0
  20  0033 202020202020  	dc.b	"      SETA      ",0
  21  0044 202020202020  	dc.b	"      L15       ",0
  22  0055 202020202043  	dc.b	"     CMD UP     ",0
  23  0066 202020202043  	dc.b	"     CMD DN     ",0
  24  0077 202020202020  	dc.b	"      DOOR      ",0
  25  0088 202020202053  	dc.b	"     SW UP1     ",0
  26  0099 202020202053  	dc.b	"     SW UP2     ",0
  27  00aa 202020202053  	dc.b	"     SW UP3     ",0
  28  00bb 202020202053  	dc.b	"     SW UP4     ",0
  29  00cc 202020202053  	dc.b	"     SW DN1     ",0
  30  00dd 202020202053  	dc.b	"     SW DN2     ",0
  31  00ee 202020202053  	dc.b	"     SW DN3     ",0
  32  00ff 202020202053  	dc.b	"     SW DN4     ",0
  33  0110 202020202020  	dc.b	"      BAT       ",0
  34  0121 202020202049  	dc.b	"     I MOT1     ",0
  35  0132 202020202049  	dc.b	"     I MOT2     ",0
  36  0143 202020202049  	dc.b	"     I MOT3     ",0
  37  0154 202020202049  	dc.b	"     I MOT4     ",0
  38  0165 20202020494e  	dc.b	"    IN PULSE1   ",0
  39  0176 20202020494e  	dc.b	"    IN PULSE2   ",0
  40  0187 20202020494e  	dc.b	"    IN PULSE3   ",0
  41  0198 20202020494e  	dc.b	"    IN PULSE4   ",0
  42  01a9               _model:
  43  01a9 202020202050  	dc.b	"     PRO4.0     ",0
  44  01ba 202020202050  	dc.b	"     PRO4.1     ",0
  45  01cb 202020202050  	dc.b	"     PRO4.4     ",0
  46  01dc 202020202050  	dc.b	"     PRO4.6     ",0
  47  01ed 202020202050  	dc.b	"     PRO4.8     ",0
  48  01fe 202020202050  	dc.b	"     PRO4.10    ",0
  49  020f 202020202050  	dc.b	"     PRO4.11    ",0
  50  0220 202020202050  	dc.b	"     PRO4.12    ",0
  51  0231 202020202050  	dc.b	"     PRO4.15    ",0
  52  0242 202020202050  	dc.b	"     PRO4.16    ",0
  53  0253 202020202050  	dc.b	"     PRO4.19    ",0
  54  0264 202020202050  	dc.b	"     PRO4.20    ",0
  55  0275 202020202050  	dc.b	"     PRO4.22    ",0
  56  0286 202020202050  	dc.b	"     PRO4.23    ",0
  57  0297 202020202050  	dc.b	"     PRO4.25    ",0
  58  02a8 202020202050  	dc.b	"     PRO4.26    ",0
  59  02b9 202020202050  	dc.b	"     PRO4.27    ",0
  60  02ca 202020202050  	dc.b	"     PRO4.28    ",0
  61  02db 202020202050  	dc.b	"     PRO4.29    ",0
  62  02ec 202020202050  	dc.b	"     PRO4.30    ",0
  63  02fd 202020202050  	dc.b	"     PRO4.31    ",0
  64  030e 202020202050  	dc.b	"     PRO4.32    ",0
  65  031f 202020202050  	dc.b	"     PRO4.34    ",0
  66  0330 202020202050  	dc.b	"     PRO4.35    ",0
  67  0341 202020202050  	dc.b	"     PRO4.36    ",0
  68  0352 202020202050  	dc.b	"     PRO4.37    ",0
  69  0363 202020202050  	dc.b	"     PRO4.38    ",0
  70  0374 202020202050  	dc.b	"     PRO4.40    ",0
  71  0385 202020202050  	dc.b	"     PRO4.41    ",0
  72  0396 202020202050  	dc.b	"     PRO4.42    ",0
  73  03a7 202020202050  	dc.b	"     PRO4.43    ",0
  74  03b8 202020202050  	dc.b	"     PRO4.44    ",0
  75  03c9 202020202050  	dc.b	"     PRO4.46    ",0
  76  03da 202020202050  	dc.b	"     PRO4.48    ",0
  77  03eb 202020202050  	dc.b	"     PRO4.54    ",0
  78                     	bsct
  79  0000               _oldStatus:
  80  0000 64            	dc.b	100
 125                     	switch	.const
 126  03fc               L01:
 127  03fc 001c          	dc.w	L3
 128  03fe 004c          	dc.w	L5
 129  0400 007c          	dc.w	L7
 130  0402 00ac          	dc.w	L11
 131  0404 00dc          	dc.w	L31
 132  0406 010a          	dc.w	L51
 133  0408 010a          	dc.w	L51
 134  040a 010a          	dc.w	L51
 135  040c 010a          	dc.w	L51
 136  040e 010a          	dc.w	L51
 137  0410 010a          	dc.w	L51
 138  0412 010a          	dc.w	L51
 139  0414 010a          	dc.w	L51
 140  0416 010a          	dc.w	L51
 141  0418 010a          	dc.w	L51
 142  041a 010a          	dc.w	L51
 143  041c 010a          	dc.w	L51
 144  041e 010a          	dc.w	L51
 145  0420 010a          	dc.w	L51
 146  0422 010a          	dc.w	L51
 147  0424 010a          	dc.w	L51
 148  0426 010a          	dc.w	L51
 149  0428 010a          	dc.w	L51
 150  042a 010a          	dc.w	L51
 151  042c 010a          	dc.w	L51
 152  042e 010a          	dc.w	L51
 153  0430 010a          	dc.w	L51
 154  0432 010a          	dc.w	L51
 155  0434 010a          	dc.w	L51
 156  0436 0141          	dc.w	L71
 157  0438 0141          	dc.w	L71
 158  043a 0141          	dc.w	L71
 159  043c 0141          	dc.w	L71
 160  043e 0141          	dc.w	L71
 161  0440 0141          	dc.w	L71
 162  0442 0141          	dc.w	L71
 163  0444 0141          	dc.w	L71
 164  0446 0141          	dc.w	L71
 165  0448 0141          	dc.w	L71
 166  044a 0141          	dc.w	L71
 167  044c 0141          	dc.w	L71
 168  044e 0141          	dc.w	L71
 169  0450 0141          	dc.w	L71
 170  0452 0141          	dc.w	L71
 171  0454 0141          	dc.w	L71
 172  0456 0141          	dc.w	L71
 173  0458 0141          	dc.w	L71
 174  045a 0141          	dc.w	L71
 175  045c 0141          	dc.w	L71
 176  045e 0141          	dc.w	L71
 177  0460 0141          	dc.w	L71
 178  0462 0141          	dc.w	L71
 179  0464 0141          	dc.w	L71
 180  0466 0141          	dc.w	L71
 181  0468 0141          	dc.w	L71
 182  046a 0141          	dc.w	L71
 183  046c 0141          	dc.w	L71
 184  046e 0141          	dc.w	L71
 185  0470 0141          	dc.w	L71
 186  0472 0141          	dc.w	L71
 187  0474 0141          	dc.w	L71
 188  0476 0141          	dc.w	L71
 189  0478 0141          	dc.w	L71
 190  047a 0141          	dc.w	L71
 191                     ; 93 void messageUpdate(uint8_t status){
 192                     	scross	off
 193                     	switch	.text
 194  0000               _messageUpdate:
 196  0000 88            	push	a
 197       00000000      OFST:	set	0
 200                     ; 95 	 if(status == oldStatus){
 202  0001 b100          	cp	a,_oldStatus
 203  0003 2602          	jrne	L74
 204                     ; 97 		 return;
 207  0005 84            	pop	a
 208  0006 81            	ret
 209  0007               L74:
 210                     ; 101 	 oldStatus = status;	
 212  0007 7b01          	ld	a,(OFST+1,sp)
 213  0009 b700          	ld	_oldStatus,a
 214                     ; 105 	 switch (status) {
 216  000b 7b01          	ld	a,(OFST+1,sp)
 218                     ; 255 		 default:
 218                     ; 256 		   
 218                     ; 257 			 
 218                     ; 258 			 
 218                     ; 259 		 break;
 219  000d a140          	cp	a,#64
 220  000f 2407          	jruge	L6
 221  0011 5f            	clrw	x
 222  0012 97            	ld	xl,a
 223  0013 58            	sllw	x
 224  0014 de03fc        	ldw	x,(L01,x)
 225  0017 fc            	jp	(x)
 226  0018               L6:
 227  0018 ac760176      	jpf	L35
 228  001c               L3:
 229                     ; 107 		 case 0:
 229                     ; 108 		   
 229                     ; 109 		   lcdSetLine    (1);
 231  001c a601          	ld	a,#1
 232  001e cd0000        	call	_lcdSetLine
 234                     ; 110 		   lcdWriteString("      PRO4      "); 
 236  0021 ae0515        	ldw	x,#L55
 237  0024 cd0000        	call	_lcdWriteString
 239                     ; 111 		   lcdSetLine    (2);
 241  0027 a602          	ld	a,#2
 242  0029 cd0000        	call	_lcdSetLine
 244                     ; 112 		   lcdWriteString("                "); 
 246  002c ae0504        	ldw	x,#L75
 247  002f cd0000        	call	_lcdWriteString
 249                     ; 113 		   lcdSetLine    (3);
 251  0032 a603          	ld	a,#3
 252  0034 cd0000        	call	_lcdSetLine
 254                     ; 114 		   lcdWriteString(" Conectar a PCI ");
 256  0037 ae04f3        	ldw	x,#L16
 257  003a cd0000        	call	_lcdWriteString
 259                     ; 115 		   lcdSetLine    (4);
 261  003d a604          	ld	a,#4
 262  003f cd0000        	call	_lcdSetLine
 264                     ; 116 		   lcdWriteString("                ");
 266  0042 ae0504        	ldw	x,#L75
 267  0045 cd0000        	call	_lcdWriteString
 269                     ; 118 		 break;
 271  0048 ac760176      	jpf	L35
 272  004c               L5:
 273                     ; 120 		 case 1:
 273                     ; 121 		   
 273                     ; 122 		   lcdSetLine    (1);
 275  004c a601          	ld	a,#1
 276  004e cd0000        	call	_lcdSetLine
 278                     ; 123 		   lcdWriteString("      PRO4      "); 
 280  0051 ae0515        	ldw	x,#L55
 281  0054 cd0000        	call	_lcdWriteString
 283                     ; 124 		   lcdSetLine    (2);
 285  0057 a602          	ld	a,#2
 286  0059 cd0000        	call	_lcdSetLine
 288                     ; 125 		   lcdWriteString("                "); 
 290  005c ae0504        	ldw	x,#L75
 291  005f cd0000        	call	_lcdWriteString
 293                     ; 126 		   lcdSetLine    (3);
 295  0062 a603          	ld	a,#3
 296  0064 cd0000        	call	_lcdSetLine
 298                     ; 127 		   lcdWriteString(" Aperte o Botao ");
 300  0067 ae04e2        	ldw	x,#L36
 301  006a cd0000        	call	_lcdWriteString
 303                     ; 128 		   lcdSetLine    (4);
 305  006d a604          	ld	a,#4
 306  006f cd0000        	call	_lcdSetLine
 308                     ; 129 		   lcdWriteString("                ");
 310  0072 ae0504        	ldw	x,#L75
 311  0075 cd0000        	call	_lcdWriteString
 313                     ; 131 		 break;
 315  0078 ac760176      	jpf	L35
 316  007c               L7:
 317                     ; 133 		 case 2:
 317                     ; 134 		 
 317                     ; 135 		   lcdSetLine    (1);
 319  007c a601          	ld	a,#1
 320  007e cd0000        	call	_lcdSetLine
 322                     ; 136 		   lcdWriteString("      PRO4      "); 
 324  0081 ae0515        	ldw	x,#L55
 325  0084 cd0000        	call	_lcdWriteString
 327                     ; 137 		   lcdSetLine    (2);
 329  0087 a602          	ld	a,#2
 330  0089 cd0000        	call	_lcdSetLine
 332                     ; 138 		   lcdWriteString("                "); 
 334  008c ae0504        	ldw	x,#L75
 335  008f cd0000        	call	_lcdWriteString
 337                     ; 139 		   lcdSetLine    (3);
 339  0092 a603          	ld	a,#3
 340  0094 cd0000        	call	_lcdSetLine
 342                     ; 140 		   lcdWriteString("    Em Teste    ");
 344  0097 ae04d1        	ldw	x,#L56
 345  009a cd0000        	call	_lcdWriteString
 347                     ; 141 		   lcdSetLine    (4);
 349  009d a604          	ld	a,#4
 350  009f cd0000        	call	_lcdSetLine
 352                     ; 142 		   lcdWriteString("                ");
 354  00a2 ae0504        	ldw	x,#L75
 355  00a5 cd0000        	call	_lcdWriteString
 357                     ; 144 		 break;
 359  00a8 ac760176      	jpf	L35
 360  00ac               L11:
 361                     ; 146 		 case 3:
 361                     ; 147 		    
 361                     ; 148 			 lcdSetLine    (1);
 363  00ac a601          	ld	a,#1
 364  00ae cd0000        	call	_lcdSetLine
 366                     ; 149 		   lcdWriteString("      PRO4      "); 
 368  00b1 ae0515        	ldw	x,#L55
 369  00b4 cd0000        	call	_lcdWriteString
 371                     ; 150 		   lcdSetLine    (2);
 373  00b7 a602          	ld	a,#2
 374  00b9 cd0000        	call	_lcdSetLine
 376                     ; 151 		   lcdWriteString("                "); 
 378  00bc ae0504        	ldw	x,#L75
 379  00bf cd0000        	call	_lcdWriteString
 381                     ; 152 		   lcdSetLine    (3);
 383  00c2 a603          	ld	a,#3
 384  00c4 cd0000        	call	_lcdSetLine
 386                     ; 153 		   lcdWriteString("    Aprovado    ");
 388  00c7 ae04c0        	ldw	x,#L76
 389  00ca cd0000        	call	_lcdWriteString
 391                     ; 154 		   lcdSetLine    (4);
 393  00cd a604          	ld	a,#4
 394  00cf cd0000        	call	_lcdSetLine
 396                     ; 155 		   lcdWriteString("                ");
 398  00d2 ae0504        	ldw	x,#L75
 399  00d5 cd0000        	call	_lcdWriteString
 401                     ; 157      break;
 403  00d8 ac760176      	jpf	L35
 404  00dc               L31:
 405                     ; 159 		 case 4:
 405                     ; 160 		    
 405                     ; 161 			 lcdSetLine    (1);
 407  00dc a601          	ld	a,#1
 408  00de cd0000        	call	_lcdSetLine
 410                     ; 162 		   lcdWriteString("      PRO4      "); 
 412  00e1 ae0515        	ldw	x,#L55
 413  00e4 cd0000        	call	_lcdWriteString
 415                     ; 163 		   lcdSetLine    (2);
 417  00e7 a602          	ld	a,#2
 418  00e9 cd0000        	call	_lcdSetLine
 420                     ; 164 		   lcdWriteString("                "); 
 422  00ec ae0504        	ldw	x,#L75
 423  00ef cd0000        	call	_lcdWriteString
 425                     ; 165 		   lcdSetLine    (3);
 427  00f2 a603          	ld	a,#3
 428  00f4 cd0000        	call	_lcdSetLine
 430                     ; 166 		   lcdWriteString(" CN1 Invertido! ");
 432  00f7 ae04af        	ldw	x,#L17
 433  00fa cd0000        	call	_lcdWriteString
 435                     ; 167 		   lcdSetLine    (4);
 437  00fd a604          	ld	a,#4
 438  00ff cd0000        	call	_lcdSetLine
 440                     ; 168 		   lcdWriteString("                ");
 442  0102 ae0504        	ldw	x,#L75
 443  0105 cd0000        	call	_lcdWriteString
 445                     ; 170      break;
 447  0108 206c          	jra	L35
 448  010a               L51:
 449                     ; 172 		 case  5:
 449                     ; 173 		 case  6:
 449                     ; 174 		 case  7:
 449                     ; 175 		 case  8:
 449                     ; 176 		 case  9:
 449                     ; 177 		 case 10:
 449                     ; 178 		 case 11:
 449                     ; 179 		 case 12:
 449                     ; 180 		 case 13:
 449                     ; 181 		 case 14:
 449                     ; 182 		 case 15:
 449                     ; 183 		 case 16:
 449                     ; 184 		 case 17:
 449                     ; 185 		 case 18:
 449                     ; 186 		 case 19:
 449                     ; 187 		 case 20:
 449                     ; 188 		 case 21:
 449                     ; 189 		 case 22:
 449                     ; 190 		 case 23:
 449                     ; 191 		 case 24:
 449                     ; 192 		 case 25:
 449                     ; 193 		 case 26:
 449                     ; 194 		 case 27:
 449                     ; 195 		 case 28:
 449                     ; 196 		   
 449                     ; 197 			 lcdSetLine    (1);
 451  010a a601          	ld	a,#1
 452  010c cd0000        	call	_lcdSetLine
 454                     ; 198 		   lcdWriteString("      PRO4:     "); 
 456  010f ae049e        	ldw	x,#L37
 457  0112 cd0000        	call	_lcdWriteString
 459                     ; 199 		   lcdSetLine    (2);
 461  0115 a602          	ld	a,#2
 462  0117 cd0000        	call	_lcdSetLine
 464                     ; 200 		   lcdWriteString("                ");
 466  011a ae0504        	ldw	x,#L75
 467  011d cd0000        	call	_lcdWriteString
 469                     ; 201 		   lcdSetLine    (3);
 471  0120 a603          	ld	a,#3
 472  0122 cd0000        	call	_lcdSetLine
 474                     ; 202 		   lcdWriteString("     Falha:     ");
 476  0125 ae048d        	ldw	x,#L57
 477  0128 cd0000        	call	_lcdWriteString
 479                     ; 203 		   lcdSetLine    (4);
 481  012b a604          	ld	a,#4
 482  012d cd0000        	call	_lcdSetLine
 484                     ; 204 		   lcdWriteString((uint8_t *)&fail[status - 5]);
 486  0130 7b01          	ld	a,(OFST+1,sp)
 487  0132 97            	ld	xl,a
 488  0133 a611          	ld	a,#17
 489  0135 42            	mul	x,a
 490  0136 1d0055        	subw	x,#85
 491  0139 1c0000        	addw	x,#_fail
 492  013c cd0000        	call	_lcdWriteString
 494                     ; 206      break;
 496  013f 2035          	jra	L35
 497  0141               L71:
 498                     ; 208 		 case 29:
 498                     ; 209 		 case 30:
 498                     ; 210 		 case 31:
 498                     ; 211 		 case 32:
 498                     ; 212 		 case 33:
 498                     ; 213 		 case 34:
 498                     ; 214 		 case 35:
 498                     ; 215 		 case 36:
 498                     ; 216 		 case 37:
 498                     ; 217 		 case 38:
 498                     ; 218 		 case 39:
 498                     ; 219 		 case 40:
 498                     ; 220 		 case 41:
 498                     ; 221 		 case 42:
 498                     ; 222 		 case 43:
 498                     ; 223 		 case 44:
 498                     ; 224 		 case 45:
 498                     ; 225 		 case 46:
 498                     ; 226 		 case 47:
 498                     ; 227 		 case 48:
 498                     ; 228 		 case 49:
 498                     ; 229 		 case 50:
 498                     ; 230 		 case 51:
 498                     ; 231 		 case 52:
 498                     ; 232 		 case 53:
 498                     ; 233 		 case 54:
 498                     ; 234 		 case 55:
 498                     ; 235 		 case 56:
 498                     ; 236 		 case 57:
 498                     ; 237 		 case 58:
 498                     ; 238 		 case 59:
 498                     ; 239 		 case 60:
 498                     ; 240 		 case 61:
 498                     ; 241 		 case 62:
 498                     ; 242 		 case 63:
 498                     ; 243 		   
 498                     ; 244 			 lcdSetLine    (1);
 500  0141 a601          	ld	a,#1
 501  0143 cd0000        	call	_lcdSetLine
 503                     ; 245 		   lcdWriteString("      PRO4:     "); 
 505  0146 ae049e        	ldw	x,#L37
 506  0149 cd0000        	call	_lcdWriteString
 508                     ; 246 		   lcdSetLine    (2);
 510  014c a602          	ld	a,#2
 511  014e cd0000        	call	_lcdSetLine
 513                     ; 247 		   lcdWriteString("                ");
 515  0151 ae0504        	ldw	x,#L75
 516  0154 cd0000        	call	_lcdWriteString
 518                     ; 248 		   lcdSetLine    (3);
 520  0157 a603          	ld	a,#3
 521  0159 cd0000        	call	_lcdSetLine
 523                     ; 249 		   lcdWriteString("     Modelo:    ");
 525  015c ae047c        	ldw	x,#L77
 526  015f cd0000        	call	_lcdWriteString
 528                     ; 250 		   lcdSetLine    (4);
 530  0162 a604          	ld	a,#4
 531  0164 cd0000        	call	_lcdSetLine
 533                     ; 251 		   lcdWriteString((uint8_t *)&model[status - 29]);
 535  0167 7b01          	ld	a,(OFST+1,sp)
 536  0169 97            	ld	xl,a
 537  016a a611          	ld	a,#17
 538  016c 42            	mul	x,a
 539  016d 1d01ed        	subw	x,#493
 540  0170 1c01a9        	addw	x,#_model
 541  0173 cd0000        	call	_lcdWriteString
 543                     ; 253 		 break;
 545  0176               L12:
 546                     ; 255 		 default:
 546                     ; 256 		   
 546                     ; 257 			 
 546                     ; 258 			 
 546                     ; 259 		 break;
 548  0176               L35:
 549                     ; 262 	}
 552  0176 84            	pop	a
 553  0177 81            	ret
 618                     	xdef	_oldStatus
 619                     	xdef	_model
 620                     	xdef	_fail
 621                     	xdef	_messageUpdate
 622                     	xref	_lcdWriteString
 623                     	xref	_lcdSetLine
 624                     	switch	.const
 625  047c               L77:
 626  047c 20202020204d  	dc.b	"     Modelo:    ",0
 627  048d               L57:
 628  048d 202020202046  	dc.b	"     Falha:     ",0
 629  049e               L37:
 630  049e 202020202020  	dc.b	"      PRO4:     ",0
 631  04af               L17:
 632  04af 20434e312049  	dc.b	" CN1 Invertido! ",0
 633  04c0               L76:
 634  04c0 202020204170  	dc.b	"    Aprovado    ",0
 635  04d1               L56:
 636  04d1 20202020456d  	dc.b	"    Em Teste    ",0
 637  04e2               L36:
 638  04e2 204170657274  	dc.b	" Aperte o Botao ",0
 639  04f3               L16:
 640  04f3 20436f6e6563  	dc.b	" Conectar a PCI ",0
 641  0504               L75:
 642  0504 202020202020  	dc.b	"                ",0
 643  0515               L55:
 644  0515 202020202020  	dc.b	"      PRO4      ",0
 664                     	end
