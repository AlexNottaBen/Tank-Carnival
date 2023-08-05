extends Button

func _on_Card_Armor_pressed():
	get_node("../../").visible = false
	get_node("../../../Player").max_durability += 250
	get_node("../../../Player").durability += 250
	get_node("../../../").play_bonus_take_sound()
	Global.paused = false
