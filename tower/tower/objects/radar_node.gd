extends Area2D


var enemy_instance
var list_of_enemies = []
#var radar_radius
signal enemy_detected()
signal no_enemy_detected()
@export var tower_base_stats: Resource = load("res://objects/towers/tower 1/other resources/tower_1_stats.tres")
signal purchase(tower_cost)

func _ready():
	connect_to_parent()
	
	$radar_shape.shape.radius = return_radar_radius()

func _get_tower_base_stats():
	pass

func return_radar_radius():
	var Radius
	Radius = (tower_base_stats.radar_range * (tower_base_stats.size/2))
	return  Radius


func connect_to_parent():
	get_parent().component_list.append(self)

func _process(delta):
	if enemy_instance != null:
		get_parent().look_at(list_of_enemies.front().position)
	
	
	if list_of_enemies.is_empty():
		no_enemy_detected.emit()



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


