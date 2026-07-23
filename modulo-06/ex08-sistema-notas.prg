REQUEST HB_CODEPAGE_PT850

FUNCTION Main()

    LOCAL cEntrada
    LOCAL aAluno
    LOCAL aArrayAlunos := {}
    LOCAL nAlunos
    LOCAL cNome
    LOCAL nNota1
    LOCAL nNota2
    LOCAL nNota3
    LOCAL nNota4
    LOCAL nMedia
    LOCAL nI // índice FOR

    hb_cdpSelect( "PT850" )

    ACCEPT "Quantidade de alunos: " TO cEntrada
    nAlunos := Val(cEntrada)

    FOR nI := 1 TO nAlunos

        ACCEPT "Nome: " TO cNome

        ACCEPT "Nota 1: " TO cEntrada
        nNota1 := Val(cEntrada)

        ACCEPT "Nota 2: " TO cEntrada
        nNota2 := Val(cEntrada)

        ACCEPT "Nota 3: " TO cEntrada
        nNota3 := Val(cEntrada)

        ACCEPT "Nota 4: " TO cEntrada
        nNota4 := Val(cEntrada)

        aAluno := {cNome, nNota1, nNota2, nNota3, nNota4} 

        AADD(aArrayAlunos, aAluno) //junta o array do aluno no array principal, fazendo o array multidimensional

    NEXT

    QOut("Alunos Aprovados: ")

    FOR nI := 1 TO Len(aArrayAlunos)

        nMedia := ( ;
            aArrayAlunos[nI][2] + ;
            aArrayAlunos[nI][3] + ;
            aArrayAlunos[nI][4] + ;
            aArrayAlunos[nI][5] ) / 4

        IF nMedia >= 7
            QOut(aArrayAlunos[nI][1] + ;
                " | Média: " + Str(nMedia,10,2))
        ENDIF

    NEXT

    QOut("Alunos Reprovados: ")

    FOR nI := 1 TO Len(aArrayAlunos)

        nMedia := ( ;
            aArrayAlunos[nI][2] + ;
            aArrayAlunos[nI][3] + ;
            aArrayAlunos[nI][4] + ;
            aArrayAlunos[nI][5] ) / 4

        IF nMedia < 7
            QOut(aArrayAlunos[nI][1] + ;
                " | Média: " + Str(nMedia,10,2))
        ENDIF

    NEXT

RETURN NIL