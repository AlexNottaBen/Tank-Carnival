extends Button

func _on_Card_Speed_pressed():
	get_node("../../").visible = false
	get_node("../../../Player").speed += 2
	get_node("../../../").play_bonus_take_sound()
	Global.paused = false
