extends Control

const card_speed_scene = preload("res://scenes/Card Speed.tscn")
const card_repair_scene = preload("res://scenes/Card Repair.tscn")
const card_armor_scene = preload("res://scenes/Card Armor.tscn")
const card_damage_scene = preload("res://scenes/Card Damage.tscn")
const card_reload_scene = preload("res://scenes/Card Reload.tscn")
const card_gun_scene = preload("res://scenes/Card Gun.tscn")
const card_rocket_scene = preload("res://scenes/Card Rocket.tscn")

var deck = [card_speed_scene, card_repair_scene, card_armor_scene, card_damage_scene, card_reload_scene, card_gun_scene, card_rocket_scene]

func _ready():
	
	if settings.is_mobile:
		$"Text Label".rect_position.y += 65
	
	randomize()
	deck.shuffle()
	var number_of_guns = get_node("../Player").number_of_guns
	if number_of_guns > 2:
		deck.erase(card_gun_scene)
	var number_of_rockets = get_node("../Player").number_of_rockets
	if number_of_rockets > 7:
		deck.erase(card_rocket_scene)
	print(deck)
	place_card(deck, "Card Place", 0)
	place_card(deck, "Card Place2", 1)
	place_card(deck, "Card Place3", 2)
	$"Panel/Player Properties Label".bbcode_text = "[center]" + $"../Player".get_player_data() + "[/center]"

func place_card(card_scenes, nodename, index):
	var card_instance = card_scenes[index].instance()
	get_node(nodename).add_child(card_instance)
	card_instance.rect_position.x = rect_position.x
	card_instance.rect_position.y = rect_position.y

func _on_Decline_Button_pressed():
	hide()
	Global.paused = false
