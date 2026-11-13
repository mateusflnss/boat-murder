extends Node2D

@onready var nodeMiscDwarf = preload("res://MrFolder/entities/misc_dwarf.tscn")
@onready var nodeMilitiaDwarf = preload("res://MrFolder/entities/militia_dwarf.tscn")

@onready var arraySpawn = [nodeMiscDwarf, nodeMilitiaDwarf]

@export var nodeTarget1 = self
@export var nodeTarget2 = self

@onready var arrayTargets: Array[Node] = [nodeTarget1, nodeTarget2]

func _on_timer_timeout() -> void:
	
	
	var i = arraySpawn.pick_random().instantiate()
	
	get_parent().add_child(i)
	i.global_position = global_position
	i.nodeTarget = arrayTargets[randi_range(0, arrayTargets.size() - 1)]
