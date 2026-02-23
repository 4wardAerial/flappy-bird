extends Timer

var pipe_timer : float = 3 

func set_timer(time : float) -> void:
	pipe_timer = time
	self.start(pipe_timer)


func _on_game_started() -> void:
	self.start(pipe_timer)


func _on_player_death() -> void:
	self.stop()
	
