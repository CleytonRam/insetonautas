extends Camera2D

@export var target: Node2D
@export var ease: float = 5.0

func _ready():
	# Torna esta câmera a ativa
	make_current()
	
	# Se não definiu o alvo pelo inspector, tenta encontrar automaticamente
	if !target:
		target = get_parent().get_node("Player")  # Ajuste o nome

func _process(delta):
	if target:
		# Cálculo simples e seguro - não afeta o player
		var wanted_position = target.global_position
		global_position = global_position.lerp(wanted_position, ease * delta)