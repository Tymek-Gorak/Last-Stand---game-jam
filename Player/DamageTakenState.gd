extends DamageTakenState
class_name IFramesDamageTakenState

func got_hit(hurtbox, remaining_health):
	get_parent().change_state(self)
	%AnimationPlayer.play("get_hit")
	super.got_hit(hurtbox, remaining_health)
	var tween = create_tween()
	tween.tween_interval(.09)
	tween.tween_property(%Hitbox, "monitoring", false, 0)
	for i in range(5):
		tween.tween_property(%Sprite2D, "modulate", Color(1, 1, 1, .5), 0)
		tween.tween_interval(.11)
		tween.tween_property(%Sprite2D, "modulate", Color.WHITE, 0)
		tween.tween_interval(.2)
	tween.tween_property(%Hitbox, "monitoring", true, 0)

func walk_again():
	get_parent().change_state(%IdleState)
