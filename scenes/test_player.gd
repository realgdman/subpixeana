extends Node2D

onready var kbody = $KinematicBody2D
onready var sprite = $Sprite

onready var bullet_tscn = load("res://scenes/gameplay/bullet.tscn")

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

func on_fire_weapon():
	fire_bullet()
	
func fire_bullet():
	var bullet = bullet_tscn.instance()
	bullet.position = kbody.position
	bullet.dir = Vector2.UP
	get_parent().attach_bullet(bullet)
