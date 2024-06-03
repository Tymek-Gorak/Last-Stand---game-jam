extends CharacterBody2D
class_name BreadBoss

signal took_damage

@export var attack_cooldown := 1.5
@export var attack_cooldown_range := .3
@export var swing_pull_speed = 3000
@export var friction := 20

##passes up the signal from the hitbox for other nodes to access 
func _on_hitbox_took_damage(hurtbox, remaining_health):
	took_damage.emit(hurtbox, remaining_health)

func prep_for_death():
	for node : Node in [%Sprite2D, %Hitbox, %CollisionShape2D, %BreadBossStateMachine, %SwordSlashHurtbox, %AOECircleHurtbox, %LungeHurtbox, %PlayerPointer]:
		print(node)
		node.queue_free()

func died():
	%AnimationPlayer.play("die")


