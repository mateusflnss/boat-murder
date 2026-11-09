extends Node2D

@export var nodeWorld := Node

@onready var nodePlayer1 = nodeWorld.nodePlayer1
@onready var nodePlayer2 = nodeWorld.nodePlayer2


@onready var nodeCam1 := $HBoxContainer/SubViewportContainer/SubViewport/Camera2D
@onready var nodeCam2 := $HBoxContainer/SubViewportContainer2/SubViewport/Camera2D

func _ready():
	var varWorld = $HBoxContainer/SubViewportContainer/SubViewport.find_world_2d()
	
	$HBoxContainer/SubViewportContainer2/SubViewport.world_2d = varWorld

func funcMoveCam(cam, player):
	cam.global_position.x = clamp(cam.global_position.x, player.global_position.x - 50, player.global_position.x + 50)
	
	if cam.global_position.x <= player.global_position.x:
		cam.global_position.x += 5
	else:
		cam.global_position.x -= 5

func _process(_delta):
	funcMoveCam(nodeCam1, nodePlayer1)
	funcMoveCam(nodeCam2, nodePlayer2)
