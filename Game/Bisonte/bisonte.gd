extends Node2D

@onready var animated_sprite:AnimatedSprite2D = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	var animation_names = animated_sprite.sprite_frames.get_animation_names()
	var anim_size = animation_names.size()
	var rand_anim = animation_names[randi_range(0,anim_size-1)]
	animated_sprite.play(rand_anim)
	print(rand_anim)
	#animated_sprite.animation#pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
