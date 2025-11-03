extends Control

func _on_button_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main.tscn")



func _on_button_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/settings.tscn")



func _on_button_exit_pressed() -> void:
	get_tree().quit()
