extends CharacterBody2D

var varFriction = 0.75

var varSpeed = randf_range(100,250)

var varFollowDistance = randf_range(32,64)

@onready var nodeNavAgent = $NavigationAgent2D

@export var nodeTarget = self

func _ready():
	var varColor = randf_range(.1,1)
	modulate = Color(1, 1, 1) * varColor
	modulate.a = 1

func _process(delta: float) -> void:
	if global_position.distance_to(nodeTarget.global_position) >= varFollowDistance:
		velocity = global_position.direction_to(nodeNavAgent.get_next_path_position()) * varSpeed
		velocity += Vector2(randf_range(-0.1,0.1),randf_range(-0.1,0.1))
	
	move_and_slide()
	
	velocity *= varFriction

func _on_timer_timeout() -> void:
	nodeNavAgent.target_position = nodeTarget.global_position
