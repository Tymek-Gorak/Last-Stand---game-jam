extends State
class_name BaseMovementState

func _process(delta):
	if Input.is_action_just_pressed("attack_primary") and %AttackCooldownTimer.time_left == 0:
		attack()
		
	#parrying is too time consuming for the soon-approaching deadling. will return to it if there will be enough time TODO
	#if Input.is_action_just_pressed("parry"):
	#	parry()

func attack():
	get_parent().change_state(%AttackState)
	%AttackCooldownTimer.start()

#func parry():
#	get_parent().change_state(%ParryState)
