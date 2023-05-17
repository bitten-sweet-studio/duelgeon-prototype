extends Node
class_name CharacterBodyMovement

@export var character_body: CharacterBody2D
@export var is_enabled: bool = true
@export var speed: float = 25000.0


func move_conditionally(direction: Vector2, delta: float) -> void:
	if !is_enabled:
		return

	move(direction, delta)


func move(direction: Vector2, delta: float) -> void:
	character_body.velocity = direction * speed
	character_body.move_and_slide()

# func on_hit(damage: float):
# 	_player.health_agent.on_hit(damage)
