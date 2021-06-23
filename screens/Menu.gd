extends Control

func _ready() -> void:
	set_colors()
	
	Singleton.debug(false)
	
	var btn = preload("res://scenes/Button.tscn")
	
	for i in len(Singleton.scenes):
		var tmp = btn.instance()
		tmp.set_text(str(i+1))
		tmp.level_index = i
		$GridContainer.add_child(tmp)

func set_colors() -> void:
	$Title.add_color_override("font_color", Singleton.primary_dark)
