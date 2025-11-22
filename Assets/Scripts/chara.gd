extends CharacterBody2D

const GRAVITY = 1500
const JUMP_SPEED = -300.0

const MAX_JUMP_TIME = 1.0
var jump_pressed_time := 0.0
var is_jumping := false

func _physics_process(delta):
	
	velocity.y += GRAVITY * delta
	
	if is_on_floor():
		$body_anim.play("idle")
		
		if Input.is_action_pressed("jump_key"):
			$body_anim.play("crouch")
			await get_tree().create_timer(0.1).timeout
			$body_anim.play("jump")
			velocity.y = JUMP_SPEED
			is_jumping = true
			jump_pressed_time = 0.0
		
	if is_jumping and Input.is_action_pressed("jump_key") and jump_pressed_time < MAX_JUMP_TIME:
		velocity.y -= GRAVITY * delta * 0.7
		jump_pressed_time = false
	else:
		is_jumping = false
		
	if Input.is_action_pressed("shoot_key"):
		$hand_anim.play("shoot")
		
	move_and_slide()
