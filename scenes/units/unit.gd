extends Node2D

onready var kbody = $KinematicBody2D
onready var sprite = $Sprite

var speed = 10.0
var dir = Vector2.ZERO

var target_pos = Vector2.ZERO

func _ready():
	set_random_target()
	position = target_pos
	
func set_random_target():
	target_pos = Vector2(randi() % 1280*3, randi() % 720*3)

func _physics_process(delta):
	update_ai_dir()
	kbody.position += dir * delta * speed
	sprite.position = kbody.position.floor()
	dir = Vector2.ZERO

func update_ai_dir():
	if kbody.position.distance_squared_to(target_pos) < 4.0:
		set_random_target()
	dir = (target_pos - kbody.position).normalized()
