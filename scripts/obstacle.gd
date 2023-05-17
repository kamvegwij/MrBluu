extends Area2D

signal _reloading

func _player_collide(body):
	if body == GameManager.player:
		MusicController._died_play()
		GameManager.player_health -= 25
		emit_signal("_reloading")
		get_tree().reload_current_scene()
