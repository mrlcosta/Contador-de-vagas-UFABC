
/***************************************************************
 * Biblioteca de Teste da PCI PRO4.38                          *
 ***************************************************************/
 
 /* Autor: Felipe Antonio Montagneri Lucchini
    Data : 02/01/2017
	*/
	
/***************************************************************/

#include "stm8s.h"
#include "stm8s_io.h"
#include "stm8s_timer.h"

#include "test.h"

#define FINISH 81
#define DELAY  82

uint8_t   state       = 0;
uint8_t   stack       = 0;
uint8_t   delay       = 0;
uint8_t   model_out   = 1;
uint8_t   model_in    = 0;
uint8_t   menuState   = 0;
uint8_t   selectState = 0;

uint16_t *buffer      = (uint16_t *)0;

bool      debouncing1 =  FALSE;
bool      debouncing2 =  FALSE;
bool      ack         =  FALSE;
bool      buzzer      =  FALSE;
bool      blink       =  FALSE;
bool      menu        =  TRUE;
bool      start       =  TRUE;
bool      wait        =  TRUE;





/***************************************************************
 * Funções e Procedimentos                                     *
 ***************************************************************/
/***************************************************************
 * testUpdate();                                               *
 *                                                             *
 * Procedimento de Controle de Teste;                          *
 *                                                             *
 * uint8_t *control -> endereço da variável de controle;       *
 *                                                             *
 * void -> não retorna valor;                                  *
 ***************************************************************/
void testUpdate(uint8_t *control){
	 
	 if(*control >= 31){
		 
		 return;
		 
	  }
	 
	 if(((*buffer > 500)&&(*buffer < 4500))||(*(buffer + 2) < 500)){
		 
		 *control  = 0;
		  state    = 0;
			ack      = FALSE;
			wait     = TRUE;
			
		 timerEnable(2, DISABLE);
		 timerReset (2);
		 
		 timerReset (6);
			
		 ioCommSetDir(INPUT);
		 
		 return;
		 
	  }else{
			
		 if((state == 0)&&(*control < 3)){
			 
			 if(*control == 0){
			   
			   timerSetOverflowValue(6, 500);
			   timerReset           (6);
			   timerEnable          (6, ENABLE);
			   
			  }
				
			 *control = 1;
				
		  }
			
		}
		
	 if(*buffer > 4500){
		 
		 *control = 4;
		 
		 return;
		 
	  }
		
	 if(!timerGetOverflow(6) && wait){
		 
		 ack = FALSE;
		 
		 return;
		 
	  }else{
			
		 wait = FALSE;
		 
		 timerEnable(6, DISABLE);
		 timerReset (6);
			
	  }	 
		
	 if((state == 0)&&(*control >= 3)&&(*control < 31)){
		 
		 if(buzzer){
			 
			 buzzer = FALSE;
			 menu   = TRUE;
			 
			 if(*control == 3){
				 
				 timerSetOverflowValue(3, 1000);
				 timerReset           (3);
				 timerEnable          (3, ENABLE);
				 
				 blink = TRUE;
				 
			  }else{
					
				 timerSetOverflowValue(1, 500);
				 timerReset           (1);
				 timerEnable          (1, ENABLE);	
					
				}
			 
		  }
			
		 if(timerGetOverflow(1)){
			 
			 timerReset(1);
			 
			 if(blink){
				 
				 blink = FALSE;
				 
			  }else{
					
				 blink = TRUE;	
					
				}
			 
		  }
			
		 if(!timerGetOverflow(3) && blink){
					
			 if(timeBase210us()){
			   
				// GPIO_WriteReverse(BUZZER);
				 
			  }
				
			}else{
				
			 GPIO_WriteLow(BUZZER);	
				
			}
			
		}
		
	 if(timerGetOverflow(2)){
		 
		 if(!GPIO_ReadInputPin(COMM)&&(*control != 0)){
			 
			 ack = TRUE;
			 
		  }
			
		 timerEnable(2, DISABLE);	
		 timerReset (2);	 
		 
	  }
	 
   switch(state){
		 
		 case 0:	 
			 
			 GPIO_WriteLow(CH1);
			 GPIO_WriteLow(CH2);
			 GPIO_WriteLow(CH3);
			 GPIO_WriteLow(CH4);
			 GPIO_WriteLow(IGN);
			 GPIO_WriteLow(DOOR);
			 GPIO_WriteLow(SETA);
			 GPIO_WriteLow(SW_P);
			 GPIO_WriteLow(SW_N);
			 GPIO_WriteLow(I_MOT);
			 GPIO_WriteLow(CMD_DN);
			 GPIO_WriteLow(CMD_UP); 
			 
			 if(ack){				 
				 
				 
				 *control = 2;
				  ack     = FALSE;
					menu    = FALSE;
				  buzzer  = TRUE;
				  state   = 1;			 
					
			   timerSetOverflowValue(3, 30);			     
			   timerReset           (3);			     			 
				 timerEnable          (3, ENABLE);	
				  
				 ioCommSetDir(OUTPUT);
					
			  }
			 
		 break;
/***************************************************************/		 
     case 1:      
			 
			 if(timerGetOverflow(3)){
				 
				 model_in++;
				 
				 if(model_in <= (2 * model_out)){
					  
					 GPIO_WriteReverse(COMM);
					 
					 timerSetOverflowValue(1, 1500);
				   timerReset           (1);
				   timerEnable          (1, ENABLE);
				   
				   timerReset           (3);
				    
				  }else{
						
					 model_in = 0;					 
					 state    = 2;
					 
					 timerEnable(1, ENABLE);
					 timerReset (1);
					 
					 ioCommSetDir(INPUT);
						
					}
				  
			  }
			 
			 
			 
			 
		 break;
/***************************************************************/	
     case 2:
		   
			 if(ack){
				 
				 ack = FALSE;
				 
				 if(model_in == 0){
					 
					 timerSetOverflowValue(1, 50);
					 timerReset           (1);
					 timerEnable          (1, ENABLE);
					 
				  }else{
						
					 timerReset(1);
						
					}
				 
				 model_in++;
				 
			  }			  
				
			 if(timerGetOverflow(1)){
				 
				 if(model_in == model_out){
					 
					  buzzer  = TRUE;
					  state   = DELAY;
					  stack   = 3;
				    
				   timerReset (1);
					  
					 timerSetOverflowValue(3, 15);	
				   timerReset           (3);			     			 
				   timerEnable          (3, ENABLE);
           
				   ioCommSetDir(OUTPUT);
					 
				   GPIO_WriteHigh(COMM);					 
					 
				  }else{
				   
					 *control = 5;
				    state   = FINISH;
					 
				  }
					
				 model_in = 0;
				 
			  }
       
		 break;		 
/***************************************************************/	
		 case 3:
		    
			 if(ack){
				 
				 ack   = FALSE;
				 state = DELAY;
				 stack = 4;
				 
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);
				  
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);			 
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 *control =  7;
				  state   = FINISH;
				  
			  }				
			 
		 break;
