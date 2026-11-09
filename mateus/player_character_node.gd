extends CharacterBody2D


const SPEED = 300.0
var friction = 2

func _physics_process(delta: float) -> void:

	#handler of movement
	var xdirection := Input.get_axis("ui_left", "ui_right")
	var ydirection := Input.get_axis("ui_up", "ui_down")
	
	if xdirection:
		velocity.x = xdirection * SPEED
	if ydirection:
		velocity.y = ydirection * SPEED
	
	velocity /= friction 

	move_and_slide()
