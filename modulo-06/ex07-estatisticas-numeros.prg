REQUEST HB_CODEPAGE_PT850

FUNCTION Main() 

    LOCAL aNumeros := {}
    LOCAL cEntrada
    LOCAL nNum
    LOCAL nI //indice FOR
    LOCAL nSoma := 0
    LOCAL nMedia

    hb_cdpSelect( "PT850" )

    FOR nI := 1 TO 10
        ACCEPT "Digite um número: " TO cEntrada
        nNum := Val(cEntrada)
        AADD(aNumeros, nNum) //adicionar numeros no array
        nSoma := nSoma + nNum //soma do array
    NEXT

    ASORT(aNumeros) //ordenando o array

    nMedia := nSoma / Len(aNumeros)

    FOR nI := 1 TO Len(aNumeros)
        qOut(Str(aNumeros[nI], 10, 2))
    NEXT    

    QOut("Soma: " + Str(nSoma, 10, 2))
    QOut("Média: " + Str(nMedia, 10, 2))
    QOut("Menor número: " + Str(aNumeros[1], 10, 2))
    QOut("Maior número: " + Str(aNumeros[10], 10, 2))
RETURN NIL 