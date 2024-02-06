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

func _on_Card_Reload_pressed():
	get_node("../../").visible = false
	if get_node("../../../Player").max_reload_time > 5:
		get_node("../../../Player").max_reload_time -= 5
		get_node("../../../").play_bonus_take_sound()
	Global.paused = false
