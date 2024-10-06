extends Control

onready var touchScreenButton = $TouchScreenButton
onready var stickTexture = $StickTexture

signal vjoy_move

var vjoy_vector = Vector2.ZERO
var vjoy_active = false

func _input(event):
	if event is InputEventScreenTouch or event is InputEventScreenDrag:
		if touchScreenButton.is_pressed():
			vjoy_vector = calc_vec(event.position)
			vjoy_active = true
	if event is InputEventScreenTouch and not event.pressed:
		vjoy_vector = Vector2.ZERO
		vjoy_active = false
	stickTexture.rect_position = vjoy_vector * 32
		
func _physics_process(_delta):
	if vjoy_active:
		emit_signal("vjoy_move", vjoy_vector)
	
func calc_vec(pos):
	var center = touchScreenButton.global_position + Vector2(32, 32)
	return (pos - center).normalized()
