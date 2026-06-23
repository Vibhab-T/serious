extends Node2D

@export var FERRIS_RADIUS: float = 200
@export var FERRIS_SPEED: float = 100
@export var FERRIS_PLAT_COUNT: int = 8

var plat : PackedScene = preload("res://scenes/ferris_platform.tscn")

var plats : Array[Node2D] = []
var angle_off : float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(FERRIS_PLAT_COUNT):
		var p = plat.instantiate()
		add_child(p)
		plats.append(p)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	angle_off += FERRIS_SPEED * delta
	
	for i in range(FERRIS_PLAT_COUNT):
		var angle = TAU * i/FERRIS_PLAT_COUNT + angle_off
		var pos = Vector2(cos(angle), sin(angle)) * FERRIS_RADIUS
		
		plats[i].position = pos
	
	queue_redraw()

func _draw():
	for i in range(FERRIS_PLAT_COUNT):
		var angle = TAU * i / FERRIS_PLAT_COUNT + angle_off
		var rim_pos = Vector2(cos(angle), sin(angle)) * FERRIS_RADIUS
		
		draw_circle(rim_pos, 5, Color.YELLOW)
