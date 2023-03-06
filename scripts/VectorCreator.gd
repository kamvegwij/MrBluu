extends Area2D

signal vector_created(vector)

export var max_len: int = 200
export(NodePath) onready var ball = get_node(ball)
var pos_start: Vector2 = Vector2.ZERO
var pos_end: Vector2 = Vector2.ZERO
var vector: Vector2 = Vector2.ZERO

var touch_down: bool = false

func _ready():
	connect("input_event", self, "_on_input_event")
	
func _reset():
	pos_start = Vector2.ZERO
	pos_end = Vector2.ZERO
	vector = Vector2.ZERO
	update()
	
func _draw():
	pass
#	draw_line(pos_start - global_position, (pos_end - global_position), Color.yellow, 2)
#	draw_line(pos_start - global_position, pos_start - global_position + vector, Color.yellow, 2)
	
func _input(event):
	if !touch_down:
		return
		
	if event.is_action_released("click"):
		touch_down = false
		emit_signal("vector_created", vector)
		_reset()
		
	if event is InputEventMouseMotion:
		pos_end = event.position
		vector = -(pos_end - pos_start).clamped(max_len)
		update()
		
func _on_input_event(_viewport, event, _shape_idx):
	if event.is_action_pressed("click"):
		touch_down = true
		pos_start = event.position
	
