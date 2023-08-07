extends Control


func _ready():
	$"Panel/Sounds Button".pressed = settings.sounds_enabled
	$"Panel/Music Button".pressed = settings.music_enabled
	$"Panel/Shadows Button".pressed = settings.shadow_enabled

	if settings.is_mobile:
		$"Name Label".rect_scale = Vector2(2, 2)
		$"Name Label".rect_position.x -= 250
		$Panel.rect_scale = Vector2(2, 2)
		$Panel.rect_position.y -= 100
		$Panel.rect_position.x -= 125

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

