extends Control

@onready var total_docs: Label = $TotalDocs
@onready var spawned_docs: Label = $SpawnedDocs

func _ready() -> void:
	EventController.connect("doc_picked", on_event_doc_collected)
	EventController.connect("doc_spawned", on_event_doc_spawned)
	EventController.connect("level_cleared", on_level_cleared)

func on_event_doc_collected(value: int) -> void:
	total_docs.text = str(value).lpad(2, " " )

func on_event_doc_spawned(value: int) -> void:
	spawned_docs.text = str(value).lpad(2, "/")

func on_level_cleared() -> void:
	total_docs.text = "All Docs Collected"
	spawned_docs.text = ""
