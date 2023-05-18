extends Node
class_name AutoShooter

@export var gun: Gun3D
@export var interval: float


func _ready() -> void:
	shoot_loop()


func shoot_loop() -> void:
	while true:
		if gun == null:
			break

		gun.shoot()
		await get_tree().create_timer(interval).timeout
