extends CharacterBody2D

var varFriction = 0.99

var varSpeed = randf_range(.5,1.5)

var varFollowDistance = randf_range(32,64)

@onready var nodeNavAgent = $NavigationAgent2D

@export var nodeTarget = self

func _ready():
	modulate = Color(randf_range(.25,1),randf_range(.25,1),randf_range(.25,1))

func _process(delta: float) -> void:
	if global_position.distance_to(nodeTarget.global_position) >= varFollowDistance:
		velocity += global_position.direction_to(nodeNavAgent.get_next_path_position()) * varSpeed
		velocity += Vector2(randf_range(-0.1,0.1),randf_range(-0.1,0.1))
	
	move_and_slide()
	
	velocity *= varFriction

func _on_timer_timeout() -> void:
	nodeNavAgent.target_position = nodeTarget.global_position
