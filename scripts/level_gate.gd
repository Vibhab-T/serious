extends Node2D
@onready var area: Area2D = $Area2D

@export var to_level: PackedScene 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player and GameController.check_level_cleared():
		get_tree().change_scene_to_packed(to_level)
