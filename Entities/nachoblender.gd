extends Spatial

func _on_Area_body_entered(body):
	if body.name == "Player":
		queue_free()
		get_tree().quit()
