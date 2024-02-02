extends Node2D


func _on_gate_player_entered_gate(body):
	print("Player has entered the gate")
	print(body)


func _on_player_laser():
	print("Laser from level")


func _on_player_grenade():
	print("Grenade from level")
