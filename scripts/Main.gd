extends Node2D
#IMPORTANT! ADD TO EVERY LEVEL SCENE TO BE ABLE TO MOVE THE PLAYER!
func _ready():
	MusicController.stop_soundtrack()
	GameManager.in_game = true
	GameManager.player = $Ball
	
	if GameManager.scene_level == 4:
		GameManager.in_dialog = true
		var dialog = Dialogic.start("EnterAngryRed")
		add_child(dialog)
		dialog.connect("timeline_end", self, "after_dialog")
		get_node("npcCam").set_current(true)
		GameManager.player.sleeping = true
		
func _process(_delta):
	if GameManager.scene_level > 6:
		print("complete levels")
		
	if GameManager.player_health <= 0:
		get_tree().change_scene("res://scenes/GameOver.tscn")
		
	level_up()
	$VectorCreator.position = $Ball.position

func level_up():
	if GameManager.scene_level > 1:
		GameManager.player_level = 1
	if GameManager.scene_level > 3:
		GameManager.player_level = 2
	if GameManager.scene_level > 5:
		GameManager.player_level = 5
		
func _after_dialog():
	GameManager.in_dialog = true
	GameManager.player.sleeping = false
	get_node("npcCam").set_current(false)
