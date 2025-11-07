class_name BattleMove
extends Resource

@export var name: String = ""
@export var type: int = 0 # Type do TypeSystem
@export var power: int = 0
@export var accuracy: int = 100 # em porcentagem
@export var max_pp: int = 10
@export var category: int = 0 # 0 = Físico, 1 = Especial, 2 = Status
@export var priority: int = 0 # para ordem de ação