extends Node


var current_target
var list_of_enemies = []

signal  start_fiering_sequence()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if current_target != null:
		get_parent().look_at(current_target.global_position)
		start_fiering_sequence.emit()









func set_delatyed(target, propertyName, delay, value):
	get_tree().create_timer(delay, false).connect("timeout",target.set.bind(propertyName, value))

func call_delayed(callable : Callable, delay : float):
	get_tree().create_timer(delay, false).connect("timeout",callable)


func _on_radar_body_entered(body):
	var instance = body#.get_parent()
	if instance.is_in_group("Enemy"):
		list_of_enemies.append(instance)
		if current_target == null:
			current_target = instance
		elif is_new_ememy_a_better_target(current_target, instance):
			current_target = instance
	
	

func _on_radar_body_exited(body):
	var  instance = body#.get_parent()
	if instance.is_in_group("Enemy"):
		list_of_enemies.erase(instance)
		if instance == current_target:
			_determin_new_target()



func _determin_new_target():
	var best_choice = list_of_enemies.front()
	for  n in list_of_enemies:
		if is_new_ememy_a_better_target(best_choice, n):
			best_choice = n  
	current_target = best_choice



func is_new_ememy_a_better_target(old, new):
	if new.spawn_number <  old.spawn_number:
		
		return true






