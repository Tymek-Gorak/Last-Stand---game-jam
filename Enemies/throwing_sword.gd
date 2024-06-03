extends Node2D

@onready var bread_boss = get_tree().get_first_node_in_group("BreadBoss") as BreadBoss

signal sword_ready_for_pickup

func _ready():
	%Sword.position = to_local(bread_boss.position)
	%Sword.look_at(to_global(Vector2.ZERO))
	%AnimationPlayer.play("AOE")
	var tween = create_tween()
	tween.tween_property(%Sword, "position", Vector2.ZERO, 0.3).set_ease(Tween.EASE_OUT)
	tween.tween_interval(0.1)
	tween.tween_property(%DamageZoneHurtbox, "monitorable", true, 0)
	tween.tween_interval(0.2)
	tween.tween_property(%DamageZoneHurtbox, "monitorable", false, 0)
	tween.tween_callback(sword_grounded)
	
func sword_grounded():
	sword_ready_for_pickup.emit(position)


func _on_pickup_range_body_entered(area):
	queue_free()
