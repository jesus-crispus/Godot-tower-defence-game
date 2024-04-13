extends Node


@onready var enemy = load("res://soldier.tscn")
var 	level_resourse: Resource
var enemies_spawned = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	$"spawn timer".start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_spawn_timer_timeout():
	var instance = enemy.instantiate()
	instance.level_resourse = level_resourse
	$Path2D.add_child(instance)
	$"spawn timer".start()
	enemies_spawned += 1
	print(enemies_spawned)
