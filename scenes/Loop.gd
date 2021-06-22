extends RigidBody2D

func _physics_process(_delta: float) -> void:
	if not self.mode == MODE_RIGID and $Area2D.get_overlapping_bodies().size() == 0:
		self.set_deferred("mode", MODE_RIGID)
		print(self.name+" unstuck")

func _on_body_entered(body: Node) -> void:
	if body.get_parent().is_in_group("smart_border"):
		self.set_deferred("mode", MODE_STATIC)
		print(self.name+" stuck")
