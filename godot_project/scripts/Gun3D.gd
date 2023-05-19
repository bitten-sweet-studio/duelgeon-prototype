extends Node3D
class_name Gun3D

@export var player: Player3D
@export var bullet_spawn_point: Node3D
@export var bullet_scene: PackedScene
@export var bullet_speed: float = 200
@export var shoot_cooldown: float = 0.5

var can_shoot: bool = true


func shoot() -> void:
	if !can_shoot:
		return

	can_shoot = false
	get_tree().create_timer(shoot_cooldown).timeout.connect(disable_cooldown)

	var bullet_instance: Bullet3D = bullet_scene.instantiate()
	get_tree().root.add_child(bullet_instance)
	bullet_instance.global_position = bullet_spawn_point.global_position
	bullet_instance.global_rotation = player.global_rotation
	bullet_instance.setup(player, bullet_speed)


func disable_cooldown() -> void:
	can_shoot = true
