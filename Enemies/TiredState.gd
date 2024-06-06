extends State
class_name TiredState

##Player node, p for short
@onready var p = get_tree().get_first_node_in_group("Player") as CharacterBody2D

func _enter_state():
	super._enter_state()
	#if not %AnimationPlayer.current_animation == "attack":
	%AnimationPlayer.play("Tired")
	
	
	await get_tree().create_timer(a.attack_cooldown + randf_range(-a.attack_cooldown_range, a.attack_cooldown_range)).timeout
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
	%AnimationPlayer.play("SlashPrep")
	await get_tree().create_timer(1).timeout
	get_parent().slashes_left = randi_range(5, 8)
	get_parent().change_state(%BreadBossSlashState)
	
func aoe_circle_attack():
	%AnimationPlayer.play("AOECirclePrep")
	await get_tree().create_timer(0.8).timeout
	get_parent().change_state(%AOECircleAttackState)

func throw_sword():
	%AnimationPlayer.play("SwordThrowPrep")
	await get_tree().create_timer(.5).timeout
	get_parent().change_state(%SwordThrowState)
