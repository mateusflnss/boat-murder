extends CharacterBody2D

@onready var nodeCamFocus := $CamFocus
var nodeCamFocusFocus = self

var varSpeed = 300
var varFriction = .5

var varDodgeTimer = 0
var varDodgeDuration = 5
var varDodgeDirection = Vector2.ZERO
var varDodgeDelay = 0

var varInvulTimer = 0

@export var keyLeft = KEY_LEFT
@export var keyRight = KEY_RIGHT
@export var keyUp = KEY_UP
@export var keyDown = KEY_DOWN
@export var keyJump = KEY_SPACE

func _process(_delta):
	#CAMERA
	if $CamFocusCheck.has_overlapping_areas():
		nodeCamFocusFocus = $CamFocusCheck.get_overlapping_areas()[0]
	else:
		nodeCamFocusFocus = self
	
	nodeCamFocus.global_position -= (nodeCamFocus.global_position - nodeCamFocusFocus.global_position) / 2 
	
	#MOVIMENTO
	velocity.x -= varSpeed * ( int(Input.is_key_pressed(keyLeft)) - int(Input.is_key_pressed(keyRight)) )
	velocity.y -= varSpeed * ( int(Input.is_key_pressed(keyUp)) - int(Input.is_key_pressed(keyDown)) )
	
	velocity *= varFriction
	
	if Input.is_key_pressed(keyJump) and varDodgeTimer <= 0 and varDodgeDelay <= 0:
		varDodgeDirection = velocity * 100
		varDodgeDirection.x = clamp(varDodgeDirection.x,-200,200)
		varDodgeDirection.y = clamp(varDodgeDirection.y,-200,200)
		varDodgeTimer = varDodgeDuration
		varDodgeDelay = varDodgeTimer + 30
		varInvulTimer = varDodgeDuration + 5
	
	if varDodgeTimer >= 0:
		varDodgeTimer -= 1
		velocity += varDodgeDirection
	
	if varDodgeDelay >= 0:
		varDodgeDelay -= 1
	
	if varInvulTimer >= 0:
		varInvulTimer -= 1
		modulate.a = .5
	else:
		modulate.a = 1
	
	move_and_slide()
	
	if velocity.x * sign(velocity.x) <= 1:
		velocity.x = 0
	if velocity.y * sign(velocity.y) <= 1:
		velocity.y = 0