/***************************************************************/			 
		 case 4:
		    
			 if(ack){
				 
				 ack   = FALSE;
				 state = DELAY;
				 stack = 5;
					
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);	
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 *control =  7;
				  state   = FINISH;
				  
			  }				
			 
		 break;
/***************************************************************/			 
		 case 5:
		    
			 if(ack){
				 
				 ack   = FALSE;;
				 state = DELAY;
				 stack = 6;
					
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);	
				 
				 GPIO_WriteHigh(SETA);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 *control =  8;
				  state   = FINISH;
				 
			  }				
			 
		 break;
/***************************************************************/			 
		 case 6:
		    
			 if(ack){
				 
				 ack   = FALSE;
				 state = DELAY;
				 stack = 7;
					
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);	
				 
				 GPIO_WriteLow(SETA);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 *control =  8;
				  state   = FINISH;
				 
			  }				
			 
		 break;
/***************************************************************/			 
		 case 7:
		    
			 if(ack){
				 
				 ack   = FALSE;
				 state = DELAY;
				 stack = 8;
					
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);		
				 
				 GPIO_WriteHigh(IGN);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 *control =  9;
				  state   = FINISH;
				 
			  }				
			 
		 break;
/***************************************************************/			 
		 case 8:
		    
			 if(ack){
				 
				 ack      = FALSE;	
				 state    = DELAY;
				 stack    = 9;
					
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);		
				 
				 GPIO_WriteLow(IGN);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 *control =  9;
				  state   = FINISH;
				 
			  }				
			 
		 break;
/***************************************************************/			 
		 case 9:
		    
			 if(ack){
				 
				 ack   = FALSE;
				 state = DELAY;
				 stack = 10;
					
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);	
				 
				 GPIO_WriteHigh(CMD_UP);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 *control =  10;
				  state   = FINISH;
				 
			  }				
			 
		 break;
/***************************************************************/			 
		 case 10:
		    
			 if(ack){
				 
				 ack   = FALSE;
				 state = DELAY;
				 stack = 11;
					
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);	
				 
				 GPIO_WriteLow(CMD_UP);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 *control =  10;
				  state   = FINISH;
				 
			  }				
			 
		 break;
/***************************************************************/			 
		 case 11:
		    
			 if(ack){
				 
				 ack   = FALSE;	
				 state = DELAY;
				 stack = 12;
					
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);
				 
				 GPIO_WriteHigh(CMD_DN);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 *control =  11;
				  state   = FINISH;
				 
			  }				
			 
		 break;
/***************************************************************/			 
		 case 12:
		    
			 if(ack){
				 
				 ack   = FALSE;	
				 state = DELAY;
				 stack = 13;
					
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);		
				 
				 GPIO_WriteLow(CMD_DN);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 *control =  11;
				  state   = FINISH;
				 
			  }				
			 
		 break;
/***************************************************************/			 
		 case 13:
		    
			 if(ack){
				 
				 ack   = FALSE;
				 state = DELAY;
				 stack = 14;
					
 				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);
				 
				 GPIO_WriteHigh(DOOR);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 *control = 12;
				  state   = FINISH;
				 
			  }				
			 
		 break;
/***************************************************************/			 
		 case 14:
		    
			 if(ack){
				 
				 ack   = FALSE;
				 state = DELAY;
				 stack = 15;
					
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);	
				 
				 GPIO_WriteLow(DOOR);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 *control = 12;
				  state   = FINISH;
				 
			  }				
			 
		 break;
/***************************************************************/			 
		 case 15:
		    
			 if(ack){
				 
				 ack   = FALSE;
				 state = DELAY;
				 stack = 22;
					
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);	
				 
				 GPIO_WriteHigh(SW_P);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 ack   = FALSE;
				 state = DELAY;
				 stack = 16;
					
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
			  }				
			 
		 break;
/***************************************************************/		 
		 case 16:
		    
			 if(ack){
				 
				 ack   = FALSE;
				 state = DELAY;
				 stack = 17;
					
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE); 
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 *control = 13;
				  state   = FINISH;
				 
			  }				
			 
		 break;
