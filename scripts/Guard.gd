extends KinematicBody2D

var direction = 1
var speed = 30
var health: int = 100

onready var pathfollow = get_parent()

export (String, "linear", "loop") var patrol_type = "linear"

func _ready():
	pass
	
func _physics_process(delta):
	if health <= 0:
		queue_free()
		
	$health.value = health
	
	guard_moving(delta)
	guard_attacking(delta)

func guard_moving(delta):
	if is_instance_valid(self):
		if patrol_type == "linear":
			if direction == 1:
				if pathfollow.unit_offset == 1:
					$Sprite.flip_h = true
					direction = 0
				else:
					pathfollow.offset += speed *delta
			else:
				if pathfollow.unit_offset == 0:
					$Sprite.flip_h = false
					direction = 1
				else:
					pathfollow.offset -= speed *delta
				
func guard_attacking(delta):
	pass

func _on_Area2D_area_entered(area):
	if area.get_parent() == GameManager.player:
		GameManager.player.get_node("Ball").apply_impulse(Vector2.ZERO, Vector2(0,200))
		GameManager.player_health -= 30
