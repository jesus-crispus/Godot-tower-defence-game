extends Node2D


var Tower_data: Resource
signal request_Tower_data(reciver)

var projectile
@onready var coldown = $coldown

var projectile_instance 
func _ready():
	request_Tower_data.emit(self)
	projectile = load(Tower_data.tower_projectile_path)
	
	coldown.wait_time = Tower_data.fire_rate



func _fire():
	projectile_instance = projectile.instantiate()
	add_sibling(projectile_instance)
	projectile_instance.position = position
	projectile_instance.rotation = rotation


#func _on_coldown_timeout():
#	_fire()








func AimPoint():
	pass


func _on_tower_node_fire_is_allowed_by_tower():
	if coldown.is_stopped():
		_fire()
		coldown.start()
