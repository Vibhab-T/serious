extends Node2D

var anchor = preload("res://scenes/anchor.tscn")
var container = preload("res://scenes/container.tscn")

@export var radius : float = 350;
@export var anchor_count :int = 8;
@export var speed: float = 0.5;

var anchor_array : Array[Node2D] = []
var container_array : Array[Node2D] = []
var joint_array : Array[PinJoint2D] = []
var joint_array2 : Array[PinJoint2D] = []
var angle_offset : float = 0.0

func _ready() -> void:
	spawn_anchors()
	spawn_containers()
	join_anchors_and_containers()
	join_anchors_and_containers2()

func _process(delta: float) -> void:
	$Sprite2D.z_index = -1
	_draw()
	angle_offset+=speed*delta
	$Sprite2D.rotate(speed*delta)
		
	for i in range(anchor_array.size()):
		var anchor_instance = anchor_array[i]
		var container_instance = container_array[i]
		var angle = TAU * float(i) / anchor_count + angle_offset
		
		var anchorGlobalPos = anchor_array[i].global_position;
		var containerGlobalPos = container_array[i].global_position;
		
		joint_array[i].global_position = (anchorGlobalPos) 
		joint_array2[i].global_position = anchorGlobalPos + Vector2(15,0)

		anchor_instance.position = Vector2(
			cos(angle),
			sin(angle)
		) * radius
		queue_redraw()
	
func spawn_anchors() -> void:
	for i in range(anchor_count):
		var anchor_instance = anchor.instantiate()
		add_child(anchor_instance);
		
		var angle = TAU * float(i) / anchor_count;
		anchor_instance.position = Vector2(cos(angle), sin(angle))*radius
		anchor_instance.scale = Vector2(0.325, 0.125)
		anchor_array.append(anchor_instance)

func spawn_containers() -> void:
	for i in range(anchor_count):
		var container_instance = container.instantiate()
		add_child(container_instance);
		
		var angle = TAU * float(i) / anchor_count;
		container_instance.position = Vector2(cos(angle), sin(angle))*radius
		container_instance.scale = Vector2(2, 3.5)
		container_instance.position.y +=2;
		container_array.append(container_instance)

func join_anchors_and_containers() -> void:
	for i in range(anchor_count):
		var joint = PinJoint2D.new();
		add_child(joint);
		var anchorGlobalPos = anchor_array[i].global_position;
		var containerGlobalPos = container_array[i].global_position;
		
		joint.global_position = anchorGlobalPos
		joint.set_node_a(anchor_array[i].get_path());
		joint.set_node_b(container_array[i].get_path());
		joint.softness = 0.1
		joint.bias = 0.1
		joint_array.append(joint)

func join_anchors_and_containers2():
	for i in range(anchor_count):
		var joint = PinJoint2D.new();
		add_child(joint);
		var anchorGlobalPos = anchor_array[i].global_position;
		var containerGlobalPos = container_array[i].global_position;
		
		joint.global_position = anchorGlobalPos + Vector2(15,0)
		joint.set_node_a(anchor_array[i].get_path());
		joint.set_node_b(container_array[i].get_path());
		joint.softness = 0.1
		joint.bias = 0.05
		joint_array2.append(joint)	

func _draw() -> void:
	for joint in joint_array:
		var pos_a = to_local(joint.get_node(joint.node_a).global_position)
		var pos_b = to_local(joint.get_node(joint.node_b).global_position)
		var joint_pos = to_local(joint.global_position)
		
		draw_line(pos_a, joint_pos, Color.RED, 2.0)
		draw_line(joint_pos, pos_b, Color.RED, 2.0)
		draw_circle(joint_pos, 5.0, Color.YELLOW)
	
	for joint in joint_array2:
		var pos_a = to_local(joint.get_node(joint.node_a).global_position)
		var pos_b = to_local(joint.get_node(joint.node_b).global_position)
		var joint_pos = to_local(joint.global_position)
		
		draw_line(pos_a, joint_pos, Color.RED, 2.0)
		draw_line(joint_pos, pos_b, Color.RED, 2.0)
		draw_circle(joint_pos, 5.0, Color.YELLOW)	
