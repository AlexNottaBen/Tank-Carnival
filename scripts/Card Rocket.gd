# Copyright (c) 2024 AlexNottaBen
#
# This software product is licensed under the terms of
# GNU General Public License version 3 (GPLv3) or any newer version.
# Please check the LICENSE file in the project root directory
# to obtain the full text of the license.
#
# WARNING: This software product is provided without any warranty.
# See the LICENSE file for details.

extends Button

func _on_Card_Rocket_pressed():
	get_node("../../").visible = false
	get_node("../../../Player").number_of_rockets += 1
	get_node("../../../").play_bonus_take_sound()
	Global.paused = false
