extends "res://scripts/Bullet.gd"

func _ready():
	speed = 0

func _physics_process(delta):
	var Velocity = Vector3()
	
	if direction == "Up":
		Velocity.z = -1 * speed
		$CollisionShape.rotation_degrees = Vector3(0,0,0)
		
	elif direction == "Down":
		Velocity.z = 1 * speed	
		$CollisionShape.rotation_degrees = Vector3(0,-180,0)
		
	elif direction == "Left":
		Velocity.x = -1 * speed
		$CollisionShape.rotation_degrees = Vector3(0,90,0)
		
	elif direction == "Right":
		Velocity.x = 1 * speed
		$CollisionShape.rotation_degrees = Vector3(0,-90,0)
	
	if not Global.paused:
		if speed < 30:
			speed += 1
		Velocity = move_and_slide(Velocity, Vector3.UP)
