extends Button


func _on_Card_Gun_pressed():
	get_node("../../").visible = false
	get_node("../../../Player").number_of_guns += 1
	get_node("../../../").play_bonus_take_sound()
	Global.paused = false
