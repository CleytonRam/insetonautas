extends Node2D

func _ready():
	print("DEBUG: BattleScene carregada")
	
	# Cria o BattleManager programaticamente
	var battle_manager = BattleManager.new()
	battle_manager.name = "BattleManager"
	add_child(battle_manager)
	
	print("DEBUG: BattleManager criado programaticamente")