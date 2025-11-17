extends Area2D



@export var next_scene: String = "res://scenes/World/house_interior.tscn"
@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "enter_house"

var player_in_range = false

func _on_area_2d_body_exited(body:Node2D) -> void:
	if body.is_in_group("player"):
		player_in_range = false


func _on_area_2d_body_entered(body:Node2D) -> void:
	if body.is_in_group("player"):
		player_in_range = true

func _input(event):
	if player_in_range and event.is_action_pressed("ui_accept"):
		if next_scene:
			DialogueManager.show_dialogue_balloon(dialogue_resource, dialogue_start)
			get_tree().change_scene_to_file(next_scene)
		else:
			print("Próxima cena não definida")



