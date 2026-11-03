# Jogo de Plataforma 2D (TCC - UNIP 2026)

Repositório oficial com o código-fonte e assets do Trabalho de Conclusão de Curso II (TC II) do curso de Ciência da Computação da Universidade Paulista (UNIP).

**Título do Trabalho:** DESENVOLVIMENTO DE UM AMBIENTE GRÁFICO 2D UTILIZANDO O GAMEMAKER STUDIO 2 **Autores:** Eduardo &amp; Ana **Engine:** GameMaker (Linguagem GML - GameMaker Language)

---

## Tecnologias e Arquitetura

* **Engine:** GameMaker Studio 2 (GML)
* **Arquitetura:** Máquina de Estados Finitos (FSM - Finite State Machine)
* **Recursos Técnicos:** Colisão hermética com máscara estática (spr\_cat\_mask), física de pulo tolerante (Coyote Time), deslocamento rápido (Dash), Wall Jump e trepidação de câmera (Screen Shake).

---

## Controles do Jogo

| Comando          | Tecla                                 | Descrição                                                   |
| ---------------- | ------------------------------------- | ----------------------------------------------------------- |
| **Movimentação** | A / D ou Seta Esquerda / Seta Direita | Mover personagem para a esquerda/direita                    |
| **Pulo**         | Espaço                                | Pulo simples, Coyote Time nas bordas e Wall Jump em paredes |
| **Dash**         | Shift                                 | Deslocamento rápido horizontal                              |
| **Ataque**       | J                                     | Golpe de espada em curta distância                          |

---

## Pré-requisitos: Baixando e Instalando o GameMaker

Para abrir e executar o projeto, você precisará ter o GameMaker instalado no seu computador:

1. **Baixar o GameMaker:**  
  * Acesse o site oficial do GameMaker ([gamemaker.io](https://gamemaker-io.translate.goog/en?_x_tr_sl=en&_x_tr_tl=pt&_x_tr_hl=pt&_x_tr_pto=tc&_x_tr_hist=true)).
  * Clique em Download Gratuito (Windows ou macOS).
2. **Instalar:**  
  * Execute o instalador baixado e siga o assistente padrão de instalação.
3. **Criar / Fazer Login na Conta:**  
  * Ao abrir o GameMaker pela primeira vez, faça login com a sua conta Opera / YoYo Games (é possível criar uma conta gratuita).

---

## Como Baixar e Rodar o Projeto

### Opção 1: Baixar como arquivo ZIP (Mais simples)

1. No topo da página do repositório no GitHub, clique no botão verde Code.
2. Selecione a opção Download ZIP.
3. Extraia a pasta compactada no seu computador.
4. Abra o GameMaker Studio 2.
5. Na tela inicial da IDE, clique em Open (Abrir) e navegue até a pasta extraída.
6. Selecione o arquivo do projeto com extensão .yyp (ex: projeto\_jogo\_tcc.yyp).

### Opção 2: Clonar via Git (Para desenvolvedores)

Caso tenha o Git instalado em sua máquina:

1. Abra o terminal (Prompt de Comando ou Git Bash).
2. Execute o comando de clonagem com a URL do seu repositório.
3. Abra o GameMaker Studio 2, clique em Open e selecione o arquivo .yyp dentro da pasta clonada.

---

## Executando o Jogo

Assim que o projeto carregar na interface do GameMaker:

1. Aguarde a barra de progresso no canto inferior carregar todos os assets.
2. Pressione a tecla F5 do seu teclado (ou clique no ícone do botão Play no canto superior esquerdo da tela).
3. O jogo será compilado e a janela da partida será iniciada automaticamente!
