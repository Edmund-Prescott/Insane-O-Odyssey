extends Node2D

#@export var next_level: PackedScene

@onready var collision_polygon_2d = $StaticBody2D/CollisionPolygon2D
@onready var polygon_2d = $StaticBody2D/CollisionPolygon2D/Polygon2D

func _ready():
	#Events.level_completed.connect(level_completed)
	polygon_2d.polygon = collision_polygon_2d.polygon

#func level_completed():
	#get_tree().paused = true
	#if not next_level is PackedScene: return
	#get_tree().paused = false
	#get_tree().change_scene_to_packed(next_level)
