extends Spatial

func _ready():
	if Health.dash:
		queue_free()
		
func _on_Area_body_entered(body):
	if body.name == "Player":
		Health.dash = true
		queue_free()
