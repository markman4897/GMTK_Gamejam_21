extends Node2D

func _on_Area2D_body_entered(_body: Node) -> void:
	var s_b = get_tree().get_nodes_in_group("smart_border")
	for i in s_b:
		i.visible = false
		i.get_node("StaticBody2D/CollisionShape2D").set_deferred("disabled", true)

func _on_Area2D_body_exited(_body: Node) -> void:
	var check = true
	for node in get_tree().get_nodes_in_group("trigger"):
		if node.get_node("Area2D").get_overlapping_bodies().size() != 0:
			check = false
	
	if check:
		var s_b = get_tree().get_nodes_in_group("smart_border")
		for i in s_b:
			i.visible = true
			i.get_node("StaticBody2D/CollisionShape2D").set_deferred("disabled", false)
