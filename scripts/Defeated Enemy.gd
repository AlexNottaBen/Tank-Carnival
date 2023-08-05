extends KinematicBody

func _on_LifeTimeTimer_timeout():
	queue_free()

func _on_VisibilityNotifier_screen_exited():
	queue_free()
