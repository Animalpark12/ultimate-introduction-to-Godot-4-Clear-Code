extends Node2D

var speed = 500;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	#Input
	var direction = Input.get_vector("left", "right", "up", "down")
	position += direction * delta * speed

	#Shoot
	if Input.is_action_pressed("primary action"):
		print("Shoot")

	#Grenade
	if Input.is_action_pressed("secondary action"):
		print("Grenade")
