extends Node2D

@onready var enemy = load("res://soldier.tscn")
@onready  var credits_label = $credits_label
@onready var _self_hierarchy_position = self
var preview_is_active = false
var preview_instance
var credits = 150
signal _credits_reference(Credits)
# Called when the node enters the scene tree for the first time.
func _ready():
	#$"spawn timer".start()
	#credits_label.text = "credits: " + str(credits)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#print(self)
	#if preview_is_active:
	#	_credits_reference.emit(credits)



func _on_spawn_timer_timeout():
	var instance = enemy.instantiate()
	instance.main = _self_hierarchy_position
	$Path2D.add_child(instance)
	$"spawn timer".start()

func _on_tower_preview_has_started(preview):
	preview_is_active = true
	preview_instance = preview
	#preview.connect("_credits_reference", preview._on_credits_reference)

func _on_tower_preview_is_done():
	preview_is_active = false

func _on_tower_preview_purchase(cost):
	credits -= cost
	credits_label.text = "credits: " + str(credits)


func _on_soldier_unit_defeat(value):
	credits += value
	credits_label.text = "credits: " + str(credits)
