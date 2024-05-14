extends CharacterBody2D
class_name Character

const SPEED = 24000.0

@onready var character_sprite = $AnimatedSprite2D
var direction:Vector2 = Vector2.ZERO

func _ready():
	$HealthComponent.health_is_zero.connect(func():SceneManager.change_scene("main"))

func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_vector("left", "right","forward","downward")
	if direction:
		velocity = direction * SPEED*delta
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
	sprite_changes()
	move_and_slide()

## Función que se encarga de acomodar el sprite
func sprite_changes():
	var look_angle =  direction.angle()
	
	if direction:
		global_rotation = lerp_angle(global_rotation,look_angle,0.3)
	
	if abs(global_rotation_degrees) < 45 :
		character_sprite.play("right") #animación correspondiente a ese ángulo
		character_sprite.rotation = deg_to_rad(0) #se rota el sprite pq los png estan orientados
	elif (global_rotation_degrees < -45) && (global_rotation_degrees > -135):
		character_sprite.rotation = deg_to_rad(90)
		character_sprite.play("up")
	elif abs(global_rotation_degrees) > 135:
		character_sprite.rotation = deg_to_rad(180)
		character_sprite.play("left")
	elif (global_rotation_degrees > 45) && (global_rotation_degrees < 135):
		character_sprite.rotation = deg_to_rad(270)
		character_sprite.play("down")
