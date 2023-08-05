extends Button

func _on_Card_Damage_pressed():
	get_node("../../").visible = false
	get_node("../../../Player").damage += 100
	get_node("../../../").play_bonus_take_sound()
	Global.paused = false
