extends Area2D


func _on_body_entered(body):
    body.health += 20.0
    queue_free()
