extends CharacterBody3D

@onready var nodeCam := $Camera3D

var varSpeed = 5
var varJumpHeight = 50

var varFriction := .75
var varAirDrag := .95
var varGrav := 2

var varLookSens := 100

func _input(event: InputEvent) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
	if Input.is_key_pressed(KEY_ESCAPE):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
	if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		if event is InputEventMouseMotion:
			rotation.y -= event.relative.x / varLookSens
			
			nodeCam.rotation.x -= event.relative.y / varLookSens
			
			nodeCam.rotation.x = clamp(nodeCam.rotation.x, -1.5, 1.5)
	
	if is_on_floor() and Input.is_action_pressed("Jump"):
		velocity.y = varJumpHeight

func _process(delta):
	velocity -= transform.basis.z * varSpeed * ( int( Input.is_action_pressed("W") ) - int( Input.is_action_pressed("S") ))
	
	velocity -= transform.basis.x * varSpeed * ( int( Input.is_action_pressed("A") ) - int( Input.is_action_pressed("D") ))
	
	velocity.y -= varGrav
	
	move_and_slide()
	
	velocity *= Vector3(varFriction, varAirDrag, varFriction)
