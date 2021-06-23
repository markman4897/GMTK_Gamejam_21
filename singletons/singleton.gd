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

# Theme colors
const background = Color("#ffffff")
const primary_light = Color("#20a1f7")
const primary_dark = Color("#0c3f60")
const secondary_light = Color("#ff0000")
const secondary_dark = Color("#790000")

var debug = false
var active_ball_id = 0

func goals_cleared() -> void:
	var _var = get_tree().change_scene_to(menu)

func change_scene(scene:int) -> void:
	var s = scenes[scene]
	var _var = get_tree().change_scene_to(s)
	active_ball_id = 0

func debug(state:bool) -> void:
	if state == debug:
		return
	
	debug = state
	if state:
		var d = preload("res://scenes/debug.tscn")
		get_tree().get_root().add_child(d.instance())
	else:
		get_tree().get_root().get_node("debug").queue_free()

func write_to_debug(text:String) -> void:
	if not debug:
		debug(true)
	
	var n = get_tree().get_root().get_node("debug/RichTextLabel")
	n.text = n.text + "\n" + text
