extends Spatial

# func _on_VisibilityNotifier_camera_entered(camera):
#	$"../../".show()


# func _on_VisibilityNotifier_camera_exited(camera):
#	$"../../".hide()


func _on_VisibilityNotifier_screen_entered():
	if settings.culling_enabled:
		$"../../".show()


func _on_VisibilityNotifier_screen_exited():
	if settings.culling_enabled:
		$"../../".hide()
