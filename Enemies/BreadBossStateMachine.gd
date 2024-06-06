extends StateMachine

var slashes_left = 0

func change_state(new_state: State):
	if slashes_left > 0:
		super.change_state(%BreadBossSlashState)
		slashes_left -= 1
	else:
		super.change_state(new_state)
