extends StaticBody2D

@onready var animation_player = $AnimationPlayer

var is_pushed = false

func _ready():
	pass 

func _process(delta):
	pass


func _on_detector_body_entered(body):
	if is_pushed != true:
		buttonpressed()

func buttonpressed():
	if is_pushed != true:
		is_pushed = true
		animation_player.play("pushed")
		await animation_player.animation_finished
		Events.door_open.emit()
		
	

func _on_detector_body_exited(body):
	if is_pushed != false:
		is_pushed = false
		animation_player.play("unpress")
		await animation_player.animation_finished
		Events.door_close.emit()
		
