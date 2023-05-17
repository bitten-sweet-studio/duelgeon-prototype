extends Node2D
class_name Player

@export var input_component: PlayerInput
@export var movement_component: CharacterBodyMovement
@export var shooter_component: ShooterComponent


func _ready() -> void:
	assert(input_component != null)
	assert(movement_component != null)
	assert(shooter_component != null)


func take_damage(amount: float) -> void:
	queue_free()


func _physics_process(delta: float) -> void:
	var movement_direction: Vector2 = input_component.get_movement_input()
	movement_component.move_conditionally(movement_direction, delta)

	var aim_direction: Vector2 = input_component.get_aim_input(self)
	shooter_component.aim_at(aim_direction)

	if input_component.get_shoot_input():
		shooter_component.shoot()
