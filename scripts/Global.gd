extends Node

var difficulty = "Medium"

var multipiller = 1

var paused = false

func go_to_scene(scene):
	get_tree().change_scene("res://scenes/" + scene + ".tscn")

func increase_multipiller():
	multipiller += 0.1

func reset_multipiller():
	multipiller = 1
