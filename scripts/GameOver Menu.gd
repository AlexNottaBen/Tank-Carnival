extends Control


func _ready():
	if settings.is_mobile:
		$"Game Over Label".rect_scale = Vector2(2, 2)
		$"Game Over Label".rect_position.x -= 210
		$"Game Over Label".rect_position.y -= 100
		$HBoxContainer.rect_scale = Vector2(2, 2)
		$HBoxContainer.rect_position.x -= 250


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
