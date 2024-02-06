# Copyright (c) 2024 AlexNottaBen
#
# This software product is licensed under the terms of
# GNU General Public License version 3 (GPLv3) or any newer version.
# Please check the LICENSE file in the project root directory
# to obtain the full text of the license.
#
# WARNING: This software product is provided without any warranty.
# See the LICENSE file for details.

extends "res://scripts/Enemy.gd"

export var melee_damage = 80

var rocket = preload("res://scenes/Enemy Rocket.tscn")

func _ready():
	randomize()
	defeated = preload("res://scenes/Defeated Enemy5.tscn")

func fire():
	reload_time = round(rand_range(min_reload_time, max_reload_time))
	var new_rocket = rocket.instance()
	var new_rocket2 = rocket.instance()
	var new_rocket3 = rocket.instance()
	var new_rocket4 = rocket.instance()
	get_parent().add_child(new_rocket)
	get_parent().add_child(new_rocket2)
	get_parent().add_child(new_rocket3)
	get_parent().add_child(new_rocket4)
	new_rocket.global_transform.origin = $CollisionShape/Firepoint.global_transform.origin
	new_rocket2.global_transform.origin = $CollisionShape/Firepoint2.global_transform.origin
	new_rocket3.global_transform.origin = $CollisionShape/Firepoint3.global_transform.origin
	new_rocket4.global_transform.origin = $CollisionShape/Firepoint4.global_transform.origin
	new_rocket.direction = direction
	new_rocket2.direction = direction
	new_rocket3.direction = direction
	new_rocket4.direction = direction

func _on_MeleeAttackArea_body_entered(body):
	if body != self:
		print(body.name)
		if body.has_method("take_damage") and body.name == "Player":
			body.take_damage(melee_damage)
