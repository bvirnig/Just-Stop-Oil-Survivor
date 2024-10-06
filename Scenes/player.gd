extends CharacterBody2D

@export var projectile_scene: Resource
@export var move_speed: float = 200.0
@export var max_y_position: float = 250.0  # Set your desired maximum Y position

func _ready():
	# Set the player's position to the center of the screen
	position = get_viewport().get_visible_rect().size / 2

func _input(event):
	if (event is InputEventMouseButton):
		# Only shoot on left click pressed down
		if (event.button_index == 1 and event.is_pressed()):
			var new_projectile = projectile_scene.instantiate()
			get_parent().add_child(new_projectile)
			
			var projectile_forward = position.direction_to(get_global_mouse_position())
			new_projectile.fire(projectile_forward, 1000.0)
			new_projectile.position = $ProjectileRefPoint.global_position

func _physics_process(delta):
	#look_at(get_viewport().get_mouse_position())
	
	# Get input and calculate velocity
	velocity = Input.get_vector("move_left", "move_right", "move_up", "move_down") * move_speed
	
	# Apply movement
	move_and_slide()
	
	# Constrain the Y position
	if position.y < max_y_position:
		position.y = max_y_position
	
	# Math to sort out direction and animation
	var angle = rad_to_deg(velocity.angle()) + 180
	if (velocity.length() < 10):
		$AnimationPlayer.play("idle")
	else:
		if (angle > 135 and angle < 225):
			$AnimationPlayer.play("walk_right")
		elif (angle > 225 and angle < 315):
			$AnimationPlayer.play("walk_down")
		elif (angle > 315 or angle < 45):
			$AnimationPlayer.play("walk_left")
		elif (angle > 45 and angle < 135):
			$AnimationPlayer.play("walk_up")
			
