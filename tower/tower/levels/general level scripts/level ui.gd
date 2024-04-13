extends Control


@onready  var credits_label = $credits_label
var level_resourse: Resource


# Called when the node enters the scene tree for the first time.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	credits_label.text = "credits: " + str(level_resourse.credits)
