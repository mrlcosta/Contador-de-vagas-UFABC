/***************************************************************
 * Biblioteca de Controle do Display de LCD                    *
 ***************************************************************/
 
 /* Autor: Felipe Antonio Montagneri Lucchini
    Data : 27/10/2016
	*/
	
/***************************************************************/

#include "stm8s.h"
#include "stm8s_lcd.h"
#include "stm8s_timer.h"
#include "stm8s_flash.h"
#include "stm8s_screen.h"
	
const string fail[] =  {"   Comunicacao  ",
                        " Curto Circuito ",
		  									"   TIMER/PROT   ",
   											"      SETA      ",
											  "      L15       ",
                        "     CMD UP     ",
                        "     CMD DN     ",
                        "      DOOR      ",
                        "     SW UP1     ",
                        "     SW UP2     ",
                        "     SW UP3     ",
                        "     SW UP4     ",
                        "     SW DN1     ",
                        "     SW DN2     ",
                        "     SW DN3     ",
                        "     SW DN4     ",
                        "      BAT       ",
                        "     I MOT1     ",
                        "     I MOT2     ",
                        "     I MOT3     ",
                        "     I MOT4     ",
                        "    IN PULSE1   ",
                        "    IN PULSE2   ",
                        "    IN PULSE3   ",
                        "    IN PULSE4   ",
												"      TIMER     "};												
												
const string model[] = {"Modelo: PRO4.0  ",
										  	"Modelo: PRO4.1  ",
											  "Modelo: PRO4.4  ",
											  "Modelo: PRO4.6  ",
								   			"Modelo: PRO4.8  ",
								   			"Modelo: PRO4.10 ",
								   			"Modelo: PRO4.11 ",
                        "Modelo: PRO4.12 ",
                        "Modelo: PRO4.15 ",
                        "Modelo: PRO4.16 ",
												"Modelo: PRO4.19 ",
                        "Modelo: PRO4.20 ",
                        "Modelo: PRO4.22 ",
                        "Modelo: PRO4.23 ",
                        "Modelo: PRO4.25 ",
                        "Modelo: PRO4.26 ",
                        "Modelo: PRO4.27 ",
                        "Modelo: PRO4.28 ",
                        "Modelo: PRO4.29 ",
                        "Modelo: PRO4.30 ",
                        "Modelo: PRO4.31 ",
                        "Modelo: PRO4.32 ",
                        "Modelo: PRO4.34 ",
                        "Modelo: PRO4.35 ",
                        "Modelo: PRO4.36 ",
                        "Modelo: PRO4.37 ",
                        "Modelo: PRO4.38 ",
                        "Modelo: PRO4.40 ",
											  "Modelo: PRO4.41 ",
   											"Modelo: PRO4.42 ",
		  									"Modelo: PRO4.43 ",
			  								"Modelo: PRO4.44 ",
												"Modelo: PRO4.46 ",
				  							"Modelo: PRO4.48 ",
												"Modelo: PRO4.54 "};
												
const string name[] =  {"     PRO4.0     ",
										  	"     PRO4.1     ",
											  "     PRO4.4     ",
											  "     PRO4.6     ",
								   			"     PRO4.8     ",
								   			"     PRO4.10    ",
								   			"     PRO4.11    ",
                        "     PRO4.12    ",
                        "     PRO4.15    ",
                        "     PRO4.16    ",
												"     PRO4.19    ",
                        "     PRO4.20    ",
                        "     PRO4.22    ",
                        "     PRO4.23    ",
                        "     PRO4.25    ",
                        "     PRO4.26    ",
                        "     PRO4.27    ",
                        "     PRO4.28    ",
                        "     PRO4.29    ",
                        "     PRO4.30    ",
                        "     PRO4.31    ",
                        "     PRO4.32    ",
                        "     PRO4.34    ",
                        "     PRO4.35    ",
                        "     PRO4.36    ",
                        "     PRO4.37    ",
                        "     PRO4.38    ",
                        "     PRO4.40    ",
											  "     PRO4.41    ",
   											"     PRO4.42    ",
		  									"     PRO4.43    ",
			  								"     PRO4.44    ",
												"     PRO4.46    ",
				  							"     PRO4.48    ",
												"     PRO4.54    "};
  
uint8_t oldStatus = 100;
 	
/***************************************************************
 * Funções e Procedimentos                                     *
 ***************************************************************/
