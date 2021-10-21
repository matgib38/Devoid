extends Spatial

func _on_Area_body_entered(body):
	if body.name == "Player":
		Health.change_health(1)
