extends Spatial

onready var double_check = get_parent().get_node("Player")

func _on_Area_body_entered(body):
	if body.name == "Player":
		double_check.double_jump = true
