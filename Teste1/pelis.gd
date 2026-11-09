extends Node3D

var varTarget = self

@onready var nodeHitbox = $Area3D

func _ready() -> void:
	await get_tree().create_timer(0.1).timeout
	varTarget = get_parent().nodePlayer

func _process(delta: float) -> void:
	look_at(varTarget.global_position)
	
	global_position -= transform.basis.z / 10
	
	if nodeHitbox.has_overlapping_bodies():
		get_tree().quit()
