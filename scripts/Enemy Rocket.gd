extends "res://scripts/Rocket.gd"

func _ready():
	damage = 300 * Global.multipiller

func _on_Area_body_entered(body):
	if body != self:
		if body.has_method("take_damage"):
			# print(body.name)
			stop()
			if body.name == "Player":
				body.take_damage(damage)
		elif body.has_method("fall_down"):
			body.fall_down()
