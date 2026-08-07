REQUEST HB_CODEPAGE_PT850

FUNCTION MAIN()

    LOCAL cEntrada 
    LOCAL nNum1
    LOCAL nNum2

    hb_cdpSelect( "PT850" )

    ACCEPT "Digite o primeiro número: " TO cEntrada
    nNum1 := Val(cEntrada)

    ACCEPT "Digite o segundo número: " TO cEntrada
    nNum2 := Val(cEntrada)

    IF nNum1 == nNum2
        QOut("Os valores são iguais")
    ELSEIF nNum1 > nNum2
        QOut("O primeiro valor: " + Str(nNum1, 10, 2) + " é maior.")
    ELSE
        QOut("O segundo valor: " + Str(nNum2, 10, 2) + " é maior.")
    ENDIF
RETURN NIL 