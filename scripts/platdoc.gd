extends Node2D

@export var doc_value : int = 1
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

func _ready() -> void:
	GameController.doc_spawned(1)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player or body is PlayerCar:
		audio_stream_player_2d.play(0.92)
		await get_tree().create_timer(0.19).timeout
		audio_stream_player_2d.stop()
		GameController.doc_picked(doc_value)
		self.queue_free()
