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
		$"Durability Bar".rect_scale = Vector2(2.5, 2.5)
		$"Durability Bar".rect_position.x = ($"Durability Bar".rect_position.x) - 200
		$"Enemies Left Icon".rect_scale = Vector2(1, 1)
		$"Waves Label".rect_scale = Vector2(2.5, 2.5)
		$"Waves Label".rect_position.x = ($"Waves Label".rect_position.x/1.5) + 200
		$"Score Label".rect_scale = Vector2(2.5, 2.5)
		$"Score Label".rect_position.x = (get_viewport().size.x/2) - 172
	else:
		$"Durability Bar".rect_position.y += 50


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$"Durability Bar".value = $"../Player".durability*100/($"../Player".max_durability)
	$"Enemies Left Icon/Enemies Left Label".text = str($"../Waves".enemies)
	$"Waves Label".bbcode_text = "[right]" + "Wave " + str($"../Waves".wave) + " [/right]"
	$"Score Label".bbcode_text = "[center]" + str($"../Waves".score) + " [/center]"
