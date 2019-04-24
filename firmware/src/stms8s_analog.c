/***************************************************************
 * Biblioteca de Aquisição Analógica                           *
 ***************************************************************/
 
 /* Autor: Felipe Antonio Montagneri Lucchini
    Data : 30/03/2016
	*/
	
#include "stm8s.h"
#include "stm8s_adc1.h"
#include "stm8s_analog.h"

 uint8_t sample               = 0;
 uint8_t channel              = 0;
 uint8_t dataStatus           = DATA_UNAVAILABLE;
 
uint16_t  adcValue            = 0;

uint16_t *analog_buffer       = (uint16_t *)0;
uint16_t *analog_buffer_reset = (uint16_t *)0;
uint16_t *ponteiro;

uint16_t  table[SAMPLE_QTY];


 
/***************************************************************
 * ADC1_Enable(channel)                                        *
 *                                                             *
 * Configurações do Conversor Analógico/Digital 1              *
 *                                                             * 
 * Modo de Conversão contínua                                  * 
 * Bits alinhados à direita                                    *
 *                                                             *
 * _ _ _ _ _ _ D9 D8 - D7 D6 D5 D4 D3 D2 D1 D0                 *
 *                                                             *
 ***************************************************************/  
void ADC1_Enable(uint8_t ch){
	 
    ADC1_ConversionConfig(ADC1_CONVERSIONMODE_SINGLE, ch, ADC1_ALIGN_RIGHT);		
	  ADC1_Cmd             (ENABLE);
		ADC1_StartConversion ();
		
	} 
	
/***************************************************************
 * analogSetBuffer(&buffer_addr);                              *
 *                                                             *
 * Função para seleção do endereço do buffer de leitura;       *
 *                                                             *
 * uint16_t *buffer_addr -> endereço para o buffer             *  
 *                                                             * 
 * void -> não retorna valor;                                  *
 ***************************************************************/
void analogSetBuffer(uint16_t * buffer_addr){
		
	 analog_buffer       = buffer_addr;
	 analog_buffer_reset = buffer_addr;
	 
  }
	
/***************************************************************
 * analogRun();                                                *
 *                                                             *
 * Configurações iniciais do ADC                               *
 *                                                             * 
 * void -> não retorna valor                                   *
 ***************************************************************/
 void analogRun(void){
	 
	 signed int aux;
	 
	 table[sample] = (uint32_t)ADC1_GetConversionValue() * (uint16_t)5000 / (uint16_t)1023;
	 
	 if(sample > 0){
		 
		 aux = table[sample] - table[sample-1];
		 
		 if((aux > NOISE_REJECTION)||(aux < (-NOISE_REJECTION))){
			  
			 channel       = 0;
			 sample        = 0;			 
			 dataStatus    = DATA_UNAVAILABLE;
			 analog_buffer = analog_buffer_reset;
		   	
			 return;
			 
			}	
		 
	  }
	 
	 sample++;
	 
	 if(sample == SAMPLE_QTY){
		 
		 *analog_buffer++ = table[sample - 1];
		 
		 sample = 0;
			
		 channel++;
		 
		 	
		}
		
	 if(channel == CHANNEL_QTY){
		 	
		 channel = 0;
			
		 dataStatus = DATA_AVAILABLE;
		 
		 analog_buffer = analog_buffer_reset;
		 
		}
	 
	 ADC1_Enable(channel);
   
  }	
	

 

 
 