/* MAIN.C file
 *
 * 	Projeto contador de carros para o estacionamento
 * da universidade federal do ABC. 
 * 
 * Com muito carinho
 * Muriel Costa 
 * 2019
 */

#include "stm8s.h"
#include "stm8s_flash.h"
#include "main.h"

/******************************************************************************
 * Declaração de variáveis globais:                                           *
 ******************************************************************************/

uint8_t		controle															= 0;
uint8_t		carros 																= 0;
uint8_t		quantidade_vagas 											= 0;
uint8_t		controle_buzzer 											= 0;

uint16_t	n																			= 0;
uint16_t	contador_debounce_sensor_entrada			= 0;
uint16_t	contador_debounce_sensor_saida				= 0;
uint16_t	contador_debounce_bt_incremento				= 0;
uint16_t	contador_debounce_bt_decremento				= 0;
uint16_t	contador_debounce_bt_confirma					= 0;

uint16_t	contador_buzzer												= 0;
uint16_t	tempo_buzzer_incremento								= 0;
uint16_t	tempo_buzzer_decremento								= 0;

uint32_t	eeprom																= PRIMEIRO_ENDERECO_EEPROM; 

bool			sensor_entrada												= 0;
bool			last_sensor_entrada										= 0;
bool			sensor_saida													= 0;
bool			last_sensor_saida											= 0;
bool			bt_incremento													= 0;
bool			last_bt_incremento										= 0;
bool			bt_decremento													= 0;
bool			last_bt_decremento										= 0;
bool			bt_confirma														= 0;


bool			buzzer_incremento											= 0;
bool			buzzer_decremento											= 0;
/******************************************************************************
 * Funções e Procedimentos                                                    *
 ******************************************************************************/
void timerInit						(void);
void adcInit							(void);
void ioInit								(void);
void commInit							(void);
void lcdInit							(void);
void uartInit							(void);
void uartDeInit						(void);

void atualiza_menu				(void);
void atualiza_display			(void);
void leitura_comunicacao	(void);


void checa_botao					(void);
void checa_entradas				(void);
void contagem_carros			(void);
void contagem_estacionamento	(void);
void checa_eeprom					(void);
void grava_eeprom					(void);
void sinalizacao_buzzer 	(void);
void incrementa_buzzer 		(void);
void decrementa_buzzer 		(void);

void lcd_clear						(void);
void lcd_write_string			(const uint8_t *string);
void lcd_set_line					(uint8_t line);
void lcd_write						(uint8_t data, uint8_t type);
void lcd_write_nibble			(uint8_t data, uint8_t type);
void mensagem_inicial_lcd	(void);


/******************************************************************************
 * Loop principal:                                                            *
 ******************************************************************************/


main(){
	CLK->CKDIVR = 0; 
	ioInit();
	timerInit();
	FLASH_DeInit();
	enableInterrupts();
	lcdInit();
	lcd_clear();
	mensagem_inicial_lcd();
	checa_eeprom();
	while (1){
		checa_entradas();
		contagem_carros();
		contagem_estacionamento();
		
		sinalizacao_buzzer();
	}
}

void contagem_estacionamento(){
	
	if(last_bt_incremento != bt_incremento){
		
		last_bt_incremento 	= bt_incremento;
		if(bt_incremento){
			
			if (quantidade_vagas < 255){
				quantidade_vagas++;
			}else{
					// mostra na tela "limite de contagem"
			}
			//grava_eeprom();
		}
	}
	
	if(last_bt_decremento != bt_decremento){
		
		last_bt_decremento 	= bt_decremento;
		if(bt_decremento){
			
			if (quantidade_vagas > 0){
				quantidade_vagas--;
			}else{
					// mostra na tela "limite de contagem"
			}
			//grava_eeprom();
		}
	}
	
}


void incrementa_buzzer (){
	buzzer_incremento = TRUE;
	tempo_buzzer_incremento = contador_buzzer;
}

void decrementa_buzzer (){
	buzzer_decremento = TRUE;
	tempo_buzzer_decremento = contador_buzzer;
}

void sinalizacao_buzzer (){
	if (buzzer_incremento){
		
		GPIO_WriteHigh(BUZZER);
		if (contador_buzzer-tempo_buzzer_incremento <= 500){return;}
		GPIO_WriteLow(BUZZER);
		buzzer_incremento = FALSE;
		controle_buzzer = 0;
	}
	
	if (buzzer_decremento){
		
		GPIO_WriteHigh(BUZZER);
		if (contador_buzzer-tempo_buzzer_decremento <= 100){return;}
		GPIO_WriteLow(BUZZER);
		buzzer_decremento = FALSE;
	}
}



