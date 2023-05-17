extends Node2D
class_name Bullet

@export var hitbox: Hitbox

var direction: Vector2
var speed: float


func setup(player: Player, p_direction: Vector2, p_speed: float) -> void:
	direction = p_direction
	speed = p_speed

	rotation = direction.angle()
	hitbox.setup(player)


func _physics_process(delta: float) -> void:
	global_position += direction * (speed * delta)
