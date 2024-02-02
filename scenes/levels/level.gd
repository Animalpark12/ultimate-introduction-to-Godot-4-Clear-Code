extends Node2D


func _on_area_2d_body_entered(body):
	print("Player has entered the area")


func _on_area_2d_body_exited(body):
	print("Player has exited the area")
