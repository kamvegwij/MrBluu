extends Node2D
var swipe_start = null
var minimum_drag = 100

func _ready():
	$Sprite/AnimationPlayer.play("swipe")
func _process(_delta):
	#lower and raise volume
	GameManager.track_volume = $center/volume_scroll.value

func _unhandled_input(event):
	if event is InputEventScreenTouch:
		if event.pressed:
		  swipe_start = event.get_position()
		else:
		  _calculate_swipe(event.get_position())

func _calculate_swipe(swipe_end):
	
	if swipe_start == null:
		return
	var swipe = swipe_end - swipe_start
	if abs(swipe.x) > minimum_drag:
		if swipe.x > 0:
			get_tree().change_scene("res://scenes/Menu.tscn")
		else:
			pass
