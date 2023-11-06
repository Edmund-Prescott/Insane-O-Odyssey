extends Area2D

@export var next_level: PackedScene

func _ready():
	pass

func _process(delta):
	pass

func _on_level_end_trigger_body_entered(body):
	Events.level_completed.emit()


