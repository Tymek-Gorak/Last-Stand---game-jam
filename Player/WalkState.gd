extends State

@onready var p := $"../.."  

func _ready():
	pass

func _process(delta):
	
	var move_vector := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if move_vector != Vector2.ZERO: 
		move_vector = p.velocity.move_toward(move_vector * p.MAX_SPEED, p.speed)
	else: 
		move_vector = p.velocity.move_toward(Vector2.ZERO, p.friction)
	
	p.velocity = move_vector
	p.move_and_slide()
