extends RigidBody2D

# where the ball should slowly go to
var pos := self.global_position
const SPD := 10
var mouse_in_ball := false
var moving := false

func _input(event) -> void:
	# if mouse down run move func  
	if (Input.is_action_pressed("left_click") and (event is InputEventMouseButton or InputEventMouseMotion or InputEventScreenTouch or InputEventScreenDrag)) and (moving or mouse_in_ball):
		moving = true
		pos = event.position
		self.linear_velocity = (pos - self.global_position) * 10
	else:
		moving = false

func _on_Ball_mouse_entered() -> void:
	mouse_in_ball = true

func _on_Ball_mouse_exited() -> void:
	mouse_in_ball = false
