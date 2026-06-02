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

const HIGH_SCORES : String = "res://main/files/high_scores.json"

func _ready():
	load_highscores()

func load_highscores() -> void:
	var json_text = FileAccess.get_file_as_string(HIGH_SCORES)
	var json_dict = JSON.parse_string(json_text)