/***************************************************************
 * screenUpdate(status, title);                                *
 *                                                             *
 * Procedimento de atualização das mensagens no display;       *
 *                                                             *
 * uint8_t status -> código de erro;                           *
 * uint8_t title  -> modelo selecionado;                       *
 *                                                             *
 * void -> não retorna valor;                                  *
 ***************************************************************/
void screenUpdate(uint8_t status, uint8_t title){
	 
	 if(status == oldStatus){
		 
		 return;
		 
	  }
		
	 oldStatus = status;	
	 
   //lcdInit();
	 
	 switch (status) {
		 
		 case 0:
		   
		   lcdSetLine    (1);
		   lcdWriteString((uint8_t *)&name[title - 1]); 
		   lcdSetLine    (2);
		   lcdWriteString("                "); 
		   lcdSetLine    (3);
		   lcdWriteString(" Conectar a PCI ");
		   lcdSetLine    (4);
		   lcdWriteString("                ");
		   
		 break;
		 
		 case 1:
		   
		   lcdSetLine    (1);
		   lcdWriteString((uint8_t *)&name[title - 1]); 
		   lcdSetLine    (2);
		   lcdWriteString("                "); 
		   lcdSetLine    (3);
		   lcdWriteString(" Aperte o Botao ");
		   lcdSetLine    (4);
		   lcdWriteString("                ");
		   
		 break;
		 
		 case 2:
		 
		   lcdSetLine    (1);
		   lcdWriteString((uint8_t *)&name[title - 1]); 
		   lcdSetLine    (2);
		   lcdWriteString("                "); 
		   lcdSetLine    (3);
		   lcdWriteString("    Em Teste    ");
		   lcdSetLine    (4);
		   lcdWriteString("                ");
		   
		 break;
		 
		 case 3:
		    
			 lcdSetLine    (1);
		   lcdWriteString((uint8_t *)&name[title - 1]); 
		   lcdSetLine    (2);
		   lcdWriteString("                "); 
		   lcdSetLine    (3);
		   lcdWriteString("    Aprovado    ");
		   lcdSetLine    (4);
		   lcdWriteString("                ");
       
     break;
		 
		 case 4:
		    
			 lcdSetLine    (1);
		   lcdWriteString((uint8_t *)&name[title - 1]); 
		   lcdSetLine    (2);
		   lcdWriteString("                "); 
		   lcdSetLine    (3);
		   lcdWriteString(" CN1 Invertido! ");
		   lcdSetLine    (4);
		   lcdWriteString("                ");
       
     break;
		  
		 case  5:
		 case  6:
		 case  7:
		 case  8:
		 case  9:
		 case 10:
		 case 11:
		 case 12:
		 case 13:
		 case 14:
		 case 15:
		 case 16:
		 case 17:
		 case 18:
		 case 19:
		 case 20:
		 case 21:
		 case 22:
		 case 23:
		 case 24:
		 case 25:
		 case 26:
		 case 27:
		 case 28:
		 case 29:
		 case 30:
		   
			 lcdSetLine    (1);
		   lcdWriteString((uint8_t *)&name[title - 1]); 
		   lcdSetLine    (2);
		   lcdWriteString("                ");
		   lcdSetLine    (3);
		   lcdWriteString("     Falha:     ");
		   lcdSetLine    (4);
		   lcdWriteString((uint8_t *)&fail[status - 5]);
		    
     break;
		  
		 case 31:
		 case 32:
		 case 33:
		 case 34:
		 case 35:
		 case 36:
		 case 37:
		 case 38:
		 case 39:
		 case 40:
		 case 41:
		 case 42:
		 case 43:
		 case 44:
		 case 45:
		 case 46:
		 case 47:
		 case 48:
		 case 49:
		 case 50:
		 case 51:
		 case 52:
		 case 53:
		 case 54:
		 case 55:
		 case 56:
		 case 57:
		 case 58:
		 case 59:
		 case 60:
		 case 61:
		 case 62:
		 case 63:
		 case 64:
		 case 65:
		   
			 lcdSetLine    (1);
		   lcdWriteString("      PRO4:     "); 
		   lcdSetLine    (2);
		   lcdWriteString("                ");
		   lcdSetLine    (3);
		   lcdWriteString((uint8_t *)&model[status - 31]);
		   lcdSetLine    (4);
		   lcdWriteString("                ");
		    
		 break;
		
		 default:
		   
			 
			 
		 break;
		 
	  }
	}