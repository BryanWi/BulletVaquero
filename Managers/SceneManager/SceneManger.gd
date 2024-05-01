extends Node
#tiene el guión bajo para que no interfiera con el Singleton llamado SceneManager
class_name Scene_Manager

## Guarda las direcciones a las distintas escenas, para agregar más basta con arrastrar la escena
## para que se copie la dirección
var scene_paths = {
	"main" : "res://Scenes/Main/main.tscn",
	"test_map" : "res://Scenes/test_map/test_map.tscn"
}


## Permite que los 
func change_scene(scene_name):
	if scene_paths.has(scene_name):
		get_tree().change_scene_to_file(scene_paths[scene_name])
	else:
		print(str(scene_name) + " not found")

