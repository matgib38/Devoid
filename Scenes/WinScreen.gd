extends Control

func _on_ExitButton_pressed():
	get_tree().quit()

func _on_RestartButton_pressed():
	get_tree().change_scene("res://Scenes/TitleScreen.tscn")
