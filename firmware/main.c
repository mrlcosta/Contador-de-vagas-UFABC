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
#include "stdio.h"

/******************************************************************************
 * Declaração de variáveis globais:                                           *
 ******************************************************************************/
 
uint8_t		controle															= 0;
uint8_t		carros 																= 1;
uint8_t		quantidade_vagas 											= 1;
uint8_t		controle_buzzer 											= 0;
uint8_t		modo_operacao													= TRAVA;

uint16_t	n																			= 0;
uint16_t	contador_debounce_sensor_entrada			= 0;
uint16_t	contador_debounce_sensor_saida				= 0;
uint16_t	contador_debounce_bt_incremento				= 0;
uint16_t	contador_debounce_bt_decremento				= 0;
uint16_t	contador_debounce_bt_confirma					= 0;
uint16_t	contador_delay												= 0;
uint16_t	contador_buzzer												= 0;
uint16_t	tempo_buzzer_incremento								= 0;
uint16_t	tempo_buzzer_decremento								= 0;

uint32_t	eeprom																=	PRIMEIRO_ENDERECO_EEPROM;		//PRIMEIRO_ENDERECO_EEPROM; 

char			buf_carros[3];
char			buf_vagas[3];

bool			sensor_entrada												= 0;
bool			last_sensor_entrada										= 0;
bool			sensor_saida													= 0;
bool			last_sensor_saida											= 0;
bool			bt_incremento													= 0;
bool			last_bt_incremento										= 0;
bool			bt_decremento													= 0;
bool			last_bt_decremento										= 0;
bool			bt_confirma														= 0;
bool			last_bt_confirma											= 0;
bool			display_carros_atualizado							= 0;
bool			display_vagas_atualizado							= 0;
bool			buzzer_incremento											= 0;
bool			buzzer_decremento											= 0;

/******************************************************************************
 * Funções e Procedimentos                                                    *
 ******************************************************************************/
void timerInit								(void);
void adcInit									(void);
void ioInit										(void);
void commInit									(void);
void lcdInit									(void);
void uartInit									(void);
void uartDeInit								(void);

void atualiza_menu						(void);
void atualiza_display_carros	(void);
void atualiza_display_vagas		(void);
void leitura_comunicacao			(void);
void delay										(int delay);
void sinaliza_semaforo				(void);
void checa_botao							(void);
void checa_entradas						(void);
void contagem_carros					(void);
void contagem_estacionamento	(void);
void checa_eeprom							(void);
void grava_eeprom							(void);
void sinalizacao_buzzer 			(void);
void incrementa_buzzer 				(void);
void decrementa_buzzer 				(void);

void lcd_clear								(void);
void lcd_write_string					(const uint8_t *string);
void lcd_set_line							(uint8_t line);
void lcd_write								(uint8_t data, uint8_t type);
void lcd_write_nibble					(uint8_t data, uint8_t type);
void mensagem_inicial_lcd			(void);


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
	delay(2500);
	lcd_clear();
	
	while (1){
		checa_entradas();
		contagem_carros();
		contagem_estacionamento();
		sinalizacao_buzzer();
		atualiza_display_carros();
		atualiza_display_vagas();
		sinaliza_semaforo();
	}
}

void sinaliza_semaforo(){
	
	if(carros<quantidade_vagas){
		GPIO_WriteHigh(SINAL_VERDE);
		GPIO_WriteLow(SINAL_VERMELHO);
	}else{
		GPIO_WriteLow(SINAL_VERDE);
		GPIO_WriteHigh(SINAL_VERMELHO);
	}
	
}



/*******************************************************************************
 * atualiza_display_carros();                                                  *
 *                                                                             *
 * Procedimento de atualização do numero de carros no display;                 *
 *                                                                             *
 * void -> não retorna valor;                                                  *
 ******************************************************************************/
void atualiza_display_carros(void){
	
	if(display_carros_atualizado){return;}
	
	sprintf(buf_carros, "%03d", (int) carros-1 );
	lcd_write(LINE_1, FALSE);
	lcd_write_string	 ("CARROS: ");
	lcd_write(buf_carros[0],TRUE);
	lcd_write(buf_carros[1],TRUE);
	lcd_write(buf_carros[2],TRUE);
	if (modo_operacao == CARROS){
		lcd_write_string	 (" <--");
	}
	display_carros_atualizado = TRUE;
}

