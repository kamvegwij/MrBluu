extends RigidBody2D

func _ready():
	$AnimationPlayer.play("mrbluu")
	set_bounce(0.1)
	set_friction(0.5)
	
func _process(_delta):
	pass
	
func launch(force: Vector2):
	apply_impulse(Vector2.ZERO, force)

