extends Node2D
class_name ShooterComponent

@export var player: Player
@export var bullet_spawn_point: Node2D
@export var bullet_scene: PackedScene
@export var bullet_speed: float = 200


func aim_at(direction: Vector2) -> void:
	if direction == Vector2.ZERO:
		return

	rotation = direction.angle()


func shoot() -> void:
	var bullet_instance: Bullet = bullet_scene.instantiate()
	get_tree().root.add_child(bullet_instance)
	bullet_instance.global_position = bullet_spawn_point.global_position
	bullet_instance.setup(player, Vector2.from_angle(rotation), bullet_speed)
