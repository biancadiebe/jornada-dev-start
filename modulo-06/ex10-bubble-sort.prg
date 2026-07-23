REQUEST HB_CODEPAGE_PT850

FUNCTION Main()

    LOCAL aNumeros := {}
    LOCAL cEntrada
    LOCAL nNum
    LOCAL nI

    hb_cdpSelect( "PT850" )

    FOR nI := 1 TO 10
        ACCEPT "Digite um número: " TO cEntrada
        nNum := Val(cEntrada)

        AADD(aNumeros, nNum)
    NEXT

    BubbleSort(aNumeros)

    QOut("Números ordenados: ")

    FOR nI := 1 TO Len(aNumeros)
        QOut(Str(aNumeros[nI]))
    NEXT

RETURN NIL


FUNCTION BubbleSort(aVetor)

    LOCAL nI
    LOCAL nJ
    LOCAL nTemp

    FOR nI := 1 TO Len(aVetor) - 1
        FOR nJ := 1 TO Len(aVetor) - nI
            IF aVetor[nJ] > aVetor[nJ + 1]
                nTemp := aVetor[nJ]
                aVetor[nJ] := aVetor[nJ + 1]
                aVetor[nJ + 1] := nTemp
            ENDIF
        NEXT
    NEXT

RETURN NIL