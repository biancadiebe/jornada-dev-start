#Include "Protheus.ch"

USER FUNCTION STTIP001()
                                                          
//Puxa o mes atual
   LOCAL cFiltro := "MONTH(ZA1_NASC) == MONTH(dDataBase)"
                                                                        
   PRIVATE cCadastro := "Pets - Mes Atual"
   PRIVATE aRotina := {}

   AADD(aRotina, {"Pesquisar"  , "AxPesqui"     , 0, 1})
   AADD(aRotina, {"Visualizar" , "AxVisual"     , 0, 2})
   AADD(aRotina, {"Incluir"    , "AxInclui"     , 0, 3})
   AADD(aRotina, {"Alterar"    , "AxAltera"     , 0, 4})
   AADD(aRotina, {"Excluir"    , "AxDeleta"     , 0, 5})
   AADD(aRotina, {"Sem Filtro" , "U_STTIP001S"  , 0, 6})
   AADD(aRotina, {"Historico"  , "U_HISTPET"    , 0, 6})

   DBSELECTAREA("ZA1")
   DBSETORDER(1)

   MBROWSE(1, 1, 22, 75, "ZA1", , , , , , , , , , , .F., , , cFiltro)

RETURN NIL


/* Abre a tela sem o filtro do mes. */
USER FUNCTION STTIP001S()

   LOCAL cFiltro := ""

   //Fecha a tela anterior para reaplicar o filtro novamente
   CLOSEBROWSE()

   PRIVATE cCadastro := "Pets - Todos"
   PRIVATE aRotina := {}

   AADD(aRotina, {"Pesquisar" , "AxPesqui"    , 0, 1})
   AADD(aRotina, {"Visualizar", "AxVisual"    , 0, 2})
   AADD(aRotina, {"Incluir"   , "AxInclui"    , 0, 3})
   AADD(aRotina, {"Alterar"   , "AxAltera"    , 0, 4})
   AADD(aRotina, {"Excluir"   , "AxDeleta"    , 0, 5})
   AADD(aRotina, {"Mes Atual" , "U_STTIP001R"  , 0, 6})
   AADD(aRotina, {"Historico" , "U_HISTPET"   , 0, 6})

   DBSELECTAREA("ZA1")
   DBSETORDER(1)

   MBROWSE(1, 1, 22, 75, "ZA1", , , , , , , , , , , .F., , , cFiltro)

RETURN NIL


//Funcao para abrir novamente o filtro com o mes (e fecha a tela SEM o filtro)
USER FUNCTION STTIP001R()

   CLOSEBROWSE()
   U_STTIP001()

RETURN NIL


//Historico
USER FUNCTION HISTPET()

   LOCAL cMensagem := ""

   DBSELECTAREA("ZA1")

   cMensagem := "Codigo: " + ALLTRIM(ZA1->ZA1_COD) + CRLF
   cMensagem += "Raca: "   + ALLTRIM(ZA1->ZA1_RACA)

   MSGINFO(cMensagem, "Historico do Pet")

RETURN NIL