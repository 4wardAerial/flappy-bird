extends Node2D

signal started
signal ended
signal paused

@onready var background : Node2D = $Background
@onready var hud : Control = $HUD
@onready var player : CharacterBody2D = $Player
@onready var pipe_handler : Node2D = $PipeHandler
@onready var pipe_start : Sprite2D = $PipeStart
@onready var pipe_timer : Timer = $PipeTimer
@onready var pipe_scene : PackedScene = preload("res://main/scenes/pipe.tscn")

const PIPES_GAP : float = 450.0

var score : int = 0
var game_start : bool = false
var game_end : bool = false
var speed : float = 150.0
var timer : float = 3


func _process(delta: float) -> void:
	if not game_start:
		if Input.is_action_just_pressed("key_space"):
			game_start = true
			emit_signal("started")
	else:
		if Input.is_action_just_pressed("key_esc"):
			get_tree().paused = true
			emit_signal("paused")
		if pipe_start.position.x > -80:
			pipe_start.position.x -= speed * delta


func _on_player_death() -> void:
	game_end = true
	emit_signal("ended", score)
	
	speed = 0
	for child in pipe_handler.get_children():
		child.set_speed(0)  # stops all the pipes


func _on_pipe_scored() -> void:
	if not game_end:
		score += 1
		hud.write_score(score)
		
		if score % 5 == 0:
			speed += 10
			timer = PIPES_GAP / speed
			background.change_speed(1, 1)


func _on_pipe_timer_timeout() -> void:
	if not game_end:
		# creates instance of pipe, but does not draw it yet
		var pipe : Node2D = pipe_scene.instantiate()
		pipe.set_speed(speed)
		pipe_timer.set_timer(timer)
		pipe_handler.add_child(pipe)
		pipe.scored.connect(_on_pipe_scored)  # gets the signals from the instantiated scenes
