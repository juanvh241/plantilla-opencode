extends CharacterBody2D

const GRAVITY := 900.0
const IMPULSE_Y := -350.0
const FIXED_X := 160.0


func _physics_process(delta: float) -> void:
	velocity.y += GRAVITY * delta
	if Input.is_action_just_pressed("flap"):
		velocity.y = IMPULSE_Y
	velocity.x = 0.0
	global_position.x = FIXED_X
	move_and_slide()