# Copyright (c) 2024 AlexNottaBen
#
# This software product is licensed under the terms of
# GNU General Public License version 3 (GPLv3) or any newer version.
# Please check the LICENSE file in the project root directory
# to obtain the full text of the license.
#
# WARNING: This software product is provided without any warranty.
# See the LICENSE file for details.

extends AnimatedSprite3D

# Called when the node enters the scene tree for the first time.
func _ready():
	play("Full")

func set_value(durability_percent):
	print("durability_percent ",durability_percent)
	if durability_percent > 75:
		play("Full")
	elif durability_percent > 50 and durability_percent <= 75:
		play("75")
	elif durability_percent > 25 and durability_percent <= 50:
		play("50")
	elif durability_percent > 10 and durability_percent <= 25:
		play("25")
	elif durability_percent > 0 and durability_percent <= 10:
		play("10")
	else:
		hide()