/***************************************************************/		 
		 case 17:
		    
			 if(ack){
				 
				 ack   = FALSE;
				 state = DELAY;
				 stack = 18;
					
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);	
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 *control = 14;
				  state   = FINISH;
				 
			  }				
			 
		 break;
/***************************************************************/		 
		 case 18:
		    
			 if(ack){
				 
				 ack   = FALSE;
				 state = DELAY;
				 stack = 19;
					
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 *control = 15;
				  state   = FINISH;
				 
			  }				
			 
		 break;
/***************************************************************/		 
		 case 19:
		    
			 if(ack){
				 
				 ack   = FALSE;
				 state = DELAY;
				 stack = 20;
					
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);	
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 *control = 16;
				  state   = FINISH;
				 
			  }				
			 
		 break;
/***************************************************************/		 
		 case 20:
		    
			 if(ack){
				 
				 ack   = FALSE;
				 state = DELAY;
				 stack = 21;
					
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 *control = 17;
				  state   = FINISH;
				 
			  }				
			 
		 break;
/***************************************************************/		 
		 case 21:
		    
			 if(ack){
				 
				 ack   = FALSE;
				 state = DELAY;
				 stack = 22;
					
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);
				 
				 GPIO_WriteHigh(SW_P);
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 *control = 18;
				  state   = FINISH;
				 
			  }				
			 
		 break;
/***************************************************************/		 
		 case 22:
		    
			 if(ack){
				 
				 ack   = FALSE;	
				 state = DELAY;
				 stack = 29;
					
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 ack   = FALSE;
				 state = DELAY;
				 stack = 23;
					
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
			  }				
			 
		 break;
/***************************************************************/		 
		 case 23:
		    
			 if(ack){
				 
				 ack   = FALSE;
				 state = DELAY;
				 stack = 24;
					
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);	
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 *control = 13;
				  state   = FINISH;
				 
			  }				
			 
		 break;
/***************************************************************/		 
		 case 24:
		    
			 if(ack){
				 
				 ack   = FALSE;
				 state = DELAY;
				 stack = 25;
					
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 *control = 14;
				  state   = FINISH;
				 
			  }				
			 
		 break;
/***************************************************************/		 
		 case 25:
		    
			 if(ack){
				 
				 ack   = FALSE;
				 state = DELAY;
				 stack = 26;
					
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 *control = 15;
				  state   = FINISH;
				 
			  }				
			 
		 break;
/***************************************************************/		 
		 case 26:
		    
			 if(ack){
				 
				 ack   = FALSE;
				 state = DELAY;
				 stack = 27;
					
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 *control = 16;
				  state   = FINISH;
				 
			  }				
			 
		 break;
/***************************************************************/		 
		 case 27:
		    
			 if(ack){
				 
				 ack      = FALSE;
				 state    = DELAY;
				 stack    = 28;
					
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 *control = 17;
				  state   = FINISH;
				 
			  }				
			 
		 break;
/***************************************************************/		 
		 case 28:
		    
			 if(ack){
				 
				 ack   = FALSE;	
				 state = DELAY;
				 stack = 29;
					
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 *control = 18;
				  state   = FINISH;
				 
			  }				
			 
		 break;
/***************************************************************/		 
		 case 29:
		    
			 if(ack){
				 
				 ack   = FALSE;	
				 state = DELAY;
				 stack = 30;
					
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 *control = 19;
				  state   = FINISH;
				 
			  }				
			 
		 break;
/***************************************************************/		 
		 case 30:
		    
			 if(ack){
				 
				 ack   = FALSE;
				 state = DELAY;
				 stack = 31;
					
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);	
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 *control = 20;
				  state   = FINISH;
				 
			  }				
			 
		 break;
/***************************************************************/		 
		 case 31:
		    
			 if(ack){
				 
				 ack   = FALSE;
				 state = DELAY;
				 stack = 32;
					
				 timerReset           (1);
				 timerSetOverflowValue(1, 200);
				 
				 timerReset           (3);				 
				 timerSetOverflowValue(3, 100);
				 timerEnable          (3, ENABLE);
					
				 GPIO_WriteLow (SW_P);
         GPIO_WriteHigh(CH1);   				 
				 GPIO_WriteHigh(I_MOT);
				 				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 *control = 21;
				  state   = FINISH;
				 
			  }				
			 
		 break;
/***************************************************************/			 
		 case 32:
		    
			 if(ack){
				 
				 ack   = FALSE;	
				 state = DELAY;
				 stack = 36;
					
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);
					
				 GPIO_WriteLow (CH1);
				 GPIO_WriteHigh(CH2);
					
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);	 				 
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 state = DELAY;
				 stack = 33;
				 
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
			  }				
			 
		 break;
/***************************************************************/			 
		 case 33:
		    
			 if(ack){
				 
				 ack   = FALSE;	
				 state = DELAY;
				 stack = 34;
					
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);
					
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);	 				 
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 *control = 22;
				 state    = FINISH;
				 
			  }				
			 
		 break;
/***************************************************************/	
		 case 34:
		    
			 if(ack){
				 
				 ack   = FALSE;	
				 state = DELAY;
				 stack = 35;
					
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);
					
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);	 				 
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 *control = 22;
				 state    = FINISH;
				 
			  }				
			 
		 break;
/***************************************************************/	
     case 35:
		    
			 if(ack){
				 
				 ack   = FALSE;	
				 state = DELAY;
				 stack = 36;
					
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);
					
				 GPIO_WriteLow (CH1);
				 GPIO_WriteHigh(CH2);
					
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);	 				 
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 *control = 22;
				  state   = FINISH;
				 
			  }				
			 
		 break;
