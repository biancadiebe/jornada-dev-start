REQUEST HB_CODEPAGE_PT850

FUNCTION Main()

    LOCAL cEntrada
    LOCAL aDias := {"Segunda", "Terça", "Quarta", "Quinta", "Sexta", "Sábado", "Domingo"}
    LOCAL nDias

    hb_cdpSelect( "PT850" )

    aDias[1] = "Segunda"
    aDias[2] = "Terça"
    aDias[3] = "Quarta"
    aDias[4] = "Quinta"
    aDias[5] = "Sexta"
    aDias[6] = "Sábado"
    aDias[7] = "Domingo"

    ACCEPT "Escolha um número de 1-7 para escolher em dia da semana: " TO cEntrada
    nDias := Val(cEntrada)

    IF nDias >= 1 .AND. nDias <= 7
        QOut("Dia da semana: " + aDias[nDias])
    ELSE
        QOut("Número inválido!")
    ENDIF 
RETURN NIL