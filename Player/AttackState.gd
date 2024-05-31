extends State

func _enter_state():
	super._enter_state()
	%HammerHurtbox.look_at(a.get_global_mouse_position())
	a.velocity = Vector2.ZERO
	a.velocity = a.velocity.direction_to(a.get_local_mouse_position())
	
	var tween = create_tween()
	tween.tween_property(%HammerHurtbox, "monitorable", true, 0)
	tween.tween_property(a, "velocity", a.velocity * a.attack_pull_speed, 0.1).set_ease(Tween.EASE_IN)
	tween.tween_property(a, "velocity", a.velocity.normalized() * a.attack_pull_speed / 200 , 0.07)
	tween.tween_property(%HammerHurtbox, "monitorable", false, 0)
	tween.tween_callback(back_to_walking)


func _process(delta):
	a.move_and_slide()

func back_to_walking():
	get_parent().change_state(%WalkState)
