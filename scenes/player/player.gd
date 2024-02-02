extends CharacterBody2D

var speed = 500;

var can_laser: bool = true
var can_grenade: bool = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	#Input
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()

	#Shoot
	if Input.is_action_pressed("primary action") and can_laser:
		print("Shoot")
		can_laser = false
		$ShootLReloadTimer.start()
		
	#Grenade
	if Input.is_action_pressed("secondary action") and can_grenade:
		print("Grenade")
		can_grenade = false
		$GrenadeReloadTimer.start()

func _on_timer_timeout():
	can_laser = true


func _on_grenade_reload_timer_timeout():
	can_grenade = true
