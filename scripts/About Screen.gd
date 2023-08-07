extends Control

func _ready():
	if settings.is_mobile:
		$"Name Label".rect_scale = Vector2(2.5, 2.5)
		$"Name Label".rect_position.x = $"Name Label".rect_position.x/2
		$"Credits Panel".rect_scale = Vector2(1.25, 1.25)

func _on_Back_Button_pressed():
	if settings.sounds_enabled:
		$"../Sounds/ClickSound".play()
	$".".visible = false
	$"../Main Menu".visible = true
