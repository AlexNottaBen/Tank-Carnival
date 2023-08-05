extends Button

func _on_Card_Rocket_pressed():
	get_node("../../").visible = false
	get_node("../../../Player").number_of_rockets += 1
	get_node("../../../").play_bonus_take_sound()
	Global.paused = false
