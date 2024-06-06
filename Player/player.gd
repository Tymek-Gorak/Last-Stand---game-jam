extends CharacterBody2D
class_name Player

signal died

@export var MAX_SPEED := 600

@export var speed := 50
@export var friction := 20
@export var attack_pull_speed := 3000
@export var roll_speed := 2000

@export var sprite_armor : Texture
@export var sprite_hammer : Texture

func _ready():
	%PlayerSprite.texture = sprite_armor
	$PlayerSprite/WeaponSprite.texture = sprite_hammer

##passes up the signal from the hitbox for other nodes to access 
func _on_hitbox_died():
	died.emit(self)
	modulate = Color.BLACK
	await get_tree().create_timer(2).timeout
	Manager.player_died()