/***************************************************************/	
		 case 36:
		    
			 if(ack){
				 
				 ack   = FALSE;	
				 state = DELAY;
				 stack = 40;
					
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);
					
				 GPIO_WriteLow (CH2);
				 GPIO_WriteHigh(CH3);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 state = DELAY;
				 stack = 37;
				 
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
			  }				
			 
		 break;
/***************************************************************/		
     case 37:
		    
			 if(ack){
				 
				 ack   = FALSE;	
				 state = DELAY;
				 stack = 38;
					
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 *control = 23;
				 state    = FINISH;
				 
			  }				
			 
		 break;
/***************************************************************/	
     case 38:
		    
			 if(ack){
				 
				 ack   = FALSE;	
				 state = DELAY;
				 stack = 39;
					
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 *control = 23;
					state   = FINISH;
				 
			  }				
			 
		 break;
/***************************************************************/	
     case 39:
		    
			 if(ack){
				 
				 ack   = FALSE;	
				 state = DELAY;
				 stack = 40;
					
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);
				 
				 GPIO_WriteLow (CH2);
				 GPIO_WriteHigh(CH3);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 timerReset(1);
					
				 *control = 23;
					state   = FINISH;
				 
			  }				
			 
		 break;
/***************************************************************/	
		 case 40:
		    
			 if(ack){
				 
				 ack   = FALSE;
				 state = DELAY;
				 stack = 44;
					
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);
					
				 GPIO_WriteLow (CH3);
				 GPIO_WriteHigh(CH4);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 state = DELAY;
				 stack = 41;
				 
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
			  }				
			 
		 break;
/***************************************************************/		
     case 41:
		    
			 if(ack){
				 
				 ack   = FALSE;
				 state = DELAY;
				 stack = 42;
					
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 timerReset(1);
				 
				 *control = 24;
				  state   = FINISH;
				 
			  }				
			 
		 break;
/***************************************************************/	
     case 42:
		    
			 if(ack){
				 
				 ack   = FALSE;
				 state = DELAY;
				 stack = 43;
					
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 timerReset(1);
				 
				 *control = 24;
				  state   = FINISH;
				 
			  }				
			 
		 break;
/***************************************************************/	
     case 43:
		    
			 if(ack){
				 
				 ack   = FALSE;
				 state = DELAY;
				 stack = 44;
					
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);
				 
				 GPIO_WriteLow (CH3);
				 GPIO_WriteHigh(CH4);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 timerReset(1);
				 
				 *control = 24;
				  state   = FINISH;
				 
			  }				
			 
		 break;
/***************************************************************/	
		 case 44:
		    
			 if(ack){
				 
				 ack   = FALSE;
				 state = DELAY;
				 stack = 48; 
					
				 timerReset           (1);
				 timerSetOverflowValue(1, 400);
				 
				 timerReset           (3);
				 timerEnable          (3, ENABLE);
				 
				 timerSetOverflowValue(4, 350);
				 timerReset           (4);
				 timerEnable          (4, ENABLE);
         
         GPIO_WriteLow (CH4);
				 GPIO_WriteLow (I_MOT);				 
				 GPIO_WriteHigh(CH1);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 state = DELAY;
				 stack = 45;
				 
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
			  }				
			 
		 break;
/***************************************************************/		 
     case 45:
		    
			 if(ack){
				 
				 ack   = FALSE;
				 state = DELAY;
				 stack = 46; 
					
				 timerReset           (1);
				 
				 timerReset           (3);
				 timerEnable          (3, ENABLE);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 *control = 25;
				  state   = FINISH;
				 
			  }				
			 
		 break;
/***************************************************************/
     case 46:
		    
			 if(ack){
				 
				 ack   = FALSE;
				 state = DELAY;
				 stack = 47; 
					
				 timerReset           (1);
				 
				 timerReset           (3);
				 timerEnable          (3, ENABLE);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 *control = 25;
				  state   = FINISH;
				 
			  }				
			 
		 break;
/***************************************************************/
		 case 47:
		    
			 if(ack){
				 
				 ack   = FALSE;
				 state = DELAY;
				 stack = 48; 
					
				 timerReset           (1);
				 timerSetOverflowValue(1, 400);
				 
				 timerReset           (3);
				 timerEnable          (3, ENABLE);
				 
				 timerSetOverflowValue(4, 365);
				 timerReset           (4);
				 timerEnable          (4, ENABLE);
         
         GPIO_WriteLow (CH4);
				 GPIO_WriteLow (I_MOT);				 
				 GPIO_WriteHigh(CH1);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 *control = 25;
				  state   = FINISH;
				 
			  }				
			 
		 break;
/***************************************************************/
		 case 48:
		   
		   if(!timerGetOverflow(4)){
				 
				 ack = FALSE;
				 
				 return;
				 
			  }
		    
			 if(ack){
				 
				 ack   = FALSE;
				 state = DELAY;
				 stack = 52;	
				
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);
				 
				 timerReset (4);
				 timerEnable(4, ENABLE);
         
         GPIO_WriteLow (CH1);				 
				 GPIO_WriteHigh(CH2);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 ack   = FALSE;
				 state = DELAY;
				 stack = 49;
				 
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);
				 
				 timerReset (4);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
			  }				
			 
		 break;
/***************************************************************/		 
		 case 49:
		   
		   if(!timerGetOverflow(4)){
				 
				 ack = FALSE;
				 
				 return;
				 
			  }
		    
			 if(ack){
				 
				 ack   = FALSE;
				 state = DELAY;
				 stack = 50;	
				
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);
				 
				 timerReset (4);
				 timerEnable(4, ENABLE);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 timerReset(1);
				 
				 *control = 26;
				  state   = FINISH;
				 
			  }				
			 
		 break;
