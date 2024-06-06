extends State
class_name ParryState

@onready var animation_player := %AnimationPlayer

func _enter_state():
	super._enter_state()
	a.velocity = Vector2.ZERO
	%ParryArea.look_at(a.get_global_mouse_position())
	animation_player.play("Parry")
	
func _process(delta):
	a.move_and_slide()

func start_walking():
	get_parent().change_state(%WalkState)
