extends "res://scripts/Enemy.gd"

func _ready():
	randomize()
	bullet = preload("res://scenes/Enemy SmallBullet.tscn")
	defeated = preload("res://scenes/Defeated Enemy4.tscn")
