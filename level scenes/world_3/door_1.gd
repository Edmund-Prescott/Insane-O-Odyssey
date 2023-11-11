extends StaticBody2D

var door_open = false
@onready var animation_player = $AnimationPlayer

func _ready():
	Events.button_two_on.connect(dooropen)
	Events.button_two_off.connect(doorclose)

func _process(delta):
	pass

func dooropen():
	animation_player.play("door_open")
	door_open = true

func doorclose():
	animation_player.play("door_close")
	door_open = false
