# Arte e Style Guide

## Direção Artística Geral

### Estilo Visual
- **Arte:** Pixel Art nostálgico (estilo GBA/SNES)
- **Inspirações:** Pokémon Emerald, Stardew Valley, Celeste
- **Princípio:** "Simples mas expressivo"

### Resoluções e Tamanhos
- **Tela do Jogo:** 320x180 pixels (escalável para 1280x720)
- **Tiles:** 16x16 pixels
- **Sprites Personagens:** 16x24 pixels (overworld)
- **Sprites Batalha:** 64x64 pixels (insetos)
- **UI Elements:** Múltiplos de 8 pixels

## Paleta de Cores Principal

### Cores da Natureza
```css
/* Verdes - Vegetação */
--verde-pastagem: #7CB518
--verde-floresta: #2D5A27  
--verde-claro: #A3B18A
--verde-musgo: #4A6670

/* Terras e Marrons */
--marrom-terra: #8B4513
--marrom-claro: #A0522D
--marrom-arenoso: #DEB887

/* Céus e Água */
--azul-ceu: #87CEEB
--azul-profundo: #4682B4
```

### Cores dos insetos
```css 
/* Abelha */
--amarelo-abelha: #FFD700
--preto-abelha: #2F2F2F

/* Joaninha */
--vermelho-joaninha: #D22B2B
--preto-detalhes: #1A1A1A

/* Formiga */
--preto-formiga: #2F2F2F
--marrom-formiga: #654321

/* Aranha */
--marrom-aranha: #8B7355
--laranja-aranha: #D2691E

/* Borboleta */
--azul-borboleta: #4A90E2
--laranja-borboleta: #FF8C00

/* Libélula */
--verde-libélula: #32CD32
--azul-libélula: #1E90FF

/* Beija-flor */
--rosa-beija-flor: #FF69B4
--verde-beija-flor: #00FF00

/* Milipéses */
--laranja-milipes: #FF8C00
--marrom-milipes: #A0522D
```

### Cores da UI
```css 
/* Interface Principal */
--ui-background: #4A6670
--ui-accent: #A3B18A
--ui-highlight: #7CB518

/* Texto */
--text-primary: #FFFFFF
--text-secondary: #E0E0E0
--text-accent: #FFD700

/* Barras e Status */
--hp-green: #7CB518
--mp-blue: #4A90E2
--xp-purple: #8A2BE2
```
### Srites e Animações


### Personagens (Overworld)
- **Frames por Sprite:** 3 frames de animação

- **Direções:** 4 (Baixo, Cima, Esquerda, Direita)

### Personagens (Overworld)
- **Frames por Sprite:** 3 frames de animação
- **Direções:** 4 (Baixo, Cima, Esquerda, Direita)
- **Animações:**
  - Idle (respiração suave)
  - Walk (movimento)
  - Interaction (interagindo com objetos)

### Insetos em Batalha
- **Tamanho:** 64x64 pixels
- **Animação Idle:** 2-4 frames de movimento natural
- **Animação Ataque:** 3-5 frames de ação específica
- **Animação Dano:** Flash branco + movimento para trás
- **Animação Vitória:** Movimento feliz/comemorativo

### Tilesets
- **Camadas:**
  - Camada 1: Chão
  - Camada 2: Objetos/Decoração
  - Camada 3: Grama Alta (transparente)
- **Variantes por Área:**
  - Laboratório: Pisos limpos, equipamentos
  - Parque: Grama, flores, árvores, bancos
  - Esconderijo: Piso sujo, caixas, gaiolas

## Interface do Usuário

### Tela de Batalha

┌─────────────────────────────────┐
│         INIMIGO                 │
│      HP: ████████ 80/100        │
│                                 │
│          [Sprite Inimigo]       │
│                                 │
│          SEU INSETO             │
│      HP: ████████ 45/60         │
│          [Sprite Aliado]        │
├─────────────────────────────────┤
│ ATACAR  HABILIDADE  ITEM  FUGIR │
└─────────────────────────────────┘
### BugDex Design
- **Layout:** Caderno de campo antigo
- **Seções:**
  - Ilustração do inseto (128x128)
  - Dados básicos (nome, tipo, habitat)
  - Stats de batalha
  - Curiosidade científica
- **Progresso:** Índice com insetos capturados/avistados

### Menu Principal
- **Opções:** Nova Partida, Continuar, Configurações, Sair
- **Design:** Fundo do laboratório com interface limpa
- **Animação:** Insetos caminhando pelo fundo

## Assets List - Prioridades

### Sprites Obrigatórios (Semana 1-2)
- [ ] Protagonista (4 direções, 3 frames cada)
- [ ] Dr. Entomos (2 direções, 2 frames cada)
- [ ] 4 insetos iniciais: Formiga, Abelha, Joaninha, Aranha
- [ ] Tileset básico do laboratório e parque

### Sprites Secundários (Semana 2-3)
- [ ] 4 insetos restantes: Borboleta, Beija-flor, Libélula, Milipéses
- [ ] 3 inimigos: Escorpião, Barata, Centopeia
- [ ] Cascudo (líder dos Negligentes)
- [ ] Tileset do esconderijo

### UI e Efeitos (Semana 3)
- [ ] Elementos de interface (barras, botões, cursor)
- [ ] Efeitos visuais (dano, captura, evolução)
- [ ] Tela de título e menus
- [ ] Ícones de habilidades e itens

## Princípios de Design

### Para Personagens
- **Silhuetas Reconhecíveis:** Dá para identificar quem é só pela forma
- **Cores Consistentes:** Cada personagem tem paleta própria
- **Expressão Simples:** 1-2 pixels podem mudar toda a emoção

### Para Insetos
- **Formas Exageradas:** Destacar características principais
- **Cores da Natureza:** Mas um pouco mais vibrantes
- **Movimento Característico:** Cada inseto se move de forma única

### Para Ambientes
- **Profundidade:** 3 camadas (chão, objetos, efeitos)
- **Coerência:** Mesmo estilo em todas as áreas
- **Detalhes:** Pequenos elementos que contam histórias

## Ferramentas Recomendadas
- **Aseprite** (para pixel art)
- **Tiled** (para mapas)
- **Godot 4.4** (com suporte nativo a pixel art)