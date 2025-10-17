extends Area2D


func _on_body_entered(body):
	body.health += 10.0
	if (body.health > 100.0):
		body.health = 100.0
	queue_free()
