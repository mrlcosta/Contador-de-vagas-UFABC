/***************************************************************
 * Biblioteca de Temporiza��o                                  *
 ***************************************************************/
 
 /* Autor: Felipe Antonio Montagneri Lucchini
    Data : 25/09/2015
	*/
	
/***************************************************************/

#include "stm8s.h"
#include "stm8s_timer.h"

uint8_t i         = 0;

bool    time1ms   = FALSE;
bool    time100us = FALSE;
bool    time210us = FALSE;

/***************************************************************
 * Vetor de Timers                                             *
 ***************************************************************/
timer timerUnit[TIMER_QTY]; 

/***************************************************************
 * Fun��es e Procedimentos                                     *                            
 ***************************************************************/
/***************************************************************
 * void timerInit(void);                                       *
 *                                                             * 
 * Configura��es do Timer 4:                                   *
 *                                                             * 
 * Prescaler = 64                                              * 
 * Overflow  = 250                                             *
 *                                                             *
 * T = PRESCALER * OVERFLOW / FREQUENCIA DE CLOCK              *
 *                                                             *
 * T = 64 * 250 / 16.000.000 = 1ms                             *     
 *                                                             *
 * Configura��es do Timer 2:                                   *
 *                                                             * 
 * Prescaler = 64                                              * 
 * Overflow  = 25                                              *
 *                                                             *
 * T = PRESCALER * OVERFLOW / FREQUENCIA DE CLOCK              *
 *                                                             *
 * T = 64 * 25 / 16.000.000 = 0,1ms                            *   
 ***************************************************************/
void timerInit(void){
	
	TIM4_DeInit      ();                       
  TIM4_TimeBaseInit(TIM4_PRESCALER_64, 249); 	
  TIM4_ITConfig    (TIM4_IT_UPDATE, ENABLE);
  TIM4_Cmd         (ENABLE);
	
	TIM2_DeInit      ();                       
  TIM2_TimeBaseInit(TIM2_PRESCALER_64, 24); 	
  TIM2_ITConfig    (TIM2_IT_UPDATE, ENABLE);
  TIM2_Cmd         (ENABLE);
	
	TIM3_DeInit      ();                       
  TIM3_TimeBaseInit(TIM3_PRESCALER_16, 210); 	
  TIM3_ITConfig    (TIM3_IT_UPDATE, ENABLE);
  TIM3_Cmd         (ENABLE);
	
}

/***************************************************************
 * timerEnable (unit, enableCount);                            *
 *                                                             *
 * Controle de habilita��o do timer                            *   
 *                                                             *
 * uint8_t unit        -> �ndice do timer a ser utilizado;     *
 * _Bool   enableCount	-> valor de hab/inib do timer;         *
 *                                                             *
 * void -> n�o retorna valor;                                  * 
 ***************************************************************/
void timerEnable(uint8_t unit, _Bool enableTimer){
	
	if(enableTimer){
		
		timerUnit[unit].enable = 1;
	
	}else{
		
		timerUnit[unit].enable = 0;
		
	}
	
}

/***************************************************************
 * timerReset (unit);                                          *   
 *                                                             *
 * Reset do valor de contagem do timer                         *
 *                                                             *
 * uint8_t unit        -> �ndice do timer a ser utilizado;     *
 *                                                             *
 * void -> n�o retorna valor;                                  * 
 ***************************************************************/
bool timerGetOverflow(uint8_t unit){
	
	if(timerUnit[unit].overflow == 1){
						
		return 1;
	
	}else{
		
		return timerUnit[unit].overflow;
		
	}
	
}

/***************************************************************
 * timerGetCount (unit);                                       *   
 *                                                             *
 * Leitura do valor de contagem do timer                       *
 *                                                             *
 * uint8_t unit        -> �ndice do timer a ser utilizado;     *
 *                                                             *
 * uint16_t -> contagem do timer;                              * 
 ***************************************************************/
uint32_t timerGetCount(uint8_t unit){
	
	return timerUnit[unit].count;
	
}

/***************************************************************
 * timerSetOverflowValue (unit, maxValue);                     *
 *                                                             *
 * Define o valor de overflow do timer                         *   
 *                                                             *
 * uint32_t unit     -> �ndice do timer a ser utilizado;       *
 * int      maxvalue -> valor de overflow do timer;            *
 *                                                             *
 * void -> n�o retorna valor;                                  * 
 ***************************************************************/
void timerSetOverflowValue(uint8_t unit, uint32_t maxValue){
	
	timerUnit[unit].maxCount = maxValue;
	
}

