extends Control

signal resumed

@onready var score_label : Label = $ScoreHUD/ScoreLabel
@onready var center_label : Label = $CenterHUD/VBoxContainer/CenterLabel
@onready var end_menu : HBoxContainer = $CenterHUD/VBoxContainer/EndMenu
@onready var pause_hud : Control = $PauseHUD
@onready var gray_tint : Sprite2D = $GrayTint


func _ready() -> void:
	score_label.hide()
	pause_hud.hide()
	end_menu.hide()
	gray_tint.hide()


func write_score(points : int) -> void:
	score_label.text = "SCORE: %d" % points


func _on_game_started() -> void:
	center_label.hide()
	score_label.show()	


func _on_game_ended(points : int) -> void:
	score_label.hide()
	center_label.show()
	end_menu.show()
	gray_tint.show()
	center_label.text = "GAME OVER\nSCORE: %d" % points


func _on_game_paused() -> void:
	center_label.hide()
	pause_hud.show()
	gray_tint.show()


func _on_resume_button_pressed() -> void:
	pause_hud.hide()
	gray_tint.hide()
	get_tree().paused = false
	emit_signal("resumed")


func _on_start_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://main/scenes/start_menu.tscn")


func _on_quit_button_pressed() -> void:
	get_tree().quit()


func _on_restart_button_pressed() -> void:
	get_tree().reload_current_scene()
