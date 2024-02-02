extends CharacterBody2D

signal laser(pos, direction)
signal grenade(pos, direction)

var speed = 500;

var can_laser: bool = true
var can_grenade: bool = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	#Input
	var direction = Input.get_vector("left", "right", "up", "down")
	var player_direction = (get_global_mouse_position() - position).normalized()
	velocity = direction * speed
	move_and_slide()

	#Rotate
	look_at(get_global_mouse_position())

	#Shoot
	if Input.is_action_pressed("primary action") and can_laser:
		var laser_markers = $ShootStartPositions.get_children()
		var selected_laser = laser_markers[randi() % laser_markers.size()]
		can_laser = false
		
		$ShootLReloadTimer.start()
		laser.emit(selected_laser.global_position, player_direction)
		
	#Grenade
	if Input.is_action_pressed("secondary action") and can_grenade:
		var pos = $ShootStartPositions.get_children()[0].global_position
		can_grenade = false
		
		$GrenadeReloadTimer.start()
		grenade.emit(pos, player_direction)

func _on_timer_timeout():
	can_laser = true	

func _on_grenade_reload_timer_timeout():
	can_grenade = true
