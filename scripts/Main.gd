extends Node2D

func _ready():
	GameManager.player = $Ball

func _process(_delta):
	$VectorCreator.position = $Ball.position
