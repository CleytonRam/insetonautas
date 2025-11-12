extends Node2D

@onready var interaction_label = $Label
@export var next_scene: String = "res://scenes/World/house_interior.tscn"

var player_in_range = false

func _on_area_2d_body_exited(body:Node2D) -> void:
	if body.is_in_group("player"):
		player_in_range = false
		interaction_label.hide()


func _on_area_2d_body_entered(body:Node2D) -> void:
	if body.is_in_group("player"):
		player_in_range = true
		interaction_label.show()

func _input(event):
	if player_in_range and event.is_action_pressed("ui_accept"):
		if next_scene:
			get_tree().change_scene_to_file(next_scene)
		else:
			print("Próxima cena não definida")