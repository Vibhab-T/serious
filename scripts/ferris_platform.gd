extends Node2D

@onready var joint_right: PinJoint2D = $JointRight
@onready var joint_left: PinJoint2D = $JointLeft
@onready var joint_middle: PinJoint2D = $JointMiddle

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	queue_redraw()

func _draw() -> void:
	for child in get_children():
		if child is PinJoint2D:
			var joint := child as PinJoint2D

			var body_a := joint.get_node_or_null(joint.node_a) as Node2D
			var body_b := joint.get_node_or_null(joint.node_b) as Node2D

			if body_a == null or body_b == null:
				continue

			var pos_a := to_local(body_a.global_position)
			var pos_b := to_local(body_b.global_position)
			var joint_pos := to_local(joint.global_position)

			draw_line(pos_a, joint_pos, Color.RED, 2.0)
			draw_line(joint_pos, pos_b, Color.BLUE, 2.0)
