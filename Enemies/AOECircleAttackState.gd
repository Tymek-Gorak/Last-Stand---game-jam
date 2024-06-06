extends State
class_name AOECircleAttackState

func _enter_state():
	super._enter_state()
	%AnimationPlayer.play("AOECircle")
	var tween = create_tween()
	tween.tween_property(%AOECircleHurtbox, "monitorable", true, 0)
	tween.tween_interval(.1)
	tween.tween_property(%AOECircleHurtbox, "monitorable", false, 0)
	tween.tween_interval(.5)
	tween.tween_callback(final_slashes)
	
	
	
	
func final_slashes():
	get_parent().slashes_left = 2
	get_parent().change_state(%BreadBossSlashState)
	
