extends Node
class_name BattleManager

signal battle_ended(result) # 0 = perdeu, 1 = ganhou, 2 = fugiu
signal message_received(message)

enum BattleState {
	SELECT_ACTION,
	EXECUTE_ACTIONS,
	SWITCH_INSECT,
	BATTLE_OVER
}

# CORREÇÃO: Busca a UI como filho direto
@onready var ui: BattleUI = $BattleUI

var player_insects: Array = []
var enemy_insects: Array = []
var current_player_insect: InsectEntity
var current_enemy_insect: InsectEntity

var battle_state: BattleState = BattleState.SELECT_ACTION
var player_action: Dictionary = {}
var enemy_action: Dictionary = {}
var action_queue: Array = []

func _ready():
	# Inicializa a batalha com os primeiros insetos
	if player_insects.size() > 0:
		current_player_insect = player_insects[0]
	if enemy_insects.size() > 0:
		current_enemy_insect = enemy_insects[0]
	
	# CORREÇÃO: Verifica se a UI existe antes de conectar
	if ui:
		ui.action_selected.connect(_on_action_selected)
		start_turn()
	else:
		push_error("BattleUI não encontrada!")

# ... resto do código permanece igual

func start_turn():
	battle_state = BattleState.SELECT_ACTION
	ui.set_actions_visible(true)
	ui.update_insect_info(current_player_insect, true)
	ui.update_insect_info(current_enemy_insect, false)

func _on_action_selected(action: Dictionary):
	player_action = action
	choose_enemy_action()
	determine_action_order()
	execute_actions()

func choose_enemy_action():
	# IA simples: escolhe movimento aleatório
	var available_moves = []
	for move in current_enemy_insect.moves:
		if current_enemy_insect.current_pp[move.name] > 0:
			available_moves.append(move)
	
	if available_moves.size() > 0:
		var move = available_moves[randi() % available_moves.size()]
		enemy_action = {"type": "move", "move": move}
	else:
		enemy_action = {"type": "move", "move": null}

func determine_action_order():
	action_queue.clear()
	
	action_queue.append({
		"insect": current_player_insect,
		"action": player_action,
		"is_player": true
	})
	action_queue.append({
		"insect": current_enemy_insect,
		"action": enemy_action,
		"is_player": false
	})
	
	# Ordena por prioridade e velocidade
	action_queue.sort_custom(_compare_actions)

func _compare_actions(a, b) -> bool:
	var a_priority = 0
	var b_priority = 0
	if a.action.type == "move" and a.action.move:
		a_priority = a.action.move.priority
	if b.action.type == "move" and b.action.move:
		b_priority = b.action.move.priority
	
	if a_priority != b_priority:
		return a_priority > b_priority
	
	return a.insect.speed > b.insect.speed

func execute_actions():
	battle_state = BattleState.EXECUTE_ACTIONS
	
	for action_info in action_queue:
		if battle_state == BattleState.BATTLE_OVER:
			break
		
		var insect = action_info.insect
		var action = action_info.action
		var is_player = action_info.is_player
		
		match action.type:
			"move":
				execute_move(insect, action.move, is_player)
			"run":
				execute_run(insect, is_player)  # Adicione esta linha

func execute_move(attacker: InsectEntity, move: Move, is_player: bool):
	var defender = current_enemy_insect if is_player else current_player_insect
	
	if randf() * 100 > move.accuracy:
		emit_signal("message_received", attacker.name + " errou o ataque!")
		return
	
	var damage = calculate_damage(attacker, defender, move)
	var defeated = defender.take_damage(damage)
	
	emit_signal("message_received", attacker.name + " usou " + move.name + "!")
	
	if defeated:
		emit_signal("message_received", defender.name + " foi derrotado!")
		handle_insect_defeated(is_player)

func calculate_damage(attacker: InsectEntity, defender: InsectEntity, move: Move) -> int:
	var level = attacker.level
	var power = move.power
	var attack_stat = attacker.attack if move.category == 0 else attacker.special_attack
	var defense_stat = defender.defense if move.category == 0 else defender.special_defense
	
	var base_damage = ((2 * level / 5 + 2) * power * attack_stat / defense_stat) / 50 + 2
	
	# Modificador de tipo
	var type_multiplier = TypeSystem.get_type_multiplier(move.type, defender.type)
	base_damage *= type_multiplier
	
	# Crítico
	if randi() % 16 == 0:
		base_damage *= 1.5
	
	# Variação aleatória
	base_damage *= randf_range(0.85, 1.0)
	
	return int(base_damage)

func handle_insect_defeated(is_player: bool):
	if is_player:
		if all_insects_fainted(player_insects):
			battle_state = BattleState.BATTLE_OVER
			emit_signal("battle_ended", 0)
		else:
			battle_state = BattleState.SWITCH_INSECT
			ui.prompt_switch_insect()
	else:
		if all_insects_fainted(enemy_insects):
			battle_state = BattleState.BATTLE_OVER
			emit_signal("battle_ended", 1)
		else:
			switch_enemy_insect()

func all_insects_fainted(insects: Array) -> bool:
	for insect in insects:
		if not insect.is_fainted():
			return false
	return true

func switch_enemy_insect():
	for insect in enemy_insects:
		if not insect.is_fainted():
			current_enemy_insect = insect
			ui.update_insect_info(current_enemy_insect, false)
			emit_signal("message_received", "Inimigo enviou " + insect.name + "!")
			break

func check_battle_over():
	if battle_state != BattleState.BATTLE_OVER:
		start_turn()

func execute_run(attacker: InsectEntity, is_player: bool):
	if is_player:
		# Chance de fugir baseada na velocidade
		var escape_chance = (current_player_insect.speed * 128) / current_enemy_insect.speed + 30
		if randi() % 256 < escape_chance:
			emit_signal("message_received", "Você fugiu da batalha!")
			emit_signal("battle_ended", 2)
		else:
			emit_signal("message_received", "Não foi possível fugir!")
	else:
		# Inimigos não fogem
		emit_signal("message_received", "O inimigo tentou fugir, mas não pode!")
