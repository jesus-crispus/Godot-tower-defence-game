extends Area2D


var enemy_instance
var list_of_enemies = []
#var radar_radius
signal enemy_detected()
signal no_enemy_detected()

#tower data resource
var Tower_data: Resource
signal request_Tower_data(reciver)



func _ready():
	request_Tower_data.emit(self)
	
	$radar_shape.shape.radius = return_radar_radius()





func return_radar_radius():
	var Radius
	Radius = (Tower_data.radar_range * (Tower_data.size/2))
	return  Radius


func connect_to_parent():
	get_parent().component_list.append(self)

func _process(delta):
	if enemy_instance != null:
		get_parent().look_at(list_of_enemies.front().position)
	
	
	if list_of_enemies.is_empty():
		no_enemy_detected.emit()
	
	print(get_overlapping_areas())
	print(list_of_enemies)



func _on_area_entered(area):
	if area.get_parent().has_method("Enemy"):
		_enemy_detected(area)
		



func _on_area_exited(area):
	if area.get_parent().has_method("Enemy"):
		list_of_enemies.erase(area.get_parent())

func _enemy_detected(enemy):
	enemy_instance = enemy.get_parent()
	list_of_enemies.append(enemy_instance)
	enemy_detected.emit()


