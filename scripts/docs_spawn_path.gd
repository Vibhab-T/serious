extends Path2D

var docs = preload("res://scenes/docs.tscn")

@onready var spawnpoint: PathFollow2D = $spawnpoint

func spawn_docs():
	for i in range(6):
		var docs_instance = docs.instantiate()
		spawnpoint.progress_ratio = randf()
		docs_instance.global_position = to_local(spawnpoint.global_position) 
		add_child(docs_instance)

func _ready() -> void:
	randomize()
	spawn_docs()
