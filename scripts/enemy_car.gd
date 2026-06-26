extends CharacterBody2D

var engine_power = 400   
var acceleration = Vector2.ZERO
# distance between front and rear axel
var wheel_base = 70
# how much can car rotate
var steering_angle = 25
var steer_direction = 0


var turn = 5
func _physics_process(delta: float):
	acceleration = Vector2.ZERO
	
	turn = turn + randi_range(-1, 1)

	steer_direction = deg_to_rad(turn * steering_angle)
	velocity = transform.x * engine_power
	
	calculate_steering(delta)
	velocity += acceleration * delta
	move_and_slide()

func calculate_steering(delta):  
	var rear_wheel = position - transform.x * wheel_base / 2
	var front_wheel = position + transform.x * wheel_base / 2
	rear_wheel += velocity * delta
	front_wheel += velocity.rotated(steer_direction) * delta
	
	var new_heading = (front_wheel - rear_wheel).normalized()
	velocity = new_heading * velocity.length()
	rotation = new_heading.angle()
	
