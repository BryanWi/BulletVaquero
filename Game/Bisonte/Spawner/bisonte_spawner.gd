extends Node2D

const manada = preload("res://Game/Bisonte/Manada/manada.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func spawn_manada(izq:bool):
	var m = manada.instantiate()
	if izq:
		pass

## Timer para aparecer las manadas
## Cambiar el tiempo aleatoriamente cada que se usa
func _on_timer_timeout():
	pass # Replace with function body.
