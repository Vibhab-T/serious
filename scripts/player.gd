class_name Player
extends CharacterBody2D

const SPEED := 200.0
const JUMP_VELOCITY := -400.0
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	var gravity := get_gravity()

	if GameController.gravity:
		up_direction = Vector2.UP
		sprite.rotation = 0
		
	else:
		up_direction = Vector2.DOWN
		gravity *= -1
		sprite.rotation = PI
		


	if not is_on_floor():
		velocity += gravity * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		if GameController.gravity:
			velocity.y = JUMP_VELOCITY
		else:
			velocity.y = -JUMP_VELOCITY

	var direction := Input.get_axis("ui_left", "ui_right")

	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0.0, SPEED)

	move_and_slide()
