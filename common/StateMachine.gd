extends Node
class_name StateMachine

@export var curr_state : State

func _ready():
	curr_state._enter_state()
	
func change_state(new_state : State):
	curr_state._exit_state()
	new_state._enter_state()
	curr_state = new_state

