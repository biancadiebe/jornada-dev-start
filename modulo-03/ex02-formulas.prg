REQUEST HB_CODEPAGE_PT850

#DEFINE PI 3.14159

FUNCTION Main()

    LOCAL cEntrada

    //AREA
    LOCAL nRaio
    LOCAL nArea

    //HIPOTENUSA
    LOCAL nA
    LOCAL nB
    LOCAL nHipotenusa

    //IMC
    LOCAL nPeso
    LOCAL nAltura
    LOCAL nIMC

    hb_cdpSelect( "PT850" )

    //AREA
    ACCEPT "Informe o valor do raio: " TO cEntrada
    nRaio := Val(cEntrada)
    nArea := PI * (nRaio ^ 2)

    //HIPOTENUSA
    ACCEPT "Informe o valor A: " TO cEntrada
    nA := Val(cEntrada)

    ACCEPT "Informe o valor B: " TO cEntrada
    nB := Val(cEntrada)

    nHipotenusa := Sqrt((nA ^ 2) + (nB ^ 2))

    //IMC
    ACCEPT "Informe o peso: " TO cEntrada
    nPeso := Val(cEntrada)

    ACCEPT "Informe a altura: " TO cEntrada
    nAltura := Val(cEntrada)

    nIMC := nPeso / (nAltura ^ 2)

    //SAIDAS
    QOut("µrea: " + Str(nArea, 10, 2))
    QOut("Hipotenusa: " + Str(nHipotenusa, 10, 2))
    QOut("IMC: " + Str(nIMC, 10, 2))

RETURN NIL