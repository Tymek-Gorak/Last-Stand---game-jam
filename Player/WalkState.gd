extends State

func _ready():
	pass

func _process(delta):
	var move_vector := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if move_vector != Vector2.ZERO: 
		move_vector = a.velocity.move_toward(move_vector * a.MAX_SPEED, a.speed)
	else: 
		move_vector = a.velocity.move_toward(Vector2.ZERO, a.friction)
	
	if Input.is_action_just_pressed("roll"):
		roll()
		
	if Input.is_action_just_pressed("attack_primary") and %AttackCooldownTimer.time_left == 0:
		attack()
	
	a.velocity = move_vector
	a.move_and_slide()

func roll():
	get_parent().change_state(%RollState)

func attack():
	get_parent().change_state(%AttackState)
	%AttackCooldownTimer.start()
