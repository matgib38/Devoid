extends KinematicBody

onready var camera = get_parent().get_node("Camera")

export var max_speed = 10
export var friction = 10
export var speed = 1
export var acceleration = 0.5

var move_vector = Vector3.ZERO
var cursor_pos = Vector3.ZERO

func get_input():
	var input = Vector3(
		-int(Input.is_action_pressed("ui_down")) + int(Input.is_action_pressed("ui_up")),
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
	
