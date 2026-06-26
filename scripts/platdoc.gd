extends Node2D

@export var doc_value : int = 1

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		GameController.doc_picked(doc_value)
		self.queue_free()
