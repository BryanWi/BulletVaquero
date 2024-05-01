extends Node
#tiene el guión bajo para que no interfiera con el Singleton llamado SceneManager
class_name Scene_Manager

## Guarda las direcciones a las distintas escenas, para agregar más basta con arrastrar la escena
## para que se copie la dirección
var scene_paths = {
	"main" : "",
	"game" : "res:/game/game.tscn",
	"juego2" : ""
}


## Permite que los 
func change_scene(scene_name):
	if scene_paths.has(scene_name):
		get_tree().change_scene_to_file(scene_paths[scene_name])
	else:
		print(str(scene_name) + " not found")