/***************************************************************/		
		 case 50:
		   
		   if(!timerGetOverflow(4)){
				 
				 ack = FALSE;
				 
				 return;
				 
			  }
		    
			 if(ack){
				 
				 ack   = FALSE;
				 state = DELAY;
				 stack = 51;	
				
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);
				 
				 timerReset (4);
				 timerEnable(4, ENABLE);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 timerReset(1);
				 
				 *control = 26;
				  state   = FINISH;
				 
			  }				
			 
		 break;
/***************************************************************/	
		 case 51:
		   
		   if(!timerGetOverflow(4)){
				 
				 ack = FALSE;
				 
				 return;
				 
			  }
		    
			 if(ack){
				 
				 ack   = FALSE;
				 state = DELAY;
				 stack = 52;	
				
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);
				 
				 timerReset (4);
				 timerEnable(4, ENABLE);
				 
				 GPIO_WriteLow (CH1);				 
				 GPIO_WriteHigh(CH2);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 timerReset(1);
				 
				 *control = 26;
				  state   = FINISH;
				 
			  }				
			 
		 break;
/***************************************************************/	
		 case 52:
		    
			 if(!timerGetOverflow(4)){
				 
				 ack = FALSE;
				 
				 return;
				 
			  }
				
			 if(ack){
				 
				 ack   = FALSE;
				 state = DELAY;
				 stack = 56;	
					
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);	
				 
				 timerReset (4);
				 timerEnable(4, ENABLE);
         
         GPIO_WriteLow (CH2);				 
				 GPIO_WriteHigh(CH3);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 state = DELAY;
				 stack = 53;
				 
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);
				 
				 timerReset (4);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
			  }				
			 
		 break;
/***************************************************************/	
		 case 53:
		    
			 if(!timerGetOverflow(4)){
				 
				 ack = FALSE;
				 
				 return;
				 
			  }
				
			 if(ack){
				 
				 ack   = FALSE;
				 state = DELAY;
				 stack = 54;	
					
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);	
				 
				 timerReset (4);
				 timerEnable(4, ENABLE);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 timerReset(1);
				 
				 *control = 27;
				  state   = FINISH;
				 
			  }				
			 
		 break;
/***************************************************************/
		 case 54:
		    
			 if(!timerGetOverflow(4)){
				 
				 ack = FALSE;
				 
				 return;
				 
			  }
				
			 if(ack){
				 
				 ack   = FALSE;
				 state = DELAY;
				 stack = 55;	
					
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);	
				 
				 timerReset (4);
				 timerEnable(4, ENABLE);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 timerReset(1);
				 
				 *control = 27;
				  state   = FINISH;
				 
			  }				
			 
		 break;
/***************************************************************/
		 case 55:
		    
			 if(!timerGetOverflow(4)){
				 
				 ack = FALSE;
				 
				 return;
				 
			  }
				
			 if(ack){
				 
				 ack   = FALSE;
				 state = DELAY;
				 stack = 56;	
					
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);	
				 
				 timerReset (4);
				 timerEnable(4, ENABLE);
				 
				 GPIO_WriteLow (CH2);				 
				 GPIO_WriteHigh(CH3);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 timerReset(1);
				 
				 *control = 27;
				  state   = FINISH;
				 
			  }				
			 
		 break;
/***************************************************************/
		 case 56:
		    
			 if(!timerGetOverflow(4)){
				 
				 ack = FALSE;
				 
				 return;
				 
			  }
				
			 if(ack){
				 
				 ack   = FALSE;	
				 state = DELAY;
				 stack = 60;	
					
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);
         
         timerReset (4);
				 timerEnable(4, ENABLE);
         
         GPIO_WriteLow (CH3);				 
				 GPIO_WriteHigh(CH4);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 state = DELAY;
				 stack = 57;
				 
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);
				 
				 timerReset (4);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
			  }				
			 
		 break;
/***************************************************************/		 
     case 57:
		    
			 if(!timerGetOverflow(4)){
				 
				 ack = FALSE;
				 
				 return;
				 
			  }
				
			 if(ack){
				 
				 ack   = FALSE;	
				 state = DELAY;
				 stack = 58;	
					
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);
         
         timerReset (4);
				 timerEnable(4, ENABLE);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 timerReset(1);
				 
				 *control = 28;
				  state   = FINISH;
				 
			  }				
			 
		 break;
/***************************************************************/		
	   case 58:
		    
			 if(!timerGetOverflow(4)){
				 
				 ack = FALSE;
				 
				 return;
				 
			  }
				
			 if(ack){
				 
				 ack   = FALSE;	
				 state = DELAY;
				 stack = 59;	
					
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);
         
         timerReset (4);
				 timerEnable(4, ENABLE);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 timerReset(1);
				 
				 *control = 28;
				  state   = FINISH;
				 
			  }				
			 
		 break;
/***************************************************************/		
     case 59:
		    
			 if(!timerGetOverflow(4)){
				 
				 ack = FALSE;
				 
				 return;
				 
			  }
				
			 if(ack){
				 
				 ack   = FALSE;	
				 state = DELAY;
				 stack = 60;	
					
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);
         
         timerReset (4);
				 timerEnable(4, ENABLE);
				 
				 GPIO_WriteLow (CH3);				 
				 GPIO_WriteHigh(CH4);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 timerReset(1);
				 
				 *control = 28;
				  state   = FINISH;
				 
			  }				
			 
		 break;
