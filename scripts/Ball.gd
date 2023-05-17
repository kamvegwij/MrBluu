extends RigidBody2D

func _ready():
	$AnimationPlayer.play("mrbluu")
	set_bounce(0.1)
	set_friction(0.5)
	
func _process(_delta):
	$gui/health.value = GameManager.player_health
	$gui/top/bg/coins/num.text = str(GameManager.player_coins)
	$gui/top/leveltext.text = str(GameManager.player_level)
	$gui/top/scenelevel.text = str(GameManager.scene_level)
	
func launch(force: Vector2):
	apply_impulse(Vector2.ZERO, force)

