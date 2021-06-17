extends KinematicBody

var gravity = 30
var wall_gravity = 5
var jump = 20
var wall_jump = false
var can_wall_jump = false
var double_jump = false
var can_double_jump = false

export var max_speed = 10
export var friction = 10
export var speed = 1
export var acceleration = 0.5

export var wait_time = 3 #double jump cooldown

var move_vector = Vector3.ZERO

func get_input(): #Codes for movement
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
	if input != Vector3.ZERO: #Codes for movement
		speed += acceleration
		if input > Vector3.ZERO:
			$CharacterMesh.rotation_degrees.y = 180
		elif input < Vector3.ZERO:
			$CharacterMesh.rotation_degrees.y = 0
		if speed > max_speed:
			speed = max_speed
	
	move_vector.z = input.z * speed
	
	if is_on_wall():
		if wall_jump and can_wall_jump:
			if move_vector.y > 0 :
				move_vector.y = 0
			move_vector.y -= wall_gravity * delta
		else:
			move_vector.y -= gravity * delta
	else:
			move_vector.y -= gravity * delta
		
	if is_on_floor():
		can_wall_jump = true
		can_double_jump = true
		
	if Input.is_action_just_pressed("ui_up") and not is_on_floor() and double_jump == true and can_double_jump:
		move_vector.y = jump
		can_double_jump = false
		$DoubleJumpTimer.start()
		
	if Input.is_action_just_pressed("ui_up") and is_on_floor(): #Codes for basic jump
		move_vector.y = jump
	
	if Input.is_action_just_pressed("ui_up") and is_on_wall() and wall_jump == true and can_wall_jump: #Codes for wall jump
		move_vector.y = jump
		can_wall_jump = false
		can_double_jump = true
		$WallJumpTimer.start()
	
	move_vector = move_and_slide(move_vector, Vector3.UP)

func _on_WallJumpTimer_timeout():
	can_wall_jump = true

func _on_DoubleJumpTimer_timeout():
	can_double_jump = true
