extends Node2D

@onready var nodeDwarf = preload("res://MrFolder/DuasCameraTeste/nodes/misc_dwarf.tscn")

@export var nodeTarget1 = self
@export var nodeTarget2 = self

@onready var arrayTargets: Array[Node] = [nodeTarget1, nodeTarget2]

func _on_timer_timeout() -> void:
	var i = nodeDwarf.instantiate()
	
	get_parent().add_child(i)
	i.global_position = global_position
	i.nodeTarget = arrayTargets[randi_range(0, arrayTargets.size() - 1)]
