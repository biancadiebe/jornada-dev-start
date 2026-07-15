EXERCÍCIO 4 - REFINAMENTO SUCESSIVO

“Um sistema de caixa de supermercado deve registrar os itens de uma compra, calcular o
subtotal, aplicar desconto se o cliente tiver cartão fidelidade (5%) e mostrar o total a
pagar.”

Nível 1: Visão geral
Início
    Registrar itens da compra
    Calcular subtotal
    Aplicar desconto se possuir o cartão fidelidade
    Mostrar total ao pagar
Fim

Nível 2: Detalhamento
Início
    Obter itens da compra:
        Ler quantidade de itens
        Ler o nome dos produtos
        Ler o valor dos produtos

    Calcular subtotal:
        subtotal ← soma dos valores de todos os produtos

    Aplicar desconto se possuir o cartão fidelidade:
        Se possui o cartão fidelidade
            desconto ← subtotal * 0.05
        Senão
             desconto ← 0

    Mostrar total:
        total ← subtotal - desconto
        Escrever total
Fim

