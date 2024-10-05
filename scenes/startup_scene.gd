extends Control

func _unhandled_input(event):
	if event is InputEventMouseButton:
		get_tree().change_scene("res://scenes/menu_scene.tscn")
