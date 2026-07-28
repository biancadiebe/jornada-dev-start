EXERCÍCIO 5 - AI_FILIAL e xFilial() 

a. Por que existe o campo A1_FILIAL na tabela SA1 (e por que toda tabela do Protheus, incluindo a ZA1 que criamos, precisa de um campo de filial)?
Esse campo existe pensando em uma possibilidade de que uma empresa pode ter várias filiais, então cada filial pode ter seus próprios processos, clientes, produtos... Esse campo ajuda para sinalizar cada filial, para facilitar na hora da pesquisa.

b. O que a função xFilial() tem a ver com isso? O que aconteceria se um programa “escrevesse a filial na mão” em vez de usar xFilial()?
Essa função serve para retornar a filial específica que deve ser usada, então se é uma tabela é compartilhada, a função retorna em branco, se fosse exclusiva, ela retornaria a filial em que o usuário está logado. Se fosse escrito uma filial na mão, o programa ficaria preso naquela filial em uma específica, e pensando em um contexto de empresas com várias filiais isso não funcionaria, já que não retornaria a filial que deveria.