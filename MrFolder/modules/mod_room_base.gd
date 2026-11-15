extends Node

func funcRoomDoors(pos, door):
	$RayCast2D.target_position = pos
	$RayCast2D.force_raycast_update()
	if $RayCast2D.is_colliding():
		door.queue_free()

func funcGenerateDoors():
	funcRoomDoors(Vector2(0,-100), $DoorUp)
	funcRoomDoors(Vector2(0,100), $DoorDown)
	funcRoomDoors(Vector2(100,0), $DoorRight)
	funcRoomDoors(Vector2(-100,0), $DoorLeft)
	
	await get_tree().create_timer(.5).timeout
	
	$"../NavigationRegion2D".bake_navigation_polygon()
