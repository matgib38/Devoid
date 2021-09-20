extends Spatial

onready var wall_check = get_parent().get_node("Player")

func _on_Area_body_entered(body):
	if body.name == "Player":
		wall_check.wall_jump = true
		queue_free()
