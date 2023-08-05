extends Button

func _on_Card_Reload_pressed():
	get_node("../../").visible = false
	if get_node("../../../Player").max_reload_time > 5:
		get_node("../../../Player").max_reload_time -= 5
		get_node("../../../").play_bonus_take_sound()
	Global.paused = false
