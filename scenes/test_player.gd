extends Node2D

onready var kbody = $KinematicBody2D
onready var sprite = $Sprite

var speed = 10.0

func _physics_process(delta):
	var dir : Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	dir = dir.normalized()
	kbody.position += dir * delta * speed
	sprite.position = kbody.position.floor()	
