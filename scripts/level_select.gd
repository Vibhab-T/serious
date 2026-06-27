extends Node2D




func _on_level_one_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_one.tscn")




func _on_level_two_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_two.tscn")
 # Replace with function body.


func _on_level_three_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_four.tscn")


func _on_bumper_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/bumper_arena.tscn")


func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/intro.tscn")