/***************************************************************/		
  	 case 60:
		    
			 if(!timerGetOverflow(4)){
				 
				 ack = FALSE;
				 
				 return;
				 
			  }
				
			 if(ack){
				 
				 ack   = FALSE;	
				 state = DELAY;
				 stack = 64;	
					
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);
				 
				 timerReset (4);
				 timerEnable(4, ENABLE);
         
         GPIO_WriteLow (CH4);
				 GPIO_WriteHigh(CH1);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 state = DELAY;
				 stack = 61;
				 
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);
				 
				 timerReset (4);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
			  }				
			 
		 break;
/***************************************************************/		 
  	 case 61:
		    
			 if(!timerGetOverflow(4)){
				 
				 ack = FALSE;
				 
				 return;
				 
			  }
				
			 if(ack){
				 
				 ack   = FALSE;	
				 state = DELAY;
				 stack = 62;	
					
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);
				 
				 timerReset (4);
				 timerEnable(4, ENABLE);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 *control = 29;
				  state   = FINISH;
				 
			  }				
			 
		 break;
/***************************************************************/	
     case 62:
		    
			 if(!timerGetOverflow(4)){
				 
				 ack = FALSE;
				 
				 return;
				 
			  }
				
			 if(ack){
				 
				 ack   = FALSE;	
				 state = DELAY;
				 stack = 63;	
					
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);
				 
				 timerReset (4);
				 timerEnable(4, ENABLE);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 *control = 29;
				  state   = FINISH;
				 
			  }				
			 
		 break;
/***************************************************************/	
     case 63:
		    
			 if(!timerGetOverflow(4)){
				 
				 ack = FALSE;
				 
				 return;
				 
			  }
				
			 if(ack){
				 
				 ack   = FALSE;	
				 state = DELAY;
				 stack = 64;	
					
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);
				 
				 timerReset (4);
				 timerEnable(4, ENABLE);
				 
				 GPIO_WriteLow (CH4);
				 GPIO_WriteHigh(CH1);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 *control = 29;
				  state   = FINISH;
				 
			  }				
			 
		 break;
/***************************************************************/	
  	 case 64:
		   
		   if(!timerGetOverflow(4)){
				 
				 ack = FALSE;
				 
				 return;
				 
			  }
		    
			 if(ack){
				 
				 ack   = FALSE;
				 state = DELAY;
				 stack = 68; 
					
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);
				 
				 timerReset (4);
				 timerEnable(4, ENABLE);
         
         GPIO_WriteLow (CH1);				 
				 GPIO_WriteHigh(CH2);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 state = DELAY;
				 stack = 65;
				 
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);
				 
				 timerReset (4);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
			  }				
			 
		 break;
/***************************************************************/		 
     case 65:
		   
		   if(!timerGetOverflow(4)){
				 
				 ack = FALSE;
				 
				 return;
				 
			  }
		    
			 if(ack){
				 
				 ack   = FALSE;
				 state = DELAY;
				 stack = 66; 
					
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);
				 
				 timerReset (4);
				 timerEnable(4, ENABLE);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 *control = 26;
				  state   = FINISH;
				 
			  }				
			 
		 break;
/***************************************************************/	
     case 66:
		   
		   if(!timerGetOverflow(4)){
				 
				 ack = FALSE;
				 
				 return;
				 
			  }
		    
			 if(ack){
				 
				 ack   = FALSE;
				 state = DELAY;
				 stack = 67; 
					
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);
				 
				 timerReset (4);
				 timerEnable(4, ENABLE);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 *control = 26;
				  state   = FINISH;
				 
			  }				
			 
		 break;
/***************************************************************/	
case 67:
		   
		   if(!timerGetOverflow(4)){
				 
				 ack = FALSE;
				 
				 return;
				 
			  }
		    
			 if(ack){
				 
				 ack   = FALSE;
				 state = DELAY;
				 stack = 68; 
					
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);
				 
				 timerReset (4);
				 timerEnable(4, ENABLE);
         
         GPIO_WriteLow (CH1);				 
				 GPIO_WriteHigh(CH2);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 *control = 26;
				  state   = FINISH;
				 
			  }				
			 
		 break;
/***************************************************************/		 
		 case 68:
		   
		   if(!timerGetOverflow(4)){
				 
				 ack = FALSE;
				 
				 return;
				 
			  }
		    
			 if(ack){
				 
				 ack   = FALSE;
				 state = DELAY;
				 stack = 72; 
					
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);
         
				 timerReset (4);
				 timerEnable(4, ENABLE);
         
         GPIO_WriteLow (CH2);				 
				 GPIO_WriteHigh(CH3);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 state = DELAY;
				 stack = 69;
				 
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);
				 
				 timerReset (4);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
			  }				
			 
		 break;
/***************************************************************/	
     case 69:
		   
		   if(!timerGetOverflow(4)){
				 
				 ack = FALSE;
				 
				 return;
				 
			  }
		    
			 if(ack){
				 
				 ack   = FALSE;
				 state = DELAY;
				 stack = 70; 
					
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);
         
				 timerReset (4);
				 timerEnable(4, ENABLE);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 *control = 27;
					state   = FINISH;
				 
			  }				
			 
		 break;
/***************************************************************/	
     case 70:
		   
		   if(!timerGetOverflow(4)){
				 
				 ack = FALSE;
				 
				 return;
				 
			  }
		    
			 if(ack){
				 
				 ack   = FALSE;
				 state = DELAY;
				 stack = 71; 
					
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);
         
				 timerReset (4);
				 timerEnable(4, ENABLE);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 *control = 27;
					state   = FINISH;
				 
			  }				
			 
		 break;
