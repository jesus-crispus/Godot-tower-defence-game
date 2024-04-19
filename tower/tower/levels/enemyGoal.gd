extends Node2D


var level_resourse: Resource

func _on_area_2d_body_entered(body):
	if body.is_in_group("Enemy"):
		body.queue_free()
		level_resourse.health -= 1
		
