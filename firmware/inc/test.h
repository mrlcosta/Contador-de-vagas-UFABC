/***************************************************************
 * Biblioteca de Teste da PCI PRO4.38                          *
 ***************************************************************/
 
 /* Autor: Felipe Antonio Montagneri Lucchini
    Data : 02/01/2017
	*/
	
/***************************************************************/

#include "stm8s.h"

/***************************************************************
 * Fun��es e Procedimentos                                     *
 ***************************************************************/
/***************************************************************
 * testUpdate();                                               *
 *                                                             *
 * Procedimento de Controle de Teste;                          *
 *                                                             *
 * uint8_t *control -> endere�o da vari�vel de controle;       *
 *                                                             *
 * void -> n�o retorna valor;                                  *
 ***************************************************************/
 void testUpdate(uint8_t *control);
 
/***************************************************************
 * menuUpdate(&control, &model);                               *
 *                                                             *
 * Procedimento de sele��o do modelo da PCI;                   *
 *                                                             *
 * uint8_t *control -> endere�o da vari�vel de controle;       *
 * uint8_t *model   -> modelo selecionado;                     *
 *                                                             *
 * void -> n�o retorna valor;                                  *
 ***************************************************************/	
void menuUpdate(uint8_t *control, uint8_t *model);
 
/***************************************************************
 * testStop(&control);                                         *
 *                                                             *
 * Procedimento de parada do teste;                            *
 *                                                             *
 * uint8_t *control -> endere�o da vari�vel de controle;       *
 *                                                             *
 * void -> n�o retorna valor;                                  *
 ***************************************************************/	
void testStop (uint8_t *control);
 
/***************************************************************
 * testSetBuffer(&bufferAddr);                                 *
 *                                                             *
 * Procedimento de sele��o do endere�o do buffer dos AD's;     *
 *                                                             *
 * uint16_t *bufferaddr -> endere�o do buffer;                 *
 *                                                             *
 * void -> n�o retorna valor;                                  *
 ***************************************************************/
void testSetBuffer(uint16_t *bufferAddr);
 
/***************************************************************/