extends Node
class_name StateMachine

@export var curr_state : State

func _ready():
	if owner is BreadBoss:
		await get_tree().create_timer(1).timeout
	curr_state._enter_state()
	
func change_state(new_state : State):
	curr_state._exit_state()
	new_state._enter_state()
	curr_state = new_state

