extends Node2D

onready var kbody = self ### $KinematicBody2D
onready var sprite = $Sprite

var speed = 10.0
var dir = Vector2.ZERO

var target_pos = Vector2.ZERO

func _ready():
	$Sprite.frame = randi() % 3
	
	set_random_target()
	kbody.position = target_pos
	
func set_random_target():
	target_pos = Vector2(randi() % 720*3, randi() % 480*3)

func _physics_process(delta):
	update_ai_dir()
	kbody.position += dir * delta * speed
	###kbody.move_and_collide(dir * speed)
	sprite.position = kbody.position.floor()
	$Sprite.flip_h = dir.x < 0.1
	dir = Vector2.ZERO

func update_ai_dir():
	if kbody.position.distance_squared_to(target_pos) < 4.0:
		set_random_target()
	dir = (target_pos - kbody.position).normalized()