/*******************************************************************************
 * atualiza_display_vagas();                                                   *
 *                                                                             *
 * Procedimento de atualização do numero de vagas no display;                  *
 *                                                                             *
 * void -> não retorna valor;                                                  *
 ******************************************************************************/
void atualiza_display_vagas(void){
	
	if(display_vagas_atualizado){return;}
	
	sprintf(buf_vagas, "%03d", (int) quantidade_vagas-1 );
	lcd_write(LINE_2, FALSE);
	lcd_write_string	 ("VAGAS : ");
	lcd_write(buf_vagas[0],TRUE);
	lcd_write(buf_vagas[1],TRUE);
	lcd_write(buf_vagas[2],TRUE);
	
	if (modo_operacao == VAGAS){
		lcd_write_string	 (" <--");
	}
	
	display_vagas_atualizado = TRUE;
}

/*******************************************************************************
 * delay();                                                   								 *
 *                                                                             *
 * Procedimento de delay;                 	 																	 *
 *                                                                             *
 * int delay -> valor em milisegundos de pausa;    														 *
 * void   -> não retorna valor																								 *
 ******************************************************************************/
void delay(int delay){
	uint16_t tempo_atual_delay = contador_delay;
	while(tempo_atual_delay + delay >= contador_delay){nop();}
}

/*******************************************************************************
 * contagem_estacionamento();                                                  *
 *                                                                             *
 * Procedimento de tratamento do estado dos botoes e vagas/carros no display;  *
 *                                                                             *
 * void -> não retorna valor;                                                  *
 ******************************************************************************/
void contagem_estacionamento(){
	
	if(last_bt_confirma != bt_confirma){
		last_bt_confirma 	= bt_confirma;
		if(bt_confirma){
			display_vagas_atualizado = FALSE;
			display_carros_atualizado = FALSE;
			lcd_clear();
			grava_eeprom();
			if(modo_operacao < 2){
				modo_operacao++;
			}else{
				modo_operacao = 0;
			}
		}
	}
	
	if(	modo_operacao == TRAVA){return;}
	
	if(last_bt_incremento != bt_incremento){
		
		last_bt_incremento 	= bt_incremento;
		if(bt_incremento){
			if (modo_operacao == VAGAS){
				if (quantidade_vagas < 253){
					quantidade_vagas++;
					display_vagas_atualizado = FALSE;
				}
			}else{
				if (carros < 253){
					carros++;
					display_carros_atualizado = FALSE;
				}
			}
			
		}
	}
	
	if(last_bt_decremento != bt_decremento){
		
		last_bt_decremento 	= bt_decremento;
		if(bt_decremento){
			if (modo_operacao == VAGAS){
				if (quantidade_vagas > 1){
					quantidade_vagas--;
					display_vagas_atualizado = FALSE;
				}
			}else{
				if (carros > 1){
					carros--;
					display_carros_atualizado = FALSE;
				}
			}
			
		}
	}
	
}

/*******************************************************************************
 * incrementa_buzzer();                                                        *
 *                                                                             *
 *	Procedimento de atualizar flag do buzzer para entrada de carro no 				 *
 *estacionamento;              																								 *
 *																																						 *
 * void -> não retorna valor;                                                  *
 ******************************************************************************/
void incrementa_buzzer (){
	buzzer_incremento = TRUE;
	tempo_buzzer_incremento = contador_buzzer;
}

/*******************************************************************************
 * decrementa_buzzer();                                                        *
 *                                                                             *
 * Procedimento de atualizar flag do buzzer para saída de carro no 						 *
 *estacionamento;  	     																											 *
 *                                                                             *
 * void -> não retorna valor;                                                  *
 ******************************************************************************/
void decrementa_buzzer (){
	buzzer_decremento = TRUE;
	tempo_buzzer_decremento = contador_buzzer;
}

/*******************************************************************************
 * sinalizacao_buzzer();                                                       *
 *                                                                             *
 * Procedimento de tocar buzzer para saída ou entrada de carro no 						 *
 *estacionamento;  	     																											 *
 *                                                                             *
 * void -> não retorna valor;                                                  *
 ******************************************************************************/
