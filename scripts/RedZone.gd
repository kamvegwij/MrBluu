extends Area2D

var in_zone: bool = false

func _process(_delta):
	do_damage()
	
func _player_entered(body):
	if body == GameManager.player and !GameManager.in_dialog:
		print("player in red zone!!")
		in_zone = true

func do_damage():
	if in_zone:
		GameManager.player_health -= 0.05
	else:
		pass


func _on_RedZone_body_exited(body):
	if body == GameManager.player:
		in_zone = false
