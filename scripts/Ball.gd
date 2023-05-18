extends RigidBody2D

enum CharacterClass{ DAMAGE_OUT = 15, BOOST = 5}
var shot_fired: bool = false
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
	if !shot_fired and !boosting:
		$gui/info.text = "shooting cooling down"
		$gui/info.visible = true
		shot_fired = true
		$shooter.visible = true
		yield(get_tree().create_timer(2), "timeout")
		$shooter.visible = false
		$gui/info.visible = false
		shot_fired = false
		
	
func boost():
	if !boosting and !shot_fired and GameManager.player_health > 50:
		boosting = true
		$gui/info.text = "boosting cooling down"
		$gui/info.visible = true
		apply_impulse(Vector2.ZERO, Vector2(250, 0))
		yield(get_tree().create_timer(5), "timeout")
		$gui/info.visible = false
		boosting = false
		
