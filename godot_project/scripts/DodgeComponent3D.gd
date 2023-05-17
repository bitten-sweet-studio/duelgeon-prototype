extends Node
class_name DodgeComponent3D

@export var interval: float
@export var speed: float
@export var char_body_movement: CharacterBodyMovement3D
@export var is_dodging: bool
@export var visual: Node
@export var collision_shape: CollisionShape3D


func dodge() -> void:
	char_body_movement.is_enabled = false
	is_dodging = true
	visual.visible = true
	char_body_movement.character_body.set_collision_layer_value(4, false)

	var forward: Vector3 = char_body_movement.character_body.global_transform.basis.z * speed
	char_body_movement.character_body.velocity = forward

	await get_tree().create_timer(interval).timeout

	is_dodging = false
	visual.visible = false
	char_body_movement.character_body.set_collision_layer_value(4, true)
	char_body_movement.character_body.velocity = Vector3.ZERO
	char_body_movement.is_enabled = true


func _physics_process(delta: float) -> void:
	if !is_dodging:
		return

	char_body_movement.character_body.move_and_slide()
