extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass  # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("reset_game"):  # Check if the reset key is pressed
		reset_game()

func reset_game() -> void:
	# Logic to reset your game goes here
	# For example, reload the current scene:
	get_tree().reload_current_scene()
