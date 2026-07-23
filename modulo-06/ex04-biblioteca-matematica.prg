SET PROCEDURE TO ex04-matematica.prg //puxa a biblioteca com as funções
REQUEST HB_CODEPAGE_PT850

FUNCTION Main()

    hb_cdpSelect( "PT850" )

    QOut("Fatorial: " + Str(Fatorial(4)))
    QOut("7 é um número primo? ")
    QOut(Primo(7))
    QOut("4 é um número primo? ")
    QOut(Primo(4))
    QOut("MDC(90,54): " + Str(MDC(90,54)))
    QOut("MMC(6,8): " + Str(MMC(6,8)))

RETURN NIL 
