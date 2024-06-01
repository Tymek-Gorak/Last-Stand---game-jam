extends State
class_name DazedState

func _enter_state():
	super._enter_state()
	await get_tree().create_timer(1)
	get_parent().change_state(%TiredState)
