REQUEST HB_CODEPAGE_PT850

FUNCTION Main()

    LOCAL cEntrada
    LOCAL nNum 
    LOCAL nTotal := 0
    LOCAL nQtd := 0

    hb_cdpSelect( "PT850" )

        WHILE .T.

        ACCEPT "Adicione um n£mero ou 0 para sair: " TO cEntrada
        nNum := Val(cEntrada)
        IF nNum == 0
            EXIT
        ENDIF
        nTotal := nTotal + nNum
        nQtd ++
    ENDDO
    QOut("N£mero total: " + Str(nTotal))
    QOut("Quantidade: " + Str(nQtd))

RETURN NIL