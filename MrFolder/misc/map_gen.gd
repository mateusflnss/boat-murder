extends Node2D

var arrayRooms = []

@onready var nodeRay = $RayCast2D

@export var varMapSize = 3

func _ready():
	for file in DirAccess.get_files_at("res://MrFolder/rooms/"):
		arrayRooms.append(load("res://MrFolder/rooms/" + file))
	
	await get_tree().process_frame
	funcGenRooms(varMapSize)
	
	await get_tree().create_timer(10).timeout
	
	arrayRooms = []
	nodeRay.queue_free()

func funcNewRoom(child, pos):
	nodeRay.global_position = child.global_position
	nodeRay.target_position = pos/3
	
	nodeRay.force_raycast_update()
	if !nodeRay.is_colliding():
		var newRoom = arrayRooms.pick_random().instantiate()
		add_child(newRoom)
		
		newRoom.global_position = child.global_position + pos

func funcSpreadRoom(child):
	funcNewRoom(child, Vector2(420,0))
	funcNewRoom(child, Vector2(-420,0))
	funcNewRoom(child, Vector2(0,420))
	funcNewRoom(child, Vector2(0,-420))

func funcGenRooms(size):
	for i in size:
		for children in get_child_count():
			funcSpreadRoom(get_child(children))
			await get_tree().process_frame
