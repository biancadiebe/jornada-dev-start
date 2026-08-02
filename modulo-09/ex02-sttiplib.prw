#include "protheus.ch"

STATIC FUNCTION NomeCliente(cCodigo, cLoja)
    LOCAL cFilial := xFilial("SA1")
    LOCAL cNome

    IF Empty(cCodigo)
        RETURN ""
    ENDIF

    cNome := POSICIONE("SA1", 1, cFilial + cCodigo + cLoja, "A1_NOME")

RETURN AllTrim(cNome)

USER FUNCTION PROXCODIGOSZ2()
RETURN GetSXENum("SZ2", "Z2_CODIGO")

STATIC FUNCTION ProxSequenSZ3(cContat)

    LOCAL nMax := 0

    dbSelectArea("SZ3")
    dbSetOrder(1)
    dbSeek(xFilial("SZ3") + cContat)

    WHILE !Eof() .AND. SZ3->Z3_FILIAL == xFilial("SZ3") .AND. SZ3->Z3_CONTAT == cContat
        nMax := Max(nMax, Val(SZ3->Z3_SEQUEN))
        dbSkip()
    ENDDO

RETURN StrZero(nMax + 1, 3)

STATIC FUNCTION DescTipoInteracao(cTipo)

    LOCAL cDesc := ""

    DO CASE
    CASE cTipo == "E"
        cDesc := "E-mail"
    CASE cTipo == "L"
        cDesc := "Ligacao"
    CASE cTipo == "R"
        cDesc := "Reuniao"
    CASE cTipo == "V"
        cDesc := "Visita"
    CASE cTipo == "W"
        cDesc := "WhatsApp"
    ENDCASE

RETURN cDesc

//EXERCÍCIO 6
USER FUNCTION GRAVARLOGB(cFuncao, oErro)

    LOCAL cArqLog := "\logs\advpl_" + DToS(Date()) + ".log"
    LOCAL nHandle
    LOCAL cLinha

    cLinha := DToS(Date()) + " " + Time() + " | "
    cLinha += cFuncao + " | "
    cLinha += cUserName + " | "
    cLinha += "Empresa: " + cEmpAnt + " Filial: " + cFilAnt + " | "

    IF oErro != NIL
        cLinha += "ERRO: " + oErro:Description + " | "
        cLinha += "Func: " + oErro:ProcName + ":" + cValToChar(oErro:ProcLine) + " | "
        cLinha += "SubSist: " + oErro:SubSystem + " | "
        cLinha += "Oper: " + oErro:Operation
    ENDIF

    nHandle := FOpen(cArqLog, FO_READWRITE + FO_SHARED)
    IF nHandle < 0
        nHandle := FCreate(cArqLog)
    ENDIF

    FSeek(nHandle, 0, FS_END)
    FWrite(nHandle, cLinha + CRLF)
    FClose(nHandle)

RETURN NIL