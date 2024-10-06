extends StaticBody2D
class_name Painting

@export var hp: int = 3
@export var painting_texture: Texture  # Individual painting texture
@export var painting_scale: float = 3.0  # Scaling factor for paintings

var sprite: Sprite2D
var collision_shape: CollisionShape2D

func _ready() -> void:
	sprite = $Sprite2D  # Access the Sprite2D node
	collision_shape = $CollisionShape2D  # Access the CollisionShape2D node

	if sprite:
		if painting_texture:
			sprite.texture = painting_texture
			sprite.scale = Vector2(painting_scale, painting_scale)

			# Set up the collision shape
			set_collision_shape_size()
		else:
			pass  # Handle the case where the texture is not assigned if needed
	else:
		pass  # Handle the case where the Sprite2D node is not found if needed

	# Debugging collision layers and masks
	print("Painting Collision Layer: ", get_collision_layer())  # Debug statement
	print("Painting Collision Mask: ", get_collision_mask())      # Debug statement

func set_collision_shape_size() -> void:
	if collision_shape:
		var shape = RectangleShape2D.new()
		shape.extents = Vector2(50, 75)  # Set your desired size here
		collision_shape.shape = shape

func hit(damage_number: int):
	hp -= damage_number
	if hp <= 0:
		queue_free()
