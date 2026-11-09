extends CharacterBody2D

var varSpeed = 10

func _process(delta: float) -> void:
	global_position.x -= varSpeed * ( int(Input.is_key_pressed(KEY_A)) - int(Input.is_key_pressed(KEY_D)) )
	global_position.y -= varSpeed * ( int(Input.is_key_pressed(KEY_W)) - int(Input.is_key_pressed(KEY_S)) )
