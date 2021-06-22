extends Control

func _ready() -> void:
	var btn = preload("res://scenes/Button.tscn")
	
	for i in len(Singleton.scenes):
		var tmp = btn.instance()
		tmp.text = str(i+1)
		tmp.level_index = i
		$GridContainer.add_child(tmp)
