extends Node2D

func _ready():
	rng = RandomNumberGenerator.new() # Reset RNG
	$GameOver.visible = false # Ensure GameOver is hidden
	get_tree().paused = false # Unpause the game
	Global.score = 0
var rng = RandomNumberGenerator.new()
func spawn_mob():
	var my_random_number = rng.randf_range(0, 4)
	print(my_random_number)
	if (my_random_number > 0 and my_random_number < 3):
		var new_mob = preload("res://mob.tscn").instantiate()
		%PathFollow2D.progress_ratio = randf()
		new_mob.global_position = %PathFollow2D.global_position
		add_child(new_mob)
	else:
		var new_mobi = preload("res://tost_mob.tscn").instantiate()
		%PathFollow2D.progress_ratio = randf()
		new_mobi.global_position = %PathFollow2D.global_position
		add_child(new_mobi)
   
func spawn_health():
	var new_health = preload("res://health_pickup.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_health.global_position = %PathFollow2D.global_position
	add_child(new_health)


func _on_timer_timeout():
	spawn_mob()
	spawn_health()


func _on_player_health_depleted():
	$GameOver.visible = true
	get_tree().paused = true
	await get_tree().create_timer(1.0).timeout
	get_tree().reload_current_scene()
