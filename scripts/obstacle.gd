extends Node2D

const SCROLL_SPEED := 150.0
const REMOVE_X := -100.0


func _physics_process(delta: float) -> void:
	position.x -= SCROLL_SPEED * delta
	if position.x < REMOVE_X:
		queue_free()