/***************************************************************/	
   case 71:
		   
		   if(!timerGetOverflow(4)){
				 
				 ack = FALSE;
				 
				 return;
				 
			  }
		    
			 if(ack){
				 
				 ack   = FALSE;
				 state = DELAY;
				 stack = 72; 
					
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);
         
				 timerReset (4);
				 timerEnable(4, ENABLE);
				 
				 GPIO_WriteLow (CH2);				 
				 GPIO_WriteHigh(CH3);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 *control = 27;
					state   = FINISH;
				 
			  }				
			 
		 break;
/***************************************************************/	
		 case 72:
		    
			 if(!timerGetOverflow(4)){
				 
				 ack = FALSE;
				 
				 return;
				 
			  }
				
			 if(ack){
				 
				 ack   = FALSE;
				 state = DELAY;
				 stack = 76; 
					
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);
				 
				 timerReset (4);
				 timerEnable(4, ENABLE);
         
         GPIO_WriteLow (CH3);				 
				 GPIO_WriteHigh(CH4);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 state = DELAY;
				 stack = 73;
				 
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);
				 
				 timerReset (4);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
			  }				
			 
		 break;
/***************************************************************/		 
     case 73:
		    
			 if(!timerGetOverflow(4)){
				 
				 ack = FALSE;
				 
				 return;
				 
			  }
				
			 if(ack){
				 
				 ack   = FALSE;
				 state = DELAY;
				 stack = 74; 
					
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);
				 
				 timerReset (4);
				 timerEnable(4, ENABLE);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 *control = 28;
				  state   = FINISH;
				 
			  }				
			 
		 break;
/***************************************************************/		 
     case 74:
		    
			 if(!timerGetOverflow(4)){
				 
				 ack = FALSE;
				 
				 return;
				 
			  }
				
			 if(ack){
				 
				 ack   = FALSE;
				 state = DELAY;
				 stack = 75; 
					
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);
				 
				 timerReset (4);
				 timerEnable(4, ENABLE);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 *control = 28;
				  state   = FINISH;
				 
			  }				
			 
		 break;
/***************************************************************/		
     case 75:
		    
			 if(!timerGetOverflow(4)){
				 
				 ack = FALSE;
				 
				 return;
				 
			  }
				
			 if(ack){
				 
				 ack   = FALSE;
				 state = DELAY;
				 stack = 76; 
					
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);
				 
				 timerReset (4);
				 timerEnable(4, ENABLE);
				 
				 GPIO_WriteLow (CH3);				 
				 GPIO_WriteHigh(CH4);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
				 
		    }		
				
			 if(timerGetOverflow(1)){
				 
				 *control = 28;
				  state   = FINISH;
				 
			  }				
			 
		 break;
/***************************************************************/		
 	   case 76:
		   
			 if(!timerGetOverflow(4)){
				 
				 ack = FALSE;
				 
				 return;
				 
			  }
		    
			 if(ack){
				 
				  ack     = FALSE;
					state   = DELAY;
				  stack   = 80;
					
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);
         
				 timerSetOverflowValue(4, 220);
				 timerReset           (4);
				 timerEnable          (4, ENABLE);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
          
		    }		
				
			 if(timerGetOverflow(1)){
				  
				 state = DELAY;
				 stack = 77;
				 
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);
				 
				 timerReset (4);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);	 
			   
			  }			       
			 
		 break;
/***************************************************************/	
     case 77:
		   
			 if(!timerGetOverflow(4)){
				 
				 ack = FALSE;
				 
				 return;
				 
			  }
		    
			 if(ack){
				 
				  ack     = FALSE;
					state   = DELAY;
				  stack   = 78;
					
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);
         
				 timerReset (4);
				 timerEnable(4, ENABLE);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
          
		    }		
				
			 if(timerGetOverflow(1)){
				  
				 *control = 29;
				  state   = FINISH;	 
			   
			  }			       
			 
		 break;
/***************************************************************/	
     case 78:
		   
			 if(!timerGetOverflow(4)){
				 
				 ack = FALSE;
				 
				 return;
				 
			  }
		    
			 if(ack){
				 
				  ack     = FALSE;
					state   = DELAY;
				  stack   = 79;
					
				 timerReset (1);
				 
				 timerReset (3);
				 timerEnable(3, ENABLE);
         
				 timerReset (4);
				 timerEnable(4, ENABLE);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
          
		    }		
				
			 if(timerGetOverflow(1)){
				  
				 *control = 29;
				  state   = FINISH;	 
			   
			  }			       
			 
		 break;
/***************************************************************/	
     case 79:
		   
			 if(!timerGetOverflow(4)){
				 
				 ack = FALSE;
				 
				 return;
				 
			  }
		    
			 if(ack){
				 
				 ack     = FALSE;
				 state   = DELAY;
				 stack   = 80;
					
				 timerReset           (1);
				 
				 timerReset           (3);
				 timerEnable          (3, ENABLE);
         
				 timerSetOverflowValue(4, 220);
				 timerReset           (4);
				 timerEnable          (4, ENABLE);
				 
				 ioCommSetDir(OUTPUT);
				  
				 GPIO_WriteHigh(COMM);
          
		    }		
				
			 if(timerGetOverflow(1)){
				  
				 *control = 29;
				  state   = FINISH;
			   
			  }			       
			 
		 break;
/***************************************************************/
		 case 80:
		 
		 if(!timerGetOverflow(4)){
				
			 ack = FALSE;
			  
			 return;
				
		  }
		 
		 if(ack){
				 
				  ack     = FALSE;					
				 *control = 3;
				  state   = FINISH;
					
				 timerEnable(1, DISABLE);
				 timerReset (1);
				 
				 timerEnable(3, DISABLE);
				 timerReset (3);
          
		    }		
				
			 if(timerGetOverflow(1)){
				  
				 *control = 30;
				  state   = FINISH;	 
			   
			  }			       
		 
		 
		 break;
