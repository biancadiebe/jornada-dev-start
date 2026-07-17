REQUEST HB_CODEPAGE_PT850

FUNCTION MAIN()

    LOCAL cEntrada 
    LOCAL nIdade
    LOCAL nDependentes
    LOCAL nPlano
    LOCAL nTotalPlano

    hb_cdpSelect( "PT850" )
    
    ACCEPT "Digite sua idade: " TO cEntrada
    nIdade := Val(cEntrada)

    ACCEPT "Digite a quantidade de dependentes: " TO cEntrada
    nDependentes := Val(cEntrada)

    IF nIdade <= 25
        nPlano := 180
        nTotalPlano := nPlano + (nDependentes * 90)
    ELSEIF nIdade >= 26 .AND. nIdade <= 40
        nPlano := 260
        nTotalPlano := nPlano + (nDependentes * 90)
    ELSEIF nIdade >= 41 .AND. nIdade <= 60
        nPlano := 380
        nTotalPlano := nPlano + (nDependentes * 90)     
    ELSE
        nPlano := 520
        nTotalPlano := nPlano + (nDependentes * 90) 
    ENDIF

    QOut("Valor do plano com base na idade: R$ " + Str(nPlano, 10, 2))
    QOut("Adicional dependentes: R$ " + Str(nDependentes * 90, 10, 2))
    QOut("Valor total: R$ " + Str(nTotalPlano, 8, 2))
    
RETURN NIL 