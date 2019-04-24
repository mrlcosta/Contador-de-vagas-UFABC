/***************************************************************
 * Biblioteca de Contagem                                      *
 ***************************************************************/
 
 /* Autor: Felipe Antonio Montagneri Lucchini
    Data : 02/01/2017
	*/
	
/***************************************************************/

#include "stm8s.h"
#include "stm8s_io.h"
#include "stm8s_exti.h"
#include "stm8s_timer.h"

/***************************************************************
 * Funções e Procedimentos                                     *                            
 ***************************************************************/
/***************************************************************
 * void ioInit(void);                                          *
 *                                                             * 
 * Inicialização dos IO's                                      *       
 *                                                             * 
 ***************************************************************/
 void ioInit(void){	 
	 
	 GPIO_Init(SENSOR,   GPIO_MODE_IN_FL_NO_IT);
	 GPIO_Init(SW_SELECT,GPIO_MODE_IN_FL_NO_IT);
	 GPIO_Init(SW_MENU,  GPIO_MODE_IN_FL_NO_IT);
	 	 
	 GPIO_Init(DOOR,     GPIO_MODE_OUT_PP_LOW_SLOW);
	 GPIO_Init(CMD_UP,   GPIO_MODE_OUT_PP_LOW_SLOW);
	 GPIO_Init(CMD_DN,   GPIO_MODE_OUT_PP_LOW_SLOW);
	 GPIO_Init(SETA,     GPIO_MODE_OUT_PP_LOW_SLOW);
	 GPIO_Init(IGN,      GPIO_MODE_OUT_PP_LOW_SLOW);
	 GPIO_Init(SW_P,     GPIO_MODE_OUT_PP_LOW_SLOW);
	 GPIO_Init(SW_N,     GPIO_MODE_OUT_PP_LOW_SLOW);
	 GPIO_Init(LCD_E,    GPIO_MODE_OUT_PP_LOW_SLOW);
	 GPIO_Init(LCD_RS,   GPIO_MODE_OUT_PP_LOW_SLOW);
	 GPIO_Init(LCD_DB4,  GPIO_MODE_OUT_PP_LOW_SLOW);
	 GPIO_Init(LCD_DB5,  GPIO_MODE_OUT_PP_LOW_SLOW);
	 GPIO_Init(LCD_DB6,  GPIO_MODE_OUT_PP_LOW_SLOW);
	 GPIO_Init(LCD_DB7,  GPIO_MODE_OUT_PP_LOW_SLOW);
   GPIO_Init(CH1,      GPIO_MODE_OUT_PP_LOW_SLOW); 
   GPIO_Init(CH2,      GPIO_MODE_OUT_PP_LOW_SLOW); 
   GPIO_Init(CH3,      GPIO_MODE_OUT_PP_LOW_SLOW); 
   GPIO_Init(CH4,      GPIO_MODE_OUT_PP_LOW_SLOW);
   GPIO_Init(I_MOT,    GPIO_MODE_OUT_PP_LOW_SLOW);	 
	 GPIO_Init(BUZZER,   GPIO_MODE_OUT_PP_LOW_SLOW);
	 
	 GPIO_Init(GPIOE, GPIO_PIN_1, GPIO_MODE_OUT_PP_LOW_SLOW);
   GPIO_Init(GPIOE, GPIO_PIN_2, GPIO_MODE_OUT_PP_LOW_SLOW);
	 
	 GPIO_WriteLow(GPIOE, GPIO_PIN_1);
	 GPIO_WriteLow(GPIOE, GPIO_PIN_2);
	 
	  EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOA, EXTI_SENSITIVITY_FALL_ONLY);
    EXTI_SetTLISensitivity   (EXTI_TLISENSITIVITY_FALL_ONLY);
		
		ioCommSetDir(INPUT);
	 
	}
	
/***************************************************************
 * void ioCommSetDir(direction);                                 *
 *                                                             *
 * _bool dicrection -> seleciona a direção da comunicação;     *
 *                                                             *
 * void -> não retorna valor;                                  * 
 ***************************************************************/
void ioCommSetDir(bool direction){
	 
	 if(direction){
		 
		 GPIO_Init(COMM, GPIO_MODE_IN_FL_IT);	
		 
	  }else{
			
		 GPIO_Init(COMM, GPIO_MODE_OUT_PP_LOW_SLOW);	
			
		} 
	  
  }

