extends Node2D

@onready var nodeCam1 = $HBoxContainer/SubViewportContainer/SubViewport/Camera2D
@onready var nodeCam2 = $HBoxContainer/SubViewportContainer2/SubViewport/Camera2D

func _ready():
	var varWorld = $HBoxContainer/SubViewportContainer/SubViewport.find_world_2d()
	
	$HBoxContainer/SubViewportContainer2/SubViewport.world_2d = varWorld
