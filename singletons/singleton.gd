extends Node

var menu = preload("res://screens/Menu.tscn")
var lvl1 = preload("res://screens/lvl1.tscn")
var lvl2 = preload("res://screens/lvl2.tscn")
var lvl3 = preload("res://screens/lvl3.tscn")
var lvl4 = preload("res://screens/lvl4.tscn")
var scenes = [lvl1, lvl2, lvl3, lvl4]

func goals_cleared() -> void:
	get_tree().change_scene_to(menu)

func change_scene(scene:int) -> void:
	print(scene)
	var s = scenes[scene]
	get_tree().change_scene_to(s)
