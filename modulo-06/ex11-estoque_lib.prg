REQUEST HB_CODEPAGE_PT850

FUNCTION Menu()
    QOut("Controle do Estoque:")
    QOut("1- Cadastrar Produto")
    QOut("2- Listar Produtos")
    QOut("3- Entrada de Estoque")
    QOut("4- Saída de Estoque")
    QOut("5- Buscar Produto")
    QOut("6- Relatório")
    QOut("0- Sair")
RETURN NIL

FUNCTION CadastrarProduto(aProdutos)

    LOCAL cEntrada
    LOCAL cCodigo
    LOCAL cNome
    LOCAL nQuantidade
    LOCAL nPreco
    LOCAL aProduto

    ACCEPT "Código: " TO cCodigo

    IF Empty(cCodigo)
        QOut("Código não pode ser vazio!")
        RETURN NIL
    ENDIF

    IF BuscarProduto(aProdutos, cCodigo) > 0
        QOut("Já existe um produto com esse código!")
        RETURN NIL
    ENDIF

    ACCEPT "Nome: " TO cNome
    IF Empty(cNome)
        QOut("Nome não pode ser vazio!")
        RETURN NIL
    ENDIF

    ACCEPT "Quantidade: " TO cEntrada
    nQuantidade := Val(cEntrada)
    IF nQuantidade < 0
        QOut("Quantidade não pode ser negativa!")
        RETURN NIL
    ENDIF

    ACCEPT "Preço unitário: " TO cEntrada
    nPreco := Val(cEntrada)
    IF nPreco < 0
        QOut("Preço não pode ser negativo!")
        RETURN NIL
    ENDIF

    aProduto := {cCodigo, cNome, nQuantidade, nPreco}
    AADD(aProdutos, aProduto)

    QOut("Produto cadastrado com sucesso!")

RETURN NIL

FUNCTION ListarProdutos(aProdutos)

    LOCAL nI

    IF Len(aProdutos) == 0
        QOut("Nenhum produto cadastrado.")
        RETURN NIL
    ENDIF

    QOut("Produtos: ")
    FOR nI := 1 TO Len(aProdutos)
        QOut(;
            "Código: " + aProdutos[nI][1] + ;
            " | Nome: " + aProdutos[nI][2] + ;
            " | Quantidade: " + Str(aProdutos[nI][3], 6) + ;
            " | Preço: R$ " + Str(aProdutos[nI][4], 10, 2))
    NEXT

RETURN NIL

FUNCTION BuscarProduto(aProdutos, cCodigo)

    LOCAL nI

    FOR nI := 1 TO Len(aProdutos)
        IF aProdutos[nI][1] == cCodigo
            RETURN nI
        ENDIF
    NEXT

RETURN 0

FUNCTION EntradaEstoque(aProdutos)

    LOCAL cCodigo
    LOCAL cEntrada
    LOCAL nQtdEntrada
    LOCAL nPos

    ACCEPT "Código do produto: " TO cCodigo
    nPos := BuscarProduto(aProdutos, cCodigo)

    IF nPos == 0
        QOut("Produto não encontrado!")
        RETURN NIL
    ENDIF

    ACCEPT "Quantidade a adicionar: " TO cEntrada
    nQtdEntrada := Val(cEntrada)

    IF nQtdEntrada <= 0
        QOut("Quantidade deve ser maior que zero!")
        RETURN NIL
    ENDIF

    aProdutos[nPos][3] += nQtdEntrada

    QOut("Estoque atualizado! Nova quantidade: " + Str(aProdutos[nPos][3]))

RETURN NIL

FUNCTION SaidaEstoque(aProdutos)

    LOCAL cCodigo
    LOCAL cEntrada
    LOCAL nQtdSaida
    LOCAL nPos

    ACCEPT "Código do produto: " TO cCodigo
    nPos := BuscarProduto(aProdutos, cCodigo)

    IF nPos == 0
        QOut("Produto não encontrado!")
        RETURN NIL
    ENDIF

    ACCEPT "Quantidade a retirar: " TO cEntrada
    nQtdSaida := Val(cEntrada)

    IF nQtdSaida <= 0
        QOut("Quantidade deve ser maior que zero!")
        RETURN NIL
    ENDIF

    IF nQtdSaida > aProdutos[nPos][3]
        QOut("Estoque insuficiente!")
        RETURN NIL
    ENDIF

    aProdutos[nPos][3] -= nQtdSaida

    QOut("Estoque atualizado! Nova quantidade: " + Str(aProdutos[nPos][3]))

RETURN NIL

FUNCTION Relatorio(aProdutos)

    LOCAL nI
    LOCAL nValorProduto
    LOCAL nTotalGeral := 0

    IF Len(aProdutos) == 0
        QOut("Nenhum produto cadastrado.")
        RETURN NIL
    ENDIF

    QOut("Relatório do Estoque: ")

    FOR nI := 1 TO Len(aProdutos)
        nValorProduto := aProdutos[nI][3] * aProdutos[nI][4]
        nTotalGeral += nValorProduto

        QOut(;
            aProdutos[nI][2] + ;
            " | Qtd: " + Str(aProdutos[nI][3], 6) + ;
            " | Preço: R$ " + Str(aProdutos[nI][4], 10, 2) + ;
            " | Total: R$ " + Str(nValorProduto, 10, 2))
    NEXT

    QOut("Total do Estoque: R$ " + Str(nTotalGeral, 12, 2))

RETURN NIL