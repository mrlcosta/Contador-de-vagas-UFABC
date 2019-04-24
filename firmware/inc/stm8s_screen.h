/***************************************************************
 * Biblioteca de Controle do Display de LCD                    *
 ***************************************************************/
 
 /* Autor: Felipe Antonio Montagneri Lucchini
    Data : 27/10/2016
	*/
	
/***************************************************************/

#include "stm8s.h"

typedef struct{
	 
	 uint8_t message[17]; 
	  
  }string;
	
/***************************************************************
 * Fun��es e Procedimentos                                     *
 ***************************************************************/
/***************************************************************
 * screenUpdate(status, title);                                *
 *                                                             *
 * Procedimento de atualiza��o das mensagens no display;       *
 *                                                             *
 * uint8_t status -> c�digo de erro;                           *
 * uint8_t title  -> modelo selecionado;                       *
 *                                                             *
 * void -> n�o retorna valor;                                  *
 ***************************************************************/
void screenUpdate(uint8_t status, uint8_t title);

/***************************************************************/