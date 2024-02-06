# Copyright (c) 2024 AlexNottaBen
#
# This software product is licensed under the terms of
# GNU General Public License version 3 (GPLv3) or any newer version.
# Please check the LICENSE file in the project root directory
# to obtain the full text of the license.
#
# WARNING: This software product is provided without any warranty.
# See the LICENSE file for details.

extends "res://scripts/Bullet.gd"

func _ready():
	speed = 0

func _physics_process(delta):
	var Velocity = Vector3()

	if direction == "Up":
		Velocity.z = -1 * speed
		$CollisionShape.rotation_degrees = Vector3(0,0,0)

	elif direction == "Down":
		Velocity.z = 1 * speed
		$CollisionShape.rotation_degrees = Vector3(0,-180,0)

	elif direction == "Left":
		Velocity.x = -1 * speed
		$CollisionShape.rotation_degrees = Vector3(0,90,0)

	elif direction == "Right":
		Velocity.x = 1 * speed
		$CollisionShape.rotation_degrees = Vector3(0,-90,0)

	if not Global.paused:
		if speed < 30:
			speed += 1
		Velocity = move_and_slide(Velocity, Vector3.UP)
