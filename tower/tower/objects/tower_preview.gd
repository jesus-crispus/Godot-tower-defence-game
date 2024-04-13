extends Node2D

@onready var tower = load("res://objects/tower_base.tscn")
var can_place = true 
var can_buy = false
var main_referens
@export var tower_base_stats: Resource
signal _tower_preview_has_started(preview)
signal preview_is_done()
signal purchase(tower_cost)
signal ask_for_credits_reference()
# Called when the node enters the scene tree for the first time.
func _ready():
	_tower_preview_has_started.emit(self)
	print(self)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = get_global_mouse_position().snapped(Vector2(64,64))
	
	
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and can_place:
		if can_buy == true:
			place_tower()

func check_if_can_place():
	pass
	
	



func place_tower():
	var instance = tower.instantiate()
	add_sibling(instance)
	instance.position = position
	purchase.emit(tower_base_stats.cost)
	
	end_preview()


func end_preview():
	
	
	preview_is_done.emit()
	queue_free()




func _on_area_2d_body_entered(body):
	can_place = false
	$Sprite2D.modulate = Color(1,0,0)


func _on_area_2d_body_exited(body):
	can_place = true
	$Sprite2D.modulate = Color(0,0,0)

func _on_credits_reference(Credits):
	if Credits >= tower_base_stats.cost:
		can_buy = true
	else:
		can_buy = false
	print("test")


func _on_area_2d_area_entered(area):
		if area.has_method("tower_body"):
			can_place = false
			$Sprite2D.modulate = Color(1,0,0)

func _on_area_2d_area_exited(area):
	if area.has_method("tower_body"):
			can_place = true
			$Sprite2D.modulate = Color(0,0,0)

func can_place_tower():
	pass




