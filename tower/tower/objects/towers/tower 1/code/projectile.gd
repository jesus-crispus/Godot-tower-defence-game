extends Node2D


class_name  Projectile

const SPEED = 1000
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += (Vector2.RIGHT.rotated(rotation) * SPEED) * delta


func _on_area_2d_area_entered(area):
	if area.get_parent().has_method("Enemy"):
		queue_free()


func _on_life_timer_timeout():
	queue_free()

func projectile():
	pass
