extends RigidBody2D

# where the ball should slowly go to
var pos := self.global_position
const SPD := 10
var mouse_in_ball := false
var moving := false

func _input(event) -> void:
	
	# this should be looked at closer and redone  
	if Input.is_action_pressed("left_click") and (moving or mouse_in_ball):
			if event is InputEventScreenTouch:
#				print("ping") # this shit only pings when you let go of the screen?!
				moving = false
			elif event is InputEventScreenDrag:
				moving = true
				pos = event.position
				self.linear_velocity = (pos - self.global_position) * SPD

func _on_Ball_mouse_entered() -> void:
	mouse_in_ball = true

func _on_Ball_mouse_exited() -> void:
	mouse_in_ball = false
