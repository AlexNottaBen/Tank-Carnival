extends Control

func _ready():
	Global.paused = false

func _on_Easy_Button_pressed():
	Global.difficulty = "Easy"
	if settings.sounds_enabled:
		$"../Sounds/ClickSound".play()
	$"../Loading Screen".visible = true
	$"../Loading Screen".timer_start()


func _on_Medium_Button_pressed():
	Global.difficulty = "Medium"
	if settings.sounds_enabled:
		$"../Sounds/ClickSound".play()
	$"../Loading Screen".visible = true
	$"../Loading Screen".timer_start()


func _on_Hard_Button_pressed():
	Global.difficulty = "Hard"
	if settings.sounds_enabled:
		$"../Sounds/ClickSound".play()
	$"../Loading Screen".visible = true
	$"../Loading Screen".timer_start()
	

func _on_Back_Button_pressed():
	if settings.sounds_enabled:
		$"../Sounds/ClickSound".play()
	$".".visible = false
	$"../Main Menu".visible = true
