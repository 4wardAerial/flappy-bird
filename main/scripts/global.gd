extends Node

var current_type : int = 0
var current_color : int = 0

var player_types : Dictionary[int, float] = {
	0 : -100,
	1 : -300,
	2 : -500,
}

var player_colors : Dictionary[int, Color] = {
	0 : Color(1.0, 1.0, 1.0, 1.0),
	1 : Color(0.0, 0.0, 1.0, 1.0),
	2 : Color(0.0, 1.0, 0.0, 1.0),
	3 : Color(1.0, 0.0, 0.0, 1.0),
}
