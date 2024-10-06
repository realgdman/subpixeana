extends Node2D

var health = 640

signal you_win

func _ready():
	$hitbox.connect("body_entered", self, "on_hit")
	$hitbox.set_team($hitbox.Team.ENEMY)
	
func on_hit(body):
	var bullet = body.get_parent()
	health = clamp(health - bullet.damage, 0, 9999)
	$lifebar/LiineHP.points[1].x = health
	if health == 0:
		die()
		
func die():
	for i in 100:
		get_parent().get_parent().spawn_poof(Vector2(rand_range(-100, 100),rand_range(-100, 100))) #Game/Units
	queue_free()
	emit_signal("you_win")
