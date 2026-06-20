extends Node2D

var single_platform = preload("res://ferris-single-plat.tscn")

@export var plat_count: int = 6
@export var radius: float = 200
@export var speed : float = 0.8

var platforms : Array[Node2D] = []
var angle_offset: float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_platforms()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	angle_offset += speed * delta

	for i in range(platforms.size()):
		var p = platforms[i]

		var angle = TAU * float(i) / plat_count + angle_offset

		p.position = Vector2(
			cos(angle),
			sin(angle)
		) * radius

func spawn_platforms() -> void:
	for i in range(plat_count):
		var p = single_platform.instantiate()
		add_child(p)
		platforms.append(p)
		
		var angle = TAU * float(i) / plat_count
		
		p.position = Vector2(
			cos(angle),
			sin(angle)
		) * radius
