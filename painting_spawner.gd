extends Node2D

@export var painting_scene: PackedScene # Reference to the Painting scene
@export var painting_textures: Array      # Array of textures for the paintings
@export var spacing: float = 150.0         # Space between paintings
@export var count: int = 50                # Number of paintings to spawn
@export var fixed_y_position: float = 100.0  # The Y position for spawning
@export var painting_scale: float = 3.0    # Scaling factor for paintings

func _ready() -> void:
	randomize()  # Seed the random number generator
	spawn_paintings()

func spawn_paintings() -> void:
	# Check if there are any textures to use
	if painting_textures.size() == 0:
		print("No painting textures available!")
		return  # Exit the function if there are no textures

	# Calculate the half count for even distribution
	var half_count = count / 2  

	for i in range(count):
		var painting_instance = painting_scene.instantiate()  # Create a new Painting instance
		var random_index = randi() % painting_textures.size()  # Get a random index
		painting_instance.painting_texture = painting_textures[random_index]  # Assign a random texture
		painting_instance.position = Vector2((i - half_count) * spacing, fixed_y_position)  # Set the position
		
		# Set the collision shape to match the fixed size (optional)
		painting_instance.set_collision_shape_size()  # Ensure this method is defined in the Painting script
		
		# Add the painting as a child of the spawner
		add_child(painting_instance)
