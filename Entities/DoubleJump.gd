extends Spatial

func _on_Area_body_entered(body):
	if body.name == "Player":
		Health.double_jump = true
		queue_free()
