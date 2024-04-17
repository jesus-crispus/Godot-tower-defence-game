extends Node2D

class_name Turret



signal fire_is_allowed_by_tower
@export var Tower_data: Resource

# Called when the node enters the scene tree for the first time.
func _ready():
	pass#$radar_shape/radius.set_radius(tower_base_stats.radar_range)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



















func _on_request_tower_data(reciver):
	reciver.Tower_data = Tower_data








