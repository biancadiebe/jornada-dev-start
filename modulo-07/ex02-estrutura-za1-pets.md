EXERCÍCIO 2 - TABELA ZA1

a. Liste os campos da ZA1 (nome do campo, tipo, tamanho) — incluindo o campo de filial,
que é obrigatório em toda tabela do Protheus.

| Campo | Tipo | Tamanho | Descrição |
|---|---|---|---|
| ZA1_FILIAL | C | 2 | Filial do registro |
| ZA1_NOME | C | 30 | Nome (pet)|
| ZA1_RACA | C | 20 | Raça (pet) |
| ZA1_NASC | D | 8 | Data de nascimento (pet) |

b. Que índice faria sentido para a ZA1? Justifique (lembre da analogia da lista telefônica).
O índice que mais faria sentido seria ZA1_FILIAL + ZA1_NOME. Isso deixa a busca mais eficiente, sem precisar percorrer toda a tabela sempre. Só usar ZA1_NOME não seria o suficiente, porque pode ter pets diferentes com o mesmo nome, então ia dar duplicidade e ambiguidades.

c. Explique por que o prefixo da tabela é Z (o que esse prefixo significa em termos de
convenção do Protheus).
O Z é uma tabela costumizada do cliente, uma tabela que não vem de "fábrica" no ERP e são criadas por uma necessidade específica do cliente.

d. Explique por que os campos começam com ZA1_ (ex: ZA1_NOME , ZA1_RACA ) e não
apenas com o nome do campo solto.
Isso é uma regrad do Protheus, que é: Nome do campo = prefixo da tabela + _ + o nome do cadmpo. Isso facilita para o usuário, pois no Protheus podem existir milhares de tabelas cadastradas, e se elas possuem nomes genéricos, podem existir muitas duplicidades e problemas. Isso ajuda a identificar cada tabela e informação de forma coerente.