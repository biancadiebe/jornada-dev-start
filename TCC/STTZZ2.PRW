#include "protheus.ch"

USER FUNCTION STTZZ2()

    LOCAL cFiltro := ""
    LOCAL aColors

    PRIVATE cCadastro := "Ocorrências de Fornecedores"

    PRIVATE aRotina := {;
        {"Pesquisar","AxPesqui",0,1},;
        {"Visualizar","AxVisual",0,2},;
        {"Incluir","AxInclui",0,3},;
        {"Alterar","AxAltera",0,4},;
        {"Excluir","AxDeleta",0,5};
    }
    
    //adiciona a validação que fizemos na biblioteca 
		aColors := {;
   		 	{"U_PercNaoConforme(ZZ2->ZZ2_QTDOK, ZZ2->ZZ2_QTDNOK, Posicione('ZZ1',1,xFilial('ZZ1')+ZZ2->ZZ2_CONFOR,'ZZ1_TOLERA'))","BR_VERMELHO"},;
    	  		{".T.","BR_VERDE"};
		}  
		
    dbSelectArea("ZZ2")
    dbSetOrder(1)
    dbSeek(xFilial("ZZ2"))

    mBrowse(1,1,22,75,"ZZ2",,,,,,aColors,,,,,.F.,,,cFiltro)

RETURN NIL

