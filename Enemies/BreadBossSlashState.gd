extends State
class_name BreadBossSlashState

##Player shortcut named p for short
@onready var p = get_tree().get_first_node_in_group("Player") as CharacterBody2D

func _enter_state():
	super._enter_state()
	%PlayerPointer.rotate(clamp(%PlayerPointer.get_angle_to(p.position), -TAU / 4, TAU / 4))
	%SwordSlashHurtbox.rotation = %PlayerPointer.rotation
	a.velocity = %PlayerPointer.target_position.normalized().rotated(%PlayerPointer.rotation)
	var tween = create_tween()
	tween.tween_property(%SwordSlashHurtbox, "monitorable", true, 0)
	tween.tween_property(a, "velocity", a.velocity.normalized() * a.swing_pull_speed, 0.04).set_ease(Tween.EASE_IN)
	tween.tween_property(a, "velocity", Vector2.ZERO , 0.07)
	tween.tween_property(%SwordSlashHurtbox, "monitorable", false, 0)
	tween.tween_interval(.3)
	tween.tween_callback(get_tired)
	

func _process(delta):
	a.move_and_slide()


func get_tired():
	get_parent().change_state(%TiredState)
