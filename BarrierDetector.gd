extends Area2D

## este nodo se pone en una escena que quieras que se elimine al entrar en contacto
## con el delete barrier de la GameScene


## Usa la collision layer 6 para detectar la delete barrier

func _on_area_entered(_area):
	get_parent().queue_free()
