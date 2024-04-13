extends PathFollow2D

var speed = 100
var value = 10
var main




signal _unit_defeat(value)
# Called when the node enters the scene tree for the first time.
func _ready():
	print(main)
#	_unit_defeat.connect(main._on_soldier__unit_defeat(value))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	progress += speed * delta
	if progress_ratio >= 1:
		queue_free()
	

func Enemy():
	pass




func _on_area_2d_area_entered(area):
	if area.get_parent().has_method("projectile"):
		soldier_death()


func soldier_death():
	main._on_soldier_unit_defeat(value)
	queue_free()
