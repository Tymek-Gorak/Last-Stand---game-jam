extends Node
class_name State

## ACTOR called a for shorter writing
@onready var a := owner as CharacterBody2D

func _ready():
	set_process(false)

func _enter_state():
	set_process(true)
	pass

func _exit_state():
	set_process(false)
	pass
