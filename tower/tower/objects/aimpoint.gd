extends Node2D

@onready var projectile = preload("res://objects/projectile.tscn")
@onready var coldown = $coldown
@onready var radar_node = preload("res://objects/radar_node.tscn")
var projectile_instance 
func _ready():
	connect_to_parent()

func connect_to_parent():
	get_parent().component_list.append(self)

func _fire():
	projectile_instance = projectile.instantiate()
	add_sibling(projectile_instance)
	projectile_instance.position = position
	projectile_instance.rotation = rotation


#func _on_coldown_timeout():
#	_fire()






func _on_radar_node_seize_fire():
	pass # Replace with function body.

func AimPoint():
	pass


func _on_tower_node_fire_is_allowed_by_tower():
	if coldown.is_stopped():
		_fire()
		coldown.start()
