extends Area2D
var level = 1
var hp = 1
var speed = 500  # Set to a higher value for noticeable movement
var damage = 5
var knock_amount = 100
var attack_size = 1.0

var target = Vector2.ZERO
var angle = Vector2.ZERO

@onready var player = get_tree().get_first_node_in_group("Player")
var velocity: Vector2 = Vector2(0, 0)

func fire(forward: Vector2, speed: float):
	velocity = forward * speed
	look_at(position + forward)
	print(name, " Collision Layers: ", get_collision_layer())  # Debug statement for collision layers
	print(name, " Collision Mask: ", get_collision_mask())  # Debug statement for collision mask

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position += velocity * delta

func _on_time_to_live_timeout():
	queue_free()

func _on_body_entered(body: Node2D) -> void:
	(body as Painting).hit(1)
	queue_free()
