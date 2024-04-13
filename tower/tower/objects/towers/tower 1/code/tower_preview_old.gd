extends Node2D

@onready var tower = load("res://objects/tower_base.tscn")
var can_place = false
var area_blocked = false
var main_referens
var Tower_data: Resource
var level_resourse: Resource
signal _tower_preview_has_started(preview)
signal preview_is_done()
signal purchase(tower_cost)
signal ask_for_credits_reference()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = get_global_mouse_position().snapped(Vector2(64,64))
	
	check_if_can_place()
	
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and can_place:
		place_tower()

func check_if_can_place():
	if check_if_position_is_blocked() == false:
		if check_if_can_afford() == true:
			can_place = true
			$Sprite2D.modulate = Color(0,0,0)
			
		else: change_color_to_red()
	else: change_color_to_red()

func change_color_to_red():
	$Sprite2D.modulate = Color(1,0,0)


func check_if_position_is_blocked():
	if area_blocked == true:
		return false
	


func check_if_can_afford():
	if level_resourse.credits >= Tower_data.cost:
		return true


func place_tower():
	var instance = tower.instantiate()
	add_sibling(instance)
	instance.position = position
	purchase_tower()
	
	end_preview()


func purchase_tower():
	
	level_resourse.credits += Tower_data.cost
	print("purchased",Tower_data.Name,"for",Tower_data.cost)

func end_preview():
	
	
	preview_is_done.emit()
	queue_free()




func _on_area_2d_body_entered(body):
	area_blocked = false

func _on_area_2d_body_exited(body):
	area_blocked = true




#func _on_area_2d_area_entered(area):
#	if area.has_method("tower_body"):
#	area_blocked = false


func _on_area_2d_area_exited(area):
	if area.has_method("tower_body"):
			can_place = true
			$Sprite2D.modulate = Color(0,0,0)

func can_place_tower():
	pass




