extends Area2D
class_name Hitbox

##health of Hitbox
@export var health = 32

##emited when health reaches 0 or less
signal died
signal took_damage

func _ready():
	connect("area_entered", got_hit)

func got_hit(hurtbox):
	health -= hurtbox.damage
	took_damage.emit(hurtbox, health)
	if health <= 0:
		died.emit()

