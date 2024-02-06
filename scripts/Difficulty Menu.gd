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
	Global.paused = false
	if settings.is_mobile:
		$"Name Label".rect_scale = Vector2(2.5, 2.5)
		$"Name Label".rect_position.x = $"Name Label".rect_position.x/2
		$"VBoxContainer".rect_scale = Vector2(2.5, 2.5)

func _on_Easy_Button_pressed():
	Global.difficulty = "Easy"
	if settings.sounds_enabled:
		$"../Sounds/ClickSound".play()
	$"../Loading Screen".visible = true
	$"../Loading Screen".timer_start()


func _on_Medium_Button_pressed():
	Global.difficulty = "Medium"
	if settings.sounds_enabled:
		$"../Sounds/ClickSound".play()
	$"../Loading Screen".visible = true
	$"../Loading Screen".timer_start()


func _on_Hard_Button_pressed():
	Global.difficulty = "Hard"
	if settings.sounds_enabled:
		$"../Sounds/ClickSound".play()
	$"../Loading Screen".visible = true
	$"../Loading Screen".timer_start()


func _on_Back_Button_pressed():
	if settings.sounds_enabled:
		$"../Sounds/ClickSound".play()
	$".".visible = false
	$"../Main Menu".visible = true
