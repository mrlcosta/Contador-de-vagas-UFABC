/***************************************************************
 * Biblioteca de Controle do Display de LCD                    *
 ***************************************************************/
 
 /* Autor: Felipe Antonio Montagneri Lucchini
    Data : 16/06/2016
	*/
	
#define LCD_16X4
	
#ifdef LCD_16X4

#define LINE_1 0x80
#define LINE_2 0xC0
#define LINE_3 0x90
#define LINE_4 0xD0

#endif

#ifdef LCD_20X4

#define LINE_1 0x80
#define LINE_2 0xC0
#define LINE_3 0x94
#define LINE_4 0xD4

#endif



/***************************************************************
 * Fun��es e Procedimentos                                     *                            
 ***************************************************************/
/***************************************************************
 * void lcdInit(void);                                         *
 *                                                             * 
 * Inicializa��o do Display;                                   *
 *                                                             * 
 * void -> n�o recebe par�metros;                              *
 *                                                             *
 * void -> n�o retorna valor;                                  *
 ***************************************************************/
void lcdInit(void);

/***************************************************************
 * void lcdSetLine(line);                                      *
 *                                                             *
 * Posiciona o cursor na linha selecionada;                    *
 *                                                             *
 * uint8_t line -> linha selecionada;                          *
 *                                                             *
 * void -> n�o retorna valor;                                  *
 ***************************************************************/
void lcdSetLine(uint8_t line);

/***************************************************************
 * lcdClear();                                                 *
 *                                                             *
 * Apaga o conte�do do display;                                *
 *                                                             *
 * void -> n�o recebe par�metros;                              *
 *                                                             *
 * void -> n�o retorna valor;                                  *
 ***************************************************************/
void lcdClear(void);

/***************************************************************
 * void lcdWrite(data, type);                                  *
 *                                                             *
 * Envia um byte para o display;                               *
 *                                                             *
 * uint8_t data -> endere�o do buffer de envio;                *
 * uint8_t type -> sele��o: TRUE = caractere, FALSE = comando; *
 *                                                             *
 * void -> n�o retorna valor;                                  *
 ***************************************************************/ 
void lcdWrite(uint8_t data, uint8_t type);

/***************************************************************
 * void lcdWriteNibble(data, type);                            *
 *                                                             *
 * Envia um nibble para o display;                             *
 *                                                             *
 * uint8_t data -> endere�o do buffer de envio;                *
 * uint8_t type -> sele��o: TRUE = caractere, FALSE = comando; *
 *                                                             *
 * void -> n�o retorna valor;                                  *
 ***************************************************************/ 
void lcdWriteNibble(uint8_t data, uint8_t type);
 
/***************************************************************
 * void lcdWriteString(&string);                               *
 *                                                             *
 * Envia uma string ao display;                                *
 *                                                             *
 * uint8_t * sting -> endere�o do buffer de envio;             *
 *                                                             *
 * void -> n�o retorna valor;                                  *
 ***************************************************************/
 void lcdWriteString(const uint8_t *string);
/***************************************************************/