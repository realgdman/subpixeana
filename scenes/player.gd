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
	
	if firing:
		process_firing()

func on_vjoy_move(vec):
	dir = vec
	
var firing = false

func update_control_dir():
	if dir.is_zero_approx():
		dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
		dir = dir.normalized()
		
	if Input.is_action_just_pressed("fire_action"):
		on_fire_pressed()
	if Input.is_action_just_released("fire_action"):
		on_fire_released()

func fire_bullet():
	var bullet = bullet_tscn.instance()
	bullet.position = kbody.global_position
	bullet.dir = Vector2.UP
	get_parent().attach_bullet(bullet)

func on_fire_pressed():
	firing = true
	
func on_fire_released():
	firing = false

func process_firing():
	if $ShootTimer.time_left < 0.01:
		fire_bullet()
		$ShootTimer.start()
