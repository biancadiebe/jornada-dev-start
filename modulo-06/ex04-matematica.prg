FUNCTION Fatorial(nNum)

    LOCAL nI //index FOR
    LOCAL nResultado := 1

    FOR nI := 1 TO nNum
        nResultado := nResultado * nI
    NEXT

RETURN nResultado

FUNCTION Primo(nNum)

    LOCAL nI //index FOR
    
    IF nNum < 2 
    RETURN .F.
    ENDIF

    FOR nI := 2 TO nNum -1 
        IF nNum % nI == 0
        RETURN .F.
    ENDIF
NEXT
RETURN .T.

FUNCTION MDC(nNum1, nNum2)

    LOCAL nResto

    WHILE nNum2 != 0 
        nResto := nNum1 % nNum2
        nNum1 := nNum2
        nNum2 := nResto
    ENDDO
RETURN nNum1

FUNCTION MMC(nNum1, nNum2)

RETURN (nNum1 * nNum2) / MDC(nNum1, nNum2) //é possível aproveitar a função de mdc 