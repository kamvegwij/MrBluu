extends Node2D

func _ready():
	GameManager.player = $Ball
	
	if GameManager.scene_level == 4:
		var dialog = Dialogic.start("EnterAngryRed")
		add_child(dialog)
		dialog.connect("timeline_end", self, "after_dialog")
		get_node("npcCam").set_current(true)
		GameManager.player.sleeping = true
		
func _process(_delta):
	$VectorCreator.position = $Ball.position

func _after_dialog():
	GameManager.player.sleeping = true
	get_node("npcCam").set_current(false)
