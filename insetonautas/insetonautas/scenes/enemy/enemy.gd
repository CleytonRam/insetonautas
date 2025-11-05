extends Area2D

@export var enemy_data: EnemyData
@onready var sprite: Sprite2D = $Sprite2D

func _ready():
	body_entered.connect(_on_body_entered)
	

func _on_body_entered(body):
	if body.name == "Coco" and State.current_state == "exploration":
		print("Batalha iniciada!")
		start_battle()

func start_battle():
	if enemy_data:
		var enemy_insects = []
		
		for insect_data in enemy_data.insects:
			var insect = InsectEntity.new()
			insect.name = insect_data.name
			insect.type = insect_data.type
			insect.level = insect_data.level
			insect.base_hp = insect_data.base_hp
			insect.base_attack = insect_data.base_attack
			insect.base_defense = insect_data.base_defense
			insect.base_special_attack = insect_data.base_special_attack
			insect.base_special_defense = insect_data.base_special_defense
			insect.base_speed = insect_data.base_speed
			
			# CORREÇÃO: Adiciona movimentos um por um
			for move in insect_data.moves:
				insect.add_move(move)
			
			insect.calculate_stats()
			enemy_insects.append(insect)
		
		State.start_battle(State.player_insects, enemy_insects)