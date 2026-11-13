extends Node
@export var depth = 0

func _process(_delta):
	get_parent().z_index = int(get_parent().global_position.y)
	
