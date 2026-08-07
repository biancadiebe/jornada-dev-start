# TCC – Sistema de Controle de Qualidade de Fornecedores (ISO 9001)

Projeto desenvolvido como Trabalho de Conclusão de Curso (TCC) para a **Jornada DEV START – TOTVS**, com foco na automatização e controle de qualidade na entrada de materiais de fornecedores integrados ao ERP Protheus[cite: 1].

---

## Autora
* **Nome:** Bianca Diebe[cite: 1]
* **Programa:** Jornada DEV START – TOTVS

---

## Contexto do Negócio: 

O sistema foi criado com base em uma necessidade real de negócio da **Indústria XYZ**, que precisa monitorar e controlar com precisão as não conformidades identificadas na entrada de materiais recebidos de seus fornecedores[cite: 1]. Esse acompanhamento rigoroso é requisito fundamental para que a empresa consiga obter e manter a **certificação ISO 9001**, norma internacional para Sistemas de Gestão da Qualidade (SGQ).

---

## Descrição do Sistema

A solução traz duas tabelas customizadas — **`ZZ1` (Controle de Fornecimento)** e **`ZZ2` (Ocorrências do Fornecedor)** —, totalmente vinculadas as tabelas padrão do Protheus de **Fornecedores (`SA2`)** e **Produtos (`SB1`)**, integradas ao módulo **SIGACOM (Compras)**.

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

![Tabela ZZ1 no Configurador](./assets/zz1_configurador.png)

#### 📝 Campos da ZZ1
| Ordem | Campo | Título | Descrição |
| :---: | :--- | :--- | :--- |
| 1 | `ZZ1_FILIAL` | Filial | Filial do Sistema[cite: 1] |
| 2 | `ZZ1_CODIGO` | Codigo | Código de Controle[cite: 1] |
| 3 | `ZZ1_LOJAFO` | Loja Fornec | Loja do fornecedor[cite: 1] |
| 4 | `ZZ1_FORNEC` | Cod. Fornec | Codigo do Fornecedor[cite: 1] |
| 5 | `ZZ1_NOMEFC` | Nome Fornec | Nome do Fornecedor[cite: 1] |
| 6 | `ZZ1_CERTIF` | Dados Certif | Dados do Certificado[cite: 1] |
| 7 | `ZZ1_VALCER` | Val Certifi | Validade do Certificado[cite: 1] |
| 8 | `ZZ1_TOLERA` | Tolerancia % | Tolerancia %[cite: 1] |
| 9 | `ZZ1_TOTOK` | Qtd.Conforme | Quantidade conforme[cite: 1] |
| 10 | `ZZ1_TOTNOK` | Não.Conforme | Quantidade não conforme[cite: 1] |

<!-- Espaço para Imagem dos Campos da ZZ1 -->
![Campos ZZ1](./assets/zz1_campos.png)[cite: 1]

#### 🔑 Índices da ZZ1
* **Ordem 1 (Chave Primária):** `ZZ1_FILIAL + ZZ1_CODIGO`[cite: 1]
* **Ordem 2 (Por Fornecedor):** `ZZ1_FILIAL + ZZ1_FORNEC + ZZ1_LOJAFO`[cite: 1]
* **Ordem 3 (Por Validade do Certificado):** `ZZ1_FILIAL + DTOS(ZZ1_VALCER)`[cite: 1]

<!-- Espaço para Imagem dos Índices da ZZ1 -->
![Índices ZZ1](./assets/zz1_indices.png)[cite: 1]

---

### 2. Tabela ZZ2 – Ocorrências do Fornecedor

