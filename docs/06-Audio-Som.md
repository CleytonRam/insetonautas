# Audio e Som

## Trilhas Sonoras Principais (Atualizadas)

### Músicas Essenciais para Exploração
1. **Tema da Casa** - Atmosfera caseira e aconchegante
2. **Escola do Dr. Entomos** - Melodia curiosa e intelectual
3. **Exploração no Parque** - Natureza vibrante e descobrimento
4. **Momento Educativo** - Tom de descoberta e realização
5. **Quiz de Conhecimento** - Ambiente de concentração

### Estilo Musical Adaptado
- **Gênero:** Trilha acústica relaxante com elementos naturais
- **BPM:** 70-90 (exploração), 50-70 (interiores), 100-120 (eventos)
- **Instrumentação:** Violão, piano, flauta, sons ambientais naturais
- **Transições:** Suaves entre áreas e estados de jogo

## Efeitos Sonoros Prioritários

### Interface (Alta Prioridade)
- [ ] Navegação de menus e diálogos
- [ ] Confirmação de coleta de insetos
- [ ] Abertura/fechamento da BugDex
- [ ] Notificação de nova missão

### Exploração (Alta Prioridade)
- [ ] Passos em diferentes superfícies (grama, madeira, interior)
- [ ] Interação bem-sucedida com objetos/NPCs
- [ ] Descoberta de novo inseto (som de "eureka!")
- [ ] Transição entre áreas

### Ambiente (Média Prioridade)
- [ ] Sons naturais do parque (pássaros, vento, água)
- [ ] Insetos ambientais (grilos, abelhas zumbindo)
- [ ] Atmosfera de interior (escola, casa)
- [ ] Eventos climáticos (chuva, vento)

### Educativo (Média Prioridade)
- [ ] Resposta correta no quiz (positivo)
- [ ] Resposta incorreta no quiz (neutro/encorajador)
- [ ] Completar missão (realização)
- [ ] Nova entrada na BugDex (descoberta)

## Implementação Godot 4.4

### Nova Estrutura de Audio

Audio/
├── Music/
│ ├── exploration/
│ │ ├── park_theme.tres
│ │ └── forest_theme.tres
│ ├── interiors/
│ │ ├── home_theme.tres
│ │ └── school_theme.tres
│ └── events/
│ ├── discovery.tres
│ └── quiz.tres
├── SFX/
│ ├── ui/
│ │ ├── menu_navigate.wav
│ │ └── bugdex_open.wav
│ ├── exploration/
│ │ ├── insect_collect.wav
│ │ └── footsteps/
│ └── educational/
│ ├── quiz_correct.wav
│ └── quest_complete.wav
└── Ambient/
├── nature_day.tres
├── nature_night.tres
└── interior_school.tres

### Configuração Técnica
- **Formato:** OGG Vorbis para música (compressão eficiente)
- **SFX:** WAV 16-bit para qualidade e rápido carregamento
- **Sample Rate:** 44100 Hz padrão
- **Canais:** Estéreo para música, mono para a maioria dos SFX
- **Streaming:** Apenas para músicas de fundo longas
- **Pool de Audio:** Para SFX frequentes (passos, interações)