#include "protheus.ch"

USER FUNCTION STTIP003()

    LOCAL cFiltro := ""
    LOCAL aColors

    PRIVATE cCadastro := "Contatos"

    PRIVATE aRotina := {;
        {"Pesquisar","AxPesqui",0,1},;
        {"Visualizar","AxVisual",0,2},;
        {"Incluir","AxInclui",0,3},;
        {"Alterar","AxAltera",0,4},;
        {"Excluir","AxDeleta",0,5},;
        {"Interações","U_STTIB004",0,6};
    }

    aColors := {;
        {"SZ2->Z2_DATA >= dDataBase - 7","BR_VERDE"},;
        {"SZ2->Z2_DATA >= dDataBase - 30","BR_AMARELO"},;
        {".T.","BR_VERMELHO"};
    }

    dbSelectArea("SZ2")
    dbSetOrder(1)
    dbSeek(xFilial("SZ2"))

    mBrowse(1,1,22,75,"SZ2",,,,,,aColors,,,,,.F.,,,cFiltro)

RETURN NIL