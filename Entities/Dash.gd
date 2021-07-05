extends Spatial

onready var dash_check = get_parent().get_node("Player")

func _on_Area_body_entered(body):
	if body.name == "Player":
		dash_check.dash = true
