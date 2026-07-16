FUNCTION Main()

    LOCAL cEntrada
    LOCAL nNota1
    LOCAL nNota2
    LOCAL nNota3
    LOCAL nNota4
    LOCAL nPesos
    LOCAL nMedia

    //NOTAS
    ACCEPT "Nota 1ø BIM: " TO cEntrada
    nNota1 := Val(cEntrada)

    ACCEPT "Nota 2ø BIM: " TO cEntrada
    nNota2 := Val(cEntrada)

    ACCEPT "Nota 3ø BIM: " TO cEntrada
    nNota3 := Val(cEntrada)

    ACCEPT "Nota 4ø BIM: " TO cEntrada
    nNota4 := Val(cEntrada)

    //CALCULO 
    nPesos := 1+2+3+4

    nMedia := (nNota1 * 1 + nNota2 * 2 + nNota3 * 3 + nNota4 * 4) / nPesos

    QOut("M‚dia: " + Str(nMedia, 10, 2))

RETURN NIL