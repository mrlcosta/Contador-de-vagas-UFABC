/*******************************************************************************
* GPIO:                                                                        *
*******************************************************************************/

#define LCD_PORT    		GPIOD

#define	SINAL_VERMELHO	GPIOA, GPIO_PIN_1
#define	SINAL_VERDE			GPIOA, GPIO_PIN_2
#define	BUZZER        	GPIOA, GPIO_PIN_3
//#define             	GPIOA, GPIO_PIN_4
//#define             	GPIOA, GPIO_PIN_5
//#define       				GPIOA, GPIO_PIN_6

//#define             	GPIOB, GPIO_PIN_0
//#define             	GPIOB, GPIO_PIN_1
//#define             	GPIOB, GPIO_PIN_2
//#define      					GPIOB, GPIO_PIN_3
#define	BT_CONFIRMA     GPIOB, GPIO_PIN_4 //sem diodo pro vdd
//#define	     					GPIOB, GPIO_PIN_5
//#define             	GPIOB, GPIO_PIN_6
//#define             	GPIOB, GPIO_PIN_7

//#define        				GPIOC, GPIO_PIN_1
//#define          			GPIOC, GPIO_PIN_2
#define SENSOR_SAIDA 		GPIOC, GPIO_PIN_3
#define SENSOR_ENTRADA  GPIOC, GPIO_PIN_4
#define BT_INCREMENTO  	GPIOC, GPIO_PIN_5
#define BT_DECREMENTO  	GPIOC, GPIO_PIN_6
#define LCD_RS       		GPIOC, GPIO_PIN_7

//#define        				GPIOD, GPIO_PIN_0
//#define	     					GPIOD, GPIO_PIN_1 //Swim
#define LCD_DB4     		GPIOD, GPIO_PIN_2
#define LCD_DB5     		GPIOD, GPIO_PIN_3
#define LCD_DB6     		GPIOD, GPIO_PIN_4
#define LCD_DB7     		GPIOD, GPIO_PIN_5
#define	LCD_E      			GPIOD, GPIO_PIN_6
//#define       				GPIOD, GPIO_PIN_7

//#define             	GPIOE, GPIO_PIN_0
//#define             	GPIOE, GPIO_PIN_1
//#define             	GPIOE, GPIO_PIN_2
//#define             	GPIOE, GPIO_PIN_3
//#define          			GPIOE, GPIO_PIN_5
//#define        				GPIOE, GPIO_PIN_6
//#define       				GPIOE, GPIO_PIN_7

//#define         			GPIOG, GPIO_PIN_0
//#define             	GPIOG, GPIO_PIN_1

/*******************************************************************************
* MODOS DE OPERAÇÃO:                                                           *
*******************************************************************************/
#define	TRAVA		0
#define	VAGAS		1
#define	CARROS	2

/*******************************************************************************
* EEPROM:                                                                      *
*******************************************************************************/
#define PRIMEIRO_ENDERECO_EEPROM			0x4000
#define ULTIMO_ENDERECO_EEPROM				0x427f

/*******************************************************************************
* BOOL:                                                                      *
*******************************************************************************/
#define TRUE 		1
#define FALSE 	0

/*******************************************************************************
* TIMER:                                                                       *
*******************************************************************************/
#define TEMPO_DEBOUNCE_ACIONA   			700
#define TEMPO_DEBOUNCE_DESACIONA			100
#define	TEMPO_DEBOUNCE_BT_INCREMENTO	30
#define	TEMPO_DEBOUNCE_BT_DECREMENTO	30
#define	TEMPO_DEBOUNCE_BT_CONFIRMA		30

/*******************************************************************************
* LCD:                                                                       	 *
*******************************************************************************/
#define LCD_16X4
	
#ifdef 	LCD_16X4

#define LINE_1 0x80
#define LINE_2 0xC0
#define LINE_3 0x90
#define LINE_4 0xD0

#endif

#ifdef 	LCD_20X4

#define LINE_1 0x80
#define LINE_2 0xC0
#define LINE_3 0x94
#define LINE_4 0xD4

#endif