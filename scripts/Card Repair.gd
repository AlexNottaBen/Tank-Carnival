extends Button

func _on_Card_Repair_pressed():
	get_node("../../").visible = false
	get_node("../../../Player").durability = get_node("../../../Player").max_durability
	get_node("../../../").play_bonus_take_sound()
	Global.paused = false
