#include "protheus.ch"

USER FUNCTION STTZZ1()

    LOCAL cFiltro := ""
    LOCAL aColors

    PRIVATE cCadastro := "Controle de Fornecimento"

PRIVATE aRotina := {;
    {"Pesquisar","AxPesqui",0,1},;
    {"Visualizar","AxVisual",0,2},;
    {"Incluir","AxInclui",0,3},;
    {"Alterar","AxAltera",0,4},;
    {"Excluir","AxDeleta",0,5},;
    {"Ocorrências", "U_STTZZ2", 0, 6};
}

    aColors := {;
        {"ZZ1->ZZ1_VALCER < dDataBase","BR_VERMELHO"},;
        {"ZZ1->ZZ1_VALCER <= dDataBase + 30","BR_AMARELO"},;
        {".T.","BR_VERDE"} ;
    }

    dbSelectArea("ZZ1")
    dbSetOrder(1)
    dbSeek(xFilial("ZZ1"))

    mBrowse(1,1,22,75,"ZZ1",,,,,,aColors,,,,,.F.,,,cFiltro)

RETURN NIL     
