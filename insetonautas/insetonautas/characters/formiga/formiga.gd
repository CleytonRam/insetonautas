extends CharacterBody2D




var direcao: int = 1
var posicao_inicial: Vector2

func _ready():
	$AnimatedSprite2D.play("idle")
