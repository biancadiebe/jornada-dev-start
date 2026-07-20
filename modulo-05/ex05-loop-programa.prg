REQUEST HB_CODEPAGE_PT850

FUNCTION Main()

    LOCAL cEntrada
    LOCAL cNome 
    LOCAL cDisciplina
    LOCAL nNota1
    LOCAL nNota2
    LOCAL nMedia
    LOCAL cResposta

    hb_cdpSelect( "PT850" )

WHILE .T.
        WHILE .T.
            ACCEPT "Nome: " TO cNome
            IF Len(Trim(cNome)) > 0 
                EXIT 
            ELSE 
                Qout("Nome inv lido!")
            ENDIF 
        ENDDO

        WHILE .T.
            ACCEPT "Disciplina (APENAS 3 letras mai£sculas): " TO cDisciplina
            IF Len(cDisciplina) == 3 .AND. cDisciplina == Upper(cDisciplina)
                EXIT 
            ELSE 
                QOut("Disciplina inv lida!")
            ENDIF 
        ENDDO 

        WHILE .T.
            ACCEPT "Nota 1: " TO cEntrada
            nNota1 := Val(cEntrada)
            IF nNota1  >= 0 .AND. nNota1 <= 10
                EXIT 
            ELSE 
                QOut("Nota inv lida!")
            ENDIF 
        ENDDO 

        WHILE .T.
            ACCEPT "Nota 2: " TO cEntrada
            nNota2 := Val(cEntrada)
            IF nNota2  >= 0 .AND. nNota2 <= 10
                EXIT 
            ELSE 
                QOut("Nota inv lida!")
            ENDIF 
        ENDDO 

        nMedia := (nNota1 + nNota2) / 2

    QOut("== DADOS DO ALUNO ==")
    QOut("Nome: " + cNome)
    QOut("Disciplina: " + cDisciplina)
    QOut("Nota 1: " + Str(nNota1, 10, 2))
    QOut("Nota 2: " + Str(nNota2, 10, 2))
    QOut("M‚dia: " + Str(nMedia, 10, 2))

        ACCEPT "Deseja calcular outro? (S/N): " TO cResposta
        cResposta := Upper(cResposta)

        IF cResposta != "S"
            EXIT 
        ENDIF 
ENDDO

RETURN NIL