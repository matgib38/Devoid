extends Spatial

onready var camera = get_parent().get_node("Camera")

func _on_Area_body_entered(body):
	print(camera)
	if body.name == "Player":
		camera.camera_follow = false

func _on_Area_body_exited(body):
	if body.name == "Player":
		camera.camera_follow = true
