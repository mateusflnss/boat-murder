extends Node2D

func _ready():
	var varWorld = $HBoxContainer/SubViewportContainer/SubViewport.find_world_2d()
	
	$HBoxContainer/SubViewportContainer2/SubViewport.world_2d = varWorld
