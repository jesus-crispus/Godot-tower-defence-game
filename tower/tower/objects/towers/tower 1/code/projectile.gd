extends Node2D


class_name  Projectile

const SPEED = 1500
var damage = 20
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += (Vector2.RIGHT.rotated(rotation) * SPEED) * delta

func _on_area_2d_body_entered(body):
	if body.has_method("take_damage"):
		var attack = Attack.new()
		attack.damage = damage
		body.take_damage(attack)
		queue_free()


func _on_life_timer_timeout():
	queue_free()

func projectile():
	pass



	pass # Replace with function body.
