extends Node
class_name CharacterBodyMovement3D

@export var character_body: CharacterBody3D
@export var is_enabled: bool = true
@export var speed: float = 25000.0


func move_conditionally(direction: Vector2, delta: float) -> void:
	if !is_enabled:
		return

	move(direction, delta)


func move(direction: Vector2, delta: float) -> void:
	var velocity2d: Vector2 = direction * speed
	character_body.velocity = Vector3(velocity2d.x, character_body.velocity.y, velocity2d.y)
	character_body.move_and_slide()

# func on_hit(damage: float):
# 	_player.health_agent.on_hit(damage)
