extends RigidBody2D

# where the ball should slowly go to
onready var pos := self.global_position
const SPD := 10
var U_ID := self.get_instance_id()
var mouse_in_ball := false
var moving := false

var is_it_pressed := false
var is_it_screentouch := false
var is_it_screendrag := false
var is_it_mousebutton := false
var is_it_mousemotion := false

var rng = RandomNumberGenerator.new()

func _ready() -> void:
	rng.randomize()
	self.linear_velocity.x = rng.randf_range(-100.0,100.0)*57
	rng.randomize()
	self.linear_velocity.y = rng.randf_range(-100.0,100.0)*57

func _input_event(viewport: Object, event: InputEvent, shape_idx: int) -> void:
	if is_it_screentouch or is_it_screendrag or is_it_mousebutton or is_it_mousemotion:
		if (is_it_pressed and is_it_screentouch and not is_it_screendrag and mouse_in_ball) or (is_it_pressed and is_it_mousebutton and not is_it_mousemotion and mouse_in_ball):
#			Singleton.active_ball_id = U_ID
			moving = true
#			Singleton.write_to_debug("1")

func _input(event) -> void:
	if not (Singleton.active_ball_id == 0 or Singleton.active_ball_id == U_ID):
		return
	
	is_it_pressed = event.is_pressed()
	
	is_it_screentouch = event is InputEventScreenTouch
	is_it_screendrag = event is InputEventScreenDrag
	
	is_it_mousebutton = event is InputEventMouseButton
	is_it_mousemotion = event is InputEventMouseMotion
	
	if is_it_screentouch or is_it_screendrag or is_it_mousebutton or is_it_mousemotion:
#		if (is_it_pressed and is_it_screentouch and not is_it_screendrag and mouse_in_ball) or (is_it_pressed and is_it_mousebutton and not is_it_mousemotion and mouse_in_ball):
##			Singleton.active_ball_id = U_ID
#			moving = true
#			Singleton.write_to_debug("1")
		if ((not is_it_pressed and not is_it_screentouch and is_it_screendrag) or (not is_it_pressed and not is_it_mousebutton and is_it_mousemotion and moving)) and moving:
			pos = event.position
			self.linear_velocity = (pos - self.global_position) * SPD
#			Singleton.write_to_debug("2")
		if (not is_it_pressed and is_it_screentouch and not is_it_screendrag) or (not is_it_pressed and is_it_mousebutton and not is_it_mousemotion):
#			Singleton.active_ball_id = 0
			moving = false
#			Singleton.write_to_debug("3")

func _on_Ball_mouse_entered() -> void:
	mouse_in_ball = true

func _on_Ball_mouse_exited() -> void:
	mouse_in_ball = false



# old movement system... probs gonna delete this soon

#func _input(event) -> void:
#	if InputEventScreenTouch and Input.is_action_just_released("left_click"):
#		if Singleton.active_ball_id == U_ID and not moving:
#			Singleton.active_ball_id = 0
#
#	# this should be looked at closer and redone  
#	if Input.is_action_pressed("left_click") and (moving or mouse_in_ball) and Singleton.active_ball_id == U_ID:
#			if event is InputEventScreenTouch:
#		#		print("ping") # this shit only pings when you let go of the screen?!
#				moving = false
#			if event is InputEventScreenDrag:
#				moving = true
#				pos = event.position
#				self.linear_velocity = (pos - self.global_position) * SPD
#
#func _on_Ball_mouse_entered() -> void:
#	if Singleton.active_ball_id == 0:
#		mouse_in_ball = true
#		Singleton.active_ball_id = U_ID
#
#func _on_Ball_mouse_exited() -> void:
#	mouse_in_ball = false
#	if not moving and Singleton.active_ball_id == U_ID:
#		Singleton.active_ball_id = 0
