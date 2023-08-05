extends RigidBody

var impulse = Vector3.UP # impulse to up

func _ready():
	randomize()
	rotation_degrees = Vector3(randi()%180, 180, randi()%180)
	for _i in range(3):
		apply_impulse(Vector3(), impulse)
