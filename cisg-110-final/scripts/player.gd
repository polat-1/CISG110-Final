extends CharacterBody2D

@export var SPEED = 0
@export var JUMP_VELOCITY = 0

@export var MAX_KICK_TIME = 0.0
@export var KICK_TIMER = 0.0

@export var _kickRight: Node2D
@export var _kickLeft: Node2D

@export var _rightKickDir = Vector2.RIGHT
@export var _leftKickDir = Vector2.LEFT

var _facingRight: bool = true

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

	if direction > 0:
		_facingRight = true
	elif direction < 0:
		_facingRight = false

	if KICK_TIMER > 0:
		KICK_TIMER -= delta
	if KICK_TIMER < 0:
		_disableKick()

	if Input.is_action_just_pressed("ui_accept"):
		_kick()

	move_and_slide()

func _kick() -> void:
	if _facingRight:
		_kickRight.process_mode = Node.PROCESS_MODE_INHERIT
	else:
		_kickLeft.process_mode = Node.PROCESS_MODE_INHERIT
	KICK_TIMER = MAX_KICK_TIME
	
func _disableKick() -> void:
	_kickRight.process_mode = Node.PROCESS_MODE_DISABLED
	_kickLeft.process_mode = Node.PROCESS_MODE_DISABLED

func _on_kick_right_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	print(body.name)
	body.apply_central_impulse(_rightKickDir)
	
	if body is Prop:
		body._was_kicked = true

func _on_kick_left_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	print(body.name)
	body.apply_central_impulse(_leftKickDir)

	if body is Prop:
		body._was_kicked = true
