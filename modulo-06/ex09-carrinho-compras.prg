REQUEST HB_CODEPAGE_PT850

FUNCTION Main()

    LOCAL cEntrada
    LOCAL aCarrinho := {}
    LOCAL aProduto
    LOCAL cNome
    LOCAL cResposta
    LOCAL nPreco
    LOCAL nTotal := 0
    LOCAL nI

    hb_cdpSelect( "PT850" ) 

    WHILE .T.
        ACCEPT "Nome do produto: " TO cNome

        ACCEPT "Preço: " TO cEntrada
        nPreco := Val(cEntrada)

        aProduto := {cNome, nPreco}

        AADD(aCarrinho, aProduto)

        ACCEPT "Adicionar outro produto? (S/N): " TO cResposta
        cResposta := Upper(AllTrim(cResposta))

        IF cResposta != "S"
            EXIT
        ENDIF
    ENDDO

    QOut("Carrinho: ")

    FOR nI := 1 TO Len(aCarrinho)

        QOut(; 
        aCarrinho[nI][1] + ;
            " : R$ " + Str(aCarrinho[nI][2],10,2))

        nTotal := nTotal + aCarrinho[nI][2]
    NEXT

    QOut("Total: R$ " + Str(nTotal,10,2))

RETURN NIL