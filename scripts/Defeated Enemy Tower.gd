# Copyright (c) 2024 AlexNottaBen
#
# This software product is licensed under the terms of
# GNU General Public License version 3 (GPLv3) or any newer version.
# Please check the LICENSE file in the project root directory
# to obtain the full text of the license.
#
# WARNING: This software product is provided without any warranty.
# See the LICENSE file for details.

extends RigidBody

var impulse = Vector3.UP # impulse to up

func _ready():
	randomize()
	rotation_degrees = Vector3(randi()%180, 180, randi()%180)
	for _i in range(3):
		apply_impulse(Vector3(), impulse)
