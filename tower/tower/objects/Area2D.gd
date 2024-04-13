extends Area2D

func _ready():
	connect_to_parent()

func connect_to_parent():
	get_parent().component_list.append(self)
func tower_body():
	pass
