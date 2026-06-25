extends Camera2D
@onready var feet: Marker2D = $"../player/Feet"
@onready var head: Marker2D = $"../player/Head"


func _process(delta: float) -> void:
	var target_y = min(head.global_position.y, 0.0)
	position.y = lerp(position.y, target_y, 5.0 * delta)
