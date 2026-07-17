REQUEST HB_CODEPAGE_PT850

FUNCTION MAIN()

    LOCAL cEntrada 
    LOCAL nMes

    hb_cdpSelect( "PT850" )
    
    ACCEPT "Digite um número de 1-12 para selecionar o mês " TO cEntrada
    nMes := Val(cEntrada)

        IF nMes == 1
            Qout("Mês: Janeiro")
        ELSEIF nMes == 2
            Qout("Mês: Fevereiro")
        ELSEIF nMes == 3
            Qout("Mês: Março")
        ELSEIF nMes == 4
            Qout("Mês: Abril")
        ELSEIF nMes == 5
            Qout("Mês: Maio")
        ELSEIF nMes == 6
            Qout("Mês: Junho")
        ELSEIF nMes == 7
            Qout("Mês: Julho")
        ELSEIF nMes == 8
            Qout("Mês: Agosto")
        ELSEIF nMes == 9
            Qout("Mês: Setembro")
        ELSEIF nMes == 10
            Qout("Mês: Outubro")
        ELSEIF nMes == 11
            Qout("Mês: Novembro")
        ELSEIF nMes == 12
            Qout("Mês: Dezembro")
        ELSE
            Qout("Mês inválido")
        ENDIF
RETURN NIL 