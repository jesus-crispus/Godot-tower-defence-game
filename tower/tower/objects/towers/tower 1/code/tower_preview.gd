extends Node2D

var tower
var can_place = false
var area_blocked = false
var Tower_data: Resource
var level_resourse: Resource
@onready var Sprite = $Sprite
signal request_level_resourse(reciver)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass #request_level_resourse.emit(self)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = get_global_mouse_position().snapped(Vector2(16,16))#Vector2(64,64)
	
	check_if_can_place()
	
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and can_place:
		place_tower()


func check_if_can_place():
	if check_if_position_is_placeable() == true:
		if check_if_can_afford() == true:
			can_place = true
			Sprite.modulate = Color(1,1,1)
			
		else: 
			change_color_to_red()
			can_place = false
	else: 
		change_color_to_red()
		can_place = false

func change_color_to_red():
	Sprite.modulate = Color(1,0,0)


func check_if_position_is_placeable():
	if $Area2D.has_overlapping_bodies() == false and $Area2D.has_overlapping_areas() == false:
		return true
	else:
		return false


func check_if_can_afford():
	if level_resourse.credits >= Tower_data.cost:
		return true


func place_tower():
	tower = load(Tower_data.tower_path)
	var instance = tower.instantiate()
	add_sibling(instance)
	instance.position = position
	purchase_tower()
	
	end_preview()


func purchase_tower():
	
	level_resourse.credits -= Tower_data.cost
	print("purchased ",Tower_data.Name," for ",Tower_data.cost)

func end_preview():
	
	
	
	queue_free()









func can_place_tower():
	pass




