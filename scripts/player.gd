extends CharacterBody2D

signal died

const GRAVITY := 900.0
const IMPULSE_Y := -350.0
const FIXED_X := 160.0
const START_Y := 360.0
const BOUND_TOP := 15.0
const BOUND_BOTTOM := 705.0

var _active := true
var _dead := false


func _physics_process(delta: float) -> void:
	if not _active:
		velocity = Vector2.ZERO
		return
	velocity.y += GRAVITY * delta
	if Input.is_action_just_pressed("flap"):
		velocity.y = IMPULSE_Y
	velocity.x = 0.0
	global_position.x = FIXED_X
	move_and_slide()
	for i in get_slide_collision_count():
		if get_slide_collision(i).get_collider():
			_die()
			return
	if global_position.y <= BOUND_TOP or global_position.y >= BOUND_BOTTOM:
		_die()


func set_active(active: bool) -> void:
	_active = active
	if not active:
		velocity = Vector2.ZERO


func respawn() -> void:
	global_position = Vector2(FIXED_X, START_Y)
	velocity = Vector2.ZERO
	_dead = false
	_active = true


func _die() -> void:
	if _dead:
		return
	_dead = true
	_active = false
	velocity = Vector2.ZERO
	died.emit()