void sinalizacao_buzzer (){
	if (buzzer_incremento){
		
		GPIO_WriteHigh(BUZZER);
		if (contador_buzzer-tempo_buzzer_incremento <= TEMPO_BUZZER_INCREMENTO){return;}
		GPIO_WriteLow(BUZZER);
		buzzer_incremento = FALSE;
		controle_buzzer = 0;
	}
	
	if (buzzer_decremento){
		
		GPIO_WriteHigh(BUZZER);
		if (contador_buzzer-tempo_buzzer_decremento <= TEMPO_BUZZER_DECREMENTO){return;}
		GPIO_WriteLow(BUZZER);
		buzzer_decremento = FALSE;
	}
}

/*******************************************************************************
 * checa_eeprom();                                                      	 		 *
 *                                                                             *
 * Procedimento de checagem de eeprom para inicializar a quantidade de carros  *
 *e vagas com ultimo número antes do desligamento															 *
 *                                                                             *
 * void -> não retorna valor;                                                  *
 ******************************************************************************/
void checa_eeprom(){
	
	eeprom = PRIMEIRO_ENDERECO_EEPROM;
	while( (FLASH_ReadByte(eeprom) == 0x00) && (eeprom <= ULTIMO_ENDERECO_EEPROM) ){
		eeprom++;
	}
	
	if(eeprom >= ULTIMO_ENDERECO_EEPROM ){ // se estourou  e não achou nada, volta pro inicio
		eeprom = PRIMEIRO_ENDERECO_EEPROM; 
		carros = FLASH_ReadByte(eeprom);
		quantidade_vagas = FLASH_ReadByte(++eeprom);
	}else{	
		carros = FLASH_ReadByte(eeprom);
		quantidade_vagas = FLASH_ReadByte(++eeprom);
		
	}
}

/*******************************************************************************
 * grava_eeprom();                                                      	 		 *
 *                                                                             *
 * Procedimento de gravação da eeprom com o número de vagas e carros					 *
 *                                                                             *
 * void -> não retorna valor;                                                  *
 ******************************************************************************/
void grava_eeprom(){
	
	FLASH_Unlock(FLASH_MEMTYPE_DATA);
	if(eeprom>=ULTIMO_ENDERECO_EEPROM-1){
		
		eeprom = PRIMEIRO_ENDERECO_EEPROM;
		FLASH_ProgramByte(eeprom, carros);
		FLASH_ProgramByte(++eeprom , quantidade_vagas);
		FLASH_EraseByte(ULTIMO_ENDERECO_EEPROM);
		FLASH_EraseByte(ULTIMO_ENDERECO_EEPROM-1);
		FLASH_EraseByte(ULTIMO_ENDERECO_EEPROM-2);
		
	}else{
		
		FLASH_ProgramByte(++eeprom, carros);
		FLASH_ProgramByte(++eeprom , quantidade_vagas);
		
		if (eeprom >= PRIMEIRO_ENDERECO_EEPROM + 3){
			FLASH_EraseByte(eeprom - 2);
			FLASH_EraseByte(eeprom - 3);
		}
		
	}
	FLASH_Lock(FLASH_MEMTYPE_DATA);
	
}

/*******************************************************************************
 * mensagem_inicial_lcd();                                                     *
 *                                                                             *
 * Mostra a mensagem inicial na tela ao ligar o produto					 							 *
 *                                                                             *
 * void -> não retorna valor;                                                  *
 ******************************************************************************/
void mensagem_inicial_lcd(){
	lcd_write(LINE_1, FALSE);
	lcd_write_string	 ("  UNIVERSIDADE  ");
	lcd_write(LINE_2, FALSE);
	lcd_write_string	 (" FEDERAL DO ABC ");
}

/*******************************************************************************
 * contagem_carros();                                                     		 *
 *                                                                             *
 * trata o acionamento dos sensores para incrementar/decrementar carros				 *
 *                                                                             *
 * void -> não retorna valor;                                                  *
 ******************************************************************************/
void contagem_carros(){
	
	if(last_sensor_entrada != sensor_entrada){
		
		last_sensor_entrada 	= sensor_entrada;
		if(sensor_entrada){
			
			if (carros < 255){
				carros++;
				incrementa_buzzer();
				display_carros_atualizado = FALSE;
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
				display_carros_atualizado = FALSE;
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
 * Procedimento de checagem e debounce do estado dos sensores e botões;        *
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
	GPIO_Init(SINAL_VERMELHO,   GPIO_MODE_OUT_PP_LOW_SLOW);
	GPIO_Init(SINAL_VERDE,    	GPIO_MODE_OUT_PP_LOW_SLOW);
	 
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
	 
	for(n = 0; n < 920; n++){ nop(); }
	 
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