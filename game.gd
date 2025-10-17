extends Node2D


func spawn_mob():
    var new_mob = preload("res://mob.tscn").instantiate()
    %PathFollow2D.progress_ratio = randf()
    new_mob.global_position = %PathFollow2D.global_position
    add_child(new_mob)
   
func spawn_health():
    var new_health = preload("res://health_pickup.tscn").instantiate()
    %PathFollow2D.progress_ratio = randf()
    new_health.global_position = %PathFollow2D.global_position
    add_child(new_health)


func _on_timer_timeout():
    spawn_mob()
    spawn_health()


func _on_player_health_depleted():
    %GameOver.visible = true
    get_tree().paused = true
