extends Camera

func _process(delta):
	look_at($"..".global_transform.origin, Vector3.UP)
