extends Control

func _on_Startbutton_pressed():
	get_tree().change_scene("res://Scenes/Test Level.tscn")

func _on_Controlbutton_pressed():
	get_tree().change_scene("res://Scenes/ControlMenu.tscn")

func _on_Exitbutton_pressed():
	get_tree().quit()
