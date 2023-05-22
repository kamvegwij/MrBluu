extends Area2D

signal _reloading

func _player_collide(body):
	if body == GameManager.player.get_node("Ball"):
		MusicController._died_play()
		GameManager.player_health -= 25
		emit_signal("_reloading")
		yield(get_tree().create_timer(2), "timeout")
		get_tree().reload_current_scene()
