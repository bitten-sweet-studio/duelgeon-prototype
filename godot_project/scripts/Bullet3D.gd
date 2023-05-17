extends Node3D
class_name Bullet3D

@export var hitbox: Hitbox3D

var speed: float


func setup(player: Player3D, p_speed: float) -> void:
	speed = p_speed

	hitbox.setup(player)


func _physics_process(delta: float) -> void:
	translate(Vector3(0, 0, speed * delta))
