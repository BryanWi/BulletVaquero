extends Node2D

const manada = preload("res://Game/Bisonte/Manada/manada.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func spawn_manada(izq:bool):
	var m = manada.instantiate()
	if izq:
		pass
