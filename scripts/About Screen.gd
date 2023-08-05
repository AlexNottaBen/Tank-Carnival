extends Control

func _on_Back_Button_pressed():
	if settings.sounds_enabled:
		$"../Sounds/ClickSound".play()
	$".".visible = false
	$"../Main Menu".visible = true
