extends Node


@onready var enemy = load("res://soldier_path_finding.tscn")
var level_resourse: Resource
var curve_resourse: Resource = load("res://levels/level resourses/enemy_spawn_curve.tres")
var enemies_spawned = 0
var time_now = 0
@onready var spawnPoint = $spawnPoint
@onready var enemy_goal = $enemyGoal
# Called when the node enters the scene tree for the first time.
func _ready():
	$"spawn timer".start()
	$Timer.start()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_spawn_timer_timeout():
	var instance = enemy.instantiate()
	instance.level_resourse = level_resourse
	instance.spawn_number  = enemies_spawned
	instance.end_destination = enemy_goal.position
	spawnPoint.add_child(instance)
	$"spawn timer".start(curve_resourse.sample(($Timer.wait_time - $Timer.time_left)/60))
	enemies_spawned += 1
	print(enemies_spawned)
	print("time",$Timer.wait_time - $Timer.time_left)
