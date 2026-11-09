extends CharacterBody2D

@export var playerID := 1

var varSpeed = 10

@export var keyLeft = KEY_LEFT
@export var keyRight = KEY_RIGHT
@export var keyUp = KEY_UP
@export var keyDown = KEY_DOWN

func _process(delta: float) -> void:
	global_position.x -= varSpeed * ( int(Input.is_key_pressed(keyLeft)) - int(Input.is_key_pressed(keyRight)) )
	global_position.y -= varSpeed * ( int(Input.is_key_pressed(keyUp)) - int(Input.is_key_pressed(keyDown)) )
