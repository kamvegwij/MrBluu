extends Area2D

signal _reloading

func _player_collide(body):
	if body == GameManager.player:
		emit_signal("_reloading")
		get_tree().reload_current_scene()
