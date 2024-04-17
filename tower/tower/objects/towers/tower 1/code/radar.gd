extends Area2D



var Tower_data: Resource






func _ready():
	_get_resource()
	$radar_collison.shape.radius = return_radar_radius()
	#$radar_shape.shape.radius = return_radar_radius()



signal request_Tower_data(reciver)

func _get_resource():
	
	var parent = get_parent()
	for n in 10:
		if parent.has_method("_on_request_tower_data"):
			self.connect("request_Tower_data",parent._on_request_tower_data)
			request_Tower_data.emit(self)
			return
		else: parent = parent.get_parent() 
	
	if Tower_data == null:
		printerr(self," did not find resource")








func return_radar_radius():
	var Radius
	Radius = (Tower_data.radar_range * (Tower_data.size/2))
	return  Radius

#get_overlapping_areas()


func _process(delta):
	pass




