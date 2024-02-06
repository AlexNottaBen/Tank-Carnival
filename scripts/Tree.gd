# Copyright (c) 2024 AlexNottaBen
#
# This software product is licensed under the terms of
# GNU General Public License version 3 (GPLv3) or any newer version.
# Please check the LICENSE file in the project root directory
# to obtain the full text of the license.
#
# WARNING: This software product is provided without any warranty.
# See the LICENSE file for details.

extends StaticBody

func _ready():
	$AnimationPlayer.playback_speed = 2

func destroy():
	$CollisionShape.disabled = true
	$Area/CollisionShape.disabled = true
	$AnimationPlayer.play("Fall Down")

func fall_down():
	destroy()

func _on_Area_body_entered(body):
	if body == self or body.has_method("fall_down"):
		return
	# print(body)
	if body.name == "Player":
		look_at(body.global_transform.origin, Vector3.UP)
	fall_down()
