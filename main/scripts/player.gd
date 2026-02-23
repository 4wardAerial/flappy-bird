extends CharacterBody2D

@onready var player_collision : CollisionShape2D = $PlayerCollision
@onready var player_sprite : Sprite2D = $PlayerSprite
@onready var player_anim : AnimationPlayer = $PlayerAnimation

signal death
signal jump

const ROTATION_VELOCITY : float = 0.5

var game_start : bool = false
var has_control : bool = true
var gravity := Vector2(0, 980)
var jump_velocity : float = -300.0


func _ready() -> void:
	var textures = [
		preload("res://assets/images/player_1.png"),
		preload("res://assets/images/player_2.png"),
		preload("res://assets/images/player_3.png"),
	]
	player_sprite.texture = textures[Global.current_sprite]
	player_sprite.self_modulate = Global.player_colors[Global.current_color]
	jump_velocity = Global.player_types[Global.current_sprite]


func _physics_process(delta : float) -> void:
	if has_control:
		if game_start:
			self.velocity += gravity * delta
			self.rotation += deg_to_rad(ROTATION_VELOCITY)  # rotates sprite down while falling
		
			if Input.is_action_just_pressed("key_space"):
				self.rotation = lerp_angle(-PI/10, self.rotation, 0.1)  # resets sprite rotation when jumping
				self.velocity.y = jump_velocity
				emit_signal("jump")
	else:
		self.velocity += gravity * delta  # continues falling
		self.rotation -= deg_to_rad(5)
	
	move_and_slide()


func lost_game() -> void:
	has_control = false
	player_collision.set_deferred("disabled", true)  # disables collision
	emit_signal("death")
	flash_effect()
	# randonly launches the player in a parabola
	self.velocity.y = jump_velocity * RandomNumberGenerator.new().randf_range(1.0, 2.0)
	self.velocity.x = 100 * RandomNumberGenerator.new().randf_range(-1, 1)
 

func _on_game_started() -> void:
	self.velocity.y = 1.5 * jump_velocity  # so that first jump is accounted for
	game_start = true


func flash_effect() -> void:
	player_sprite.material.set_shader_parameter("onoff", 1)
	var tween = create_tween()
	var flash_shader = func(x): player_sprite.material.set_shader_parameter("flash", x)
	
	tween.tween_method(flash_shader, 0.0, 1.0, 0.1)
	tween.tween_method(flash_shader, 1.0, 0.0, 0.2)


func _on_area_2d_area_entered(_area: Area2D) -> void:
	if has_control:
		lost_game()
