extends Node2D
@onready var animated_sprite = $AnimatedSprite2D

func _ready() -> void:
	# Replace "default" with the exact name of your animation in SpriteFrames
	animated_sprite.play("float")


func _on_area_2d_area_entered():
	queue_free()
