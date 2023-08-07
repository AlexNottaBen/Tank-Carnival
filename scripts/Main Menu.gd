extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	if settings.is_mobile:
		$"Name Label".rect_scale = Vector2(2.5, 2.5)
		$"Name Label".rect_position.x = $"Name Label".rect_position.x/2
		$VBoxContainer.rect_scale = Vector2(2.5, 2.5)

func _on_Start_Game_Button_pressed():
	$".".visible = false
	$"../Difficulty Menu".visible = true
	if settings.sounds_enabled:
		$"../Sounds/ClickSound".play()


func _on_Settings_Button_pressed():
	$".".visible = false
	$"../Settings Menu".visible = true
	if settings.sounds_enabled:
		$"../Sounds/ClickSound".play()
	

func _on_About_Button_pressed():
	$".".visible = false
	$"../About Screen".visible = true
	if settings.sounds_enabled:
		$"../Sounds/ClickSound".play()

func _on_Exit_Button_pressed():
	if settings.sounds_enabled:
		$"../Sounds/ClickSound".play()
	get_tree().quit()
