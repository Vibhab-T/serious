extends AnimatableBody2D

var doc: PackedScene = preload("res://scenes/docs.tscn")
@onready var doc_marker: Marker2D = $DocMarker
var doc_value: int = 1

func spawn_doc() -> void:
	if (randi_range(0, 10) < 5):
		print("Spawning doc")

		GameController.doc_spawned(doc_value)
		var d = doc.instantiate()
		d.position = doc_marker.position
		add_child(d)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_doc()