* **Prefixo:** `ZZ2`[cite: 1]
* **Path:** `\DATA\`[cite: 1]
* **Nome Físico:** `ZZ2990`[cite: 1]
* **Descrição:** OCORRENCIAS DO FORNECEDOR[cite: 1]
* **Modo de Acesso:** Compartilhado[cite: 1]

<!-- Espaço para Imagem da ZZ2 no Configurador -->
![Tabela ZZ2 no Configurador](./assets/zz2_configurador.png)[cite: 1]

#### 📝 Campos da ZZ2
| Ordem | Campo | Título | Descrição |
| :---: | :--- | :--- | :--- |
| 1 | `ZZ2_FILIAL` | Filial | Filial do Sistema[cite: 1] |
| 2 | `ZZ2_CONFOR` | Controle | Código do Controle[cite: 1] |
| 3 | `ZZ2_FORNEC` | Cod. Fornec | Codigo do Fornecedor[cite: 1] |
| 4 | `ZZ2_LOJAFO` | Loja Fornece | Loja do Fornecedor[cite: 1] |
| 5 | `ZZ2_NOMEFC` | Nome Fornece | Nome do Fornecedor[cite: 1] |
| 6 | `ZZ2_DATA` | Data Ocorren | Data da Ocorrencia[cite: 1] |
| 7 | `ZZ2_HORA` | Hora | Hora da Ocorrência[cite: 1] |
| 8 | `ZZ2_CODPRO` | Produto | Código do Produto[cite: 1] |
| 9 | `ZZ2_QTDOK` | Qtd. Conform | Quantidade Conforme[cite: 1] |
| 10 | `ZZ2_QTDNOK` | Não Conforme | Quantidade não conforme[cite: 1] |
| 11 | `ZZ2_VLRUNI` | Valor Uni. | Valor unitario[cite: 1] |
| 12 | `ZZ2_TOTOK` | R$ Conforme | Total R$ Conforme[cite: 1] |
| 13 | `ZZ2_TOTNOK` | $ N Conforme | Total R$ Não Conforme[cite: 1] |

<!-- Espaço para Imagem dos Campos da ZZ2 -->
![Campos ZZ2](./assets/zz2_campos.png)[cite: 1]

---

## ✅ Validações Implementadas

### Validações ZZ1
| Campo | Regra / Validação |
| :--- | :--- |
| `ZZ1_FORNEC` | `ExistCpo("SA2", M->ZZ1_FORNEC+M->ZZ1_LOJAFO, 1)`[cite: 1] |
| `ZZ1_VALCER` | `M->ZZ1_VALCER >= dDataBase`[cite: 1] |
| `ZZ1_TOLERA` | `M->ZZ1_TOLERA >= 0 .AND. M->ZZ1_TOLERA <= 100`[cite: 1] |

### Validações ZZ2
| Campo | Regra / Validação |
| :--- | :--- |
| `ZZ2_CONFOR` | `ExistCpo("ZZ1", M->ZZ2_CONFOR, 1)`[cite: 1] |
| `ZZ2_DATA` | `M->ZZ2_DATA <= dDataBase`[cite: 1] |
| `ZZ2_CODPRO` | `ExistCpo("SB1", M->ZZ2_CODPRO, 1)`[cite: 1] |

---

## ⚡ Gatilhos Configurados

<!-- Espaço para Imagem da Lista de Gatilhos -->
![Gatilhos no Configurador](./assets/gatilhos.png)[cite: 1]

### Gatilho ZZ1
| Campo | Cnt. Domínio | Regra / Execução |
| :--- | :--- | :--- |
| `ZZ1_FORNEC` | `ZZ1_NOMEFO` | `POSICIONE("SA2",1,xFilial("SA2")+M->ZZ1_FORNEC+M->ZZ1_LOJAFO,"A2_NOME")`[cite: 1] |

### Gatilhos ZZ2
| Campo | Cnt. Domínio | Regra / Execução |
| :--- | :--- | :--- |
| `ZZ2_CONFOR` | `ZZ2_FORNEC` | `POSICIONE("ZZ1",1,xFilial("ZZ1")+M->ZZ2_CONFOR,"ZZ1_FORNEC")`[cite: 1] |
| `ZZ2_CONFOR` | `ZZ2_LOJAFO` | `POSICIONE("ZZ1",1,xFilial("ZZ1")+M->ZZ2_CONFOR,"ZZ1_LOJAFO")`[cite: 1] |
| `ZZ2_CONFOR` | `ZZ2_NOMEFO` | `POSICIONE("SA2",1,xFilial("SA2")+M->ZZ2_FORNEC+M->ZZ2_LOJAFO,"A2_NOME")`[cite: 1] |
| `ZZ2_DATA` | `ZZ2_DATA` | `IF(INCLUI, dDataBase, ZZ2->ZZ2_DATA)`[cite: 1] |
| `ZZ2_HORA` | `ZZ2_HORA` | `IF(INCLUI, Time(), ZZ2->ZZ2_HORA)`[cite: 1] |
| `ZZ2_QTDNOK` | `ZZ2_TOTNOK` | `M->ZZ2_QTDNOK * M->ZZ2_VLRUNI`[cite: 1] |
| `ZZ2_QTDOK` | `ZZ2_TOTOK` | `M->ZZ2_QTDOK * M->ZZ2_VLRUNI`[cite: 1] |
| `ZZ2_VLRUNI` | `ZZ2_TOTOK` | `M->ZZ2_QTDOK * M->ZZ2_VLRUNI`[cite: 1] |
| `ZZ2_VLRUNI` | `ZZ2_TOTNOK` | `M->ZZ2_QTDNOK * M->ZZ2_VLRUNI`[cite: 1] |

---

## 💻 Descrição das Rotinas (ADVPL)

* **`STTZZ1.PRW`**: Rotina de manutenção da tabela `ZZ1` desenvolvida com `mBrowse`[cite: 1]. Conta com regra de legenda visual indicando o status do certificado (Vermelho = Vencido, Amarelo = Vence em até 30 dias, Verde = Dentro do prazo)[cite: 1]. Inclusões e alterações tratadas por `BEGIN SEQUENCE`[cite: 1].
* **`STTZZ2.PRW`**: Rotina de manutenção da `ZZ2` via `mBrowse`[cite: 1]. Avalia a porcentagem de peças não conformes em relação à tolerância definida, alterando as legendas visuais (Vermelho = Acima da tolerância, Verde = Conforme)[cite: 1]. Operações também protegidas com `BEGIN SEQUENCE`[cite: 1].
* **`STTZZLIB.PRW`**: Biblioteca com funções comuns para reuso[cite: 1]:
  * `NomeFornecedor`: Retorna a razão social do fornecedor[cite: 1].
  * `NomeProduto`: Retorna a descrição do produto[cite: 1].
  * `PercNaoConforme`: Calcula o percentual de peças com não conformidade[cite: 1].
  * `CertificadoVencendo`: Valida se o certificado expira nos próximos 30 dias[cite: 1].
  * `GravarLogTCC`: Função centralizada de registro de logs de erro[cite: 1].

---

## 🖥️ Telas do Sistema em Funcionamento

### Tabela ZZ1 em Ação
<!-- Espaço para Imagem da ZZ1 Rodando no SIGACOM -->
![ZZ1 no SIGACOM](./assets/zz1_sigacom.png)[cite: 1]

> **Obs:** Os fornecedores exibidos nas telas foram pré-cadastrados na tabela padrão de fornecedores (`SA2`)[cite: 1].

### Tabela ZZ2 em Ação
<!-- Espaço para Imagem da ZZ2 Rodando no SIGACOM -->
![ZZ2 no SIGACOM](./assets/zz2_sigacom.png)[cite: 1]

> **Obs:** A `ZZ2` foi acionada utilizando o filtro de "Ocorrências" da `ZZ1`[cite: 1]. Os dados de fornecedor, data e hora foram preenchidos de forma automatizada pelo sistema[cite: 1].

---

## 🛠️ Instruções de Instalação e Configuração

### 1. Pré-Requisitos
* Ambiente Protheus instalado e configurado[cite: 1].
* Módulos **SIGACFG** e **SIGACOM**[cite: 1].
* IDE **TDS / DevStudio** para compilação dos códigos em ADVPL[cite: 1].
* Acesso total ao Dicionário de Dados para atualização de tabelas, campos, índices, gatilhos e menus[cite: 1].

### 2. Importação do Dicionário
Importe os arquivos da pasta `Dados-e-Dicionario` (`SX2`, `SX3`, `SX7`, `SIX` e `SXB`) contendo as estruturas do sistema[cite: 1]. Certifique-se de importar também as tabelas físicas `ZZ1990.DBF` e `ZZ2990.DBF`[cite: 1].

### 3. Importação do Menu
Abra o módulo **Configurador (SIGACFG)** e faça a importação do arquivo `SIGACOM.XNU` (localizado em `Dados-e-Dicionario`) para adicionar as rotinas ao menu do Compras[cite: 1].

### 4. Compilação dos Códigos
Abra o projeto `TCC.PRJ` no DevStudio e compile os arquivos[cite: 1]:
* `STTZZ1.PRW`[cite: 1]
* `STTZZ2.PRW`[cite: 1]
* `STTZZLIB.PRW`[cite: 1]

No Protheus, selecione o módulo **SIGACOM**[cite: 1]. As opções estarão acessíveis em:  
`Atualizações > Cadastros > Controle ISO 9001`[cite: 1]

---

## 📝 Conclusão

O desenvolvimento deste TCC consolidou os principais conceitos da Jornada DEV START, como modelagem no Dicionário de Dados, rotinas com `mBrowse`, gatilhos, validações, tratamento de erros (`BEGIN SEQUENCE`) e reaproveitamento de código em biblioteca própria[cite: 1]. O sistema entrega o controle de fornecimento (`ZZ1`) integrado às ocorrências de não conformidade (`ZZ2`), contando com preenchimento automático, legendas visuais e filtros para apoio à gestão da ISO 9001[cite: 1]. Ademais, a resolução de instabilidades no ambiente Protheus aprofundou a compreensão prática sobre o funcionamento interno da plataforma[cite: 1].