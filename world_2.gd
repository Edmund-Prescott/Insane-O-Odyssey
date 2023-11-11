extends Node2D

#@export var next_level: PackedScene



func _ready():
	#Events.level_completed.connect(level_completed)
	pass

#func level_completed():
	#get_tree().paused = true
	#if not next_level is PackedScene: return
	#get_tree().paused = false
	#get_tree().change_scene_to_packed(next_level)
