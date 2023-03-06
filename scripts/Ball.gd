extends RigidBody2D

func _ready():
	set_bounce(0.1)
	set_friction(0.5)
	
func _process(_delta):
	#rotation_degrees = 0.0
	pass
	
func launch(force: Vector2):
	apply_impulse(Vector2.ZERO, force)

