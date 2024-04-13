extends Node

var level_resourse: Resource
var credits = 150
func _ready():
	pass

#should be caled every time credits is changed
func money_changed():
	pass
	

func _process(delta):
	if level_resourse == null:
		level_resourse.money_maneger_reference = str(self)
