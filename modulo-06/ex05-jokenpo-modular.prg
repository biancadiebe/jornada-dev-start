REQUEST HB_CODEPAGE_PT850

FUNCTION Main()

    LOCAL cJogada
    LOCAL cCPU 
    LOCAL cResposta

    hb_cdpSelect( "PT850" )

    WHILE .T.
        WHILE .T.
            ACCEPT "Escolha PEDRA, PAPEL ou TESOURA: " TO cJogada
            cJogada := Upper(AllTrim(cJogada))

            IF ValidarJogada(cJogada)
                EXIT 
            ELSE 
                QOut("Jogada inválida!")
            ENDIF
        ENDDO

        cCpu := SortearJogadaCPU()
        QOut("Computador: " + cCPU)
        QOut(DefineVencedor(cJogada, cCPU))

        ACCEPT "Quer jogar novamente? (S/N)" TO cResposta
        cResposta := Upper(AllTrim(cResposta))

        IF cResposta != "S"
            EXIT 
        ENDIF 
    ENDDO

RETURN NIL

FUNCTION SortearJogadaCPU()

        LOCAL nSorteio
        
        nSorteio := HB_RandomInt(1,3)

        DO CASE 
            CASE nSorteio == 1
                RETURN "PEDRA"
            CASE nSorteio == 2
                RETURN "PAPEL"
            OTHERWISE
            RETURN "TESOURA"
        ENDCASE

RETURN NIL

FUNCTION ValidarJogada(cJogada)
    IF cJogada == "PEDRA" .OR.;
        cJogada == "PAPEL" .OR.;
        cJogada == "TESOURA"
            RETURN .T.
    ENDIF

RETURN .F.

FUNCTION DefineVencedor(cJogador, cCPU)

    IF cJogador == cCPU
        RETURN "Empate!"
    ENDIF 

    DO CASE 
        CASE cJogador == "PEDRA" .AND. cCPU == "TESOURA"
            RETURN "Você venceu!"
        CASE cJogador == "PAPEL" .AND. cCPU = "PEDRA"
            RETURN "Você venceu!"
        CASE cJogador == "TESOURA" .AND. cCPU = "PAPEL"
            RETURN "Você venceu!"
        OTHERWISE 
            RETURN "O computador venceu!"
    ENDCASE

RETURN NIL
