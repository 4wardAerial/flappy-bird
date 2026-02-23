extends Node2D

@onready var mountain_1 : Parallax2D = $Mountains/Mountain1
@onready var mountain_2 : Parallax2D = $Mountains/Mountain2
@onready var forest_1 : Parallax2D = $Forest/Forest1
@onready var forest_2 : Parallax2D = $Forest/Forest2
@onready var forest_3 : Parallax2D = $Forest/Forest3
@onready var forest_4 : Parallax2D = $Forest/Forest4
@onready var big_cloud_1 : Parallax2D = $CloudsBack/BigCloud1
@onready var big_cloud_2 : Parallax2D = $CloudsFront/BigCloud2
@onready var cloud_1 : Parallax2D = $CloudsFront/Cloud1
@onready var cloud_2 : Parallax2D = $CloudsFront/Cloud2
@onready var cloud_3 : Parallax2D = $CloudsFront/Cloud3

var speed : float = 0.0


func _ready() -> void:
	speed = 0


func _physics_process(_delta: float) -> void:
	mountain_1.scroll_offset.x -= 0.05 * speed
	mountain_2.scroll_offset.x -= 0.1 * speed
	forest_1.scroll_offset.x -= 0.2 * speed
	forest_2.scroll_offset.x -= 0.25 * speed
	forest_3.scroll_offset.x -= 0.3 * speed
	forest_4.scroll_offset.x -= 0.6 * speed
	big_cloud_1.scroll_offset.x -= 0.15 * speed
	big_cloud_2.scroll_offset.x -= 0.5 * speed
	cloud_1.scroll_offset.x -= 0.8 * speed
	cloud_2.scroll_offset.x -= 0.9 * speed
	cloud_3.scroll_offset.x -= 0.8 * speed


func change_speed(mult : float = 1, add : float = 0):
	speed = speed * mult + add


func _on_game_started() -> void:
	speed = 1


func _on_game_ended(_points : int) -> void:
	speed = 0
