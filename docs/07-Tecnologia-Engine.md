# Tecnologia e Engine

## Configuração Godot 4.4

### Versão Específica
- **Godot 4.4.2** (estável)
- **GDScript 2.0** com tipagem para melhor manutenção
- **Renderização:** Compatibility para maior alcance

### Nova Estrutura de Projeto
bug_battlers/
├── scenes/
│ ├── world/ # Cenas do mundo aberto
│ ├── interiors/ # Casa, escola, laboratório
│ ├── ui/ # Interfaces do usuário
│ └── characters/ # NPCs e jogador
├── scripts/
│ ├── core/ # Sistemas principais
│ ├── gameplay/ # Mecânicas de jogo
│ └── ui/ # Controles de interface
├── assets/
│ ├── dialogue/ # Arquivos .dialogue
│ └── educational/ # Conteúdo educativo
└── docs/ # Documentação

## Cenas Principais (Atualizadas)

### Core Systems
- **GameManager** - Progresso educativo e save/load
- **DialogueManager** - Sistema de conversas
- **QuestManager** - Controle de missões educativas
- **BugDexManager** - Catalogação de insetos

### Gameplay Systems  
- **ExplorationPlayer** - Movimento e interação
- **InsectSpawner** - Geração de insetos no mundo
- **AreaManager** - Transição entre locais
- **TimeManager** - Ciclo dia/noite para insetos

### UI Systems
- **DialogueUI** - Interface de conversas
- **BugDexUI** - Enciclopédia interativa
- **QuestJournal** - Registro de missões
- **EducationalQuiz** - Sistema de perguntas

## Sistemas Técnicos Adaptados

### Sistema de Save (Atualizado)
```gdscript
# SaveGame.gd - Foco em progresso educativo
var save_data = {
    "player_name": String,
    "discovered_insects": Array,      # Insetos encontrados
    "completed_quests": Array,        # Missões concluídas
    "educational_score": int,         # Pontuação em quizzes
    "npc_relationships": Dictionary,  # Relacionamentos
    "game_time": float,
    "player_position": Vector2
}
```
### Sistema de Input
- **Movimento** - WASD/Setas
- **Interação** - Espaço
- **Menu** - ESC
- **BugDex** - B

### Otimizações para Exploração
- **Backgorund Loading** - Transições suaves entre áreas
- **Object Pooling** - Reuso de nós de insetos
- **Culling** - Otimização para mundo aberto
- **LOD** - Menos detalhes em áreas distantes

### Plugins e Dependências
- Essenciais Mantidos
 - Dialogue Manager 3.0
 - Save System 4.0
- Novas Considerções
 - Quest System
 - Localization