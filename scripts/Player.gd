extends Node2D

func _ready():
	GameManager.player = self
	
func _physics_process(delta):
	$VectorCreator.position = $Ball.position
