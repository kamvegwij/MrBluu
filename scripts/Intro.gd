extends Node2D

func _ready():
	$ColorRect/text/AnimationPlayer.play("name")
	GameManager.in_game = true
	yield(get_tree().create_timer(3), "timeout")
	get_tree().change_scene("res://scenes/Menu.tscn")
