FUNCTION Main()

    LOCAL cHora
    LOCAL nI //Indice FOR

    FOR nI := 1 TO 30
        cHora := ObterHora()
        cHora := FormatarHora(cHora)
        ExibirHora(cHora)
        Inkey(1) //função que faz a pausa de segundos para a próxima l
    NEXT
RETURN NIL

    FUNCTION OBterHora()
    RETURN Time()

    FUNCTION FormatarHora(cHora)
    RETURN cHora

    FUNCTION ExibirHora(cHora)
        qOut(cHora)

    RETURN NIL