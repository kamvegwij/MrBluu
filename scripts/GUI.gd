extends CanvasLayer

signal attacking()
signal boosting()



func _on_attack_pressed():
	emit_signal("attacking")


func _on_boost_pressed():
	emit_signal("boosting")
