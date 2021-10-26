extends Spatial

func _ready():
	if Health.double_jump:
		queue_free()
		
func _on_Area_body_entered(body):
	if body.name == "Player":
		Health.double_jump = true
		queue_free()
