extends Area3D
class_name Hitbox3D

@export var parent: Node

var player: Player3D


func setup(p_player: Player3D) -> void:
	player = p_player


func _on_body_entered(body: Node3D):
	if body == player:
		return

	if !body.has_method("take_damage"):
		parent.queue_free()
		return

	body.take_damage(1)
	parent.queue_free()
