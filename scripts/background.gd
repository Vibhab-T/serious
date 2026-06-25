extends Node2D
@onready var background_sprite: Sprite2D = $BackgroundSprite

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var target_rotation = 0.0 if GameController.gravity else PI
	var target_y = 0.0 if GameController.gravity else -200.0

	background_sprite.rotation = lerp_angle(background_sprite.rotation,target_rotation, 5.0 * delta)

	background_sprite.position.y = lerp(background_sprite.position.y,target_y, 5.0 * delta)
			
