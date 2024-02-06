# Copyright (c) 2024 AlexNottaBen
#
# This software product is licensed under the terms of
# GNU General Public License version 3 (GPLv3) or any newer version.
# Please check the LICENSE file in the project root directory
# to obtain the full text of the license.
#
# WARNING: This software product is provided without any warranty.
# See the LICENSE file for details.

extends Node

var difficulty = "Medium"

var multipiller = 1

var paused = false

func go_to_scene(scene):
	get_tree().change_scene("res://scenes/" + scene + ".tscn")

func increase_multipiller():
	multipiller += 0.1

func reset_multipiller():
	multipiller = 1
