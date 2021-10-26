extends Spatial

func _ready():
	if Health.wall_jump:
		queue_free()
		
func _on_Area_body_entered(body):
	if body.name == "Player":
		Health.wall_jump = true
		queue_free()
