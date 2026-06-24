extends Node

var total_docs: int = 0
var total_spawned_docs: int = 0

func check_level_cleared() -> bool:
	if total_docs == total_spawned_docs:
		EventController.emit_signal("level_cleared")
		return true
	return false

func doc_picked(value: int) -> void:
	total_docs += value
	EventController.emit_signal("doc_picked", total_docs)
 
func doc_spawned(value: int) -> void:
	print("Doc Spawned Called")
	total_spawned_docs += value
	EventController.emit_signal("doc_spawned", total_spawned_docs)

func _process(_delta: float) -> void:
	check_level_cleared()	
