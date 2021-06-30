extends Spatial

func _on_Area_body_entered(body):
	if body.name == "Player":
		get_tree().reload_current_scene()
