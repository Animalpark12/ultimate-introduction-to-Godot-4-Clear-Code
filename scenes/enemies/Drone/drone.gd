extends CharacterBody2D

var speed = 200

func _process(delta):
	
	var direction = Vector2.RIGHT
	velocity = direction * speed
	move_and_slide()
