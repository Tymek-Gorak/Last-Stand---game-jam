extends BaseMovementState
class_name WalkState

@export var sprite : Sprite2D 

func _ready():
	pass
	
func _enter_state():
	super._enter_state()

func _process(delta):
	if not %AnimationPlayer.current_animation == "attack":
		%AnimationPlayer.play("Walk")
		
	var move_vector := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if move_vector != Vector2.ZERO: 
		move_vector = a.velocity.move_toward(move_vector * a.MAX_SPEED, a.speed)
		if move_vector.x > 0:
			sprite.scale.x = 1
		elif move_vector.x < 0:
			sprite.scale.x = -1
			
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
