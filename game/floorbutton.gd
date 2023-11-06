extends StaticBody2D

@onready var animation_player = $AnimationPlayer

var is_pushed = false
var currentRoutine = null

func _ready():
	pass

func _process(delta):
	pass


func _on_detector_body_entered(body):
	if not is_pushed:
		start_push()
	elif is_pushed:
		stop_push()


func _on_detector_body_exited(body):
	if is_pushed:
		stop_push()


func start_push():
	if not is_pushed:
		is_pushed = true
		animation_player.play("pushed")
		await animation_player.animation_finished
		Events.door_open.emit()

func stop_push():
	if is_pushed:
		is_pushed = false
		animation_player.play("unpress")
		await animation_player.animation_finished
		Events.door_close.emit()
