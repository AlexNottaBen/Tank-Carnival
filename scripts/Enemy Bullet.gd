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
	damage = 100 * Global.multipiller

func _on_Area_body_entered(body):
	if body != self:
		if body.has_method("take_damage"):
			stop()
			if body.name == "Player":
				# print(body.name)
				body.take_damage(damage)
		elif body.has_method("fall_down"):
			body.fall_down()
