extends Button

var level_index = 1

func _on_Button_pressed() -> void:
	Singleton.change_scene(level_index)
