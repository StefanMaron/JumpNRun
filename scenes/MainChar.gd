extends CharacterBody2D
@onready var animated_sprite_2d = $AnimatedSprite2D

const SPEED = 400.0
const JUMP_VELOCITY = -900.0

@onready var camera_2d = $Camera2D
@export var enableCamera2D: bool = true

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	camera_2d.enabled = enableCamera2D
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	if (velocity.x != 0):
		animated_sprite_2d.animation = "running"
	else:
		animated_sprite_2d.animation = "default"
		
	if (velocity.y > 0):
		animated_sprite_2d.animation = "falling"
	if (velocity.y < 0):
		animated_sprite_2d.animation = "jumping"
		

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 30)
		
	if (velocity.x > 0):
		animated_sprite_2d.flip_h = false
	if (velocity.x < 0):
		animated_sprite_2d.flip_h = true
		

	move_and_slide()
