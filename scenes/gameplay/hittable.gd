extends Area2D

enum LayerName {
	WALL = 1 << 0,
	PLAYER = 1 << 1,
	ENEMY = 1 << 2,
	BOSS = 1 << 3,
	PLAYER_BULLET = 1 << 4,
	ENEMY_BULLET = 1 << 5,
	PLAYER_HITBOX = 1 << 6,
	ENEMY_HITBOX = 1 << 7
}

enum Team {
	PLAYER = 0,
	ENEMY = 1,
}

export var team = 0 setget set_team

func set_team(value):
	match value:
		Team.PLAYER:
			collision_layer = LayerName.PLAYER_HITBOX
			collision_mask = LayerName.ENEMY_BULLET
		Team.ENEMY:
			collision_layer = LayerName.ENEMY_HITBOX
			collision_mask = LayerName.PLAYER_BULLET
	team = value
	
func _ready():
	pass # Replace with function body.

