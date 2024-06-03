extends CharacterBody2D
class_name Player

signal died

@export var MAX_SPEED := 600

@export var speed := 50
@export var friction := 20
@export var attack_pull_speed := 3000
@export var roll_speed := 2000



##passes up the signal from the hitbox for other nodes to access 
func _on_hitbox_died():
	died.emit(self)
	
	
	
