extends Node

var current_type : int = 0
var current_color : int = 0
var current_sprite : int = 0

var player_types : Dictionary[int, float] = {
	0 : -300,
	1 : -175,
	2 : -450,
}

var player_colors : Dictionary[int, Color] = {
	0 : Color(1.0, 1.0, 1.0, 1.0),
	1 : Color(0.0, 0.0, 1.0, 1.0),
	2 : Color(0.0, 1.0, 0.0, 1.0),
	3 : Color(1.0, 0.0, 0.0, 1.0),
}
