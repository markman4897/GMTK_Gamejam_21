extends Button

var level_index = 1

func _ready() -> void:
	set_colors()

func _on_Button_pressed() -> void:
	Singleton.change_scene(level_index)

func set_text(text: String) -> void:
	$Label.text = text

func set_colors() -> void:
	var new_stylebox = self.get_stylebox("normal").duplicate()
	new_stylebox.border_color = Singleton.primary_light

	self.add_stylebox_override("normal", new_stylebox)
	self.add_stylebox_override("hover", new_stylebox)
	self.add_stylebox_override("pressed", new_stylebox)
	
	$Label.add_color_override("font_color", Singleton.primary_dark)
