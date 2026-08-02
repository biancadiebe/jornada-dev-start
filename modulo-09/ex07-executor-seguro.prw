//EXERCÍCIO - 7A
include "protheus.ch"

USER FUNCTION VALEXCSZ2()
    LOCAL lRet := .T.
    LOCAL cAlias := "SZ2"
    LOCAL nReg   := SZ2->(RecNo())
    LOCAL nOpc   := 5

    dbSelectArea("SZ3")
    dbSetOrder(1)

    IF dbSeek(xFilial("SZ3") + SZ2->Z2_CODIGO)  //procura interações na SZ3 do contato atual
        MsgAlert("Contato possui interações! Exclua as interações primeiro.", "Atenção")
        lRet := .F.
    ELSE
        AxDeleta(cAlias, nReg, nOpc) //se nao tem interacao, aparece a tela normal de exclusão
    ENDIF

RETURN lRet

USER FUNCTION STTIP003EXCLUI(cAlias, nReg, nOpc)
    LOCAL cTudoOk := "U_VALEXCSZ2()

RETURN AxDeleta(cAlias, nReg, nOpc, NIL, NIL, NIL, cTudoOk)       

//EXERCÍCIO - 7B
include "protheus.ch"

USER FUNCTION EXECUTARSEGURO(bBloco, cMsgErro)

    LOCAL lRet := .T.
    LOCAL oErro

    BEGIN SEQUENCE

        Eval(bBloco)

    RECOVER WITH oErro

        lRet := .F.

        MsgAlert(cMsgErro, "Erro")

        U_GRAVARLOGB("EXECUTARSEGURO", oErro)

    END SEQUENCE

RETURN lRet

//Para chamar a função: U_EXECUTARSEGURO({|| MsgInfo("Executou o bloco!")}, "Falha")