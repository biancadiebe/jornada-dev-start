#include "protheus.ch"

USER FUNCTION STTIB004()

    LOCAL cFiltro := ""
    LOCAL cCodigSZ2 := SZ2->Z2_CODIGO

    PRIVATE cCadastro := "Interações - Contato " + AllTrim(cCodigSZ2)

    PRIVATE aRotina := {;
        {"Pesquisar","AxPesqui",0,1},;
        {"Visualizar","AxVisual",0,2},;
        {"Incluir","AxInclui",0,3},;
        {"Alterar","AxAltera",0,4},;
        {"Excluir","AxDeleta",0,5};
    }

    cFiltro := "Z3_CONTAT == '" + cCodigSZ2 + "'"

    dbSelectArea("SZ3")
    dbSetOrder(1)
    dbSeek(xFilial("SZ3")+cCodigSZ2)

    mBrowse(1,1,22,75,"SZ3",,,,,,,,,,,.F.,,,cFiltro)

RETURN NIL