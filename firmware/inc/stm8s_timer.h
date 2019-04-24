/***************************************************************
 * Biblioteca de Temporização                                  *
 ***************************************************************/
 
 /* Autor: Felipe Antonio Montagneri Lucchini
    Data : 25/09/2015
	*/
	
/***************************************************************
 * Definição das contantes de tempo (base de tempo de 0,1ms):  *
 ***************************************************************/

#define TIME_BASE_1MS           1
#define TIME_BASE_50MS         50
#define TIME_BASE_100MS       100
#define TIME_BASE_150MS       150
#define TIME_BASE_200MS       200
#define TIME_BASE_250MS       250
#define TIME_BASE_500MS       500
#define TIME_BASE_800MS       800
#define TIME_BASE_1S         1000
#define TIME_BASE_2S         2000
#define TIME_BASE_3S         3000
#define TIME_BASE_4S         4000
#define TIME_BASE_5S         5000
#define TIME_BASE_10S       10000
#define TIME_BASE_30S       30000
#define TIME_BASE_60S       60000
#define TIME_BASE_DEBOUCING   100

#define TIMER_QTY 7


/***************************************************************
 * Estrutura do Timer:                                         *
 *                                                             * 
 * count    (inteiro)  - valor de contagem da bse de tempo;    *
 * maxCount (inteiro)  - valor de overflow;                    * 
 * enable   (booleano) - flag  de operação do timer;           *
 * overflow (booleano) - flag  de overflow do timer;           *                                                         
 ***************************************************************/

typedef struct{
	
	 uint32_t count;
	 uint32_t maxCount;
	 bool     enable;
	 bool     overflow;

} timer; 

/***************************************************************
 * Funções e Procedimentos                                     *                            
 ***************************************************************/ 
/***************************************************************
 * void timerInit(void);                                       *
 *                                                             * 
 * void -> não retorna valor                                   *
 ***************************************************************/
void timerInit(void);

 /***************************************************************
  * timerEnable (unit, enableCount);                            *
	*                                                             *
  * Controle de habilitação do timer                            *   
  *                                                             *
	* uint8_t unit        -> índice do timer a ser utilizado;     *
  * _Bool   enableCount	-> valor de hab/inib do timer;          *
	*                                                             *
	* void -> não retorna valor;                                  * 
  ***************************************************************/
void timerEnable(uint8_t unit, _Bool enableCount);

 /***************************************************************
  * timerReset (unit);                                          *   
	*                                                             *
	* Reset do valor de contagem do timer                         *
  *                                                             *
	* uint8_t unit        -> índice do timer a ser utilizado;     *
	*                                                             *
	* void -> não retorna valor;                                  * 
  ***************************************************************/
void timerReset(uint8_t unit);

 /***************************************************************
  * timerSetOverflowValue (unit, maxValue);                     *
	*                                                             *
  * Define o valor de overflow do timer                         *   
  *                                                             *
	* uint8_t unit     -> índice do timer a ser utilizado;        *
  * int     maxvalue -> valor de overflow do timer;             *
	*                                                             *
	* void -> não retorna valor;                                  * 
  ***************************************************************/
void timerSetOverflowValue(uint8_t unit, uint32_t maxValue);
 
/***************************************************************
 * timerGetOverflow (unit);                                    *
 *                                                             *
 * Verifica se ocorreu overflow no timer                       *   
 *                                                             *
 * uint8_t unit        -> índice do timer a ser utilizado;     *
 *                                                             *
 * _Bool -> retorna o valor de overflow do timer;              * 
  ***************************************************************/ 
bool timerGetOverflow(uint8_t unit);

/***************************************************************
 * timerGetCount (unit);                                       *   
 *                                                             *
 * Leitura do valor de contagem do timer                       *
 *                                                             *
 * uint8_t unit        -> índice do timer a ser utilizado;     *
 *                                                             *
 * uint16_t -> contagem do timer;                              * 
 ***************************************************************/
uint32_t timerGetCount(uint8_t unit);

/***************************************************************
 * timerDelay (delay);                                         *
 *                                                             *
 * Função de delay                                             *   
 *                                                             *
 * uint32_t delay -> valor de duração do delay, em ms;         *
 *                                                             *
 * Bool -> retorna true enquanto não houve overflow no timer;  * 
 ***************************************************************/
bool timerDelay(uint32_t delay);

/***************************************************************
 * timerDelayReset();                                          *
 *                                                             *
 * Função de reset do delay                                    *
 *                                                             *
 * void -> não recebe parâmetros;                              *
 *                                                             *
 * void -> não retorna valor;                                  * 
 ***************************************************************/
void timerDelayReset(void);

/***************************************************************
 * bool timeBase1ms();                                         *
 *                                                             *
 * Verificação de base de tempo de 1ms                         *   
 *                                                             *
 * Bool -> retorna true após um intervalo de 1ms;              * 
 ***************************************************************/
bool timeBase1ms(void);

/***************************************************************
 * bool timeBase100us();                                       *
 *                                                             *
 * Verificação de base de tempo de 100us                       *   
 *                                                             *
 * Bool -> retorna true após um intervalo de 100us;            * 
 ***************************************************************/
bool timeBase100us(void);

/***************************************************************
 * bool timeBase210us();                                       *
 *                                                             *
 * Verificação de base de tempo de 210us                       *   
 *                                                             *
 * Bool -> retorna true após um intervalo de 210us;            * 
 ***************************************************************/
bool timeBase210us(void);

/***************************************************************/
