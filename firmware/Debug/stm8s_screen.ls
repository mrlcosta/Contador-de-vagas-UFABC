   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
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
  42  01a9 202020202020  	dc.b	"      TIMER     ",0
  43  01ba               _model:
  44  01ba 4d6f64656c6f  	dc.b	"Modelo: PRO4.0  ",0
  45  01cb 4d6f64656c6f  	dc.b	"Modelo: PRO4.1  ",0
  46  01dc 4d6f64656c6f  	dc.b	"Modelo: PRO4.4  ",0
  47  01ed 4d6f64656c6f  	dc.b	"Modelo: PRO4.6  ",0
  48  01fe 4d6f64656c6f  	dc.b	"Modelo: PRO4.8  ",0
  49  020f 4d6f64656c6f  	dc.b	"Modelo: PRO4.10 ",0
  50  0220 4d6f64656c6f  	dc.b	"Modelo: PRO4.11 ",0
  51  0231 4d6f64656c6f  	dc.b	"Modelo: PRO4.12 ",0
  52  0242 4d6f64656c6f  	dc.b	"Modelo: PRO4.15 ",0
  53  0253 4d6f64656c6f  	dc.b	"Modelo: PRO4.16 ",0
  54  0264 4d6f64656c6f  	dc.b	"Modelo: PRO4.19 ",0
  55  0275 4d6f64656c6f  	dc.b	"Modelo: PRO4.20 ",0
  56  0286 4d6f64656c6f  	dc.b	"Modelo: PRO4.22 ",0
  57  0297 4d6f64656c6f  	dc.b	"Modelo: PRO4.23 ",0
  58  02a8 4d6f64656c6f  	dc.b	"Modelo: PRO4.25 ",0
  59  02b9 4d6f64656c6f  	dc.b	"Modelo: PRO4.26 ",0
  60  02ca 4d6f64656c6f  	dc.b	"Modelo: PRO4.27 ",0
  61  02db 4d6f64656c6f  	dc.b	"Modelo: PRO4.28 ",0
  62  02ec 4d6f64656c6f  	dc.b	"Modelo: PRO4.29 ",0
  63  02fd 4d6f64656c6f  	dc.b	"Modelo: PRO4.30 ",0
  64  030e 4d6f64656c6f  	dc.b	"Modelo: PRO4.31 ",0
  65  031f 4d6f64656c6f  	dc.b	"Modelo: PRO4.32 ",0
  66  0330 4d6f64656c6f  	dc.b	"Modelo: PRO4.34 ",0
  67  0341 4d6f64656c6f  	dc.b	"Modelo: PRO4.35 ",0
  68  0352 4d6f64656c6f  	dc.b	"Modelo: PRO4.36 ",0
  69  0363 4d6f64656c6f  	dc.b	"Modelo: PRO4.37 ",0
  70  0374 4d6f64656c6f  	dc.b	"Modelo: PRO4.38 ",0
  71  0385 4d6f64656c6f  	dc.b	"Modelo: PRO4.40 ",0
  72  0396 4d6f64656c6f  	dc.b	"Modelo: PRO4.41 ",0
  73  03a7 4d6f64656c6f  	dc.b	"Modelo: PRO4.42 ",0
  74  03b8 4d6f64656c6f  	dc.b	"Modelo: PRO4.43 ",0
  75  03c9 4d6f64656c6f  	dc.b	"Modelo: PRO4.44 ",0
  76  03da 4d6f64656c6f  	dc.b	"Modelo: PRO4.46 ",0
  77  03eb 4d6f64656c6f  	dc.b	"Modelo: PRO4.48 ",0
  78  03fc 4d6f64656c6f  	dc.b	"Modelo: PRO4.54 ",0
  79  040d               _name:
  80  040d 202020202050  	dc.b	"     PRO4.0     ",0
  81  041e 202020202050  	dc.b	"     PRO4.1     ",0
  82  042f 202020202050  	dc.b	"     PRO4.4     ",0
  83  0440 202020202050  	dc.b	"     PRO4.6     ",0
  84  0451 202020202050  	dc.b	"     PRO4.8     ",0
  85  0462 202020202050  	dc.b	"     PRO4.10    ",0
  86  0473 202020202050  	dc.b	"     PRO4.11    ",0
  87  0484 202020202050  	dc.b	"     PRO4.12    ",0
  88  0495 202020202050  	dc.b	"     PRO4.15    ",0
  89  04a6 202020202050  	dc.b	"     PRO4.16    ",0
  90  04b7 202020202050  	dc.b	"     PRO4.19    ",0
  91  04c8 202020202050  	dc.b	"     PRO4.20    ",0
  92  04d9 202020202050  	dc.b	"     PRO4.22    ",0
  93  04ea 202020202050  	dc.b	"     PRO4.23    ",0
  94  04fb 202020202050  	dc.b	"     PRO4.25    ",0
  95  050c 202020202050  	dc.b	"     PRO4.26    ",0
  96  051d 202020202050  	dc.b	"     PRO4.27    ",0
  97  052e 202020202050  	dc.b	"     PRO4.28    ",0
  98  053f 202020202050  	dc.b	"     PRO4.29    ",0
  99  0550 202020202050  	dc.b	"     PRO4.30    ",0
 100  0561 202020202050  	dc.b	"     PRO4.31    ",0
 101  0572 202020202050  	dc.b	"     PRO4.32    ",0
 102  0583 202020202050  	dc.b	"     PRO4.34    ",0
 103  0594 202020202050  	dc.b	"     PRO4.35    ",0
 104  05a5 202020202050  	dc.b	"     PRO4.36    ",0
 105  05b6 202020202050  	dc.b	"     PRO4.37    ",0
 106  05c7 202020202050  	dc.b	"     PRO4.38    ",0
 107  05d8 202020202050  	dc.b	"     PRO4.40    ",0
 108  05e9 202020202050  	dc.b	"     PRO4.41    ",0
 109  05fa 202020202050  	dc.b	"     PRO4.42    ",0
 110  060b 202020202050  	dc.b	"     PRO4.43    ",0
 111  061c 202020202050  	dc.b	"     PRO4.44    ",0
 112  062d 202020202050  	dc.b	"     PRO4.46    ",0
 113  063e 202020202050  	dc.b	"     PRO4.48    ",0
 114  064f 202020202050  	dc.b	"     PRO4.54    ",0
 115                     	bsct
 116  0000               _oldStatus:
 117  0000 64            	dc.b	100
 172                     	switch	.const
 173  0660               L01:
 174  0660 001d          	dc.w	L3
 175  0662 0056          	dc.w	L5
 176  0664 008f          	dc.w	L7
 177  0666 00c8          	dc.w	L11
 178  0668 0101          	dc.w	L31
 179  066a 0138          	dc.w	L51
 180  066c 0138          	dc.w	L51
 181  066e 0138          	dc.w	L51
 182  0670 0138          	dc.w	L51
 183  0672 0138          	dc.w	L51
 184  0674 0138          	dc.w	L51
 185  0676 0138          	dc.w	L51
 186  0678 0138          	dc.w	L51
 187  067a 0138          	dc.w	L51
 188  067c 0138          	dc.w	L51
 189  067e 0138          	dc.w	L51
 190  0680 0138          	dc.w	L51
 191  0682 0138          	dc.w	L51
 192  0684 0138          	dc.w	L51
 193  0686 0138          	dc.w	L51
 194  0688 0138          	dc.w	L51
 195  068a 0138          	dc.w	L51
 196  068c 0138          	dc.w	L51
 197  068e 0138          	dc.w	L51
 198  0690 0138          	dc.w	L51
 199  0692 0138          	dc.w	L51
 200  0694 0138          	dc.w	L51
 201  0696 0138          	dc.w	L51
 202  0698 0138          	dc.w	L51
 203  069a 0138          	dc.w	L51
 204  069c 0138          	dc.w	L51
 205  069e 0178          	dc.w	L71
 206  06a0 0178          	dc.w	L71
 207  06a2 0178          	dc.w	L71
 208  06a4 0178          	dc.w	L71
 209  06a6 0178          	dc.w	L71
 210  06a8 0178          	dc.w	L71
 211  06aa 0178          	dc.w	L71
 212  06ac 0178          	dc.w	L71
 213  06ae 0178          	dc.w	L71
 214  06b0 0178          	dc.w	L71
 215  06b2 0178          	dc.w	L71
 216  06b4 0178          	dc.w	L71
 217  06b6 0178          	dc.w	L71
 218  06b8 0178          	dc.w	L71
 219  06ba 0178          	dc.w	L71
 220  06bc 0178          	dc.w	L71
 221  06be 0178          	dc.w	L71
 222  06c0 0178          	dc.w	L71
 223  06c2 0178          	dc.w	L71
 224  06c4 0178          	dc.w	L71
 225  06c6 0178          	dc.w	L71
 226  06c8 0178          	dc.w	L71
 227  06ca 0178          	dc.w	L71
 228  06cc 0178          	dc.w	L71
 229  06ce 0178          	dc.w	L71
 230  06d0 0178          	dc.w	L71
 231  06d2 0178          	dc.w	L71
 232  06d4 0178          	dc.w	L71
 233  06d6 0178          	dc.w	L71
 234  06d8 0178          	dc.w	L71
 235  06da 0178          	dc.w	L71
 236  06dc 0178          	dc.w	L71
 237  06de 0178          	dc.w	L71
 238  06e0 0178          	dc.w	L71
 239  06e2 0178          	dc.w	L71
 240                     ; 131 void screenUpdate(uint8_t status, uint8_t title){
 241                     	scross	off
 242                     	switch	.text
 243  0000               _screenUpdate:
 245  0000 89            	pushw	x
 246       00000000      OFST:	set	0
 249                     ; 133 	 if(status == oldStatus){
 251  0001 9e            	ld	a,xh
 252  0002 b100          	cp	a,_oldStatus
 253  0004 2602          	jrne	L35
 254                     ; 135 		 return;
 257  0006 85            	popw	x
 258  0007 81            	ret
 259  0008               L35:
 260                     ; 139 	 oldStatus = status;	
 262  0008 7b01          	ld	a,(OFST+1,sp)
 263  000a b700          	ld	_oldStatus,a
 264                     ; 143 	 switch (status) {
 266  000c 7b01          	ld	a,(OFST+1,sp)
 268                     ; 295 		 default:
 268                     ; 296 		   
 268                     ; 297 			 
 268                     ; 298 			 
 268                     ; 299 		 break;
 269  000e a142          	cp	a,#66
 270  0010 2407          	jruge	L6
 271  0012 5f            	clrw	x
 272  0013 97            	ld	xl,a
 273  0014 58            	sllw	x
 274  0015 de0660        	ldw	x,(L01,x)
 275  0018 fc            	jp	(x)
 276  0019               L6:
 277  0019 acad01ad      	jpf	L75
 278  001d               L3:
 279                     ; 145 		 case 0:
 279                     ; 146 		   
 279                     ; 147 		   lcdSetLine    (1);
 281  001d a601          	ld	a,#1
 282  001f cd0000        	call	_lcdSetLine
 284                     ; 148 		   lcdWriteString((uint8_t *)&name[title - 1]); 
 286  0022 7b02          	ld	a,(OFST+2,sp)
 287  0024 97            	ld	xl,a
 288  0025 a611          	ld	a,#17
 289  0027 42            	mul	x,a
 290  0028 1d0011        	subw	x,#17
 291  002b 1c040d        	addw	x,#_name
 292  002e cd0000        	call	_lcdWriteString
 294                     ; 149 		   lcdSetLine    (2);
 296  0031 a602          	ld	a,#2
 297  0033 cd0000        	call	_lcdSetLine
 299                     ; 150 		   lcdWriteString("                "); 
 301  0036 ae075b        	ldw	x,#L16
 302  0039 cd0000        	call	_lcdWriteString
 304                     ; 151 		   lcdSetLine    (3);
 306  003c a603          	ld	a,#3
 307  003e cd0000        	call	_lcdSetLine
 309                     ; 152 		   lcdWriteString(" Conectar a PCI ");
 311  0041 ae074a        	ldw	x,#L36
 312  0044 cd0000        	call	_lcdWriteString
 314                     ; 153 		   lcdSetLine    (4);
 316  0047 a604          	ld	a,#4
 317  0049 cd0000        	call	_lcdSetLine
 319                     ; 154 		   lcdWriteString("                ");
 321  004c ae075b        	ldw	x,#L16
 322  004f cd0000        	call	_lcdWriteString
 324                     ; 156 		 break;
 326  0052 acad01ad      	jpf	L75
 327  0056               L5:
 328                     ; 158 		 case 1:
 328                     ; 159 		   
 328                     ; 160 		   lcdSetLine    (1);
 330  0056 a601          	ld	a,#1
 331  0058 cd0000        	call	_lcdSetLine
 333                     ; 161 		   lcdWriteString((uint8_t *)&name[title - 1]); 
 335  005b 7b02          	ld	a,(OFST+2,sp)
 336  005d 97            	ld	xl,a
 337  005e a611          	ld	a,#17
 338  0060 42            	mul	x,a
 339  0061 1d0011        	subw	x,#17
 340  0064 1c040d        	addw	x,#_name
 341  0067 cd0000        	call	_lcdWriteString
 343                     ; 162 		   lcdSetLine    (2);
 345  006a a602          	ld	a,#2
 346  006c cd0000        	call	_lcdSetLine
 348                     ; 163 		   lcdWriteString("                "); 
 350  006f ae075b        	ldw	x,#L16
 351  0072 cd0000        	call	_lcdWriteString
 353                     ; 164 		   lcdSetLine    (3);
 355  0075 a603          	ld	a,#3
 356  0077 cd0000        	call	_lcdSetLine
 358                     ; 165 		   lcdWriteString(" Aperte o Botao ");
 360  007a ae0739        	ldw	x,#L56
 361  007d cd0000        	call	_lcdWriteString
 363                     ; 166 		   lcdSetLine    (4);
 365  0080 a604          	ld	a,#4
 366  0082 cd0000        	call	_lcdSetLine
 368                     ; 167 		   lcdWriteString("                ");
 370  0085 ae075b        	ldw	x,#L16
 371  0088 cd0000        	call	_lcdWriteString
 373                     ; 169 		 break;
 375  008b acad01ad      	jpf	L75
 376  008f               L7:
 377                     ; 171 		 case 2:
 377                     ; 172 		 
 377                     ; 173 		   lcdSetLine    (1);
 379  008f a601          	ld	a,#1
 380  0091 cd0000        	call	_lcdSetLine
 382                     ; 174 		   lcdWriteString((uint8_t *)&name[title - 1]); 
 384  0094 7b02          	ld	a,(OFST+2,sp)
 385  0096 97            	ld	xl,a
 386  0097 a611          	ld	a,#17
 387  0099 42            	mul	x,a
 388  009a 1d0011        	subw	x,#17
 389  009d 1c040d        	addw	x,#_name
 390  00a0 cd0000        	call	_lcdWriteString
 392                     ; 175 		   lcdSetLine    (2);
 394  00a3 a602          	ld	a,#2
 395  00a5 cd0000        	call	_lcdSetLine
 397                     ; 176 		   lcdWriteString("                "); 
 399  00a8 ae075b        	ldw	x,#L16
 400  00ab cd0000        	call	_lcdWriteString
 402                     ; 177 		   lcdSetLine    (3);
 404  00ae a603          	ld	a,#3
 405  00b0 cd0000        	call	_lcdSetLine
 407                     ; 178 		   lcdWriteString("    Em Teste    ");
 409  00b3 ae0728        	ldw	x,#L76
 410  00b6 cd0000        	call	_lcdWriteString
 412                     ; 179 		   lcdSetLine    (4);
 414  00b9 a604          	ld	a,#4
 415  00bb cd0000        	call	_lcdSetLine
 417                     ; 180 		   lcdWriteString("                ");
 419  00be ae075b        	ldw	x,#L16
 420  00c1 cd0000        	call	_lcdWriteString
 422                     ; 182 		 break;
 424  00c4 acad01ad      	jpf	L75
 425  00c8               L11:
 426                     ; 184 		 case 3:
 426                     ; 185 		    
 426                     ; 186 			 lcdSetLine    (1);
 428  00c8 a601          	ld	a,#1
 429  00ca cd0000        	call	_lcdSetLine
 431                     ; 187 		   lcdWriteString((uint8_t *)&name[title - 1]); 
 433  00cd 7b02          	ld	a,(OFST+2,sp)
 434  00cf 97            	ld	xl,a
 435  00d0 a611          	ld	a,#17
 436  00d2 42            	mul	x,a
 437  00d3 1d0011        	subw	x,#17
 438  00d6 1c040d        	addw	x,#_name
 439  00d9 cd0000        	call	_lcdWriteString
 441                     ; 188 		   lcdSetLine    (2);
 443  00dc a602          	ld	a,#2
 444  00de cd0000        	call	_lcdSetLine
 446                     ; 189 		   lcdWriteString("                "); 
 448  00e1 ae075b        	ldw	x,#L16
 449  00e4 cd0000        	call	_lcdWriteString
 451                     ; 190 		   lcdSetLine    (3);
 453  00e7 a603          	ld	a,#3
 454  00e9 cd0000        	call	_lcdSetLine
 456                     ; 191 		   lcdWriteString("    Aprovado    ");
 458  00ec ae0717        	ldw	x,#L17
 459  00ef cd0000        	call	_lcdWriteString
 461                     ; 192 		   lcdSetLine    (4);
 463  00f2 a604          	ld	a,#4
 464  00f4 cd0000        	call	_lcdSetLine
 466                     ; 193 		   lcdWriteString("                ");
 468  00f7 ae075b        	ldw	x,#L16
 469  00fa cd0000        	call	_lcdWriteString
 471                     ; 195      break;
 473  00fd acad01ad      	jpf	L75
 474  0101               L31:
 475                     ; 197 		 case 4:
 475                     ; 198 		    
 475                     ; 199 			 lcdSetLine    (1);
 477  0101 a601          	ld	a,#1
 478  0103 cd0000        	call	_lcdSetLine
 480                     ; 200 		   lcdWriteString((uint8_t *)&name[title - 1]); 
 482  0106 7b02          	ld	a,(OFST+2,sp)
 483  0108 97            	ld	xl,a
 484  0109 a611          	ld	a,#17
 485  010b 42            	mul	x,a
 486  010c 1d0011        	subw	x,#17
 487  010f 1c040d        	addw	x,#_name
 488  0112 cd0000        	call	_lcdWriteString
 490                     ; 201 		   lcdSetLine    (2);
 492  0115 a602          	ld	a,#2
 493  0117 cd0000        	call	_lcdSetLine
 495                     ; 202 		   lcdWriteString("                "); 
 497  011a ae075b        	ldw	x,#L16
 498  011d cd0000        	call	_lcdWriteString
 500                     ; 203 		   lcdSetLine    (3);
 502  0120 a603          	ld	a,#3
 503  0122 cd0000        	call	_lcdSetLine
 505                     ; 204 		   lcdWriteString(" CN1 Invertido! ");
 507  0125 ae0706        	ldw	x,#L37
 508  0128 cd0000        	call	_lcdWriteString
 510                     ; 205 		   lcdSetLine    (4);
 512  012b a604          	ld	a,#4
 513  012d cd0000        	call	_lcdSetLine
 515                     ; 206 		   lcdWriteString("                ");
 517  0130 ae075b        	ldw	x,#L16
 518  0133 cd0000        	call	_lcdWriteString
 520                     ; 208      break;
 522  0136 2075          	jra	L75
 523  0138               L51:
 524                     ; 210 		 case  5:
 524                     ; 211 		 case  6:
 524                     ; 212 		 case  7:
 524                     ; 213 		 case  8:
 524                     ; 214 		 case  9:
 524                     ; 215 		 case 10:
 524                     ; 216 		 case 11:
 524                     ; 217 		 case 12:
 524                     ; 218 		 case 13:
 524                     ; 219 		 case 14:
 524                     ; 220 		 case 15:
 524                     ; 221 		 case 16:
 524                     ; 222 		 case 17:
 524                     ; 223 		 case 18:
 524                     ; 224 		 case 19:
 524                     ; 225 		 case 20:
 524                     ; 226 		 case 21:
 524                     ; 227 		 case 22:
 524                     ; 228 		 case 23:
 524                     ; 229 		 case 24:
 524                     ; 230 		 case 25:
 524                     ; 231 		 case 26:
 524                     ; 232 		 case 27:
 524                     ; 233 		 case 28:
 524                     ; 234 		 case 29:
 524                     ; 235 		 case 30:
 524                     ; 236 		   
 524                     ; 237 			 lcdSetLine    (1);
 526  0138 a601          	ld	a,#1
 527  013a cd0000        	call	_lcdSetLine
 529                     ; 238 		   lcdWriteString((uint8_t *)&name[title - 1]); 
 531  013d 7b02          	ld	a,(OFST+2,sp)
 532  013f 97            	ld	xl,a
 533  0140 a611          	ld	a,#17
 534  0142 42            	mul	x,a
 535  0143 1d0011        	subw	x,#17
 536  0146 1c040d        	addw	x,#_name
 537  0149 cd0000        	call	_lcdWriteString
 539                     ; 239 		   lcdSetLine    (2);
 541  014c a602          	ld	a,#2
 542  014e cd0000        	call	_lcdSetLine
 544                     ; 240 		   lcdWriteString("                ");
 546  0151 ae075b        	ldw	x,#L16
 547  0154 cd0000        	call	_lcdWriteString
 549                     ; 241 		   lcdSetLine    (3);
 551  0157 a603          	ld	a,#3
 552  0159 cd0000        	call	_lcdSetLine
 554                     ; 242 		   lcdWriteString("     Falha:     ");
 556  015c ae06f5        	ldw	x,#L57
 557  015f cd0000        	call	_lcdWriteString
 559                     ; 243 		   lcdSetLine    (4);
 561  0162 a604          	ld	a,#4
 562  0164 cd0000        	call	_lcdSetLine
 564                     ; 244 		   lcdWriteString((uint8_t *)&fail[status - 5]);
 566  0167 7b01          	ld	a,(OFST+1,sp)
 567  0169 97            	ld	xl,a
 568  016a a611          	ld	a,#17
 569  016c 42            	mul	x,a
 570  016d 1d0055        	subw	x,#85
 571  0170 1c0000        	addw	x,#_fail
 572  0173 cd0000        	call	_lcdWriteString
 574                     ; 246      break;
 576  0176 2035          	jra	L75
 577  0178               L71:
 578                     ; 248 		 case 31:
 578                     ; 249 		 case 32:
 578                     ; 250 		 case 33:
 578                     ; 251 		 case 34:
 578                     ; 252 		 case 35:
 578                     ; 253 		 case 36:
 578                     ; 254 		 case 37:
 578                     ; 255 		 case 38:
 578                     ; 256 		 case 39:
 578                     ; 257 		 case 40:
 578                     ; 258 		 case 41:
 578                     ; 259 		 case 42:
 578                     ; 260 		 case 43:
 578                     ; 261 		 case 44:
 578                     ; 262 		 case 45:
 578                     ; 263 		 case 46:
 578                     ; 264 		 case 47:
 578                     ; 265 		 case 48:
 578                     ; 266 		 case 49:
 578                     ; 267 		 case 50:
 578                     ; 268 		 case 51:
 578                     ; 269 		 case 52:
 578                     ; 270 		 case 53:
 578                     ; 271 		 case 54:
 578                     ; 272 		 case 55:
 578                     ; 273 		 case 56:
 578                     ; 274 		 case 57:
 578                     ; 275 		 case 58:
 578                     ; 276 		 case 59:
 578                     ; 277 		 case 60:
 578                     ; 278 		 case 61:
 578                     ; 279 		 case 62:
 578                     ; 280 		 case 63:
 578                     ; 281 		 case 64:
 578                     ; 282 		 case 65:
 578                     ; 283 		   
 578                     ; 284 			 lcdSetLine    (1);
 580  0178 a601          	ld	a,#1
 581  017a cd0000        	call	_lcdSetLine
 583                     ; 285 		   lcdWriteString("      PRO4:     "); 
 585  017d ae06e4        	ldw	x,#L77
 586  0180 cd0000        	call	_lcdWriteString
 588                     ; 286 		   lcdSetLine    (2);
 590  0183 a602          	ld	a,#2
 591  0185 cd0000        	call	_lcdSetLine
 593                     ; 287 		   lcdWriteString("                ");
 595  0188 ae075b        	ldw	x,#L16
 596  018b cd0000        	call	_lcdWriteString
 598                     ; 288 		   lcdSetLine    (3);
 600  018e a603          	ld	a,#3
 601  0190 cd0000        	call	_lcdSetLine
 603                     ; 289 		   lcdWriteString((uint8_t *)&model[status - 31]);
 605  0193 7b01          	ld	a,(OFST+1,sp)
 606  0195 97            	ld	xl,a
 607  0196 a611          	ld	a,#17
 608  0198 42            	mul	x,a
 609  0199 1d020f        	subw	x,#527
 610  019c 1c01ba        	addw	x,#_model
 611  019f cd0000        	call	_lcdWriteString
 613                     ; 290 		   lcdSetLine    (4);
 615  01a2 a604          	ld	a,#4
 616  01a4 cd0000        	call	_lcdSetLine
 618                     ; 291 		   lcdWriteString("                ");
 620  01a7 ae075b        	ldw	x,#L16
 621  01aa cd0000        	call	_lcdWriteString
 623                     ; 293 		 break;
 625  01ad               L12:
 626                     ; 295 		 default:
 626                     ; 296 		   
 626                     ; 297 			 
 626                     ; 298 			 
 626                     ; 299 		 break;
 628  01ad               L75:
 629                     ; 302 	}
 632  01ad 85            	popw	x
 633  01ae 81            	ret
 710                     	xdef	_oldStatus
 711                     	xdef	_name
 712                     	xdef	_model
 713                     	xdef	_fail
 714                     	xdef	_screenUpdate
 715                     	xref	_lcdWriteString
 716                     	xref	_lcdSetLine
 717                     	switch	.const
 718  06e4               L77:
 719  06e4 202020202020  	dc.b	"      PRO4:     ",0
 720  06f5               L57:
 721  06f5 202020202046  	dc.b	"     Falha:     ",0
 722  0706               L37:
 723  0706 20434e312049  	dc.b	" CN1 Invertido! ",0
 724  0717               L17:
 725  0717 202020204170  	dc.b	"    Aprovado    ",0
 726  0728               L76:
 727  0728 20202020456d  	dc.b	"    Em Teste    ",0
 728  0739               L56:
 729  0739 204170657274  	dc.b	" Aperte o Botao ",0
 730  074a               L36:
 731  074a 20436f6e6563  	dc.b	" Conectar a PCI ",0
 732  075b               L16:
 733  075b 202020202020  	dc.b	"                ",0
 753                     	end
