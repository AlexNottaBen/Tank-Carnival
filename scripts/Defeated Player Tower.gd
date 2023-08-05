extends RigidBody

var impulse = Vector3.UP # impulse to up

func _ready():
	var number_of_guns = get_node("../../Player").number_of_guns
	if number_of_guns > 1:
		$"Right Gun".visible = true
	if number_of_guns > 2:
		$"Left Gun".visible = true
	randomize()
	rotation_degrees = Vector3(randi()%180, 180, randi()%180)
	for _i in range(3):
		apply_impulse(Vector3(), impulse)
