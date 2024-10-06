extends Node2D

func _ready():
	start_game()
	
func start_game():
	create_units()

onready var unit_tscn = load("res://scenes/units/unit.tscn")

func create_units():
	for _i in range(3000):
		var unit = unit_tscn.instance()
		$Units.add_child(unit)

func attach_bullet(bullet):
	$Bullets.add_child(bullet)

onready var poof_tscn = load("res://scenes/gameplay/poof.tscn")
onready var powerup_tscn = load("res://scenes/powerup.tscn")

func spawn_poof(pos):
	var poof = poof_tscn.instance()
	poof.position = pos
	$Poofs.add_child(poof)
	var pup = powerup_tscn.instance()
	$Poofs.call_deferred("add_child",pup)
	pup.call_deferred("set_position",pos)

