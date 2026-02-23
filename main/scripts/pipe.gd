extends Node2D

signal scored

const MIN_GAP : float = 180.0
const MAX_GAP : float = 300.0

@onready var pipe_up : Area2D = $PipeUpArea
@onready var pipe_down : Area2D = $PipeDownArea
@onready var pipe_up_tile : TileMapLayer = $PipeUpArea/PipeUpTile
@onready var pipe_down_tile : TileMapLayer = $PipeDownArea/PipeDownTile

var speed : float = 150.0
var colors : Array[Color] = [
	Color(1.0, 0.3, 0.0, 1.0),
	Color(0.3, 0.0, 1.0, 1.0),
	Color(0.0, 1.0, 0.3, 1.0),
	Color(0.3, 1.0, 1.0, 1.0),
	Color(1.0, 0.3, 1.0, 1.0),
	Color(1.0, 1.0, 0.3, 1.0),
]

func _ready() -> void:
	var pipe_up_pos : float = randf_range(-420, -160)
	# guarantees that the gap is no smaller than the MIN_GAP
	var pipe_down_min : float = 960 + MIN_GAP + pipe_up_pos
	var pipe_down_pos : float = randf_range(pipe_down_min, 1030)
	# guarantees that the gap is no bigger than the MAX_GAP
	if pipe_down_pos - pipe_up_pos - 960 > MAX_GAP:
		pipe_down_pos = pipe_up_pos + 960 + MAX_GAP
	# places pipe offscreen with the random heights
	self.position.x = 1250
	paint()
	pipe_up.position.y = pipe_up_pos
	pipe_down.position.y = pipe_down_pos


func _physics_process(delta : float) -> void:
	self.position.x -= speed * delta
	
	if self.global_position.x < -200:
		self.queue_free()  # kills itself offscreen


func paint() -> void:
	var color : Color = colors.pick_random()
	pipe_up_tile.self_modulate = color
	pipe_down_tile.self_modulate = color


func set_speed(spd : float):
	speed = spd


func _on_score_area_exited(_area: Area2D) -> void:
	emit_signal("scored")
