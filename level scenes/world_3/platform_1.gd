extends StaticBody2D

@onready var animation_player = $AnimationPlayer
var platform_move = false

func _ready():
	Events.button_one_on.connect(platform_on)
	Events.button_one_off.connect(platform_off)

func _process(delta):
	pass

func platform_on():
	animation_player.play("platform_move")
	platform_move = true

func platform_off():
	animation_player.play("RESET")
	platform_move = false
