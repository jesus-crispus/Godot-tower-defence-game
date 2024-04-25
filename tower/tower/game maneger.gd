extends Node


var curent_level
func _ready():
	get_tree().paused = true
	curent_level = $"level test"


func _start_game():
	get_tree().paused = false




func _input(event):
	if Input.is_action_just_pressed("escape",1):
		_pause_game()



func _pause_game():
	if get_tree().paused == false:
		get_tree().paused = true
	else:
		get_tree().paused = false

func _restart_game():
	var child = curent_level
	child.queue_free()
	var level = load("res://levels/level_test.tscn")
	var instance = level.instantiate()
	add_child(instance)
	curent_level = instance
