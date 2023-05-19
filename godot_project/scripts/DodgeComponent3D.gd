extends Node
class_name DodgeComponent3D

@export var interval: float
@export var speed: float
@export var char_body_movement: CharacterBodyMovement3D
@export var is_dodging: bool
@export var visual: Node
@export var collision_shape: CollisionShape3D
@export var input: PlayerInput
@export var cooldown: float = 0.5
@export var can_dodge: bool = true


func dodge() -> void:
	if !can_dodge:
		return

	can_dodge = false
	get_tree().create_timer(cooldown).timeout.connect(disable_cooldown)

	char_body_movement.is_enabled = false
	is_dodging = true
	visual.visible = true
	char_body_movement.character_body.set_collision_layer_value(4, false)

	var direction: Vector3
	var movement_input: Vector2 = input.get_movement_input()

	if movement_input == Vector2.ZERO:
		direction = char_body_movement.character_body.global_transform.basis.z * speed
	else:
		movement_input = movement_input.normalized() * speed
		direction.x = movement_input.x
		direction.y = char_body_movement.character_body.velocity.y
		direction.z = movement_input.y

	char_body_movement.character_body.velocity = direction

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


func disable_cooldown() -> void:
	can_dodge = true
