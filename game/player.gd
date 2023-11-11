extends CharacterBody2D

@onready var sprite_2d = $Sprite2D

@export var SPEED = 150.0
@export var JUMP_VELOCITY = -200.0
@export var ACCELERATION = 600.0
@export var AIR_ACCELERATION = 500.0
@export var AIR_RESISTENCE = 200.0
@export var FRICTION = 1000.0
@export var PUSH_FORCE = 60.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction : Vector2 = Vector2.ZERO


func _physics_process(delta):
	apply_gravity(delta)
	#handle_jump()
	
	var input_axis = Input.get_axis("Left", "Right")
	direction = Input.get_vector("Left", "Right", "ui_up", "ui_down")

	handle_acceleration(input_axis, delta)
	handle_air_acceleration(input_axis, delta)
	handle_air_resistence(input_axis, delta)
	apply_friction(input_axis, delta)
	facing_direction()
	
	
	for i in get_slide_collision_count():
		var c = get_slide_collision(i)
		var collider = c.get_collider()
		
		if collider is RigidBody2D:
			var impulse = -c.get_normal() * PUSH_FORCE
			collider.apply_central_impulse(impulse)
	
	move_and_slide()

func handle_acceleration(input_axis, delta):
	if !is_on_floor(): return
	if input_axis:
		velocity.x = move_toward(velocity.x, SPEED * input_axis, ACCELERATION * delta)

func handle_air_acceleration(input_axis, delta):
	if is_on_floor(): return
	if input_axis != 0:
		velocity.x = move_toward(velocity.x, SPEED * input_axis, AIR_ACCELERATION * delta)

func handle_air_resistence(input_axis, delta):
	if input_axis == 0 and not is_on_floor():
		velocity.x = move_toward(velocity.x, 0, AIR_RESISTENCE * delta)

func apply_friction(input_axis, delta):
	if input_axis == 0 and is_on_floor():
		velocity.x = move_toward(velocity.x, 0, FRICTION * delta)

func apply_gravity(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

func handle_jump():
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

func facing_direction():
	if direction.x > 0:
		sprite_2d.flip_h = false
	elif direction.x < 0:
		sprite_2d.flip_h = true
