# Copyright (c) 2024 AlexNottaBen
#
# This software product is licensed under the terms of
# GNU General Public License version 3 (GPLv3) or any newer version.
# Please check the LICENSE file in the project root directory
# to obtain the full text of the license.
#
# WARNING: This software product is provided without any warranty.
# See the LICENSE file for details.

extends KinematicBody

# Medium
export var speed = 5
export var damage = 200
var rocket_damage
export var max_reload_time = 40
var reload_time = max_reload_time
var rocket_reload_time = max_reload_time
var direction = "Up"
export var max_durability = 800
var durability = max_durability

var number_of_guns = 1
var number_of_rockets = 0

var is_playng = true

var bullet = preload("res://scenes/Bullet.tscn")
var rocket = preload("res://scenes/Rocket.tscn")

var defeated = preload("res://scenes/Defeated Player.tscn")

const clamp_radius = 40

func _ready():
	if Global.difficulty == "Easy":
		speed = 6
		max_reload_time = 35
		damage = 250
		max_durability = 1000
	elif Global.difficulty == "Hard":
		speed = 4
		max_reload_time = 45
		damage = 100
		max_durability = 500

	durability = max_durability

func destroy():
	if settings.sounds_enabled:
		$"Sounds/Explode Sound".pitch_scale = rand_range(0.8,1.5)
		$"Sounds/Explode Sound".play()
	$CollisionShape.disabled = true
	$CollisionShape/Model.visible = false
	$"../GameOver Menu".game_over()
	var defeated_instance = defeated.instance()
	get_parent().add_child(defeated_instance)
	defeated_instance.global_transform.origin = global_transform.origin
	defeated_instance.rotation_degrees = $CollisionShape.rotation_degrees
	is_playng = false

func take_damage(taken_damage):
	if is_playng:
		durability -= taken_damage
		if settings.sounds_enabled:
			play_hit_sound()
		if durability <= 0:
			destroy()

func play_hit_sound():
	randomize()
	var sounds = {
		"Sound1": $"Sounds/Hit Sound",
		"Sound2": $"Sounds/Hit Sound2",
		"Sound3": $"Sounds/Hit Sound3",
		"Sound4": $"Sounds/Hit Sound4",
	}
	sounds["Sound" + str((randi() % 4) + 1)].play()

func fire():
	reload_time = max_reload_time
	$"Sounds/Fire Sound".pitch_scale = rand_range(0.8,1.5)
	for i in range(number_of_guns):
		if settings.sounds_enabled:
			$"Sounds/Fire Sound".play()
	var new_bullet = bullet.instance()
	get_parent().add_child(new_bullet)
	new_bullet.global_transform.origin = $CollisionShape/Firepoint.global_transform.origin
	new_bullet.direction = direction
	new_bullet.damage = damage
	if number_of_guns > 1:
		new_bullet = bullet.instance()
		get_parent().add_child(new_bullet)
		new_bullet.global_transform.origin = $CollisionShape/Firepoint2.global_transform.origin
		new_bullet.direction = direction
		new_bullet.damage = damage
	if number_of_guns > 2:
		new_bullet = bullet.instance()
		get_parent().add_child(new_bullet)
		new_bullet.global_transform.origin = $CollisionShape/Firepoint3.global_transform.origin
		new_bullet.direction = direction
		new_bullet.damage = damage

func rocket_fire():
	rocket_reload_time = max_reload_time

	rocket_damage = 200 + damage

	var firepoints = {
		"Firepoint1": $CollisionShape/RocketLauncher/Firepoint,
		"Firepoint2": $CollisionShape/RocketLauncher/Firepoint2,
		"Firepoint3": $CollisionShape/RocketLauncher/Firepoint3,
		"Firepoint4": $CollisionShape/RocketLauncher/Firepoint4,
		"Firepoint5": $CollisionShape/RocketLauncher2/Firepoint,
		"Firepoint6": $CollisionShape/RocketLauncher2/Firepoint2,
		"Firepoint7": $CollisionShape/RocketLauncher2/Firepoint3,
		"Firepoint8": $CollisionShape/RocketLauncher2/Firepoint4,
	}

	for i in range(number_of_rockets):
		var new_rocket = rocket.instance()
		get_parent().add_child(new_rocket)
		if settings.sounds_enabled:
			$"Sounds/Fire Rocket Sound".play()
		var firepoint_path = "Firepoint" + str(i + 1)
		var firepoint = firepoints[firepoint_path]
		new_rocket.global_transform.origin = firepoint.global_transform.origin
		new_rocket.direction = direction
		new_rocket.damage = rocket_damage

func reload(delta):
	if reload_time != 0:
		reload_time -= 1
	if rocket_reload_time != 0:
		rocket_reload_time -= 0.5

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var position = get_global_transform().origin
	var Velocity = Vector3()
	# print(position)

	if Input.is_action_pressed("Up") and not Global.paused and is_playng:
		if position.z > -clamp_radius:
			Velocity.z = -1 * speed
		direction = "Up"
		$CollisionShape.rotation_degrees = Vector3(0,0,0)
	elif Input.is_action_pressed("Down") and not Global.paused and is_playng:
		if position.z < clamp_radius:
			Velocity.z = 1 * speed
		direction = "Down"
		$CollisionShape.rotation_degrees = Vector3(0,-180,0)
	elif Input.is_action_pressed("Left") and not Global.paused and is_playng:
		if position.x > -clamp_radius:
			Velocity.x = -1 * speed
		direction = "Left"
		$CollisionShape.rotation_degrees = Vector3(0,90,0)
	elif Input.is_action_pressed("Right") and not Global.paused and is_playng:
		if position.x < clamp_radius:
			Velocity.x = 1 * speed
		direction = "Right"
		$CollisionShape.rotation_degrees = Vector3(0,-90,0)

	if is_playng and not Global.paused:

		if number_of_guns > 1:
			$"CollisionShape/Right Gun".visible = true
		if number_of_guns > 2:
			$"CollisionShape/Left Gun".visible = true

		if number_of_rockets > 0:
			$CollisionShape/RocketLauncher.visible = true
		if number_of_rockets > 4:
			$CollisionShape/RocketLauncher2.visible = true

		if Input.is_action_pressed("Enter"):
			durability = 0
			destroy()

		Velocity.y = -9.8
		move_and_slide(Velocity, Vector3.UP)

func _physics_process(delta):
		if is_playng and not Global.paused:
			reload(delta)
			if Input.is_action_pressed("Fire") and reload_time == 0:
				fire()
			if Input.is_action_pressed("Fire") and rocket_reload_time == 0:
				rocket_fire()


func get_player_data():
	return "Max Durability: " + str(max_durability) + ", Speed: " + str(speed) + ", Damage: " + str(damage) + ", Rocket Damage: " + str(rocket_damage) + ", Recharge Time: " + str(max_reload_time)
