FUNCTION Main()

    LOCAL nNum

    FOR nNum := 1 TO 100
        QOut("Exemplo 1: " + Str(nNum))
    NEXT 

    FOR nNum := -50 TO 50
        QOut("Exemplo 2: " + Str(nNum))
    NEXT 

    FOR nNum := 80 TO 5 STEP -1
        QOut("Exemplo 3: " + Str(nNum))
    NEXT

RETURN NIL