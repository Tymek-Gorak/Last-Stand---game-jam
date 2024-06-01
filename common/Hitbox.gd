extends Area2D
class_name Hitbox

##health of Hitbox
var health = 100

##emited when health reaches 0 or less
signal died

func _ready():
	connect("area_entered", got_hit)

func got_hit(hurtbox):
	print(hurtbox.damage)
	health -= hurtbox.damage
	if health <= 0:
		died.emit()

