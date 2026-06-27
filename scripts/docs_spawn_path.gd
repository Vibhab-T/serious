extends Path2D

var docs = preload("res://scenes/docs.tscn")

@onready var spawnpoint: PathFollow2D = $spawnpoint

func spawn_docs():
	for i in range(6):
		var docs_instance = docs.instantiate()
		spawnpoint.progress_ratio = randf()
		docs_instance.global_position = to_local(spawnpoint.global_position) 
		docs_instance.scale.x = 2
		docs_instance.scale.y = 2
		
		add_child(docs_instance)
		GameController.doc_spawned(1)
		
func _ready() -> void:
	randomize()
	spawn_docs()
