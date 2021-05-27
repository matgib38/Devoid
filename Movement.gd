extends KinematicBody

var gravity = 9.8
var jump = 5
var whatisthis = Vector3()

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
			
	move_vector = input * speed
	move_and_slide(move_vector)
	
	
	if not is_on_floor():
		whatisthis.y -= gravity * delta
		
	if Input.is_action_just_pressed("ui_up"):
		whatisthis.y = jump
		
	move_and_slide(whatisthis, Vector3.UP)
