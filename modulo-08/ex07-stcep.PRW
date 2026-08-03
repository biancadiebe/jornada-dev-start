#include "protheus.ch"

USER FUNCTION STCEP(cCEP, cRetorno)

    LOCAL aTabela := aTabCEP()
    LOCAL cLimpo  := ""
    LOCAL cRet    := ""
    LOCAL nPos    := 0

    DEFAULT cCEP      := ""
    DEFAULT cRetorno := "BAIRRO"

    IF nPos > 0

        DO CASE

        CASE Upper(AllTrim(cRetorno)) == "BAIRRO"
            cRet := aTabela[nPos][2]

        CASE Upper(AllTrim(cRetorno)) == "CIDADE"
            cRet := aTabela[nPos][3]

        CASE Upper(AllTrim(cRetorno)) == "UF"
            cRet := aTabela[nPos][4]

        ENDCASE

    ENDIF

RETURN cRet

USER FUNCTION STCEPTESTE()

    LOCAL cCEP := "18035-000"

    MsgInfo( ;
        "CEP informado: " + cCEP + CRLF + ;
        "Bairro: " + U_STCEP(cCEP, "BAIRRO") + CRLF + ;
        "Cidade: " + U_STCEP(cCEP, "CIDADE") + CRLF + ;
        "UF: " + U_STCEP(cCEP, "UF"), ;
        "Consulta de CEP" )

RETURN NIL

STATIC FUNCTION aTabCEP()

RETURN { ;
    { "18035000", "Centro",           "Sorocaba",          "SP" }, ;
    { "18040000", "Vila Hortencia",   "Sorocaba",          "SP" }, ;
    { "18045000", "Jardim Paulista",  "Sorocaba",          "SP" }, ;
    { "18110000", "Centro",           "Votorantim",        "SP" }, ;
    { "18200000", "Centro",           "Itapetininga",      "SP" }, ;
    { "01310100", "Bela Vista",       "Sao Paulo",         "SP" }, ;
    { "01001000", "Se",               "Sao Paulo",         "SP" }, ;
    { "04547000", "Vila Olimpia",     "Sao Paulo",         "SP" }, ;
    { "08010000", "Itaquera",         "Sao Paulo",         "SP" }, ;
    { "09010000", "Centro",           "Santo Andre",       "SP" }, ;
    { "13010000", "Centro",           "Campinas",          "SP" }, ;
    { "13330000", "Centro",           "Indaiatuba",        "SP" }, ;
    { "14010000", "Centro",           "Ribeirao Preto",    "SP" }, ;
    { "06010000", "Centro",           "Osasco",            "SP" }, ;
    { "07010000", "Centro",           "Guarulhos",         "SP" }, ;
    { "11010000", "Centro",           "Santos",            "SP" }, ;
    { "12210000", "Centro",           "Sao Jose Campos",   "SP" }, ;
    { "37540000", "Centro",           "Santa Rita",        "MG" }, ;
    { "70070000", "Asa Sul",          "Brasilia",          "DF" }, ;
    { "20010000", "Centro",           "Rio de Janeiro",    "RJ" } ;
}