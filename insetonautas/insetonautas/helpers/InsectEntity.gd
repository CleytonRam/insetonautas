class_name InsectEntity
extends Resource

@export var name: String = ""
@export var type: int = 0
@export var level: int = 1

@export var base_hp: int = 10
@export var base_attack: int = 10
@export var base_defense: int = 10
@export var base_special_attack: int = 10
@export var base_special_defense: int = 10
@export var base_speed: int = 10

# REMOVA a linha @export var moves: Array[Move] = []
# Vamos gerenciar os moves de forma diferente

var max_hp: int = 0
var current_hp: int = 0
var attack: int = 0
var defense: int = 0
var special_attack: int = 0
var special_defense: int = 0
var speed: int = 0

var moves: Array = []  # SEM @export
var current_pp: Dictionary = {}

func _init():
	calculate_stats()

func calculate_stats():
	max_hp = (2 * base_hp * level) / 100 + level + 10
	attack = (2 * base_attack * level) / 100 + 5
	defense = (2 * base_defense * level) / 100 + 5
	special_attack = (2 * base_special_attack * level) / 100 + 5
	special_defense = (2 * base_special_defense * level) / 100 + 5
	speed = (2 * base_speed * level) / 100 + 5
	
	current_hp = max_hp
	
	# Inicializa PP para cada movimento
	for move in moves:
		if move is Move:  # Verifica se é um Move válido
			current_pp[move.name] = move.max_pp

func take_damage(damage: int) -> bool:
	current_hp -= damage
	if current_hp <= 0:
		current_hp = 0
		return true
	return false

func is_fainted() -> bool:
	return current_hp <= 0

# Função para adicionar movimentos de forma segura
func add_move(move: Move):
	if move and move is Move:
		moves.append(move)
		current_pp[move.name] = move.max_pp