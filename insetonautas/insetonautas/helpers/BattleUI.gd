class_name BattleUI
extends CanvasLayer

signal action_selected(action)

# CORREÇÃO: Caminhos relativos ao BattleUI (CanvasLayer)
@onready var message_label: Label = $MessageLabel
@onready var actions_menu: Control = $ActionsMenu
@onready var move_buttons: Array = [
	$ActionsMenu/Move1, $ActionsMenu/Move2, 
	$ActionsMenu/Move3, $ActionsMenu/Move4
]
@onready var run_button: Button = $ActionsMenu/RunButton
@onready var player_insect_info: Control = $PlayerInsectInfo
@onready var enemy_insect_info: Control = $EnemyInsectInfo

func _ready():
	# Debug para verificar se encontrou os nós
	print("MessageLabel encontrado: ", message_label != null)
	print("ActionsMenu encontrado: ", actions_menu != null)
	
	for i in range(move_buttons.size()):
		if move_buttons[i]:
			move_buttons[i].pressed.connect(_on_move_button_pressed.bind(i))
		else:
			print("ERRO: Move button ", i, " não encontrado!")
	
	if run_button:
		run_button.pressed.connect(_on_run_button_pressed)
	else:
		print("ERRO: RunButton não encontrado!")

func _on_move_button_pressed(index: int):
	emit_signal("action_selected", {
		"type": "move",
		"move_index": index
	})

func _on_run_button_pressed():
	emit_signal("action_selected", {
		"type": "run"
	})

func set_actions_visible(visible: bool):
	if actions_menu:
		actions_menu.visible = visible

func update_insect_info(insect: InsectEntity, is_player: bool):
	var info_node = player_insect_info if is_player else enemy_insect_info
	if info_node and insect:
		info_node.get_node("NameLabel").text = insect.name
		info_node.get_node("LevelLabel").text = "Lv." + str(insect.level)
		info_node.get_node("HPLabel").text = str(insect.current_hp) + "/" + str(insect.max_hp)
		
		var hp_bar = info_node.get_node("HPBar")
		if hp_bar:
			hp_bar.max_value = insect.max_hp
			hp_bar.value = insect.current_hp

func show_message(message: String):
	if message_label:
		message_label.text = message