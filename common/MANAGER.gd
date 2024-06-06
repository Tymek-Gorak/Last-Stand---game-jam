extends Node

var battle_scene = "res://SceneScenes/battle.tscn"
var flashback_scene = "res://SceneScenes/flashback.tscn"


var player_deaths := 0



func player_died():
	player_deaths += 1
	print(player_deaths, get_tree().current_scene.owner is FlashbackLogic)
	if player_deaths == 1:
		get_tree().change_scene_to_packed(load(flashback_scene))
	elif get_tree().current_scene.owner is FlashbackLogic:
		get_tree().change_scene_to_packed(load(flashback_scene))
	else:
		get_tree().change_scene_to_packed(load(battle_scene))
		
