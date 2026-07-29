EXERCÍCIO 1 - AxCadastro × mBrowse

a. Quando você usaria AxCadastro e quando usaria mBrowse ? Dê um exemplo de cada.
AxCadastro: É o caminho mais rápido para ter um cadastro funcionando. É usado para tabelas mais simples pois temos menos controle de funções específicas. É usado também muito para aprendizado.
mBrowsE: É mais focado em um controle maior e mais detalhado. Ele possui funções mais específicas e aprofundadas, e funciona para rotinas de produção em um sistema real.

b. Cite três coisas que o mBrowse faz e o AxCadastro não faz.
Legendas coloridas, colunas customizadas e filtros dinâmicos de forma completa.

c. Na configuração de legendas ( aColors ), por que a regra ".T." deve ficar por último?
Como o aColors é avaliado de cima pra baixo e testando todas as regras até achar uma verdadeira, e o .T. é sempre verdadeiro, se ele estivesse acima de todos ele ignoraria todas as configurações que acontecem depois dele, já que ele já é "verdade" e não passaria por nenhuma validação.

d. Qual a diferença entre um campo Virtual (X3_RELACAO) e um gatilho (SX7) para preencher
o nome do cliente?
O campo virtual calcula o valor só na hora de exibir na tela, ele não grava nada na tabela, é como uma "busca" que acontece toda vez que a tela é aberta. Já o gatilho preenche um campo real de verdade, gravando o valor no banco no momento em que o usuário digita o código do cliente. 