FUNCTION Main()

/*EXPLICANDO AS DIFERENÄAS:
= : Compara apenas o in°cio da String, ent∆o os textos n∆o precisam ser necessariamente iguais.
== : Compara de forma EXATA as Strings
*/

    LOCAL cNome1   := "Harb"
    LOCAL cNome2   := "Harbour"
    LOCAL lUmIgual
    LOCAL lDoisIguais

    lUmIgual := (cNome2 = cNome1)
    lDoisIguais := (cNome2 == cNome1)

    QOut(cNome1 + " = " + cNome2 + ":", lUmIgual)
    QOut(cNome1 + " == " + cNome2 + ":", lDoisIguais)

RETURN NIL