/***************************************************************/
     case FINISH:
		   
		   if(timerDelay(500)){
				 
				 GPIO_WriteLow(CH1);
		     GPIO_WriteLow(CH2);
		     GPIO_WriteLow(CH3);
		     GPIO_WriteLow(CH4);
			   GPIO_WriteLow(IGN);
			   GPIO_WriteLow(DOOR);
			   GPIO_WriteLow(SETA);
			   GPIO_WriteLow(SW_P);
			   GPIO_WriteLow(SW_N);
			   GPIO_WriteLow(I_MOT);
		     GPIO_WriteLow(CMD_DN);
		     GPIO_WriteLow(CMD_UP); 
				 
				 ack    = 0;
				 state  = 0;			 
				 buzzer = TRUE;
				 
				 if(*control != 3){
				   
				   menu  = TRUE;
					 
				  }
				 
				 timerEnable(2, DISABLE);
				 timerReset (2);
				 
			  }
		   
		 break;
/***************************************************************/		
		 case DELAY:
		    
		   if(timerGetOverflow(3)){
				 
				 GPIO_WriteLow (COMM);
				 
				 ioCommSetDir(INPUT);
				 
				 timerEnable(2, DISABLE);
				 timerReset (2);
				 
				 timerEnable(3, DISABLE);
				 timerReset (3);
				 
				 state = stack;
				 
			  } 
			  
		 break;
/***************************************************************/		 
	  }
	 
  }
	
/***************************************************************
 * menuUpdate(&control, &model);                               *
 *                                                             *
 * Procedimento de seleção do modelo da PCI;                   *
 *                                                             *
 * uint8_t *control -> endereço da variável de controle;       *
 * uint8_t *model   -> modelo selecionado;                     *
 *                                                             *
 * void -> não retorna valor;                                  *
 ***************************************************************/	
void menuUpdate(uint8_t *control, uint8_t *model){
	 
	 *model = model_out;
	 
	 if(!menu){
		 
		 return;
		 
	  }
		
	 switch(menuState){
		 
		 case 0:
		   
		   if(*(buffer + 3) > 500){
		     
		     timerEnable(4, DISABLE);
		     timerReset (4);
          
		     debouncing1 = FALSE;
		     
	      }else{
			   
		     if(!debouncing1){
			     
			     timerSetOverflowValue(4, 100);
					 timerReset           (4);
			     timerEnable          (4, ENABLE);
			     
			     debouncing1 = TRUE;		 
			     
		      }
			    
			   if(timerGetOverflow(4)){
			     
			     debouncing1 = FALSE;
					 
					 timerEnable(4, DISABLE);
		       timerReset (4);
			     
			     menuState++;
				   
			    }		
			   
		    }   
		   
		 break;
		 
		 case 1:
		   
			 if(*(buffer + 3) > 500){
				 
				 if((*control < 31)||(*control == 65)){
					  
					 *control = 31;
					 
				  }else{
						
					 *control += 1;
						
					}		
           
         menuState = 0;
				 
			  }
			 
		 break;
		 
		 
	  }
		
		switch(selectState){
		 
		 case 0:
		   
		   if(*(buffer + 4) > 500){
		     
		     timerEnable(5, DISABLE);
		     timerReset (5);
          
		     debouncing2 = FALSE;
		     
	      }else{
			   
		     if(!debouncing2){
			     
			     timerSetOverflowValue(5, 100);
					 timerReset           (5);
			     timerEnable          (5, ENABLE);
			     
			     debouncing2 = TRUE;		 
			     
		      }
			    
			   if(timerGetOverflow(5)){
			     
			     debouncing2 = FALSE;
					 
					 timerEnable(5, DISABLE);
		       timerReset (5);
			     
			     selectState++;
				   
			    }		
			   
		    }   
		   
		 break;
		 
		 case 1:
		   
			 if(*(buffer + 4) > 500){
				 
				 model_out = *control - 30;
				 
				 *control  = 0;
				 
         selectState = 0;
				 
			  }
			 
		 break;
		 
		 
	  }
		
	  
	 
	}
	
/***************************************************************
 * testStop(&control);                                         *
 *                                                             *
 * Procedimento de parada do teste;                            *
 *                                                             *
 * uint8_t *control -> endereço da variável de controle;       *
 *                                                             *
 * void -> não retorna valor;                                  *
 ***************************************************************/	
void testStop (uint8_t *control){
	 
	 *control = 6;
	    state = 0;
	 
	}
 
/***************************************************************
 * testSetBuffer(&bufferAddr);                                 *
 *                                                             *
 * Procedimento de seleção do endereço do buffer dos AD's;     *
 *                                                             *
 * uint16_t *bufferaddr -> endereço do buffer;                 *
 *                                                             *
 * void -> não retorna valor;                                  *
 ***************************************************************/
void testSetBuffer(uint16_t *bufferAddr){
	 
	 buffer = bufferAddr; 
	 
  }
	
/***************************************************************
 * Interrupção dos Ports;                                     *
***************************************************************/ 
INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3){
		
	 timerSetOverflowValue(2, 10);
	 timerReset           (2);
	 timerEnable          (2, ENABLE);
	 
	 if(state >= 48){
		 
		 GPIO_WriteReverse(SW_P);
		 
	  }
	  
  }
	
INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4){
	 
  }
	
INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5){
		
	}
	
INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6){
    
  }
	
INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7){
	 	 
  }
 