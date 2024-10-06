extends Node2D

var dir = Vector2.ZERO
var speed = 100.0

onready var kbody = $KinematicBody2D
onready var sprite = $Bullet

var damage = 1

func _ready():
	$DespawnTimer.connect("timeout", self, "despawn")

func _physics_process(delta):
	kbody.position += dir * speed * delta
	sprite.position = kbody.position.floor()
	
func set_despawn_timer(value):
	$DespawnTimer.wait_time = value

func despawn():
	queue_free()
	
func set_damage(value):
	damage = value
	$Bullet.scale = Vector2.ONE * damage / 100.0
