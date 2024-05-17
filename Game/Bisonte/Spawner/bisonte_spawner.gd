extends Node2D

const manada = preload("res://Game/Bisonte/Manada/manada.tscn")
# Called when the node enters the scene tree for the first time.

#exports
@export_range(0,1,0.01) var stampeede_probabilty = 0.5 
@export_range(0,1,0.01) var dual_stampeede_probabilty = 1 
@export var stampeede_scaling = 0.1
@export var stampeede_scaling_probablity = 0.2


var starting_time = 0

@onready var stampeede_timer = $Timer
@onready var izq_pos = [$Izq/up.global_position,$Izq/mid.global_position,$Izq/down.global_position]
@onready var der_pos = [$Der/up.global_position,$Der/mid.global_position,$Der/down.global_position]

func _ready():
	randomize()
	starting_time = Time.get_ticks_msec()

## spawnea una manada en derecha o izquierda, según la posición indicada 
## up:0, mid:1, down:2
func spawn_manada(izq:bool,pos:int):
	var pos1:Vector2 = Vector2.ZERO
	var pos2:Vector2 = Vector2.ZERO
	var m = manada.instantiate()
	if !izq:
		pos1 = izq_pos[pos]
		pos2 = der_pos[pos]
		m.global_position = izq_pos[pos]
		print("izq")
		print(m.global_position)
		m.dir = 1
	else:
		pos1 = der_pos[pos]
		pos2 = izq_pos[pos]
		m.scale.x = -m.scale.x
		m.global_position = pos1
		print("der")
		print(m.global_position)
		m.dir = -1
	var T = LASER(pos1,pos2)
	T.tween_callback(m.start_moving)
	self.add_child(m)

## Timer para aparecer las manadas
## Cambiar el tiempo aleatoriamente cada que se usa
func _on_timer_timeout():
	if randf() < stampeede_probabilty:
		return
	if randf() < stampeede_scaling_probablity:
		#var elapsed_sec = (starting_time - Time.get_ticks_msec())/1000.0
		stampeede_probabilty += 0.4
		stampeede_timer.wait_time *= 0.9
	
	if randf() < dual_stampeede_probabilty:
		var side_1 = false if (randf() >= 0.5) else true
		var side_2 = false if (randf() >= 0.5) else true
		spawn_manada(side_1,0)
		spawn_manada(side_2,2)
		return
	
	
	var pos = randi_range(0,2)
	if randi_range(0,1)==0:
		spawn_manada(true,pos)
	else:
		spawn_manada(false,pos)

func LASER(pos1:Vector2, pos2:Vector2) -> Tween:
	print("LASER")
	var L:Line2D = Line2D.new()
	L.points = PackedVector2Array([pos1,pos2])
	L.width = 50
	L.default_color = Color(0.5,0,0,0.5)
	var curve:Curve = Curve.new()
	curve.add_point(Vector2(0,1))
	curve.add_point(Vector2(1,0))
	L.width_curve = curve
	var T:Tween = get_tree().create_tween()
	T.tween_property(L,"width",0,1).set_trans(Tween.TRANS_EXPO)
	self.add_child(L)
	return T
