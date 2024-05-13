extends Area2D

@onready var game_manager = %GameManager
@export var requiredPoints: int
@export var nextScene: PackedScene

func _on_body_entered(body):
	print(body.name)
	if (body.name == "CharacterBody2D"):
		if (game_manager.getPoints() >= requiredPoints):
			get_tree().change_scene_to_packed(nextScene)
		else:
			get_tree().reload_current_scene()
