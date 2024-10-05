extends Control

func _unhandled_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		get_tree().change_scene("res://scenes/menu_scene.tscn")
