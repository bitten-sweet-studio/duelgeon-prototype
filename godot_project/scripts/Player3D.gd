extends Node3D
class_name Player3D

@export var input_component: PlayerInput
@export var movement_component: CharacterBodyMovement3D
@export var dodge_component: DodgeComponent3D
@export var gun: Gun3D


func _ready() -> void:
	assert(input_component != null)
	assert(movement_component != null)
	assert(gun != null)


func take_damage(amount: float) -> void:
	queue_free()


func _physics_process(delta: float) -> void:
	var movement_direction: Vector2 = input_component.get_movement_input()
	movement_component.move_conditionally(movement_direction, delta)

	var aim_direction: Vector2 = input_component.get_aim_input_3d(self)
	aim_at(aim_direction)

	if input_component.get_shoot_input():
		gun.shoot()
	elif input_component.get_dodge_input():
		dodge_component.dodge()


func aim_at(direction: Vector2) -> void:
	if direction == Vector2.ZERO:
		return

	rotation.y = -direction.angle() + 90
