extends CharacterBody2D

var engine_power = 400   
var acceleration = Vector2.ZERO
# distance between front and rear axel
var wheel_base = 70
# how much can car rotate
var steering_angle = 25
var steer_direction = 0

var docs_counter = 0
@onready var docs_label = %docs_label

func _physics_process(delta: float):
	acceleration = Vector2.ZERO
	get_input()
	calculate_steering(delta)
	velocity += acceleration * delta
	move_and_slide()

func get_input():
	var turn = 0
	if Input.is_action_pressed("ui_right"):
		turn += 1
	if Input.is_action_pressed("ui_left"):
		turn -= 1       
	steer_direction = deg_to_rad(turn * steering_angle)
	
	velocity = Vector2.ZERO
	#accelerate
	if Input.is_action_pressed("ui_accept"):
		velocity = transform.x * engine_power

func calculate_steering(delta):  
	var rear_wheel = position - transform.x * wheel_base / 2
	var front_wheel = position + transform.x * wheel_base / 2
	rear_wheel += velocity * delta
	front_wheel += velocity.rotated(steer_direction) * delta
	
	var new_heading = (front_wheel - rear_wheel).normalized()
	velocity = new_heading * velocity.length()
	rotation = new_heading.angle()
	
func _on_area_2d_area_entered(area: Area2D) -> void:
	if(area.is_in_group("docs")):
		set_docs( docs_counter + 1)
	
func set_docs(update_docs_count: int) -> void:
	docs_counter = update_docs_count
	docs_label.text = "docs : " + str(docs_counter)
