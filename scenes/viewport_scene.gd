extends Node2D

func _ready():
	$"%VJoystick".connect("vjoy_move", $Viewport/game_scene/test_player, "on_vjoy_move")
