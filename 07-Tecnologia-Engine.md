# Tecnologia e Engine

## Configuração Godot 4.4

### Versão Específica
- **Godot 4.4.2** (última versão estável)
- **GDScript 2.0** (com tipagem opcional)
- **Renderização:** Compatibility (maior compatibilidade)

### Estrutura de Projeto
bug_battlers/
├── addons/ # Extensões
├── assets/
│ ├── audio/ # Músicas e SFX
│ ├── fonts/ # Fontes do jogo
│ └── translations/ # Localização
├── scenes/ # Cenas principais
├── scripts/ # Scripts GDScript
├── settings/ # Configurações
└── docs/ # Documentação

## Cenas Principais

### Core Systems
- **Main.tscn** - Ponto de entrada do jogo
- **GameManager.gd** - Estado global e save/load
- **SceneManager.gd** - Transições entre cenas
- **AudioManager.gd** - Controle de música e SFX

### Gameplay Systems
- **World.gd** - Gerenciamento do mundo aberto
- **BattleSystem.gd** - Lógica de batalha por turnos
- **Insect.gd** - Classe base para todos os insetos
- **QuestSystem.gd** - Gerenciamento de missões

### UI Systems
- **UIManager.gd** - Controle de interface
- **BattleUI.gd** - Interface de batalha
- **BugDex.gd** - Sistema de catalogação
- **DialogueSystem.gd** - Sistema de diálogos

## Sistemas Técnicos

### Sistema de Save
```gdscript
# SaveGame.gd
var save_data = {
    "player_name": String,
    "insects_caught": Array,
    "quests_completed": Array,
    "battle_stats": Dictionary,
    "game_time": float
}
```
### Sistema de Input
- **Teclado/Mouse:** - Controle principal

### Otimizações
- **Texture Atlases:** - Sprites agrupados
- **Object Pooling:** - Reuso de nós de batalha
- **LOD:** - Menos detalhes em áreas grandes
- **Culling:** - Descartar objetos fora de tela

### Plugins e Dependências
- **Essenciais**
    - **Dialogue Manager 3.0** - Sistema de diálogos
    - **Save System 4.0** - Gerenciamento de save games
- **Opicionais**
    - **Input System** - Controles multiplataforma
    - **Localization** - Suporte a múltiplos idiomas



