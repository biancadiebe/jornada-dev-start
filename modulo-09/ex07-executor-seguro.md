#include "protheus.ch"

USER FUNCTION EXECUTARSEGURO(bBloco, cMsgErro)

    LOCAL lRet := .T.
    LOCAL oErro

    BEGIN SEQUENCE

        Eval(bBloco)

    RECOVER USING oErro
    
        lRet := .F.

        MsgAlert(cMsgErro, "Erro")

        U_GRAVARLOGB("EXECUTARSEGURO", oErro)

    END SEQUENCE

RETURN lRet