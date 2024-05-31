extends State
class_name TiredState

##Player node, p for short
@onready var p = get_tree().get_first_node_in_group("Player") as CharacterBody2D

func _enter_state():
	super._enter_state()
	await get_tree().create_timer(.5).timeout
	if %PlayerPointer.is_colliding():
		var randomize_attack = randi_range(1,2)
		if randomize_attack == 1:
			slashy_slash()
		elif randomize_attack == 2:
			aoe_circle_attack()
	else:
		throw_sword()

func _process(delta):
	%PlayerPointer.look_at(p.position) 


func slashy_slash():
	await get_tree().create_timer(1).timeout
	get_parent().slashes_left = randi_range(5, 8)
	get_parent().change_state(%BreadBossSlashState)
	
func aoe_circle_attack():
	await get_tree().create_timer(1).timeout
	get_parent().change_state(%AOECircleAttackState)

func throw_sword():
	await get_tree().create_timer(1).timeout
	get_parent().change_state(%SwordThrowState)
