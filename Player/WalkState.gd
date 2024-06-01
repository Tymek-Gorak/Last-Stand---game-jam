extends BaseMovementState
class_name WalkState

func _ready():
	pass

func _process(delta):
	var move_vector := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if move_vector != Vector2.ZERO: 
		move_vector = a.velocity.move_toward(move_vector * a.MAX_SPEED, a.speed)
	else: 
		move_vector = a.velocity.move_toward(Vector2.ZERO, a.friction)
	a.velocity = move_vector
	a.move_and_slide()
	
	if a.velocity.is_zero_approx():
		go_idle()
	
	if Input.is_action_just_pressed("roll"):
		roll()
	
	super._process(delta)
	
func go_idle():
	get_parent().change_state(%IdleState)

func roll():
	get_parent().change_state(%RollState)
