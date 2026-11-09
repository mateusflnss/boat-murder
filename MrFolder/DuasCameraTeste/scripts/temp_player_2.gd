extends CharacterBody2D

var varSpeed = 10

func _process(delta: float) -> void:
	global_position.x -= varSpeed * ( int(Input.is_key_pressed(KEY_LEFT)) - int(Input.is_key_pressed(KEY_RIGHT)) )
	global_position.y -= varSpeed * ( int(Input.is_key_pressed(KEY_UP)) - int(Input.is_key_pressed(KEY_DOWN)) )
