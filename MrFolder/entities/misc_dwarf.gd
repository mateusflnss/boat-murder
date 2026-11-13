extends CharacterBody2D

var varTargetSpread = 32

var varFriction = 0.9
var varStopFriction = 0.5
var varCurrentFriction = varFriction

var varSpeed = randf_range(25,50)

var varFollowDistance = 16

@onready var nodeNavAgent = $NavigationAgent2D

@export var nodeTarget = self

func _ready():
	modulate = Color(randf_range(.25,1),randf_range(.25,1),randf_range(.25,1))

func _process(delta: float) -> void:
	var varPath = nodeNavAgent.get_next_path_position()
	
	if global_position.distance_to(varPath) >= varFollowDistance:
		velocity +=  global_position.direction_to(varPath) * varSpeed
	else:
		velocity *= varStopFriction
	
	velocity *= varCurrentFriction
	
	move_and_slide()

func _on_timer_timeout() -> void:
	nodeNavAgent.target_position = nodeTarget.global_position + Vector2(randf_range(-varTargetSpread,varTargetSpread),randf_range(-varTargetSpread,varTargetSpread))
