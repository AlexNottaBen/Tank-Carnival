extends Spatial

export var number_of_bodies = 250
export var spawn_area_size = Vector3(75, 0, 75)
export var tree_scene = preload("res://scenes/Tree.tscn")
export var bush_scene = preload("res://scenes/Bush.tscn")

func _ready():
	randomize()
	if settings.music_enabled:
		play_music()
	for i in range(number_of_bodies):
		print(number_of_bodies)
		var randomize_gen = round(rand_range(0,1))
		var new_body = tree_scene.instance()
		if randomize_gen == 1 or randomize_gen == 2:
			new_body = bush_scene.instance()
		$Level.add_child(new_body)
		
		var posX = rand_range(-spawn_area_size.x/2, spawn_area_size.x/2)
		var posY = 0
		var posZ = rand_range(-spawn_area_size.z/2, spawn_area_size.z/2)
		
		new_body.translation = Vector3(posX, posY, posZ)
		new_body.rotate_y(rand_range(-180,180))

func _process(delta):
	$DirectionalLight.shadow_enabled = settings.shadow_enabled

func _input(event):
	if event.is_action_pressed("ui_cancel"): # "Escape"
		toggle_pause()

func toggle_pause():
	if $Player.is_playng:
		Global.paused = not Global.paused
		if Global.paused:
			$"InGame Menu".show()
			$UI.visible = false
		else:
			$"InGame Menu".hide()
			$"Settings InGame Menu".hide()
			$"Card Selection".hide()
			$UI.visible = true
			
func play_bonus_take_sound():
	$Sounds/BonusTakeSound.play()

func play_music():
	var randomize_music = round(rand_range(0,1))
	if randomize_music == 0:
		$Music/SoundTrack1.play()
	elif randomize_music == 1:
		$Music/SoundTrack2.play()

func stop_music():
	$Music/SoundTrack1.stop()
	$Music/SoundTrack2.stop()
