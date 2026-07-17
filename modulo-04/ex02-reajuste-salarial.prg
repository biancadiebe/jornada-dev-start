REQUEST HB_CODEPAGE_PT850

FUNCTION MAIN()

    LOCAL cEntrada 
    LOCAL nSalario
    LOCAL nSalarioAjustado

    hb_cdpSelect( "PT850" )

    ACCEPT "Informe o seu salário atual: " TO cEntrada
    nSalario := Val(cEntrada)

    IF nSalario < 1000 
        nSalarioAjustado := nSalario * 1.15
    ELSEIF nSalario >= 1000 .AND. nSalario <= 2000
        nSalarioAjustado := nSalario * 1.12
    ELSEIF nSalario >= 2000 .AND. nSalario <= 4000
        nSalarioAjustado := nSalario * 1.08
    ELSE
        nSalarioAjustado := nSalario * 1.05
    ENDIF

    QOut("Salário após o ajuste: " + Str(nSalarioAjustado, 10,2))

RETURN NIL 