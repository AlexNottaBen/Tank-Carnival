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
		$"Game Over Label".rect_scale = Vector2(2, 2)
		$"Game Over Label".rect_position.x -= 210
		$"Game Over Label".rect_position.y -= 100
		$HBoxContainer.rect_scale = Vector2(2, 2)
		$HBoxContainer.rect_position.x -= 250


func game_over():
	$"../Card Selection".hide()
	$"../".stop_music()
	$Timer.start()

func _on_Restart_Button_pressed():
	if settings.sounds_enabled:
		$"../Sounds/ClickSound".play()
	Global.multipiller = 1
	get_tree().reload_current_scene()

func _on_Back_Button_pressed():
	if settings.sounds_enabled:
		$"../Sounds/ClickSound".play()
	Global.multipiller = 1
	Global.go_to_scene("Menu")


func _on_Timer_timeout():
	visible = true
	if settings.sounds_enabled:
		$GameOverSound.play()
