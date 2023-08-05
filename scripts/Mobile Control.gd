extends CanvasLayer

var is_mobile = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if is_mobile:
		show()
	else:
		hide()
