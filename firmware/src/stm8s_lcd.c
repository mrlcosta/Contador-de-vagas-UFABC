/***************************************************************
 * Biblioteca de Controle do Display de LCD                    *
 ***************************************************************/
 
 /* Autor: Felipe Antonio Montagneri Lucchini
    Data : 16/06/2016
	*/
	
/***************************************************************/

#include "stm8s.h"
#include "stm8s_io.h"
#include "stm8s_lcd.h"
#include "stm8s_gpio.h"
#include "stm8s_timer.h"

uint16_t n = 0;

/***************************************************************
 * Funções e Procedimentos                                     *                            
 ***************************************************************/
/***************************************************************
 * void lcdInit(void);                                         *
 *                                                             * 
 * Inicialização do Display;                                   *
 *                                                             * 
 * void -> não recebe parâmetros;                              *
 *                                                             *
 * void -> não retorna valor;                                  *
 ***************************************************************/
void lcdInit(void){
	 
// GPIO_WriteLow(LCD_PORT, LCD_R_W);
	 GPIO_WriteLow(LCD_RS);
	 GPIO_WriteLow(LCD_E);   
	 
	 for(n = 0; n < 50000; n++){ nop(); }
	 for(n = 0; n < 50000; n++){ nop(); }
	 
   lcdWriteNibble(0x03, FALSE);	 
   lcdWriteNibble(0x03, FALSE); 
	 
   lcdWrite(0x02, FALSE); //set to 4 bit interface, 1 line and 5*7 font
   lcdWrite(0x28, FALSE); //set to 4 bit interface, 2 line and 5*10 font
   lcdWrite(0x0C, FALSE); //set to 4 bit interface, 2 line and 5*7 font
   lcdWrite(0x01, FALSE); //clear display
   lcdWrite(0x06, FALSE); //move cursor right after write
 	 	
  }

/***************************************************************
 * void lcdSetLine(line);                                      *
 *                                                             *
 * Posiciona o cursor na linha selecionada;                    *
 *                                                             *
 * uint8_t line -> linha selecionada;                          *
 *                                                             *
 * void -> não retorna valor;                                  *
 ***************************************************************/
void lcdSetLine(uint8_t line){
	 
   switch(line){
		 
		 case 1:
     lcdWrite(LINE_1, FALSE);
     break;
     
     case 2:
     lcdWrite(LINE_2, FALSE);
     break;
     
     case 3:
     lcdWrite(LINE_3, FALSE);
     break;
     
     case 4:
     lcdWrite(LINE_4, FALSE);
     break;
		 
		 default:
		 lcdWrite(LINE_1, FALSE);
		 break;
		 
    } 		
  }
	
/***************************************************************
 * lcdClear();                                                 *
 *                                                             *
 * Apaga o conteúdo do display;                                *
 *                                                             *
 * void -> não recebe parâmetros;                              *
 *                                                             *
 * void -> não retorna valor;                                  *
 ***************************************************************/
void lcdClear(void){
	 
	 lcdWrite(0x01, FALSE);
	 
  }

/***************************************************************
 * void lcdWrite(data, type);                                  *
 *                                                             *
 * Envia um byte para o display;                               *
 *                                                             *
 * uint8_t data -> endereço do buffer de envio;                *
 * uint8_t type -> seleção: TRUE = caractere, FALSE = comando; *
 *                                                             *
 * void -> não retorna valor;                                  *
 ***************************************************************/ 
void lcdWrite(uint8_t data, uint8_t type){
	 
   for(n = 0; n < 600; n++){ nop(); }
	 
   lcdWriteNibble(data >> 4, type); //WRITE THE UPPER NIBBLE
	 lcdWriteNibble(data,      type); //WRITE THE LOWER NIBBLE
	 
  }

/***************************************************************
 * void lcdWriteNibble(data, type);                            *
 *                                                             *
 * Envia um nibble para o display;                             *
 *                                                             *
 * uint8_t data -> endereço do buffer de envio;                *
 * uint8_t type -> seleção: TRUE = caractere, FALSE = comando; *
 *                                                             *
 * void -> não retorna valor;                                  *
 ***************************************************************/ 
void lcdWriteNibble(uint8_t data, uint8_t type){
	 
   GPIO_Write(LCD_PORT, (data << 2) & 0x3C);
	 
	 if(type == 0){ 
	   
		 GPIO_WriteLow(LCD_RS);
     
		} else {
			
		 GPIO_WriteHigh(LCD_RS);
     
		}
   
    GPIO_WriteHigh(LCD_E);    
		GPIO_WriteLow (LCD_E);
	 
  }
 
/***************************************************************
 * void lcdWriteString(&string);                               *
 *                                                             *
 * Envia uma string ao display;                                *
 *                                                             *
 * uint8_t * sting -> endereço do buffer de envio;             *
 *                                                             *
 * void -> não retorna valor;                                  *
 ***************************************************************/
 void lcdWriteString(const uint8_t *string){
	 
	 while(*string){
	   
		 lcdWrite(*string++, TRUE);
		 
		}
	 
  }
 
 
 
 
 
 


 