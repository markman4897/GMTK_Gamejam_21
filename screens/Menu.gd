extends Control

func _on_ItemList_item_selected(index: int) -> void:
	Singleton.change_scene(index)
