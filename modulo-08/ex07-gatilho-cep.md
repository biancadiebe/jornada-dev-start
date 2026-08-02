EXERCÍCIO 7 - A brincadeira do CEP

a. Qual a diferença entre campo, contra-domínio e regra num gatilho?
- Campo: É quem dispara o evento. Quando o usuário sai do campo (TAB), o Protheus verifica se existe algum gatilho configurado nele e o realiza.
- Contra-domínio: É o destino do campo, que vai receber o valor calculado.
- Regra: É a fórmula que cacula o valor a ser colocado no contra-domínio.

b. Por que a regra usa M->A1_CEP e não SA1->A1_CEP?
- Como o gatilho precisa reagir na hora que algo é digitado no campo (o CEP), o M-> pega o valor que foi digitado na tela antes mesmo de ser salvo, já o SA-> pega o valor gravado no cadastro ANTES dessa edição.

c. Os CEPs estão dentro do fonte. Cite dois problemas disso em produção e como você resolveria (pense em tabela do dicionário e em serviço externo).
- O primeiro problema seria que não é possível colocar todos os CEPs do Brasil escritos dentro do código (pode até ser possível, mas não é prático, demandaria muito tempo e não seria eficiente). Sempre que eu precisasse adicionar ou remover um CEP, teria que acessar o código.
- O segundo problema é que os CEPs também podem mudar com o tempo, então um bairro não irá necessariamente ter o mesmo CEP ao decorrer do tempo.
- Para resolver ambos os problemas, uma a conexão com uma API (como a viaCEP) poderia resolver essa questão do código, já que ela já vem com as informações sempre atualizadas, sem precisar mexer diretamente no código.

d. Se pedissem para preencher também o código do município ( A1_COD_MUN ), o que você faria?
- Usaria um quarto gatilho igual aos outros três que representasse o código do município. A Regra chamaria a mesma função do CEP, só que pedindo também o código do município. Também precisaria mudar a função geral do CEP para ela também retornar esse código do município quando solicitado.