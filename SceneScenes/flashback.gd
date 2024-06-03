extends Node2D
class_name FlashbackLogic


@export_file("*.tscn") var battle_scene : String
@export_file("*.tscn") var wave_scene : String
@export var training_dummy : PackedScene
var dummies_killed : int


func _process(delta):
	if dummies_killed == 2:
		%AnimationPlayer.play("training waves")
		set_process(false)

func wave_left(speed := 50):
	var wave =  load(wave_scene).instantiate()
	wave.position = Vector2(0, 491)
	wave.end_pos = Vector2(1945, 491)
	wave.speed = speed
	add_child(wave)
	
func wave_right(speed := 50):
	var wave = load(wave_scene).instantiate()
	wave.position = Vector2(1945, 491)
	wave.end_pos = Vector2(0, 491)
	wave.speed = speed
	add_child(wave)
	
func wave_up(speed := 50):
	var wave = load(wave_scene).instantiate()
	wave.position = Vector2(1153, -10)
	wave.end_pos = Vector2(1153, 1106)
	wave.speed = speed
	wave.is_horizontal = true
	add_child(wave)
	
func wave_down(speed := 50):
	var wave = load(wave_scene).instantiate()
	wave.position = Vector2(1153, 1106)
	wave.end_pos = Vector2(1153, -10)
	wave.speed = speed
	wave.is_horizontal = true
	add_child(wave)
	
func summon_training_dummy(pos : Vector2):
	var dummy = training_dummy.instantiate()
	dummy.position = pos
	add_child(dummy)
	dummy.connect("died", back_to_present)

func back_to_present():
	get_tree().change_scene_to_packed(load(battle_scene))
