extends Node2D




var Tower_data: Resource
var projectile
var magazine_size
var rounds_left_in_magazine
#var reserve_ammo = Tower_data.max_ammo
var fire_is_allowed = true

func _ready():
	_get_resource()
	projectile = load(Tower_data.tower_projectile_path)
	magazine_size = Tower_data.magazine_size
	rounds_left_in_magazine = Tower_data.magazine_size



signal request_Tower_data(reciver)
func _get_resource():
	
	var parent = get_parent()
	for n in 10:
		if parent.has_method("_on_request_tower_data"):
			self.connect("request_Tower_data",parent._on_request_tower_data)
			request_Tower_data.emit(self)
			return
		else: parent = parent.get_parent() 
	
	if Tower_data == null:
		push_warning(self," did not find resource")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func start_fiering_sequence_started():
	if rounds_left_in_magazine > 0:
		if fire_is_allowed == true:
			fire()
	
	
	
	

func fire():
	
	
	
	spawn_projectile()
	rounds_left_in_magazine -= 1
	if rounds_left_in_magazine < 1:
		reload_magazine()
	else:
		coldown()



func reload_magazine():
	fire_is_allowed = false
	await get_tree().create_timer(Tower_data.reload_speed).timeout
	rounds_left_in_magazine = magazine_size
	fire_is_allowed = true
	

func coldown():
	fire_is_allowed = false
	await get_tree().create_timer(Tower_data.fire_rate).timeout
	fire_is_allowed = true


func spawn_projectile():
	var projectile_instance
	projectile_instance = projectile.instantiate()
	add_sibling(projectile_instance)
	projectile_instance.position = position
	projectile_instance.rotation = rotation
