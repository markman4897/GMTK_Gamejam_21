extends Node

# should i add .new() every time i change scenes?
var menu = preload("res://screens/Menu.tscn")
var lvl1 = preload("res://screens/lvl1.tscn")
var lvl2 = preload("res://screens/lvl2.tscn")
var lvl3 = preload("res://screens/lvl3.tscn")
var lvl4 = preload("res://screens/lvl4.tscn")
var lvl5 = preload("res://screens/lvl5.tscn")
var lvl6 = preload("res://screens/lvl6.tscn")
var scenes = [lvl1, lvl2, lvl3, lvl4, lvl5, lvl6]

var active_ball_id = 0

func goals_cleared() -> void:
	var _var = get_tree().change_scene_to(menu)

func change_scene(scene:int) -> void:
	var s = scenes[scene]
	var _var = get_tree().change_scene_to(s)
	active_ball_id = 0

func _process(delta: float) -> void:
	print(active_ball_id)
