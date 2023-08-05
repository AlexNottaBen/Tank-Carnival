extends "res://scripts/Enemy.gd"

func _ready():
	randomize()
	bullet = preload("res://scenes/BallBullet.tscn")
	defeated = preload("res://scenes/Defeated Enemy3.tscn")
