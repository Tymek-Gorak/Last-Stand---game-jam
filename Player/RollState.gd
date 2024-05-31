extends State

func _enter_state():
	super._enter_state()
	
	var tween = create_tween()
	tween.tween_property(a, "modulate", Color(255,255,0), 0)
	var move_vector := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if move_vector != Vector2.ZERO: 
		a.velocity = move_vector
	tween.tween_property(a, "velocity", a.velocity.normalized() * a.roll_speed, 0.15)
	tween.tween_property(a, "velocity", a.velocity.normalized() * a.roll_speed / 10, 0.3)
	tween.tween_property(a, "modulate", Color(255,255,255), 0)
	tween.tween_callback(start_walking)

func _process(delta):
	a.move_and_slide()

func start_walking():
	get_parent().change_state(%WalkState)