// testar essa funcao
void checa_eeprom(){
	
	eeprom = PRIMEIRO_ENDERECO_EEPROM;
	while( (FLASH_ReadByte(eeprom) == 0x00) && (eeprom <= ULTIMO_ENDERECO_EEPROM) ){
		eeprom++;
	}
	
	if(eeprom > ULTIMO_ENDERECO_EEPROM ){ // se estourou  e não achou nada, volta pro inicio
	
		eeprom = PRIMEIRO_ENDERECO_EEPROM; 
		carros = FLASH_ReadByte(ULTIMO_ENDERECO_EEPROM);
		
	}else{	
		carros = FLASH_ReadByte(eeprom++);
	}
}

void grava_eeprom(){
	
	FLASH_Unlock(FLASH_MEMTYPE_DATA);
	
	if(eeprom==ULTIMO_ENDERECO_EEPROM){
		
		eeprom = PRIMEIRO_ENDERECO_EEPROM;
		FLASH_ProgramByte(eeprom++ , carros);
		FLASH_EraseByte(ULTIMO_ENDERECO_EEPROM);
		
	}else{
		
		FLASH_ProgramByte(eeprom++ , carros);
		
		if (eeprom != PRIMEIRO_ENDERECO_EEPROM + 1){
			FLASH_EraseByte(eeprom - 2);
		}
		
	}
	FLASH_Lock(FLASH_MEMTYPE_DATA);
	
}

void mensagem_inicial_lcd(){
	lcd_write_string	 ("  UNIVERSIDADE  ");
	lcd_write(LINE_2, FALSE);
	lcd_write_string	 (" FEDERAL DO ABC ");
	lcd_clear();
}

void contagem_carros(){
	
	if(last_sensor_entrada != sensor_entrada){
		
		last_sensor_entrada 	= sensor_entrada;
		if(sensor_entrada){
			
			if (carros < 255){
				carros++;
				incrementa_buzzer();
			}else{
					// mostra na tela "limite de contagem"
				
			}
			grava_eeprom();
		}
	}
	
	if(last_sensor_saida != sensor_saida){
		
		last_sensor_saida 	= sensor_saida;
		if(sensor_saida){
			if(carros > 0){
				carros--;
				decrementa_buzzer();
			}else{
					//mostra na tela "limite de contagem"
				
			}
			grava_eeprom();
		}
	}

}



/*******************************************************************************
 * checa_entradas();                                                           *
 *                                                                             *
 * Procedimento de checagem do estado dos sensores;                            *
 *                                                                             *
 * void -> não recebe parâmetros;                                              *
 *                                                                             *
 * void -> não retorna valor;                                                  *
 ******************************************************************************/
void checa_entradas (void){
	
	/*********************sensor de entrada****************************/
	
	if(!GPIO_ReadInputPin(SENSOR_ENTRADA)){
		 
		if(contador_debounce_sensor_entrada >= TEMPO_DEBOUNCE_ACIONA){
			
			sensor_entrada = TRUE;	
			contador_debounce_sensor_entrada = 0;
		}
		
	}else{
		
		if(contador_debounce_sensor_entrada >= TEMPO_DEBOUNCE_DESACIONA){
			
			sensor_entrada = FALSE; 
			contador_debounce_sensor_entrada = 0;
		}
		
	}
	
	/*********************sensor de saída*****************************/
	
		if(!GPIO_ReadInputPin(SENSOR_SAIDA)){
		 
		if(contador_debounce_sensor_saida >= TEMPO_DEBOUNCE_ACIONA){
			 
			sensor_saida = TRUE;	
			contador_debounce_sensor_saida = 0;
		}
		
	}else{
		
		if(contador_debounce_sensor_saida >= TEMPO_DEBOUNCE_DESACIONA){
		
			sensor_saida = FALSE; 
			contador_debounce_sensor_saida = 0;
		}

	}
	
	/*********************botão de incremento*****************************/
	
		if(!GPIO_ReadInputPin(BT_INCREMENTO)){
		 
		if(contador_debounce_bt_incremento >= TEMPO_DEBOUNCE_BT_INCREMENTO){
			 
			bt_incremento = TRUE;	
			contador_debounce_bt_incremento = 0;
		}
		
	}else{
		
		if(contador_debounce_bt_incremento >= TEMPO_DEBOUNCE_BT_INCREMENTO){
		
			bt_incremento = FALSE; 
			contador_debounce_bt_incremento = 0;
		}

	}
	
	
	/*********************botão de decremento*****************************/
	
	if(!GPIO_ReadInputPin(BT_DECREMENTO)){
		 
		if(contador_debounce_bt_decremento >= TEMPO_DEBOUNCE_BT_DECREMENTO){
			 
			bt_decremento = TRUE;	
			contador_debounce_bt_decremento = 0;
		}
		
	}else{
		
		if(contador_debounce_bt_decremento >= TEMPO_DEBOUNCE_BT_DECREMENTO){
		
			bt_decremento = FALSE; 
			contador_debounce_bt_decremento = 0;
		}

	}
	
	
	/*********************botão de confirmação*****************************/
	
		if(!GPIO_ReadInputPin(BT_CONFIRMA)){
		 
		if(contador_debounce_bt_confirma >= TEMPO_DEBOUNCE_BT_CONFIRMA){
			 
			bt_confirma = TRUE;	
			contador_debounce_bt_confirma = 0;
		}
		
	}else{
		
		if(contador_debounce_bt_confirma >= TEMPO_DEBOUNCE_BT_CONFIRMA){
		
			bt_confirma = FALSE; 
			contador_debounce_bt_confirma = 0;
		}

	}
	
}

	
/*******************************************************************************
 * void ioInit(void);                                                          *
 *                                                                             *
 * Inicialização dos IO's                                                      *
 *                                                                             *
 ******************************************************************************/
