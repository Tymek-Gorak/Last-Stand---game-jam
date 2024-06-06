extends State
class_name DamageTakenState

@export var knockback_mult : int
@export var knockback_res : float

@export var sprites : Array[Sprite2D]

func got_hit(hurtbox, remaining_health):

	var tween = create_tween()
	var tween2 = create_tween()
	var knockback_amount = a.position - a.position.direction_to(hurtbox.owner.to_global(hurtbox.position)).normalized() * hurtbox.knockback * knockback_mult / knockback_res
	tween2.tween_property(a, "position", knockback_amount, 0.2).set_ease(Tween.EASE_OUT)
	for sprite : Sprite2D in sprites:
		tween.tween_property(sprite, "modulate", Color(255, 255, 255), 0)
	#Always remember to add a delay when adding a tween to child states equal 0.09s
	tween.tween_interval(0.09)
	for sprite : Sprite2D in sprites:
		tween.tween_property(sprite, "modulate", Color(1, 1, 1), 0)
