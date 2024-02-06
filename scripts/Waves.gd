# Copyright (c) 2024 AlexNottaBen
#
# This software product is licensed under the terms of
# GNU General Public License version 3 (GPLv3) or any newer version.
# Please check the LICENSE file in the project root directory
# to obtain the full text of the license.
#
# WARNING: This software product is provided without any warranty.
# See the LICENSE file for details.

extends Spatial

export var number_of_enemies = 5
export var square_size = 55
export var enemy_scene = preload("res://scenes/Enemy.tscn")
export var enemy2_scene = preload("res://scenes/Enemy 2.tscn")
export var enemy3_scene = preload("res://scenes/Enemy 3.tscn")
export var enemy4_scene = preload("res://scenes/Enemy 4.tscn")
export var enemy5_scene = preload("res://scenes/Enemy 5.tscn")
export var enemy6_scene = preload("res://scenes/Enemy 6.tscn")

var score = 0
var enemies = 0
var wave = 1

var is_enemy4_spawned = false
var is_enemy5_spawned = false
var is_enemy6_spawned = false

func _ready():
	for i in range(number_of_enemies):
		randomize()
		var new_body = enemy_scene.instance()
		var choose_type = round(rand_range(0, 5))

		if choose_type==1:
			new_body = enemy2_scene.instance()
		elif choose_type==2:
			new_body = enemy3_scene.instance()
		elif choose_type==3 and not is_enemy4_spawned:
			new_body = enemy4_scene.instance()
			is_enemy4_spawned = true
		elif choose_type==4 and not is_enemy5_spawned and not is_enemy6_spawned:
			new_body = enemy5_scene.instance()
			is_enemy5_spawned = true
		elif choose_type==5 and not is_enemy6_spawned:
			new_body = enemy6_scene.instance()
			is_enemy6_spawned = true

		elif choose_type==3:
			new_body = enemy_scene.instance()
		elif choose_type==4:
			new_body = enemy2_scene.instance()
		elif choose_type==5:
			new_body = enemy3_scene.instance()
		add_child(new_body)

		print(is_enemy4_spawned,is_enemy5_spawned,is_enemy6_spawned)

		var posX = 0.0
		var posY = 1.0
		var posZ = 0.0

		var side = round(rand_range(0, 3))
		var edge_position = rand_range(-square_size/2, square_size/2)
		# print("side",side)
		# print("edgePos",edgePos)
		if side==0:
			posX = edge_position
			posZ = -square_size/2
		elif side==1:
			posX = edge_position
			posZ = square_size/2
		elif side==2:
			posX = -square_size/2
			posZ = edge_position
		elif side==3:
			posX = square_size/2
			posZ = edge_position

		new_body.translation = Vector3(posX, posY, posZ)
		print(choose_type)
		enemies += 1

func _process(delta):
	if enemies == 0:
		next_wave()


func enemies_decrement():
	enemies -= 1
	if enemies < 0:
		enemies = 0
	score += 100 * Global.multipiller
	print("Enemies left: ", enemies)


func next_wave():
	is_enemy4_spawned = false
	is_enemy5_spawned = false
	is_enemy6_spawned = false
	wave += 1
	number_of_enemies += 1
	Global.increase_multipiller()
	Global.paused = true
	$"../Card Selection"._ready()
	$"../Card Selection".visible = true
	_ready()
