extends Node2D

func _ready():
	start_game()
	
func start_game():
	create_units()
	

func create_units():
	var unit_tscn = load("res://scenes/units/unit.tscn")
	for i in range(2000):
		var unit = unit_tscn.instance()
		$Units.add_child(unit)
