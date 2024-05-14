extends Node2D

var bisonte = preload("res://Game/Bisonte/bisonte.tscn")
var dir:int = 1

var SPEED:int = 900
var boost:float = 1.0

var moving:bool = false

func _ready():
	var bis = bisonte.instantiate()
	var animation_names:Array = bis.get_anim_names()
	animation_names.shuffle()
	for p in $Bisonte_pos.get_children():
		bis = bisonte.instantiate()
		bis.position = p.position	
		bis.set_animation(animation_names.pop_front())
		self.add_child(bis)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if moving:
		position.x += SPEED * boost * dir * delta 

func start_moving():
	moving = true
