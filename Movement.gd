extends KinematicBody

var gravity = 30
var jump = 20

export var max_speed = 10
export var friction = 10
export var speed = 1
export var acceleration = 0.5

var move_vector = Vector3.ZERO

func get_input():
	var input = Vector3(
		0,
		0,
		-int(Input.is_action_pressed("ui_left")) + int(Input.is_action_pressed("ui_right"))
	)
	input = input.normalized()
	return input

func _process(delta):
	pass

func _physics_process(delta):
	var input = get_input()
	if input != Vector3.ZERO:
		speed += acceleration
		if speed > max_speed:
			speed = max_speed
			
	move_vector.z = input.z * speed
	
	if not is_on_floor():
		move_vector.y -= gravity * delta
		
	if Input.is_action_just_pressed("ui_up") and is_on_floor() :
		move_vector.y = jump
		
	move_and_slide(move_vector, Vector3.UP)
