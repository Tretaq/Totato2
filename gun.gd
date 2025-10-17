extends Area2D

func _physics_process(delta):
    var enemies_in_range = get_overlapping_bodies()
    if enemies_in_range.size() > 0:
        var target_enemy = enemies_in_range.front()
        look_at(target_enemy.global_position)

var n = 0;
func shoot():
    const BULLET = preload("res://bullet.tscn")
    var new_bullet = BULLET.instantiate()
    new_bullet.global_position = %Shotingpoint.global_position
    new_bullet.global_rotation = %Shotingpoint.global_rotation
    %Shotingpoint.add_child(new_bullet)
    print(n)
    if (n == 5):
        const BIG_BULLET = preload("res://big_bullet.tscn")
        var new_big_bullet = BIG_BULLET.instantiate()
        new_big_bullet.global_position = %Shotingpoint.global_position
        new_big_bullet.global_rotation = %Shotingpoint.global_rotation
        %Shotingpoint.add_child(new_big_bullet)
        n = 1
    else:
        n += 1
    

func _on_timer_timeout() -> void:
    shoot()