/***************************************************************
 * timerGetOverflow (unit);                                    *
 *                                                             *
 * Verifica se ocorreu overflow no timer                       *   
 *                                                             *
 * uint8_t unit        -> �ndice do timer a ser utilizado;     *
 *                                                             *
 * _Bool -> retorna o valor de overflow do timer;              * 
 ***************************************************************/
void timerReset(uint8_t unit){
	
	timerUnit[unit].count    = 0;
	timerUnit[unit].overflow = 0;
	
}

/***************************************************************
 * timerDelay (delay);                                         *
 *                                                             *
 * Fun��o de delay                                             *   
 *                                                             *
 * uint32_t delay -> valor de dura��o do delay, em ms;         *
 *                                                             *
 * Bool -> retorna true enquanto n�o houve overflow no timer;  * 
 ***************************************************************/
bool timerDelay(uint32_t delay){
	
	if(timerUnit[0].count == 0){
		
		timerSetOverflowValue(0, delay);
	  timerReset           (0);
	  timerEnable          (0, ENABLE);
		
	}
	
	if(timerGetOverflow(0)){
		
		timerEnable(0, DISABLE);
		timerReset (0);
		
		return TRUE;
		
	}else{
		
		return FALSE;
		
	}
}

/***************************************************************
 * timerDelayReset();                                          *
 *                                                             *
 * Fun��o de reset do delay                                    *
 *                                                             *
 * void -> n�o recebe par�metros;                              *
 *                                                             *
 * void -> n�o retorna valor;                                  * 
 ***************************************************************/
void timerDelayReset(void){
	 
	 timerEnable          (0, DISABLE);
	 timerReset           (0);
	 
  }

/***************************************************************
 * bool timeBase1ms();                                         *
 *                                                             *
 * Verifica��o de base de tempo de 1ms                         *   
 *                                                             *
 * Bool -> retorna true ap�s um intervalo de 1ms;              * 
 ***************************************************************/
bool timeBase1ms(void){
	
	if(time1ms){
		
		time1ms = FALSE;
		
		return TRUE;
		
	}else{
		
		return FALSE;
		
	}
	
}

/***************************************************************
 * bool timeBase100us();                                       *
 *                                                             *
 * Verifica��o de base de tempo de 100us;                      *   
 *                                                             *
 * Bool -> retorna true ap�s um intervalo de 100us;            * 
 ***************************************************************/
bool timeBase100us(void){
	
	if(time100us){
		
		time100us = FALSE;
		
		return TRUE;
		
	}else{
		
		return FALSE;
		
	}
	
}

/***************************************************************
 * bool timeBase210us();                                       *
 *                                                             *
 * Verifica��o de base de tempo de 210us                       *   
 *                                                             *
 * Bool -> retorna true ap�s um intervalo de 210us;            * 
 ***************************************************************/
bool timeBase210us(void){
	
	if(time210us){
		
		time210us = FALSE;
		
		return TRUE;
		
	}else{
		
		return FALSE;
		
	}
	
}

/***************************************************************
  * Interrup��o do TIM4 (Timer f�sico do controlador;          *
***************************************************************/ 
#ifdef STM8S903
/**
  * @brief Timer6 Update/Overflow/Trigger Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(TIM6_UPD_OVF_TRG_IRQHandler, 23)
 {
  /* In order to detect unexpected events during development,
     it is recommended to set a breakpoint on the following instruction.
  */
 }
#else /*STM8S208, STM8S207, STM8S105 or STM8S103 or STM8AF52Ax or STM8AF62Ax or STM8AF626x */
/**
  * @brief Timer4 Update/Overflow Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 	{		
		
		TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
		
		time1ms = TRUE;
		
		for(i = 0; i < TIMER_QTY; i++){
			
			if(timerUnit[i].enable == 1){
				
				if(timerUnit[i].count >= timerUnit[i].maxCount){
					
					timerUnit[i].overflow = 1;
					
			  }
				
			  timerUnit[i].count++;
				
		  }
	  }
	}

#endif /*STM8S903*/

/***************************************************************
  * Interrup��o do TIM2 (Timer f�sico do controlador;          *
***************************************************************/
INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13){
	 
	 TIM2_ClearITPendingBit(TIM2_IT_UPDATE);
	 
	 time100us = TRUE;		
		
  }
	
/***************************************************************
  * Interrup��o do TIM3 (Timer f�sico do controlador;          *
***************************************************************/
INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15){
	 
	 TIM3_ClearITPendingBit(TIM3_IT_UPDATE);
   
	 time210us = TRUE;
	 
	}



