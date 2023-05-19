extends Node


func _unhandled_input(_event: InputEvent) -> void:
	if not Input.is_action_just_pressed("reload"):
		return

	get_tree().reload_current_scene()
