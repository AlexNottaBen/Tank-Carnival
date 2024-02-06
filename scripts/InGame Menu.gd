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
		$"Name Label".rect_scale = Vector2(2, 2)
		$"Name Label".rect_position.x -= 250
		$VBoxContainer.rect_scale = Vector2(2, 2)
		$VBoxContainer.rect_position.y -= 200
		$VBoxContainer.rect_position.x -= 200

func _on_Continue_Button_pressed():
	if settings.sounds_enabled:
		$"../Sounds/ClickSound".play()
	$".".visible = false
	$"..".toggle_pause()

func _on_Restart_Button_pressed():
	if settings.sounds_enabled:
		$"../Sounds/ClickSound".play()
	Global.paused = false
	Global.multipiller = 1
	get_tree().reload_current_scene()

func _on_Settings_Button_pressed():
	if settings.sounds_enabled:
		$"../Sounds/ClickSound".play()
	$".".visible = false
	$"../Settings InGame Menu".visible = true


func _on_Stop_Button_pressed():
	if settings.sounds_enabled:
		$"../Sounds/ClickSound".play()
	$".".visible = false
	Global.go_to_scene("Menu")


func _on_Exit_Button_pressed():
	if settings.sounds_enabled:
		$"../Sounds/ClickSound".play()
	get_tree().quit()
