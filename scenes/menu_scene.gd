extends Node2D

func _ready():
	var _e = $"%BtnStart".connect("pressed", get_tree(), "change_scene", ["res://scenes/viewport_scene.tscn"])
