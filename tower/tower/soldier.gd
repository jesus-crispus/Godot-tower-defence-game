extends PathFollow2D

var speed = 100
var value = 5
var level_resourse : Resource
var spawn_number




# Called when the node enters the scene tree for the first time.
func _ready():
	pass
#	_unit_defeat.connect(main._on_soldier__unit_defeat(value))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	progress += speed * delta
	if progress_ratio >= 0.99:
		queue_free()
	

func Enemy():
	pass




func _on_area_2d_area_entered(area):
	if area.get_parent().has_method("projectile"):
		soldier_death()


func soldier_death():
	level_resourse.credits += value
	queue_free()
