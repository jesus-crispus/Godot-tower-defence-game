extends Node2D


var component_list = []


signal fire_is_allowed_by_tower
var enemy_detected = false
@export var Tower_data: Resource

# Called when the node enters the scene tree for the first time.
func _ready():
	pass#$radar_shape/radius.set_radius(tower_base_stats.radar_range)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	is_fire_allowed()









func _on_radar_node_no_enemy_detected():
	enemy_detected = false


func _on_radar_node_enemy_detected():
	enemy_detected = true

func is_fire_allowed():
	if enemy_detected == true:
		fire_is_allowed_by_tower.emit()

#func _give_data_to_children():
#	var nodes_that_wants_level_resource
#	nodes_that_wants_level_resource = get_tree().get_nodes_in_group("wants level resource")
#	for node in nodes_that_wants_level_resource:
#		node.Tower_data = Tower_data


#for lop checing for component
	#for n in component_list.size():
		#var current_component = component_list.find(n)
		#if current_component.has_method("AimPoint"):
			#pass





func _on_request_tower_data(reciver):
	reciver.Tower_data = Tower_data
