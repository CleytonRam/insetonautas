extends Node

signal state_changed(new_state: String)

# Estados globais possíveis
var current_state: String = "exploration"
var player_insects: Array = []
var battle_instance: Node = null

func _ready():
	# Cria insetos iniciais do jogador para teste
	create_test_insects()

func create_test_insects():
	# Formiga de teste
	var formiga = InsectEntity.new()
	formiga.name = "Formiga"
	formiga.type = TypeSystem.Type.DECOMPOSER
	formiga.level = 5
	formiga.base_hp = 25
	formiga.base_attack = 15
	formiga.base_defense = 20
	formiga.base_special_attack = 10
	formiga.base_special_defense = 15
	formiga.base_speed = 10
	
	# Movimentos da formiga
	var mordida = Move.new()
	mordida.name = "Mordida"
	mordida.type = TypeSystem.Type.PREDATOR
	mordida.power = 40
	mordida.accuracy = 100
	mordida.max_pp = 15
	mordida.category = 0
	
	var trabalho_equipe = Move.new()
	trabalho_equipe.name = "Trabalho em Equipe"
	trabalho_equipe.type = TypeSystem.Type.DECOMPOSER
	trabalho_equipe.power = 0
	trabalho_equipe.accuracy = 100
	trabalho_equipe.max_pp = 10
	trabalho_equipe.category = 2
	
	# CORREÇÃO: Adiciona movimentos usando add_move()
	formiga.add_move(mordida)
	formiga.add_move(trabalho_equipe)
	
	formiga.calculate_stats()
	player_insects = [formiga]

func set_state(new_state: String) -> void:
	if current_state == new_state:
		return
	current_state = new_state
	print("[STATE] -> ", new_state)
	state_changed.emit(new_state)

func start_battle(player_team: Array, enemy_team: Array):
	set_state("battle")
	
	# Carrega a cena de batalha
	var battle_scene = preload("res://BattleScene.tscn")
	battle_instance = battle_scene.instantiate()
	get_tree().root.add_child(battle_instance)
	
	# Configura o BattleManager
	var battle_manager = battle_instance.get_node("BattleManager")
	battle_manager.player_insects = player_team
	battle_manager.enemy_insects = enemy_team
	
	# Conecta os sinais
	battle_manager.battle_ended.connect(_on_battle_ended)
	battle_manager.message_received.connect(_on_battle_message)

func _on_battle_ended(result: int):
	set_state("exploration")
	if battle_instance:
		battle_instance.queue_free()
		battle_instance = null
	
	match result:
		0: print("Você perdeu a batalha!")
		1: print("Você venceu a batalha!")
		2: print("Você fugiu da batalha!")

func _on_battle_message(message: String):
	print("[BATTLE] ", message)


#region AREA DEBUG
func _input(event):
	if event.is_action_pressed("ui_accept") and current_state == "exploration":
		# Teste rápido com Enter
		print("Teste de batalha iniciado via Enter")
		
		# Cria inimigo de teste
		var enemy_insect = InsectEntity.new()
		enemy_insect.name = "Abelha Teste"
		enemy_insect.type = TypeSystem.Type.POLLINATOR
		enemy_insect.level = 5
		enemy_insect.base_hp = 20
		enemy_insect.base_attack = 18
		enemy_insect.base_defense = 12
		enemy_insect.base_special_attack = 15
		enemy_insect.base_special_defense = 12
		enemy_insect.base_speed = 25
		
		var ferrao = Move.new()
		ferrao.name = "Ferrão"
		ferrao.type = TypeSystem.Type.PREDATOR
		ferrao.power = 40
		ferrao.accuracy = 95
		ferrao.max_pp = 15
		ferrao.category = 0
		
		enemy_insect.add_move(ferrao)
		enemy_insect.calculate_stats()
		
		start_battle(player_insects, [enemy_insect])
#endregion
