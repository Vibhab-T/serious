extends Node2D
@onready var area: Area2D = $Area2D

@export var to_level: PackedScene 


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player and GameController.check_level_cleared():
		get_tree().change_scene_to_packed(to_level)
