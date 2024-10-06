extends Node2D

onready var kbody = $KinematicBody2D
onready var sprite = $Sprite

var speed = 10.0
var dir = Vector2.ZERO

func _physics_process(delta):
	update_control_dir()
	kbody.position += dir * delta * speed
	sprite.position = kbody.position.floor()
	dir = Vector2.ZERO

func on_vjoy_move(vec):
	dir = vec

func update_control_dir():
	if dir.is_zero_approx():
		dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
		dir = dir.normalized()
