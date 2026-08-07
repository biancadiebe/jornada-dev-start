#include "protheus.ch"

//funcao que recebe o codigo e procura o nome na SA2 (cadastro de fornecedor)
STATIC FUNCTION NomeFornecedor(cFornec, cLoja)

    LOCAL cNome := ""

    IF !Empty(cFornec)
        cNome := Posicione("SA2",1,;
                 xFilial("SA2")+cFornec+cLoja,;
                 "A2_NOME")
    ENDIF

RETURN AllTrim(cNome)

//recebe o nome do produto
STATIC FUNCTION NomeProduto(cCodPro)

    LOCAL cNome := ""

    IF !Empty(cCodPro)
        cNome := Posicione("SB1",1,;
                 xFilial("SB1")+cCodPro,;
                 "B1_DESC")
    ENDIF

RETURN AllTrim(cNome)

//faz o calculo de quantidade de produtos conformes - quantidade de produtos não conformes e retorna a % de produtos não conformes
USER FUNCTION PercNaoConforme(nOk,nNok, nTolerancia)

    LOCAL nPerc := 0

    IF (nOk+nNok) > 0
        nPerc := (nNok/(nOk+nNok))*100
    ENDIF  

//quando recebe o numero, verifica os parametros, se recebe o nTolerancia verifica se ele passou do valor limite         
    IF PCount() >= 3
      
    		RETURN (nPerc > nTolerancia)
 
    ENDIF

RETURN nPerc
   
//recebe a data de validade e compara com a atual
STATIC FUNCTION CertificadoVencendo(dValCer)

    IF Empty(dValCer)
        RETURN .F.
    ENDIF

RETURN (dValCer <= dDataBase + 30)

//log de erros
USER FUNCTION GravarLogTCC(cFuncao,oErro)

    LOCAL cArqLog := "\logs\tcc_" + DToS(Date()) + ".log"
    LOCAL nHandle
    LOCAL cLinha := ""

    cLinha += DToS(Date()) + " " + Time() + " | "
    cLinha += cFuncao + " | "
    cLinha += cUserName + " | "
    cLinha += "Empresa: " + cEmpAnt + ;
              " Filial: " + cFilAnt + " | "

    IF oErro != NIL
        cLinha += "ERRO: " + oErro:Description + " | "
        cLinha += "Func: " + oErro:ProcName + ;
                  ":" + cValToChar(oErro:ProcLine) + " | "
        cLinha += "SubSist: " + oErro:SubSystem + " | "
        cLinha += "Oper: " + oErro:Operation
    ENDIF

    nHandle := FOpen(cArqLog, FO_READWRITE + FO_SHARED)

    IF nHandle < 0
        nHandle := FCreate(cArqLog)
    ENDIF

    FSeek(nHandle,0,FS_END)
    FWrite(nHandle,cLinha + CRLF)
    FClose(nHandle)

RETURN NIL  