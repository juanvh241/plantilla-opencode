extends Node2D

signal passed

const SCROLL_SPEED := 150.0
const REMOVE_X := -100.0
const PLAYER_X := 160.0

var scored := false
var _stopped := false


func _physics_process(delta: float) -> void:
	if _stopped:
		return
	position.x -= SCROLL_SPEED * delta
	if not scored and position.x < PLAYER_X:
		scored = true
		passed.emit()
	if position.x < REMOVE_X:
		queue_free()


func stop() -> void:
	_stopped = true