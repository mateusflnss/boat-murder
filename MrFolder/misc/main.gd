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
	cam.global_position.x -= (cam.global_position.x - player.nodeCamFocus.global_position.x) / 2
	cam.global_position.y -= (cam.global_position.y - player.nodeCamFocus.global_position.y) / 2

func _process(_delta):
	funcMoveCam(nodeCam1, nodePlayer1)
	funcMoveCam(nodeCam2, nodePlayer2)
