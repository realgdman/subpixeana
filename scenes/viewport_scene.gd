extends Node2D

func _ready():
	var _e = $"%VJoystick".connect("vjoy_move", $Viewport/game_scene/player, "on_vjoy_move")

	_e = $"%BtnRbgMode".connect("pressed", self, "on_rgb_mode_pressed")
	
	_e = $"%BtnFire".connect("pressed", $Viewport/game_scene/player, "on_fire_pressed")
	_e = $"%BtnFire".connect("released", $Viewport/game_scene/player, "on_fire_released")
	
	$Viewport/game_scene/Units/boss.connect("you_win", self, "on_win")
	
	set_rgb_mode(0)

var current_rgb_mode = 0

var rgb_modes = [
	{ "shader": "res://util/subpixel/subpixel_canvas_rgb.gdshader",
	"label": "RGB\n[color=red]I[/color][color=green]I[/color][color=blue]I[/color]"},
	{ "shader": "res://util/subpixel/subpixel_canvas_bgr.gdshader",
	"label": "BGR\n[color=blue]I[/color][color=green]I[/color][color=red]I[/color]"},
]

func on_rgb_mode_pressed():
	current_rgb_mode = wrapi(current_rgb_mode + 1, 0, rgb_modes.size())
	set_rgb_mode(current_rgb_mode)
	
func set_rgb_mode(index):
	($SubpixelCanvas.material as ShaderMaterial).shader = load(rgb_modes[index].shader)
	$GUI/LblRbgMode.bbcode_text = rgb_modes[index].label
	
func on_win():
	$GUI/YouWin.show()
