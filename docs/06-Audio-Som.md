# Audio e Som

## Trilhas Sonoras Principais

### Músicas Essenciais
1. **Tema do Laboratório** - Melodia científica e curiosidade
2. **Exploração no Parque** - Ambiente natural e relaxante
3. **Batalha Contra Insetos** - Ritmo energético mas não intenso
4. **Batalha Contra Negligentes** - Tom mais sombrio e urgente
5. **Esconderijo dos Negligentes** - Ambiente tenso e misterioso

### Estilo Musical
- **Gênero:** Chiptune melódico com elementos naturais
- **BPM:** 120-140 (batalhas), 80-100 (exploração)
- **Instrumentação:** Sintetizadores 8-bit + sons ambientais naturais

## Efeitos Sonoros Prioritários

### Interface (Alta Prioridade)
- [ ] Navegação de menu
- [ ] Seleção de opção
- [ ] Confirmação de ação
- [ ] Abertura/fechamento de menus

### Batalha (Alta Prioridade)
- [ ] Ataques básicos
- [ ] Habilidades especiais
- [ ] Dano recebido
- [ ] Captura bem-sucedida
- [ ] Vitória/derrota

### Ambiente (Média Prioridade)
- [ ] Passos em diferentes superfícies
- [ ] Insetos ambientais (grilos, abelhas)
- [ ] Interação com objetos

### Personagens (Baixa Prioridade)
- [ ] Vozes dos NPCs (sons não verbais)
- [ ] Som característico por tipo de inseto

## Implementação Godot 4.4

### Estrutura de Audio
Audio/
├── Music/
│ ├── exploration.tres
│ ├── battle.tres
│ └── laboratory.tres
├── SFX/
│ ├── UI/
│ ├── Battle/
│ └── Environment/
└── Voices/
├── dr_entomos/
└── cascudo/
### Configuração Técnica
- **Formato:** OGG Vorbis para música, WAV para SFX
- **Sample Rate:** 44100 Hz
- **Canais:** Estéreo para música, mono para SFX
- **Streaming:** Apenas para músicas longas