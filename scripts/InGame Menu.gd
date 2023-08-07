extends Control

func _ready():
	if settings.is_mobile:
		$"Name Label".rect_scale = Vector2(2, 2)
		$"Name Label".rect_position.x -= 250
		$VBoxContainer.rect_scale = Vector2(2, 2)
		$VBoxContainer.rect_position.y -= 200
		$VBoxContainer.rect_position.x -= 200

func _on_Continue_Button_pressed():
	if settings.sounds_enabled:
		$"../Sounds/ClickSound".play()
	$".".visible = false
	$"..".toggle_pause()

func _on_Restart_Button_pressed():
	if settings.sounds_enabled:
		$"../Sounds/ClickSound".play()
	Global.paused = false
	Global.multipiller = 1
	get_tree().reload_current_scene()

func _on_Settings_Button_pressed():
	if settings.sounds_enabled:
		$"../Sounds/ClickSound".play()
	$".".visible = false
	$"../Settings InGame Menu".visible = true


func _on_Stop_Button_pressed():
	if settings.sounds_enabled:
		$"../Sounds/ClickSound".play()
	$".".visible = false
	Global.go_to_scene("Menu")


func _on_Exit_Button_pressed():
	if settings.sounds_enabled:
		$"../Sounds/ClickSound".play()
	get_tree().quit()
