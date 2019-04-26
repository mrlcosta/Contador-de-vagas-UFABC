Este projeto tem o propósito de auxiliar e humanizar o trabalho dos funcionários da portaria. 
A situação atual é: um senhor de idade avançada que fica encarregado de fazer a contagem de aproximadamente 150 vagas em um caderninho, precisa colocar e tirar o cone para impedir a passagem de carros (embaixo de sol e chuva) e também escuta reclamação de aluno dizendo que as vagas estão sendo contadas erradas (há diversos posts no grupo também).

O projeto é simples: o sensor conta quantos carros entram e quantos carros saem. 
Quando o estacionamento estiver cheio, a fita de led mudará de verde para vermelho.

Assim o senhor da portaria poderá ficar dentro de sua sala apenas verificando as carteirinhas.
Peço a colaboração de todos.


**CONTRIBUIÇÃO**

O projeto aceita contribuição e é open source, porém você precisa seguir as regras abaixo:

Testar bem antes de colocar em prod. Você precisa abranger muitos fatores e todo código deve ser rigorosamente testado para ter o pull request aceito.

O projeto deve possuir o mínimo de boas práticas de código e prezar pelo entendimento alheio. No futuro outras pessoas irão dar manutenção nele, seja gentil.

OBS: A ideia inicial era apenas usar o github como plataforma de versionamento, não imaginei que muitas pessoas gostariam de contribuir, portanto a documentação ainda está muito precária. Estou atualizando aos poucos para que todos possam entender melhor.

A escolha do chip talvez não tenha sido a melhor em questões de popularidade, porém pode ser interessante aprender a mexer em outro microcontrolador. Quem quiser me chamar para perguntar como instala os programas utilizados, compilador, onde conseguir o chip, etc Estarei a disposição. Em breve será documentado.

Muitas pessoas adoram o arduino por ser de fácil acesso, conter muito material didático e as vezes ele acaba ficando na nossa zona de conforto. É interessante levar também para nossa universidade a diversidade de outras ferramentas que não a utilização de arduino, tudo bem? não se sinta acanhado com isto, estamos aqui para expandir nossos horizontes.


**FUNCIONAMENTO BASICO**

Ficará um sensor no portão de entrada e outro no portão de saída.
Quando o sensor detectar que tem um obstáculo na portaria, ele conta ou subtrai uma vaga.
para diferenciar acionamento de humanos ou carros passando o algoritmo de debounce foi implementado.
A cada atualização do numero de carros, o número é atualizado na eeprom para evitar percas por desligamento.
A gravação da eeprom da eeprom é feita de forma rotativa pois ela tem vida útil limitada.

**MATERIAIS MINIMOS**

sensor: http://www.baudaeletronica.com.br/sensor-de-proximidade-infravermelho-e18-d80nk.html

display LCD: http://www.baudaeletronica.com.br/display-lcd-16x2-azul.html

microcontrolador: https://produto.mercadolivre.com.br/MLB-1218797200-modulo-desenvolvimento-microcontrolador-st-stm8-stm8s003f3p6-_JM?quantity=1

gravador/debuger: https://produto.mercadolivre.com.br/MLB-1132196907-programador-stm32-stm8-stlink-st-link-v2-mini-_JM

A placa irá comutar a fita de led através de um TIP41.

A caixa plastica é um modelo da patola: PB107.

Os botões de navegação são 3 push button.

Dúvidas? Sugesões? fala comigo: mrlcosta0@gmail.com

Seu feedback e engajamento é muito importante pra mim.


