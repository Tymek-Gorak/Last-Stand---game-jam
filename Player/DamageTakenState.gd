extends DamageTakenState
class_name IFramesDamageTakenState

func got_hit(hurtbox, remaining_health):
	if remaining_health > 0:
		get_parent().change_state(self)
		%AnimationPlayer.play("get_hit")
		super.got_hit(hurtbox, remaining_health)
	var tween = create_tween()
	tween.tween_interval(.09)
	tween.tween_property(%Hitbox, "monitoring", false, 0)
	if remaining_health > 0:
		for i in range(5):
			for sprite in sprites:
				tween.tween_property(sprite, "modulate", Color(1, 1, 1, .5), 0)
			tween.tween_interval(.11)
			for sprite in sprites:
				tween.tween_property(sprite, "modulate", Color.WHITE, 0)
			tween.tween_interval(.2)
		tween.tween_property(%Hitbox, "monitoring", true, 0)
	else:
		get_parent().change_state(%PlayerDiedState)

func walk_again():
	get_parent().change_state(%IdleState)
