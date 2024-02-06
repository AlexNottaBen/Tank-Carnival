# Copyright (c) 2024 AlexNottaBen
#
# This software product is licensed under the terms of
# GNU General Public License version 3 (GPLv3) or any newer version.
# Please check the LICENSE file in the project root directory
# to obtain the full text of the license.
#
# WARNING: This software product is provided without any warranty.
# See the LICENSE file for details.

extends Control

func _ready():
	if settings.is_mobile:
		$"Name Label".rect_scale = Vector2(2.5, 2.5)
		$"Name Label".rect_position.x = $"Name Label".rect_position.x/2
		$"Credits Panel".rect_scale = Vector2(1.25, 1.25)

func _on_Back_Button_pressed():
	if settings.sounds_enabled:
		$"../Sounds/ClickSound".play()
	$".".visible = false
	$"../Main Menu".visible = true
