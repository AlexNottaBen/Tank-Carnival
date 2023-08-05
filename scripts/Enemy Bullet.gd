extends "res://scripts/Bullet.gd"

func _ready():
	damage = 100 * Global.multipiller

func _on_Area_body_entered(body):
	if body != self:
		if body.has_method("take_damage"):
			stop()
			if body.name == "Player":
				# print(body.name)
				body.take_damage(damage)
		elif body.has_method("fall_down"):
			body.fall_down()
