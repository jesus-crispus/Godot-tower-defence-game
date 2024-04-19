extends CharacterBody2D

var speed = 100
var value = 1
var level_resourse : Resource
var spawn_number
var end_destination
var curent_destination
var target
@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D

func _ready():
	
	
	curent_destination = end_destination
	_refresh_path()

func _physics_process(delta):
	var directon = to_local(nav_agent.get_next_path_position()).normalized()
	velocity = directon * 200
	move_and_slide()
	
	

func _refresh_path():
	if curent_destination != null:
		
		nav_agent.target_position = curent_destination







func soldier_death():
	level_resourse.credits += value
	queue_free()







func _on_timer_timeout():
	_refresh_path()


#func _on_aggro_range_area_entered(area):
#	if area.get_parent().is_in_group("tower"):
#		target = area.get_parent()
#		curent_destination = target.position

