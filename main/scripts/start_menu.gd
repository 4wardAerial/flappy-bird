extends Control

@onready var player_sprite : Sprite2D = $HBoxContainer/VBoxContainer/PlayerContainer/PlayerSprite
@onready var color : int = Global.current_color
@onready var sprite_frame : int = Global.current_sprite

func _ready() -> void:
	player_sprite.frame_coords = Vector2i(sprite_frame, 4)
	player_sprite.self_modulate = Global.player_colors[color]	


func _on_start_button_pressed() -> void:
	Global.current_color = color
	Global.current_sprite = sprite_frame
	get_tree().change_scene_to_file("res://main/scenes/game.tscn")


func _on_quit_button_pressed() -> void:
	get_tree().quit()


func _on_color_button_up_pressed() -> void:
	color = posmod((color + 1), Global.player_colors.size())
	player_sprite.self_modulate = Global.player_colors[color]


func _on_color_button_down_pressed() -> void:
	color = posmod((color - 1), Global.player_colors.size())
	player_sprite.self_modulate = Global.player_colors[color]


func _on_player_button_right_pressed() -> void:
	sprite_frame = posmod(sprite_frame + 1, 4)
	player_sprite.frame_coords = Vector2i(sprite_frame, 3)


func _on_player_button_left_pressed() -> void:
	sprite_frame = posmod(sprite_frame - 1, 4)
	player_sprite.frame_coords = Vector2i(sprite_frame, 3)
