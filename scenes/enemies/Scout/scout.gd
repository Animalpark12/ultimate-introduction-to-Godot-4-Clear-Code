extends CharacterBody2D

signal laser(pos, direction)
var player_nearby: bool = false
var can_laser: bool = true
var right_gun_use: bool = true

func hit():
	print("scout has hit")

func _process(_delta):
	if player_nearby:
		look_at(Globals.player_pos)
		if can_laser:
			var laser_marker = $LaserSpawnPosition.get_child(right_gun_use)
			right_gun_use = not right_gun_use
			var pos: Vector2 = laser_marker.global_position
			var direction: Vector2 = (Globals.player_pos - position).normalized()
			laser.emit(pos, direction)
			can_laser = false
			$LaserCooldown.start()

func _on_attack_area_body_entered(_body):
	player_nearby = true

func _on_attack_area_body_exited(_body):
	player_nearby = false


func _on_laser_cooldown_timeout():
	can_laser = true
