extends Node

const GAME_SCENE = preload("res://Scenes/Game/game_scene.tscn")

func _on_test_map_button_up():
	SceneManager.change_scene("test_map")


func _on_play_button_up():
	for c in $Game.get_children():
		c.queue_free()
	$Game.add_child(GAME_SCENE.instantiate())


func _on_settings_button_up():
	pass # Replace with function body.


func _on_credits_button_up():
	pass # Replace with function body.
