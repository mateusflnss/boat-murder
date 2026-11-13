extends Node

func funcRoomDoors(pos, door):
	await get_tree().process_frame
	
	$RayCast2D.target_position = pos
	$RayCast2D.force_raycast_update()
	if $RayCast2D.is_colliding():
		door.queue_free()


func _ready():
	await get_tree().create_timer(1).timeout
	funcRoomDoors(Vector2(0,-100), $DoorUp)
	funcRoomDoors(Vector2(0,100), $DoorDown)
	funcRoomDoors(Vector2(100,0), $DoorRight)
	funcRoomDoors(Vector2(-100,0), $DoorLeft)
	
	await get_tree().create_timer(1).timeout
	
	if $DoorUp:
		funcRoomDoors(Vector2(0,-100), $DoorUp)
	if $DoorDown:
		funcRoomDoors(Vector2(0,100), $DoorDown)
	if $DoorRight:
		funcRoomDoors(Vector2(100,0), $DoorRight)
	if $DoorLeft:
		funcRoomDoors(Vector2(-100,0), $DoorLeft)
	
	await get_tree().create_timer(1).timeout
	
	get_parent().nodeNav.bake_navigation_polygon()
