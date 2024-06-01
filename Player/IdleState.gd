extends BaseMovementState
class_name IdleState

func _ready():
	pass

func _process(delta):
	var move_vector := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if move_vector != Vector2.ZERO: 
		walk()
	
	super._process(delta)
		
func walk():
	get_parent().change_state(%WalkState)
