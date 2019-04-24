/***************************************************************
 * Biblioteca de Configuração de I/O's                         *
 ***************************************************************/
 
 /* Autor: Felipe Antonio Montagneri Lucchini
    Data : 02/01/2017
	*/
	
/***************************************************************/

#include "stm8s.h" 

#define LCD_PORT    GPIOD

#define DOOR        GPIOA, GPIO_PIN_1
#define CMD_DN      GPIOA, GPIO_PIN_2
#define I_MOT       GPIOA, GPIO_PIN_3
//#define             GPIOA, GPIO_PIN_4
//#define             GPIOA, GPIO_PIN_5
#define CMD_UP      GPIOA, GPIO_PIN_6

//#define             GPIOB, GPIO_PIN_0
//#define             GPIOB, GPIO_PIN_1
//#define             GPIOB, GPIO_PIN_2
#define SW_MENU     GPIOB, GPIO_PIN_3
#define SW_SELECT   GPIOB, GPIO_PIN_4
//#define             GPIOB, GPIO_PIN_5
//#define             GPIOB, GPIO_PIN_6
//#define             GPIOB, GPIO_PIN_7

#define SETA        GPIOC, GPIO_PIN_1
#define CH3         GPIOC, GPIO_PIN_2
#define IGN         GPIOC, GPIO_PIN_3
#define CH2         GPIOC, GPIO_PIN_4
#define SW_P        GPIOC, GPIO_PIN_5
#define CH1         GPIOC, GPIO_PIN_6
//#define             GPIOC, GPIO_PIN_7

#define LCD_E       GPIOD, GPIO_PIN_0
//#define             GPIOD, GPIO_PIN_1
#define LCD_DB4     GPIOD, GPIO_PIN_2
#define LCD_DB5     GPIOD, GPIO_PIN_3
#define LCD_DB6     GPIOD, GPIO_PIN_4
#define LCD_DB7     GPIOD, GPIO_PIN_5
#define BUZZER      GPIOD, GPIO_PIN_6
#define LCD_RS      GPIOD, GPIO_PIN_7

//#define             GPIOE, GPIO_PIN_0
//#define             GPIOE, GPIO_PIN_1
//#define             GPIOE, GPIO_PIN_2
//#define             GPIOE, GPIO_PIN_3
#define CH4         GPIOE, GPIO_PIN_5
#define TIMER       GPIOE, GPIO_PIN_6
#define SENSOR      GPIOE, GPIO_PIN_7

#define SW_N        GPIOG, GPIO_PIN_0
//#define             GPIOG, GPIO_PIN_1

#define COMM        GPIOA, GPIO_PIN_5

#define INPUT       TRUE
#define OUTPUT      FALSE

/***************************************************************
 * Funções e Procedimentos                                     *                            
 ***************************************************************/
/***************************************************************
 * void ioInit(void);                                          *
 *                                                             * 
 * Inicialização dos IO's                                      *       
 *                                                             * 
 ***************************************************************/
void ioInit(void);
 
/***************************************************************
 * void ioCommSetDir(direction);                                 *
 *                                                             *
 * _bool dicrection -> seleciona a direção da comunicação;     *
 *                                                             *
 * void -> não retorna valor;                                  * 
 ***************************************************************/
void ioCommSetDir(bool direction);

/***************************************************************/