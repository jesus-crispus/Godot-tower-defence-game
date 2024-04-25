extends Button



@onready var Tower_data: Resource = preload("res://objects/towers/tower 1/other resources/tower_1_data.tres")


signal tower_1_button_pressed(tower_resource)
func _ready():
	text = "cr: " + str(Tower_data.cost)
	Tower_data.projectile_parent = str(%ProjectileManege)


func _unhandled_input(event):
	if Input.is_action_just_pressed("tower_1_hot_key",1):
		tower_1_button_pressed.emit(Tower_data)



func _on_button_up():
	
	tower_1_button_pressed.emit(Tower_data)
	
	#var instance = tower_preview.instantiate()
	#instance.main_referens = Main_referens
	#purchase.emit(tower_base_stats.cost)
	#instance.connect("_tower_preview_has_started", Main_referens._on_tower_preview_has_started)
	#instance.connect("preview_is_done", Main_referens._on_tower_preview_is_done)
	#instance.connect("purchase",Main_referens._on_tower_preview_purchase)
	#Main_referens.connect("_credits_reference", instance._on_credits_reference)
	#add_sibling(instance)
	

#func _on_tower_preview_is_done():
#	purchase.emit(tower_base_stats.cost)



