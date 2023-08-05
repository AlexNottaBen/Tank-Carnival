extends Control

func game_over():
	$"../Card Selection".hide()
	$"../".stop_music()
	$Timer.start()

func _on_Restart_Button_pressed():
	if settings.sounds_enabled:
		$"../Sounds/ClickSound".play()
	Global.multipiller = 1
	get_tree().reload_current_scene()

func _on_Back_Button_pressed():
	if settings.sounds_enabled:
		$"../Sounds/ClickSound".play()
	Global.multipiller = 1
	Global.go_to_scene("Menu")


func _on_Timer_timeout():
	visible = true
	if settings.sounds_enabled:
		$GameOverSound.play()
