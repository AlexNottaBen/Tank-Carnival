extends KinematicBody

var speed = 25
var direction = "Up"
var damage

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
		Velocity = move_and_slide(Velocity, Vector3.UP)

func stop():
	if not Global.paused:
		queue_free()
	else:
		$Lifetime.start()

func _on_Lifetime_timeout():
	stop()

func _on_Area_body_entered(body):
	if body != self and body.name != "Player":
		# print(body.name)
		if body.has_method("take_damage"):
			body.take_damage(damage)
			stop()
		elif body.has_method("fall_down"):
			body.fall_down()
			
