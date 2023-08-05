extends Control


func _ready():
	$"Sounds Button".pressed = settings.sounds_enabled
	$"Music Button".pressed = settings.music_enabled
	$"Shadows Button".pressed = settings.shadow_enabled


func _on_Back_Button_pressed():
	if settings.sounds_enabled:
		$"../Sounds/ClickSound".play()
	$".".visible = false
	$"../InGame Menu".visible = true


func _on_Shadows_Button_toggled(button_pressed):
	if settings.sounds_enabled:
		$"../Sounds/ClickSound".play()
	settings.shadow_enabled = button_pressed


func _on_Sounds_Button_toggled(button_pressed):
	settings.sounds_enabled = button_pressed
	if settings.sounds_enabled:
		$"../Sounds/ClickSound".play()


func _on_Music_Button_toggled(button_pressed):
	if settings.sounds_enabled:
		$"../Sounds/ClickSound".play()
	settings.music_enabled = button_pressed
	if settings.music_enabled:
		$"..".play_music()
	else:
		$"..".stop_music()

