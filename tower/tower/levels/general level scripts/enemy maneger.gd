extends Node


@onready var enemy = load("res://soldier_path_finding.tscn")
var level_resourse: Resource
var enemies_spawned = 0
@onready var spawnPoint = $spawnPoint
@onready var enemy_goal = $enemyGoal
# Called when the node enters the scene tree for the first time.
func _ready():
	$"spawn timer".start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_spawn_timer_timeout():
	var instance = enemy.instantiate()
	instance.level_resourse = level_resourse
	instance.spawn_number  = enemies_spawned
	instance.end_destination = enemy_goal.position
	spawnPoint.add_child(instance)
	$"spawn timer".start()
	enemies_spawned += 1
	print(enemies_spawned)
