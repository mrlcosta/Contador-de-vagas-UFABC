/***************************************************************
 * Biblioteca de Teste da PCI PRO4.38                          *
 ***************************************************************/
 
 /* Autor: Felipe Antonio Montagneri Lucchini
    Data : 02/01/2017
	*/
	
/***************************************************************/

#include "stm8s.h"

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
 void testUpdate(uint8_t *control);
 
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
void menuUpdate(uint8_t *control, uint8_t *model);
 
/***************************************************************
 * testStop(&control);                                         *
 *                                                             *
 * Procedimento de parada do teste;                            *
 *                                                             *
 * uint8_t *control -> endereço da variável de controle;       *
 *                                                             *
 * void -> não retorna valor;                                  *
 ***************************************************************/	
void testStop (uint8_t *control);
 
/***************************************************************
 * testSetBuffer(&bufferAddr);                                 *
 *                                                             *
 * Procedimento de seleção do endereço do buffer dos AD's;     *
 *                                                             *
 * uint16_t *bufferaddr -> endereço do buffer;                 *
 *                                                             *
 * void -> não retorna valor;                                  *
 ***************************************************************/
void testSetBuffer(uint16_t *bufferAddr);
 
/***************************************************************/