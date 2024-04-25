extends Node2D


@onready var level_resourse: Resource = load("res://levels/level resourses/curent_level_resourse.tres")
@export var level_resourse_data: Resource



func _ready():
	_reset_level_resourse()
	_give_data_to_children()
	
	
	#_give_data_to_children() find("money manager")


#func _asign_reference_nodes_to_level_resourse():
	#var reference_nodes = []
	#reference_nodes = get_tree().get_nodes_in_group("reference nodes")
	#var money_manager_id = reference_nodes[reference_nodes.find("money manager")]
	#print(reference_nodes)
	#print(reference_nodes.find("money manager",0))
	#print(reference_nodes[reference_nodes.find("money manager")])
	#print()
	#var enemy_manager_id = reference_nodes[reference_nodes.find("enemy manager")]
	#level_resourse.money_maneger_reference = str(money_manager_id)
	#level_resourse.enemy_maneger_reference = str(enemy_manager_id)
#func find

func _reset_level_resourse():
	level_resourse.health = level_resourse_data.health
	level_resourse.credits = level_resourse_data.credits
	

func _on_request_level_resourse(reciver):
	reciver.level_resourse = level_resourse

func _give_data_to_children():
	var nodes_that_wants_level_resource
	nodes_that_wants_level_resource = get_tree().get_nodes_in_group("wants level resource")
	for node in nodes_that_wants_level_resource:
		node.level_resourse = level_resourse

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass



