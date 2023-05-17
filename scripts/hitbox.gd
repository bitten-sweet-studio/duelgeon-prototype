extends Area2D
class_name Hitbox

@export var parent: Node

var player: Player


func setup(p_player: Player) -> void:
	player = p_player


func _on_body_entered(body: Node2D):
	if body == player or !body.has_method("take_damage"):
		return

	body.take_damage(1)
	parent.queue_free()
