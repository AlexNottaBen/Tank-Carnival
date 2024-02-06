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

func _ready():
	randomize()
	bullet = preload("res://scenes/Enemy Bullet.tscn")
	defeated = preload("res://scenes/Defeated Enemy2.tscn")

func fire():
	reload_time = round(rand_range(min_reload_time, max_reload_time))
	var new_bullet = bullet.instance()
	var new_bullet2 = bullet.instance()
	var new_bullet3 = bullet.instance()
	get_parent().add_child(new_bullet)
	get_parent().add_child(new_bullet2)
	get_parent().add_child(new_bullet3)
	new_bullet.global_transform.origin = $CollisionShape/Firepoint.global_transform.origin
	new_bullet2.global_transform.origin = $CollisionShape/Firepoint2.global_transform.origin
	new_bullet3.global_transform.origin = $CollisionShape/Firepoint3.global_transform.origin
	new_bullet.direction = direction
	new_bullet2.direction = direction
	new_bullet3.direction = direction


func _on_MeleeAttackArea_body_entered(body):
	if body != self:
		# print(body.name)
		if body.has_method("take_damage") and body.name == "Player":
			body.take_damage(melee_damage)
