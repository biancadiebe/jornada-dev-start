REQUEST HB_CODEPAGE_PT850

FUNCTION Main()

    LOCAL cEntrada
    LOCAL nNumSecreto
    LOCAL nPalpite
    LOCAL nTentativa
    LOCAL lAcerto := .F.

    hb_cdpSelect("PT850")

    nNumSecreto := HB_RandomInt(1, 100)

    FOR nTentativa := 1 TO 7

        QOut("Tentativa " + Str(nTentativa))
        ACCEPT "Digite um n£mero entre 1 e 100: " TO cEntrada
        nPalpite := Val(cEntrada)

        IF nPalpite == nNumSecreto
            QOut("Vocˆ acertou!")
            lAcerto := .T.
            EXIT

        ELSEIF nPalpite < nNumSecreto
            QOut("O n£mero secreto ‚ maior.")

        ELSE
            QOut("O n£mero secreto ‚ menor.")
        ENDIF
    NEXT

    IF lAcerto
        QOut("Vocˆ acertou!")
    ELSE
        QOut("As tentativas acabaram")
    ENDIF

    QOut("O n£mero secreto era: " + Str(nNumSecreto))

RETURN NIL