extends Line2D

var queue: Array[Vector2] = []
@export var MAX_LEN: int = 20

func _process(_delta: float) -> void:
	var pos = to_local(get_parent().global_position)
	
	queue.push_front(pos)
	
	if queue.size() > MAX_LEN:
		queue.pop_back()
	
	clear_points()
	
	for point in queue:
		add_point(point)    
