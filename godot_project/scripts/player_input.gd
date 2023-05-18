extends Node
class_name PlayerInput

@export var definition: PlayerInputDefinition


func get_movement_input() -> Vector2:
	return definition.get_movement_input()


func get_aim_input(aimer: Node3D) -> Vector2:
	return definition.get_aim_input(aimer)


func get_aim_input_3d(aimer: Node3D) -> Vector2:
	return definition.get_aim_input(aimer)


func get_shoot_input() -> bool:
	return definition.get_shoot_input()


func get_dodge_input() -> bool:
	return definition.get_dodge_input()
