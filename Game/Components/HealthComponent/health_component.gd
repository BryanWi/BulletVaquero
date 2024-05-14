extends Area2D
class_name HealthComponent

##Este nodo por defecto conecta los nodos Area2D a 

@export var max_health:int = 5
@export var health:int = 0:
	set(new_val):
		health = new_val
		health_changed.emit(new_val)
		if health <= 0:
			
			health_is_zero.emit()


@onready var invincibility_timer = $"../InvincibilityTimer"

## Avisa cuando cambia la vida 
signal health_changed(new_health)
signal health_is_zero


func _ready():
	health = max_health

func _on_area_entered(area):
	print(area)
	if area.name == ("HurtBox"):
		take_damage(area.damage)
	elif area.name == ("HealBox"):
		heal(area.healing)
	print(health)

func take_damage(damage):
	health = health - damage

func heal(healing):
	health = health + healing
