extends Node

var Tower_data: Resource 
var level_resourse: Resource 
var tower_preview_reference
#var tower_preview
# Called when the node enters the scene tree for the first time.



func _ready():
	pass # Replace with function body.




func _on_tower_button_pressed(tower_resource):
	if tower_preview_reference == null:
		Tower_data = tower_resource
		var tower_preview = load(Tower_data.tower_prevew_path)#: String = Tower_data.tower_prevew_path
		spawn_tower_preview(tower_preview)
	else:
		tower_preview_reference.end_preview()
	


func spawn_tower_preview(tower_preview):
	var instance = tower_preview.instantiate()
	instance.level_resourse = level_resourse
	instance.Tower_data = Tower_data
	add_child(instance)
	tower_preview_reference = instance
	#instance.Tower_data = Tower_data
	
