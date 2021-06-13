extends Node2D

func _on_Area2D_body_entered(body: Node) -> void:
	var s_b = get_tree().get_nodes_in_group("smart_border")
	for i in s_b:
		i.visible = false
		i.get_node("StaticBody2D/CollisionShape2D").set_deferred("disabled", true)

func _on_Area2D_body_exited(body: Node) -> void:
	var s_b = get_tree().get_nodes_in_group("smart_border")
	for i in s_b:
		i.visible = true
		i.get_node("StaticBody2D/CollisionShape2D").set_deferred("disabled", false)
