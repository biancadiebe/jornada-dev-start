# TCC – Sistema de Controle de Qualidade de Fornecedores (ISO 9001)

Projeto desenvolvido como Trabalho de Conclusão de Curso (TCC) para a **Jornada DEV START – TOTVS**, com foco na automatização e controle de qualidade na entrada de materiais de fornecedores integrados ao ERP Protheus.

---

## Autora
* **Nome:** Bianca Diebe
* **Programa:** Jornada DEV START – TOTVS

---

## Contexto do Negócio

O sistema foi criado com base em uma necessidade real de negócio da **Indústria XYZ**, que precisa monitorar e controlar com precisão as não conformidades identificadas na entrada de materiais recebidos de seus fornecedores. Esse acompanhamento rigoroso é requisito fundamental para que a empresa consiga obter e manter a **certificação ISO 9001**, norma internacional para Sistemas de Gestão da Qualidade (SGQ).

---

## Descrição do Sistema

A solução traz duas tabelas customizadas — **`ZZ1` (Controle de Fornecimento)** e **`ZZ2` (Ocorrências do Fornecedor)** —, totalmente vinculadas às tabelas padrão do Protheus de **Fornecedores (`SA2`)** e **Produtos (`SB1`)**, integradas ao módulo **SIGACOM (Compras)**.

### Principais Funcionalidades
* **Cadastro e Gestão:** Controle centralizado da tabela `ZZ1` e registro detalhado das ocorrências na `ZZ2`.
* **Alertas Visuais:** Lógica de validação com legendas coloridas (Verde, Amarelo e Vermelho) para rápida visualização dos índices e validade das ocorrências e certificados.
* **Filtros Personalizados:** Consulta direta e ágil de ocorrências vinculadas a um fornecedor específico na `ZZ1` via botão dedicado.
* **Preenchimento Automático:** Automação na inserção de data, hora e consulta aos dados do fornecedor, com tratamento para códigos/produtos inexistentes.
* **Cálculos de Peças Conformes e Não Conformes:** Apuração automática dos totais em **R$** com base em quantidade e valor unitário do item.
* **Tratamento de Erros:** Operações protegidas por `BEGIN SEQUENCE`, com mensagens personalizadas e geração de log de falhas via `GravarLogTCC`.

---

## Layout das Tabelas (Dicionário de Dados)

### 1. Tabela ZZ1 – Controle de Fornecimento
#### Descrição da imagem:

