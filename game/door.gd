extends StaticBody2D

var door_open = false
@onready var animation_player = $AnimationPlayer

func _ready():
	Events.door_open.connect(dooropen)
	Events.door_close.connect(doorclose)

func _process(delta):
	pass

func dooropen():
	animation_player.play("door_open")
	door_open = true

func doorclose():
	animation_player.play("door_close")
	door_open = false
