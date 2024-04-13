extends Button

@onready var tower_preview = preload("res://objects/tower_preview.tscn")
@export var tower_base_stats: Resource
var Main_referens
#signal purchase(tower_cost)
func _ready():
	Main_referens = get_parent()

func _on_button_up():
	var instance = tower_preview.instantiate()
	instance.main_referens = Main_referens
	#purchase.emit(tower_base_stats.cost)
	instance.connect("_tower_preview_has_started", Main_referens._on_tower_preview_has_started)
	instance.connect("preview_is_done", Main_referens._on_tower_preview_is_done)
	instance.connect("purchase",Main_referens._on_tower_preview_purchase)
	Main_referens.connect("_credits_reference", instance._on_credits_reference)
	add_sibling(instance)
	

#func _on_tower_preview_is_done():
#	purchase.emit(tower_base_stats.cost)
