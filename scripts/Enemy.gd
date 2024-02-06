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

# Declare member variables here.
export var speed = 5
export var min_reload_time = 50
export var max_reload_time = 150
var reload_time = max_reload_time
var direction = "Up"

var destroyed = false
var is_defeated_instance_created = false

var max_durability = 250 * Global.multipiller
var durability = max_durability

const clamp_radius = 40

var bullet
var defeated

func fire():
	reload_time = round(rand_range(min_reload_time, max_reload_time))
	var new_bullet = bullet.instance()
	get_parent().add_child(new_bullet)
	new_bullet.global_transform.origin = $CollisionShape/Firepoint.global_transform.origin
	new_bullet.direction = direction

func reload():
	# print(reload_time)
	if reload_time != 0:
		reload_time -= 1

func take_damage(damage):
	if settings.sounds_enabled:
		get_node("../HitNotifySound").play()
	durability -= damage
	var durability_percent = durability * 100 / max_durability
	$"Durability Bar".set_value(durability_percent)
	if durability <= 0:
		destroy()

func destroy():
	if not destroyed:
		destroyed = true
		$CollisionShape.disabled = true
		if settings.sounds_enabled:
			get_node("../DestroyNotifySound").play()
		get_node("../../Waves").enemies_decrement()
		create_defeated_instance()
		queue_free()

func create_defeated_instance():
	if not is_defeated_instance_created:
		var defeated_instance = defeated.instance()
		get_parent().add_child(defeated_instance)
		defeated_instance.global_transform.origin = global_transform.origin
		defeated_instance.rotation_degrees = $CollisionShape.rotation_degrees
		is_defeated_instance_created = true

func _ready():
	randomize()
	bullet = preload("res://scenes/Enemy Bullet.tscn")
	defeated = preload("res://scenes/Defeated Enemy.tscn")

func _physics_process(delta):
	var position = get_global_transform().origin
	var Velocity = Vector3()

	reload()

	# print(position)

	if direction == "Up":
		if position.z > -clamp_radius:
			Velocity.z = -1 * speed
			$CollisionShape.rotation_degrees = Vector3(0,0,0)

	elif direction == "Down":
		if position.z < clamp_radius:
			Velocity.z = 1 * speed
			$CollisionShape.rotation_degrees = Vector3(0,-180,0)

	elif direction == "Left":
		if position.x > -clamp_radius:
			Velocity.x = -1 * speed
			$CollisionShape.rotation_degrees = Vector3(0,90,0)

	elif direction == "Right":
		if position.x < clamp_radius:
			Velocity.x = 1 * speed
			$CollisionShape.rotation_degrees = Vector3(0,-90,0)

	if not Global.paused:
		Velocity.y = -9.8

		Velocity = move_and_slide(Velocity, Vector3.UP)

		if reload_time == 0:
			fire()

func choose_random(rand_list):
	return rand_list[randi() % rand_list.size()]

func _on_DirectionTimer_timeout():
	var directions = ["Up","Down","Left","Right"]
	if not Global.paused:
		direction = choose_random(directions)
