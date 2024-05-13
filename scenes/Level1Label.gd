extends Area2D


func _on_body_entered(body):
	print(body.name)
	if (body.name == "CharacterBody2D"):
		get_tree().change_scene_to_file("res://scenes/main.tscn")
