extends Node2D

@export var end_pos : Vector2
@export var speed : float
@export var is_horizontal = false



func _ready():
	if is_horizontal == true:
		var temp
		temp = scale.y
		scale.y = scale.x
		scale.x = temp
	var tween = create_tween()
	tween.tween_property(self, "position", end_pos, 100 * (1 / speed))
	await tween.finished
	queue_free()
