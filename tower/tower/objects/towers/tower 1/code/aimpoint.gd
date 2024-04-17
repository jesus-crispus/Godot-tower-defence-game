extends Node2D


var Tower_data: Resource
signal request_Tower_data(reciver)

var i_have_magazine
var is_fire_allowed_by_tower = false
var magazine_size
var rounds_left_in_magazine
var curently_reloding = false

var projectile
@onready var coldown = $coldown
@onready var magazine_reload_timer = $magazine_reload_timer


var projectile_instance 
func _ready():
	request_Tower_data.emit(self)
	projectile = load(Tower_data.tower_projectile_path)
	
	check_if_has_magazine()
	coldown.wait_time = Tower_data.fire_rate

func _process(delta):
	check_if_can_fire()

func check_if_has_magazine():
	if Tower_data.has_magazine == true:
		i_have_magazine = true
		magazine_size = Tower_data.magazine_size
		rounds_left_in_magazine = magazine_size
		magazine_reload_timer.wait_time = Tower_data.reload_speed
	else:
		i_have_magazine = false



func try_to_fire_with_magazine():	
	if curently_reloding == false:
		if rounds_left_in_magazine > 0 and rounds_left_in_magazine <= (magazine_size + 1):
			rounds_left_in_magazine -= 1
			
			_fire()
		else: reload_magazine()
	

func reload_magazine():
	curently_reloding = true
	magazine_reload_timer.start()
	
	





func try_to_fire_without_magazine():
	
	
	_fire()
	


func _fire():
	coldown.start()
	
	var projectile_instance
	projectile_instance = projectile.instantiate()
	add_sibling(projectile_instance)
	projectile_instance.position = position
	projectile_instance.rotation = rotation


#func _on_coldown_timeout():
#	_fire()








func AimPoint():
	pass


func _on_tower_node_fire_is_allowed_by_tower(is_fire_allowed):
	is_fire_allowed_by_tower = is_fire_allowed
	



func check_if_can_fire():
	if coldown.is_stopped():
		if i_have_magazine == true:
			try_to_fire_with_magazine()
		
		else:
			try_to_fire_without_magazine()




func _on_magazine_reload_timer_timeout():
	rounds_left_in_magazine = magazine_size
	var curently_reloding = false
	


func _on_coldown_timeout():
	pass # Replace with function body.
