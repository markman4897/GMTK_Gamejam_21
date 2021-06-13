extends Node2D

var entered = false

func _on_Area2D_body_entered(body: Node) -> void:
	entered = true
	var goals = get_tree().get_nodes_in_group("goal")
	var check = true
	for i in goals:
		if i.get("entered") == false:
			check = false
	if check:
		Singleton.goals_cleared()

func _on_Area2D_body_exited(body: Node) -> void:
	entered = false
