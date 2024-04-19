extends Control


@onready  var credits_label = $credits_label
@onready  var health_label = $health_label

var level_resourse: Resource
signal game_over()

# Called when the node enters the scene tree for the first time.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if level_resourse.changed:
		credits_label.text = "credits: " + str(level_resourse.credits)
		health_label.text = "health: " + str(level_resourse.health)
		if level_resourse.health < 1:
			game_over.emit()