* **Prefixo:** `ZZ1`
* **Path:** `\DATA\`
* **Nome Físico:** `ZZ1990`
* **Descrição:** CONTROLE DE FORNECIMENTO
* **Modo de Acesso:** Compartilhado

![Tabela ZZ1 no Configurador](https://github.com/biancadiebe/jornada-dev-start/blob/7e60db2a0c12342faedeb25154d4056c60dab729/TCC/evidencias/imagem1.png)

#### Campos da ZZ1
#### Descrição da imagem:
| Ordem | Campo | Título | Descrição |
| :---: | :--- | :--- | :--- |
| 1 | `ZZ1_FILIAL` | Filial | Filial do Sistema |
| 2 | `ZZ1_CODIGO` | Codigo | Código de Controle |
| 3 | `ZZ1_LOJAFO` | Loja Fornec | Loja do fornecedor |
| 4 | `ZZ1_FORNEC` | Cod. Fornec | Codigo do Fornecedor |
| 5 | `ZZ1_NOMEFC` | Nome Fornec | Nome do Fornecedor |
| 6 | `ZZ1_CERTIF` | Dados Certif | Dados do Certificado |
| 7 | `ZZ1_VALCER` | Val Certifi | Validade do Certificado |
| 8 | `ZZ1_TOLERA` | Tolerancia % | Tolerancia % |
| 9 | `ZZ1_TOTOK` | Qtd.Conforme | Quantidade conforme |
| 10 | `ZZ1_TOTNOK` | Não.Conforme | Quantidade não conforme |

![Campos ZZ1](https://github.com/biancadiebe/jornada-dev-start/blob/7e60db2a0c12342faedeb25154d4056c60dab729/TCC/evidencias/imagem2.png)

#### Índices da ZZ1
#### Descrição da imagem: Índices da ZZ1 no Configurador. 
* **Ordem 1 (Chave Primária):** `ZZ1_FILIAL + ZZ1_CODIGO`
* **Ordem 2 (Por Fornecedor):** `ZZ1_FILIAL + ZZ1_FORNEC + ZZ1_LOJAFO`
* **Ordem 3 (Por Validade do Certificado):** `ZZ1_FILIAL + DTOS(ZZ1_VALCER)`

![Índices ZZ1](https://github.com/biancadiebe/jornada-dev-start/blob/7e60db2a0c12342faedeb25154d4056c60dab729/TCC/evidencias/imagem3.png)

---

### 2. Tabela ZZ2 – Ocorrências do Fornecedor
#### Descrição da imagem: 
* **Prefixo:** `ZZ2`
* **Path:** `\DATA\`
* **Nome Físico:** `ZZ2990`
* **Descrição:** OCORRENCIAS DO FORNECEDOR
* **Modo de Acesso:** Compartilhado

![Tabela ZZ2 no Configurador](https://github.com/biancadiebe/jornada-dev-start/blob/7e60db2a0c12342faedeb25154d4056c60dab729/TCC/evidencias/imagem4.png)

#### Campos da ZZ2
#### Descrição da imagem: 
| Ordem | Campo | Título | Descrição |
| :---: | :--- | :--- | :--- |
| 1 | `ZZ2_FILIAL` | Filial | Filial do Sistema |
| 2 | `ZZ2_CONFOR` | Controle | Código do Controle |
| 3 | `ZZ2_FORNEC` | Cod. Fornec | Codigo do Fornecedor |
| 4 | `ZZ2_LOJAFO` | Loja Fornece | Loja do Fornecedor |
| 5 | `ZZ2_NOMEFC` | Nome Fornece | Nome do Fornecedor |
| 6 | `ZZ2_DATA` | Data Ocorren | Data da Ocorrencia |
| 7 | `ZZ2_HORA` | Hora | Hora da Ocorrência |
| 8 | `ZZ2_CODPRO` | Produto | Código do Produto |
| 9 | `ZZ2_QTDOK` | Qtd. Conform | Quantidade Conforme |
| 10 | `ZZ2_QTDNOK` | Não Conforme | Quantidade não conforme |
| 11 | `ZZ2_VLRUNI` | Valor Uni. | Valor unitario |
| 12 | `ZZ2_TOTOK` | R$ Conforme | Total R$ Conforme |
| 13 | `ZZ2_TOTNOK` | $ N Conforme | Total R$ Não Conforme |

![Campos ZZ2](https://github.com/biancadiebe/jornada-dev-start/blob/7e60db2a0c12342faedeb25154d4056c60dab729/TCC/evidencias/imagem5.png)

#### Índices da ZZ2
#### Descrição da imagem: Índices da ZZ1 no Configurador. 
* **Ordem 1 (Chave Primária):** `ZZ2_FILIAL + ZZ2_CONFOR + DTOS(ZZ2_DATA) + ZZ2_HORA`
* **Ordem 2 (Por fornecedor e Data):** `ZZ2_FILIAL + ZZ2_FORNEC + ZZ2_LOJAFO + DTOS(ZZ2_DATA)`
* **Ordem 3 (Por Data):** `ZZ2_FILIAL + DTOS(ZZ2_DATA)                `

![Índices ZZ2](https://github.com/biancadiebe/jornada-dev-start/blob/7e60db2a0c12342faedeb25154d4056c60dab729/TCC/evidencias/imagem6.png)

---

## Validações Implementadas

### Validações ZZ1
| Campo | Regra / Validação |
| :--- | :--- |
| `ZZ1_FORNEC` | `ExistCpo("SA2", M->ZZ1_FORNEC+M->ZZ1_LOJAFO, 1)` |
| `ZZ1_VALCER` | `M->ZZ1_VALCER >= dDataBase` |
| `ZZ1_TOLERA` | `M->ZZ1_TOLERA >= 0 .AND. M->ZZ1_TOLERA <= 100` |

### Validações ZZ2
| Campo | Regra / Validação |
| :--- | :--- |
| `ZZ2_CONFOR` | `ExistCpo("ZZ1", M->ZZ2_CONFOR, 1)` |
| `ZZ2_DATA` | `M->ZZ2_DATA <= dDataBase` |
| `ZZ2_CODPRO` | `ExistCpo("SB1", M->ZZ2_CODPRO, 1)` |

---

## Gatilhos Configurados
### Descrição da imagem: Gatilhos de ZZ1 e ZZ2 no configurador. ZZ1_FORNEC, ZZ2_CONFOR, ZZ2_CONFOR, ZZ2_CONFOR, ZZ2_DATA, ZZ2_HORA, ZZ2_QTDNOK, ZZ2_QTDOK.

![Gatilhos no Configurador](https://github.com/biancadiebe/jornada-dev-start/blob/7e60db2a0c12342faedeb25154d4056c60dab729/TCC/evidencias/imagem7.png)

### Gatilho ZZ1
| Campo | Cnt. Domínio | Regra / Execução |
| :--- | :--- | :--- |
| `ZZ1_FORNEC` | `ZZ1_NOMEFO` | `POSICIONE("SA2",1,xFilial("SA2")+M->ZZ1_FORNEC+M->ZZ1_LOJAFO,"A2_NOME")` |

### Gatilhos ZZ2
| Campo | Cnt. Domínio | Regra / Execução |
| :--- | :--- | :--- |
| `ZZ2_CONFOR` | `ZZ2_FORNEC` | `POSICIONE("ZZ1",1,xFilial("ZZ1")+M->ZZ2_CONFOR,"ZZ1_FORNEC")` |
| `ZZ2_CONFOR` | `ZZ2_LOJAFO` | `POSICIONE("ZZ1",1,xFilial("ZZ1")+M->ZZ2_CONFOR,"ZZ1_LOJAFO")` |
| `ZZ2_CONFOR` | `ZZ2_NOMEFO` | `POSICIONE("SA2",1,xFilial("SA2")+M->ZZ2_FORNEC+M->ZZ2_LOJAFO,"A2_NOME")` |
| `ZZ2_DATA` | `ZZ2_DATA` | `IF(INCLUI, dDataBase, ZZ2->ZZ2_DATA)` |
| `ZZ2_HORA` | `ZZ2_HORA` | `IF(INCLUI, Time(), ZZ2->ZZ2_HORA)` |
| `ZZ2_QTDNOK` | `ZZ2_TOTNOK` | `M->ZZ2_QTDNOK * M->ZZ2_VLRUNI` |
| `ZZ2_QTDOK` | `ZZ2_TOTOK` | `M->ZZ2_QTDOK * M->ZZ2_VLRUNI` |
| `ZZ2_VLRUNI` | `ZZ2_TOTOK` | `M->ZZ2_QTDOK * M->ZZ2_VLRUNI` |
| `ZZ2_VLRUNI` | `ZZ2_TOTNOK` | `M->ZZ2_QTDNOK * M->ZZ2_VLRUNI` |

---

## Descrição das Rotinas (ADVPL)

* **`STTZZ1.PRW`**: Rotina de manutenção da tabela `ZZ1` desenvolvida com `mBrowse`. Conta com regra de legenda visual indicando o status do certificado (Vermelho = Vencido, Amarelo = Vence em até 30 dias, Verde = Dentro do prazo). Inclusões e alterações tratadas por `BEGIN SEQUENCE`.
* **`STTZZ2.PRW`**: Rotina de manutenção da `ZZ2` via `mBrowse`. Avalia a porcentagem de peças não conformes em relação à tolerância definida, alterando as legendas visuais (Vermelho = Acima da tolerância, Verde = Conforme). Operações também protegidas com `BEGIN SEQUENCE`.
* **`STTZZLIB.PRW`**: Biblioteca com funções comuns para reuso:
  * `NomeFornecedor`: Retorna a razão social do fornecedor.
  * `NomeProduto`: Retorna a descrição do produto.
  * `PercNaoConforme`: Calcula o percentual de peças com não conformidade.
  * `CertificadoVencendo`: Valida se o certificado expira nos próximos 30 dias.
  * `GravarLogTCC`: Função centralizada de registro de logs de erro.

---

## Sistema em Funcionamento

## 1. Menu no SIGACOM
### Descrição da imagem: Os menus de Controle de Fornecimento e Ocorrencias do Fornecedor estão destacados em amarelo na imagem. Estão no menu SIGACOM, Dentro de atualizações > cadastros > Controle Iso 9001

![Menus no SIGACOM](https://github.com/biancadiebe/jornada-dev-start/blob/7e60db2a0c12342faedeb25154d4056c60dab729/TCC/evidencias/imagem8.png)

### 2. ZZ1
#### Descrição da imagem: Tabela ZZ1 criada no SIGACOM. Legenda em verde. Codigo: 01, Loja Fornec:, 01, Cod. Fornec: 000001, Nome Fornec: (vazio), Dados Certif: “Certificado”, Val. Certifi: 13/10/26, Tolerancia %: 85.00, Qtd.Conforme: 250.00, Não.Conforme: 30.00. OBS: Os valores referente aos fornecedores foram criados na tabela de fornecedores.

![ZZ1 no SIGACOM](https://github.com/biancadiebe/jornada-dev-start/blob/7e60db2a0c12342faedeb25154d4056c60dab729/TCC/evidencias/imagem9.png)

![ZZ1 no SIGACOM2](https://github.com/biancadiebe/jornada-dev-start/blob/7e60db2a0c12342faedeb25154d4056c60dab729/TCC/evidencias/imagem10.png)

### 2.1 Erro ao cadastrar um código de fornecedor que não existe no "Controle de Fornecimento"
#### Descrição da imagem: Erro: "Não existe registro relacionado a este código"
![ERRO ZZ1](https://github.com/biancadiebe/jornada-dev-start/blob/7e60db2a0c12342faedeb25154d4056c60dab729/TCC/evidencias/imagem14.png)

### 3. ZZ2
##### Descrição da imagem: Tabela ZZ2 criada no SIGACOM. Legenda em verde. Código: 01, Cod.Fornece 000001, Loja Fornece: 01, Nome Fornece: FORNECEDOR LTDA, Data Ocorren: 07/08/26, Hora: 13:40, Produto: 01, Qtd. Conform: 200, Não conforme: 20, Valor Uni.: 50, R$ Conforme: 10.000, $ N Conforme: 1.000. OBS: A ZZ2 foi acessada pelo filtro “Ocorrências” do fornecedor específico pela ZZ1, a data e hora foram preenchidas automaticamente, e as informações do fornecedor também foram fechadas automaticamente.

![ZZ2 no SIGACOM](https://github.com/biancadiebe/jornada-dev-start/blob/7e60db2a0c12342faedeb25154d4056c60dab729/TCC/evidencias/imagem11.png)

![ZZ2 no SIGACOM2](https://github.com/biancadiebe/jornada-dev-start/blob/7e60db2a0c12342faedeb25154d4056c60dab729/TCC/evidencias/imagem12.png)

### 3.1 Erro ao cadastrar um código de fornecedor que não existe no "Ocorrências de Fornecedores"
#### Descrição da imagem: Erro: "Não existe registro relacionado a este código"
![ERRO ZZ2](https://github.com/biancadiebe/jornada-dev-start/blob/7e60db2a0c12342faedeb25154d4056c60dab729/TCC/evidencias/imagem13.png)

---

## Instruções de Instalação e Configuração

### 1. Pré-Requisitos
* Ambiente Protheus instalado e configurado.
* Módulos **SIGACFG** e **SIGACOM**.
* IDE **TDS / DevStudio** para compilação dos códigos em ADVPL.
* Acesso total ao Dicionário de Dados para atualização de tabelas, campos, índices, gatilhos e menus.

### 2. Importação do Dicionário
Importe os arquivos da pasta `Dados-e-Dicionario` (`SX2`, `SX3`, `SX7`, `SIX` e `SXB`) contendo as estruturas do sistema. Certifique-se de importar também as tabelas físicas `ZZ1990.DBF` e `ZZ2990.DBF`.

### 3. Importação do Menu
Abra o módulo **Configurador (SIGACFG)** e faça a importação do arquivo `SIGACOM.XNU` (localizado em `Dados-e-Dicionario`) para adicionar as rotinas ao menu do Compras.

### 4. Compilação dos Códigos
Abra o projeto `TCC.PRJ` no DevStudio e compile os arquivos:
* `STTZZ1.PRW`
* `STTZZ2.PRW`
* `STTZZLIB.PRW`

No Protheus, selecione o módulo **SIGACOM**. As opções estarão acessíveis em:  
`Atualizações > Cadastros > Controle ISO 9001`

---

## Conclusão

O desenvolvimento deste TCC consolidou os principais conceitos da Jornada DEV START, como modelagem no Dicionário de Dados, rotinas com `mBrowse`, gatilhos, validações, tratamento de erros (`BEGIN SEQUENCE`) e reaproveitamento de código em biblioteca própria. O sistema entrega o controle de fornecimento (`ZZ1`) integrado às ocorrências de não conformidade (`ZZ2`), contando com preenchimento automático, legendas visuais e filtros para apoio à gestão da ISO 9001. Ademais, a resolução de instabilidades no ambiente Protheus aprofundou a compreensão prática sobre o funcionamento interno da plataforma.