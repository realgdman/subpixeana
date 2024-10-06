extends Node2D

var dir = Vector2.ZERO
var speed = 10.0

onready var kbody = $KinematicBody2D

func _ready():
	$DespawnTimer.connect("timeout", self, "despawn")

func _physics_process(delta):
	kbody.position += dir * speed
	
func set_despawn_timer(value):
	$DespawnTimer.wait_time = value

func despawn():
	queue_free()
