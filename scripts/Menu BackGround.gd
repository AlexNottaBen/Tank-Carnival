extends Spatial

func _process(delta):
	$DirectionalLight.shadow_enabled = settings.shadow_enabled
