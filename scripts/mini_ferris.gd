extends Node2D

@onready var pillar: StaticBody2D = $Pillar
@onready var container: Sprite2D = $container
@onready var wheel: Sprite2D = %ferris_wheel

var plat : PackedScene = preload("res://scenes/ferris_platform2.tscn")
var plats : Array[AnimatableBody2D] = []

@export var wheel_speed: float = 0.2
@export var count :int = 8
@export var speed : float = 0.5
@export var radius: float = 100
@export var angle_off : float = 0.0
@export var spoke_color: Color = Color.DARK_SLATE_GRAY
@export var platform_color : Color = Color.GREEN

func spawn_platforms() -> void:
	for i in range(count):
		var p = plat.instantiate()
		add_child(p)
		plats.append(p)
		
		var angle = TAU * float(i) / count
		
		p.position = Vector2(cos(angle), sin(angle)) * radius

func rotate_plats(delta: float) -> void:
	angle_off += speed * delta
	
	for i in range(plats.size()):
		var p = plats[i]
		var angle = TAU * float(i) / count + angle_off
		p.position = Vector2(cos(angle), sin(angle)) * radius	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_platforms()
	
func draw_spokes() -> void:
	for i in range(count):
		draw_line(
			pillar.position,
			plats[i].position,
			spoke_color,
			5.0 # line width
		)

func _draw() -> void:
	draw_spokes()


func _physics_process(delta: float) -> void:
	rotate_plats(delta)
	wheel.rotate(delta * wheel_speed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	queue_redraw()
