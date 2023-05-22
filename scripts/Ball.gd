extends RigidBody2D

enum CharacterClass{ DAMAGE_OUT = 15, BOOST = 5}

var boosting: bool = false

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

func attack():
	pass
	
func boost():
	if !boosting and GameManager.player_health > 50:
		boosting = true
		$gui/info.text = "burst cooling down"
		$gui/info.visible = true
		apply_impulse(Vector2.ZERO, Vector2(500, 0))
		yield(get_tree().create_timer(5), "timeout")
		$gui/info.visible = false
		boosting = false
		
	elif !boosting and GameManager.player_health < 50:
		$gui/info.text = "increase heath to burst!"
		$gui/info.visible = true
		
