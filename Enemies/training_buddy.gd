extends CharacterBody2D


signal died

func _on_hitbox_died():
	%AnimationPlayer.play("die")
	if owner is FlashbackLogic:
		owner.dummies_killed += 1
	died.emit()

func prep_for_death():
	for node : Node in [%Sprite2D, $Hitbox, $CollisionShape2D]:
		node.queue_free()
