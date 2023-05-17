extends Node2D

func _ready():
	GameManager.in_game = false
	MusicController._play_soundtrack()
	
func _on_play_pressed():
	MusicController._click_play()
	get_tree().change_scene("res://scenes/Level1.tscn")


func _on_quit_pressed():
	MusicController._click_play()
	get_tree().quit()


func _on_options_pressed():
	MusicController._click_play()
	get_tree().change_scene("res://scenes/Options.tscn")
