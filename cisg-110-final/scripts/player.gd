extends CharacterBody2D


@export var SPEED = 0
@export var JUMP_VELOCITY = 0

@export var _kickRight: Node2D

func _enter_tree() -> void:
	_disableKick()

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if Input.is_action_just_pressed("ui_accept"):
		_kick()

	move_and_slide()

func _kick() -> void:
	print("player kick")
	_kickRight.disabled = false
	
func _disableKick() -> void:
	_kickRight.disabled = true
