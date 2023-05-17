extends Area2D



func collect_health(body):
	if body == GameManager.player:
		MusicController._collect_play()
		GameManager.player_health +=  20
		queue_free()
		if GameManager.player_health >= 100:
			GameManager.player_coins += 1 #CONVERT THE HEALTH TO INGAME CURRENCY
