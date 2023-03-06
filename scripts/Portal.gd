extends Area2D


func _on_Portal_body_entered(body):
	if body == GameManager.player:
		GameManager.scene_level += 1
		get_tree().change_scene("res://scenes/Level" + str(GameManager.scene_level) + ".tscn")
