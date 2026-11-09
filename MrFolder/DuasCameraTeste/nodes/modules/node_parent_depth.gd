extends Node

func _process(_delta):
	get_parent().z_index = int(get_parent().global_position.y)
	
