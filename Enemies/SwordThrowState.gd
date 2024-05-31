extends State
class_name SwordThrowState

##Player, p for short
@onready var p = get_tree().get_first_node_in_group("Player") as CharacterBody2D 

##Throwing sword scene
@export var throwing_sword: PackedScene 


func _enter_state():
	super._enter_state()
	var sword = throwing_sword.instantiate() as Node2D
	sword.position = p.position
	sword.connect("sword_ready_for_pickup", lunge_to_sword)
	add_child(sword)

func lunge_to_sword(sword_pos):
	var tween = create_tween()
	tween.tween_property(%LungeHurtbox, "monitorable", true, 0)
	tween.tween_property(a, "position", sword_pos, .3).set_ease(Tween.EASE_OUT)
	tween.tween_property(%LungeHurtbox, "monitorable", false, 0)
	#pick up sword
	tween.tween_interval(0.2)
	tween.tween_callback(final_slash).set_delay(0.3)
	
func final_slash():
	get_parent().change_state(%BreadBossSlashState)
