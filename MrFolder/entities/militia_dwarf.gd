extends CharacterBody2D

var varTargetSpread = 32

var varFriction = 0.75

var varStopFriction = 0.5

var varSpeed = randf_range(50,75)

var varFollowDistance = 3

@onready var nodeNavAgent = $NavigationAgent2D

@export var nodeTarget = self

func _ready():
	var varColor = randf_range(.1,1)
	modulate = Color(1, 1, 1) * varColor
	modulate.a = 1

func _process(delta: float) -> void:
	var varPath = nodeNavAgent.get_next_path_position()
	
	if global_position.distance_to(varPath) >= varFollowDistance:
		velocity += global_position.direction_to(varPath) * varSpeed
	else:
		velocity *= varStopFriction
	
	velocity *= varFriction
	
	move_and_slide()

func _on_timer_timeout() -> void:
	nodeNavAgent.target_position = nodeTarget.global_position + Vector2(randf_range(-varTargetSpread,varTargetSpread), randf_range(-varTargetSpread,varTargetSpread))
