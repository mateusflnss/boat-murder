extends MeshInstance2D

func _ready():
	texture.noise.seed += randf_range(-100,100)