void ioInit(void){	 

	GPIO_Init(BT_INCREMENTO,  	GPIO_MODE_IN_PU_NO_IT);
	GPIO_Init(BT_DECREMENTO,  	GPIO_MODE_IN_PU_NO_IT);
	GPIO_Init(BT_CONFIRMA,  		GPIO_MODE_IN_PU_NO_IT);
	
	GPIO_Init(SENSOR_SAIDA,  		GPIO_MODE_IN_PU_NO_IT);
	GPIO_Init(SENSOR_ENTRADA,		GPIO_MODE_IN_PU_NO_IT);
	
	GPIO_Init(BUZZER,    				GPIO_MODE_OUT_PP_LOW_SLOW);
	 
	GPIO_Init(LCD_E,    				GPIO_MODE_OUT_PP_LOW_SLOW);
	GPIO_Init(LCD_RS,  				 	GPIO_MODE_OUT_PP_LOW_SLOW);
	GPIO_Init(LCD_DB4,  				GPIO_MODE_OUT_PP_LOW_SLOW);
	GPIO_Init(LCD_DB5,  				GPIO_MODE_OUT_PP_LOW_SLOW);
	GPIO_Init(LCD_DB6,  				GPIO_MODE_OUT_PP_LOW_SLOW);
	GPIO_Init(LCD_DB7,  				GPIO_MODE_OUT_PP_LOW_SLOW);
}

/*******************************************************************************
* timerInit();                                                                 *
*                                                                              *
* Procedimento de configuração de Timer                                        *
*                                                                              *
* void -> não recebe parâmetros;                                               *
*                                                                              *
* void -> não retorna valor;                                                   *
*                                                                              *
* Configurações de Timer:                                                      *
*                                                                              *
* Timer 4:                                                                     *
* Prescaler = 64                                                               *
* Overflow  = 250                                      									       *
*                                                     									       *
* T = PRESCALER * OVERFLOW / FREQUENCIA DE CLOCK                               *
*                                                                              *
* T = 64 * 250 / 16.000.000 = 1ms                                              *
*                                                                              *
*******************************************************************************/
void timerInit(void){
	TIM4_DeInit      ();                       
	TIM4_TimeBaseInit(TIM4_PRESCALER_64, 249); 	
	TIM4_ITConfig    (TIM4_IT_UPDATE, ENABLE);
	TIM4_Cmd         (ENABLE);
}
	
/*******************************************************************************
 * lcdInit();                                                                  *
 *                                                                             *
 * Inicialização do Display;                                                   *
 *                                                                             *
 * void -> não recebe parâmetros;                                              *
 *                                                                             *
 * void -> não retorna valor;                                                  *
 ******************************************************************************/
void lcdInit(void){
	GPIO_WriteLow(LCD_RS);
	GPIO_WriteLow(LCD_E);   
	 
	for(n = 0; n < 50000; n++){ nop(); }
	for(n = 0; n < 50000; n++){ nop(); }
	 
	lcd_write_nibble(0x03, FALSE);	 
	lcd_write_nibble(0x03, FALSE); 
	 
	lcd_write(0x02, FALSE); //set to 4 bit interface, 1 line and 5*7 font
	lcd_write(0x28, FALSE); //set to 4 bit interface, 2 line and 5*10 font
	lcd_write(0x0C, FALSE); //set to 4 bit interface, 2 line and 5*7 font
	lcd_write(0x01, FALSE); //clear display
	lcd_write(0x06, FALSE); //move cursor right after write
}

