extends Node2D

signal obstacle_passed

const OBSTACLE_SCENE := preload("res://scenes/obstacle.tscn")
const SPAWN_INTERVAL_X := 300.0
const SCROLL_SPEED := 150.0
const START_X := 520.0
const MIN_CENTER := 100.0
const MAX_CENTER := 620.0

var _distance := 0.0
var _stopped := false
var _rng := RandomNumberGenerator.new()


func _ready() -> void:
	_rng.randomize()


func _physics_process(delta: float) -> void:
	if _stopped:
		return
	_distance += SCROLL_SPEED * delta
	if _distance >= SPAWN_INTERVAL_X:
		_distance = 0.0
		_spawn()


func _spawn() -> void:
	var obstacle := OBSTACLE_SCENE.instantiate()
	add_child(obstacle)
	obstacle.position = Vector2(START_X, _rng.randf_range(MIN_CENTER, MAX_CENTER))
	obstacle.passed.connect(_relay_passed)


func _relay_passed() -> void:
	obstacle_passed.emit()


func stop() -> void:
	_stopped = true
	for child in get_children():
		if child.has_method("stop"):
			child.stop()