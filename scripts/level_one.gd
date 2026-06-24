extends Node2D

var level_two: PackedScene = preload("res://scenes/level_two.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if (GameController.check_level_cleared()) :
		get_tree().change_scene_to_packed(level_two)
		
