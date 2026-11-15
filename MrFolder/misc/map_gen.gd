extends Node2D

var arrayRooms = []

@onready var nodeRay = $RayCast2D

@export var varGenSteps = 3

@export var varMinRooms = 30

@export var varMaxRooms = 100

@export var varRoomChance = 25

@onready var varStartingChildren = get_child_count()

func _ready():
	for file in DirAccess.get_files_at("res://MrFolder/rooms/"):
		arrayRooms.append(load("res://MrFolder/rooms/" + file))
	
	await get_tree().physics_frame
	funcGenRooms(varGenSteps)

func funcNewRoom(child, pos):
	if get_child_count() < varMaxRooms + varStartingChildren:
		if get_child_count() - varStartingChildren < varMinRooms or varRoomChance + Vector2.ZERO.distance_to(child.global_position / 3) * randf_range(0.025,0.05) >= randi_range(0,100):
			nodeRay.global_position = child.global_position
			nodeRay.target_position = pos/3
			
			print(Vector2.ZERO.distance_to(child.global_position / 3) * randf_range(0.025,0.05))
			
			nodeRay.force_raycast_update()
			if !nodeRay.is_colliding():
				var newRoom = arrayRooms.pick_random().instantiate()
				add_child(newRoom)
				newRoom.global_position = child.global_position + pos

func funcSpreadRoom(child):
	if randi() or get_child_count() < varMinRooms + varStartingChildren:
		funcNewRoom(child, Vector2(420,0))
	if randi() or get_child_count() < varMinRooms + varStartingChildren:
		funcNewRoom(child, Vector2(-420,0))
	if randi() or get_child_count() < varMinRooms + varStartingChildren:
		funcNewRoom(child, Vector2(0,420))
	if randi() or get_child_count() < varMinRooms + varStartingChildren:
		funcNewRoom(child, Vector2(0,-420))

func funcGenRooms(size):
	#GERAR OS TILES
	for i in size:
		if i < size - 1:
			for children in get_child_count():
				funcSpreadRoom(get_child(children))
				await get_tree().physics_frame
		#DEPOIS DE GERAR OS TILES
		if i == size - 1:
			print("placed all them tiles ☻", get_child_count() - varStartingChildren)
			
			if $MapGenWait:
				$MapGenWait.queue_free()
				print("freed players ☻")
			
			get_tree().call_group("modRoomBaseGroup", "funcGenerateDoors")
			print("deleted doors ☻")
