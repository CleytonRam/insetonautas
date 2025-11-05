@tool
class_name InsectData
extends Resource

@export_category("Basic Info")
@export var name: String = "Inseto"
@export_enum("Polinizador", "Predador", "Praga", "Decompositor") var type: int = 0
@export_range(1, 100) var level: int = 1

@export_category("Base Stats")
@export_range(1, 100) var base_hp: int = 10
@export_range(1, 100) var base_attack: int = 10
@export_range(1, 100) var base_defense: int = 10
@export_range(1, 100) var base_special_attack: int = 10
@export_range(1, 100) var base_special_defense: int = 10
@export_range(1, 100) var base_speed: int = 10

@export_category("Moves")
@export var moves: Array[Move] = []

# Esta função ajuda a converter para string nos botões
func get_type_name() -> String:
	match type:
		0: return "Polinizador"
		1: return "Predador"
		2: return "Praga"
		3: return "Decompositor"
		_: return "Desconhecido"