extends Node2D


@onready var coco: CharacterBody2D = %Coco



func _ready():
	$AudioTheme.play()