/*******************************************************************************
 * lecd_set_line;                                                              *
 *                                                                             *
 * Posiciona o cursor na linha selecionada;                                    *
 *                                                                             *
 * uint8_t line -> linha selecionada;                                          *
 *                                                                             *
 * void -> não retorna valor;                                                  *
 ******************************************************************************/
void lcd_set_line(uint8_t line){
	 
	switch(line){
		 
		case 1:
			lcd_write(LINE_1, FALSE);
		break;
     
		case 2:
			lcd_write(LINE_2, FALSE);
		break;
     
		case 3:
			lcd_write(LINE_3, FALSE);
		break;
     
		case 4:
			lcd_write(LINE_4, FALSE);
		break;
		 
		default:
			lcd_write(LINE_1, FALSE);
		break;
		 
	} 		
}
	
/*******************************************************************************
 * lcd_clear();                                                                *
 *                                                                             *
 * Apaga o conteúdo do display;                                                *
 *                                                                             *
 * void -> não recebe parâmetros;                                              *
 *                                                                             *
 * void -> não retorna valor;                                                  *
 *******************************************************************************/
void lcd_clear(void){
	 
	lcd_write(0x01, FALSE);
}

/*******************************************************************************
 * lcd_write(data, type);                                                      *
 *                                                                             *
 * Envia um byte para o display;                                               *
 *                                                                             *
 * uint8_t data -> endereço do buffer de envio;                                *
 * uint8_t type -> seleção: TRUE = caractere, FALSE = comando;                 *
 *                                                                             *
 * void -> não retorna valor;                                                  *
 *******************************************************************************/
void lcd_write(uint8_t data, uint8_t type){
	 
	for(n = 0; n < 600; n++){ nop(); }
	 
	lcd_write_nibble(data >> 4, type); //WRITE THE UPPER NIBBLE
	lcd_write_nibble(data,      type); //WRITE THE LOWER NIBBLE
}
	
/*******************************************************************************
 * lcd_write_nibble(data, type);                                               *
 *                                                                             *
 * Envia um nibble para o display;                                             *
 *                                                                             *
 * uint8_t data -> endereço do buffer de envio;                                *
 * uint8_t type -> seleção: TRUE = caractere, FALSE = comando;                 *
 *                                                                             *
 * void -> não retorna valor;                                                  *
 ******************************************************************************/ 
void lcd_write_nibble(uint8_t data, uint8_t type){
	 
	GPIO_Write(LCD_PORT, (data << 2) & 0x3C);
	 
	if(type == 0){ 
	   
		GPIO_WriteLow(LCD_RS);
     
	} else {
			
		GPIO_WriteHigh(LCD_RS);
	}
   
	GPIO_WriteHigh(LCD_E);    
	GPIO_WriteLow (LCD_E);
}
 
/*******************************************************************************
 * lcd_write_string(&string);                                                  *
 *                                                                             *
 * Envia uma string ao display;                                                *
 *                                                                             *
 * uint8_t * sting -> endereço do buffer de envio;                             *
 *                                                                             *
 * void -> não retorna valor;                                                  *
 ******************************************************************************/
void lcd_write_string(const uint8_t *string){
	 
	while(*string){
	   
		lcd_write(*string++, TRUE);
	}
}

/*******************************************************************************
 * atualiza_display();                                                         *
 *                                                                             *
 * Procedimento de atualização das mensagens no display;                       *
 *                                                                             *
 * 																		                                         *
 * 																			                                       *
 *                                                                             *
 * void -> não retorna valor;                                                  *
 ******************************************************************************/
 /*
void atualiza_display(void){
	 
	 switch (controle) {
		 case 0:
				lcd_clear();
				lcd_write_string	 ("                ");
				lcd_write(LINE_2, FALSE);
				lcd_write_string	 ("                ");
		 break;
		 
		 case 1:
				lcd_clear();
				lcd_write(LINE_2, FALSE);
				lcd_write_string	 ("                ");		   
		 break;
		 
		 case 2:
				lcd_clear();
				lcd_write(LINE_2, FALSE);
				lcd_write_string	 ("                ");	
		 break;
	  }
	}
	*/