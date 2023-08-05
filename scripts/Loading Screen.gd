extends Control

func timer_start():
	$Timer.start(1)

func _on_Timer_timeout():
	Global.go_to_scene("World")
