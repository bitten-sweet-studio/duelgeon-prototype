extends Resource
class_name PlayerInputDefinition

@export var is_input_enabled: bool

@export_group("Movement")
@export var move_left_input: String
@export var move_right_input: String
@export var move_up_input: String
@export var move_down_input: String

@export_group("Aim")
@export var aim_left_input: String
@export var aim_right_input: String
@export var aim_up_input: String
@export var aim_down_input: String
@export var use_mouse_instead: bool

@export_group("Misc")
@export var dodge_input: String
@export var shoot_input: String


func get_movement_input() -> Vector2:
	if !is_input_enabled:
		return Vector2.ZERO

	var result: Vector2 = Input.get_vector(
		move_left_input, move_right_input, move_up_input, move_down_input
	)
	return result


func get_aim_input(aimer: Node2D) -> Vector2:
	if !is_input_enabled:
		return Vector2.ZERO

	var result: Vector2 = Vector2.ZERO

	if !use_mouse_instead:
		result = Input.get_vector(aim_left_input, aim_right_input, aim_up_input, aim_down_input)
	else:
		result = (aimer.get_global_mouse_position() - aimer.global_position).normalized()

	return result


func get_shoot_input() -> bool:
	if !is_input_enabled:
		return false

	var result: bool = Input.is_action_just_pressed(shoot_input)
	return result


func get_dodge_input() -> bool:
	if !is_input_enabled:
		return false

	var result: bool = Input.is_action_just_pressed(dodge_input)
	return result
