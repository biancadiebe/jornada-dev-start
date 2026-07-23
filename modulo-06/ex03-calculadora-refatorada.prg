REQUEST HB_CODEPAGE_PT850


FUNCTION Main()

    LOCAL cEntrada 
    LOCAL nNum1
    LOCAL nNum2
    LOCAL cSinal
    LOCAL nResultado

    hb_cdpSelect( "PT850" )

    LerNumero(@cEntrada, @cSinal, @nNum1, @nNum2)   

    IF Calcular(cSinal, @nResultado, nNum1, nNum2) 
        MostrarResultado(cSinal, nNum1, nNum2, nResultado)
    ELSE
        QOut("Erro! Operação inválida ou divisão por zero.")
    ENDIF

RETURN NIL

FUNCTION LerNumero(cEntrada, cSinal, nNum1, nNum2)
    ACCEPT "Operação (+,-,*,/,^,R): " TO cSinal
    cSinal := Upper(cSinal)

    ACCEPT "Digite o primeiro número: " TO cEntrada
    nNum1 := Val(cEntrada)

    IF cSinal != "R"
        ACCEPT "Digite o segundo número: " TO cEntrada
        nNum2 := Val(cEntrada)
    ENDIF
RETURN NIL

FUNCTION Calcular(cSinal, nResultado, nNum1, nNum2)
    DO CASE
        CASE cSinal == "+"
            nResultado := nNum1 + nNum2
        CASE cSinal == "-"
            nResultado := nNum1 - nNum2
        CASE cSinal == "*"
            nResultado := nNum1 * nNum2
        CASE cSinal == "/"
            IF nNum2 == 0                    
                RETURN .F.
            ENDIF
            nResultado := nNum1 / nNum2
        CASE cSinal == "^"
            nResultado := nNum1 ^ nNum2
        CASE cSinal == "R"
            nResultado := Sqrt(nNum1)
        OTHERWISE
            RETURN .F.
    ENDCASE
RETURN .T.

FUNCTION MostrarResultado(cSinal, nNum1, nNum2, nResultado)  
    IF cSinal == "R"
        QOut("Resultado: " + Str(nResultado, 10, 2))
    ELSE
        QOut("Resultado: " + Str(nResultado, 10, 2))
    ENDIF
RETURN NIL