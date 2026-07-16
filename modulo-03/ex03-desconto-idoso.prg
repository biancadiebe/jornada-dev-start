#DEFINE nDesc 0.125

FUNCTION Main()

    LOCAL cEntrada
    LOCAL cNome
    LOCAL dDataNasc
    LOCAL nIdade
    LOCAL nPrecoOriginal
    LOCAL nValorFinal
    LOCAL nValorDesconto

    //Usando o date format pra funcionar no padrÆo do Brasil
    SET DATE FORMAT "DD/MM/YYYY"

    ACCEPT "Nome: " TO cNome
    ACCEPT "Data de nascimento: " TO cEntrada
    dDataNasc := CtoD(cEntrada)
    ACCEPT "Pre‡o do produto: " TO cEntrada
    nPrecoOriginal := Val(cEntrada)

    //CALCULANDO IDADE
    nIdade := Int((Date() - dDataNasc) / 365)

    IF nIdade >= 60
        nValorDesconto := nPrecoOriginal * nDesc
        nValorFinal := nPrecoOriginal - nValorDesconto
ELSE
    nValorDesconto := 0
    nValorFinal := nPrecoOriginal
END IF

    QOut("Cliente: " + cNome)
    QOut("Idade: " + Str(nIdade, 3))
    QOut("Pre‡o: " + Str(nPrecoOriginal, 10, 2))
    QOut("Desconto: " + Str(nValorDesconto, 10, 2))
    QOut("Total: " + Str(nValorFinal, 10, 2))
RETURN NIL