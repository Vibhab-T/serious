
class_name Player extends CharacterBody2D

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 200
const JUMP_VELOCITY = -400.0
@onready var jump_sound: AudioStreamPlayer2D = $JumpSound

func play_jump_sound() -> void:
	jump_sound.play(0.78)
	await get_tree().create_timer(0.60).timeout
	jump_sound.stop()

func _physics_process(delta: float) -> void:
	var gravity := get_gravity()

	if GameController.gravity:
		up_direction = Vector2.UP
		sprite.rotation = 0
		
	else:
		up_direction = Vector2.DOWN
		gravity *= -1
		sprite.rotation = PI
	# Add the gravity.
	if not is_on_floor():
		velocity += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		if GameController.gravity:
			velocity.y = JUMP_VELOCITY
		else:
			velocity.y = -JUMP_VELOCITY
		play_jump_sound()
		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
