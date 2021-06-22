extends RigidBody2D

# where the ball should slowly go to
onready var pos := self.global_position
const SPD := 10
var U_ID := self.get_instance_id()
var mouse_in_ball := false
var moving := false

var rng = RandomNumberGenerator.new()

func _ready() -> void:
	rng.randomize()
	self.linear_velocity.x = rng.randf_range(-100.0,100.0)*57
	rng.randomize()
	self.linear_velocity.y = rng.randf_range(-100.0,100.0)*57
	

func _physics_process(_delta: float) -> void:
	if not self.mode == MODE_RIGID and $Area2D.get_overlapping_bodies().size() == 0:
		self.set_deferred("mode", MODE_RIGID)

func _input(event) -> void:
	if InputEventScreenTouch and Input.is_action_just_released("left_click")	:
		if Singleton.active_ball_id == U_ID and not moving:
			Singleton.active_ball_id = 0
	
	# this should be looked at closer and redone  
	if Input.is_action_pressed("left_click") and (moving or mouse_in_ball) and Singleton.active_ball_id == U_ID:
			if event is InputEventScreenTouch:
		#		print("ping") # this shit only pings when you let go of the screen?!
				moving = false
			if event is InputEventScreenDrag:
				moving = true
				pos = event.position
				self.linear_velocity = (pos - self.global_position) * SPD

func _on_Ball_mouse_entered() -> void:
	if Singleton.active_ball_id == 0:
		mouse_in_ball = true
		Singleton.active_ball_id = U_ID

func _on_Ball_mouse_exited() -> void:
	mouse_in_ball = false
	if not moving and Singleton.active_ball_id == U_ID:
		Singleton.active_ball_id = 0

func _on_body_entered(body: Node) -> void:
	if body.get_parent().name == "Smart_border":
		self.set_deferred("mode", MODE_STATIC)
