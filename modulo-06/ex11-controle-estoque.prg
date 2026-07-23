SET PROCEDURE TO estoque_lib.prg
REQUEST HB_CODEPAGE_PT850

FUNCTION Main()

    LOCAL aProdutos := {}
    LOCAL cEntrada
    LOCAL cCodigo
    LOCAL nOpcao
    LOCAL nPos

    hb_cdpSelect( "PT850" )

    WHILE .T.

        Menu()

        ACCEPT "Escolha uma opção: " TO cEntrada
        nOpcao := Val(cEntrada)

        IF nOpcao == 1
            CadastrarProduto(aProdutos)
        ENDIF

        IF nOpcao == 2
            ListarProdutos(aProdutos)
        ENDIF

        IF nOpcao == 3
            EntradaEstoque(aProdutos)
        ENDIF

        IF nOpcao == 4
            SaidaEstoque(aProdutos)
        ENDIF

        IF nOpcao == 5
            ACCEPT "Código do produto: " TO cCodigo
            nPos := BuscarProduto(aProdutos, cCodigo)
            IF nPos > 0
                QOut("Encontrado!")
                QOut(;
                    "Código: " + aProdutos[nPos][1] + ;
                    " | Nome: " + aProdutos[nPos][2] + ;
                    " | Quantidade: " + Str(aProdutos[nPos][3]) + ;
                    " | Preço: R$ " + Str(aProdutos[nPos][4], 10, 2))
            ELSE
                QOut("Produto não encontrado!")
            ENDIF
        ENDIF

        IF nOpcao == 6
            Relatorio(aProdutos)
        ENDIF

        IF nOpcao == 0
            EXIT
        ENDIF

        IF nOpcao < 0 .OR. nOpcao > 6
            QOut("Opção inválida!")
        ENDIF

    ENDDO

RETURN NIL