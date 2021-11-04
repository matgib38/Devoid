extends Spatial


func _on_Area_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene("res://Scenes/WinScreen.tscn")

