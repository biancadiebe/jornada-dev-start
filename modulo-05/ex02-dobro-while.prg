REQUEST HB_CODEPAGE_PT850

FUNCTION Main()

    LOCAL cEntrada
    LOCAL nNum
    LOCAL nNumDobro

    hb_cdpSelect( "PT850" )

    WHILE .T.

        ACCEPT "Adicione um número ou 0 para sair: " TO cEntrada
        nNum := Val(cEntrada)
        IF nNum <= 0
            EXIT
        ENDIF
        nNumDobro := nNum * 2
        QOut("Número em dobro: " + Str(nNumDobro))
    ENDDO

RETURN NIL