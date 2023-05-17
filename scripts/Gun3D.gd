extends Node3D
class_name Gun3D

@export var player: Player3D
@export var bullet_spawn_point: Node3D
@export var bullet_scene: PackedScene
@export var bullet_speed: float = 200


func shoot() -> void:
	var bullet_instance: Bullet3D = bullet_scene.instantiate()
	get_tree().root.add_child(bullet_instance)
	bullet_instance.global_position = bullet_spawn_point.global_position
	bullet_instance.global_rotation = player.global_rotation
	bullet_instance.setup(player, bullet_speed)
