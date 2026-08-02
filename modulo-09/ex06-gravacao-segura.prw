#include "protheus.ch"

USER FUNCTION STTIB003SALVAR()

    LOCAL lOk := .T.
    LOCAL oErro

    BEGIN TRANSACTION

    BEGIN SEQUENCE

        IF Empty(M->Z2_CLIENTE)
            MsgAlert("Cliente e obrigatorio!", "Atencao")
            lOk := .F.
            DisarmTransaction()
            Break(.T.)
        ENDIF

        IF Empty(M->Z2_ASSUNTO)
            MsgAlert("Assunto e obrigatorio!", "Atencao")
            lOk := .F.
            DisarmTransaction()
            Break(.T.)
        ENDIF

        dbSelectArea("SZ2")
        IF INCLUI
            RecLock("SZ2", .T.)
        ELSE
            RecLock("SZ2", .F.)
        ENDIF

        SZ2->Z2_CODIGO  := M->Z2_CODIGO
        SZ2->Z2_CLIENTE := M->Z2_CLIENTE
        SZ2->Z2_ASSUNTO := M->Z2_ASSUNTO

        MsUnLock()

    RECOVER USING oErro
        lOk := .F.
        DisarmTransaction()
        IF ValType(oErro) == "O"
            MsgStop("Erro ao salvar: " + oErro:Description, "Erro")
            U_GRAVARLOGB("STTIB003SALVAR", oErro)
        ENDIF
    END SEQUENCE

    END TRANSACTION

RETURN lOk

USER FUNCTION STTIP003INCLUI(cAlias,nReg,nOpc)

    LOCAL nRet := 0
    LOCAL cTudoOk := "U_STTIB003SALVAR()"

    nRet := AxInclui(cAlias,nReg,nOpc,,,,cTudoOk)

    IF nRet == 1
        MsgInfo("Inclusão realizada com sucesso!")
    ENDIF

RETURN nRet

//OBS: O STTIPLIB com a função atualizada está no arquivo do exercício 2