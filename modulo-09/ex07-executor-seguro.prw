#include "protheus.ch"

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

//Para chamar a função: U_EXECUTARSEGURO({|| 10 / 0}, "Falha ao executar operação")