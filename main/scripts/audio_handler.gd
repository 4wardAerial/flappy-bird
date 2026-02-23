extends Node

@onready var game_music : AudioStreamPlayer = $Music/GameMusic
@onready var birds : AudioStreamPlayer = $Music/Birds
@onready var jump : AudioStreamPlayer = $SFX/JumpSFX
@onready var hit : AudioStreamPlayer = $SFX/HitSFX


func _on_game_started() -> void:
	game_music.play()
	birds.volume_linear /= 2


func _on_game_paused() -> void:
	game_music.volume_linear /= 4


func _on_hud_resumed() -> void:
	game_music.volume_linear += 1


func _on_game_ended(_score : int) -> void:
	hit.play()
	game_music.stop()
	birds.stop()


func _on_player_jump() -> void:
	var random_pitch : float = randf_range(0.8, 2)
	jump.pitch_scale = random_pitch
	jump.play()
