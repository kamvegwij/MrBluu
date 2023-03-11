extends Node2D

func _ready():
	GameManager.player = $Ball

func _process(_delta):
	$VectorCreator.position = $Ball.position
	
	if GameManager.scene_level == 1:
		var dialog = Dialogic.start("EnterAngryRed")
		add_child(dialog)
		dialog.connect("timeline_end", self, "after_dialog")

func _after_dialog():
	print("Introduced AngryRed")
