REQUEST HB_CODEPAGE_PT850

FUNCTION MAIN()

    LOCAL cEntrada 
    LOCAL nNum1
    LOCAL nNum2
    LOCAL cSinal
    LOCAL nResultado

    hb_cdpSelect( "PT850" )
    
    ACCEPT "Operaá∆o (+,-,*,/,^,R): " TO cSinal
    cSinal := Upper(cSinal)

    ACCEPT "Digite o primeiro n£mero: " TO cEntrada
    nNum1 := Val(cEntrada)

    IF cSinal != "R"
        ACCEPT "Digite o segundo n£mero: " TO cEntrada
        nNum2 := Val(cEntrada)
    ENDIF


    DO CASE
        CASE cSinal == "+"
            nResultado := nNum1 + nNum2
            QOut("Resultado: " + Str(nResultado, 10, 2))
        CASE cSinal == "-"
            nResultado := nNum1 - nNum2
            QOut("Resultado: " + Str(nResultado, 10, 2))
        CASE cSinal == "*"
            nResultado := nNum1 * nNum2
            QOut("Resultado: " + Str(nResultado, 10, 2))
        CASE cSinal == "/"
            IF nNum2 == 0
                QOut("Erro! Divis∆o por 0")
            ELSE 
              nResultado := nNum1 / nNum2
              QOut("Resultado: " + Str(nResultado, 10, 2))  
            ENDIF
        CASE cSinal == "^"
            nResultado := nNum1 ^ nNum2
            QOut("Resultado: " + Str(nResultado,10,2))
        CASE cSinal == "R"
            nResultado := Sqrt(nNum1)
            QOut("Resultado: " + Str(nResultado,10,2))

        OTHERWISE
            Qout("Operaá∆o inv†lida")
        ENDCASE
RETURN NIL 