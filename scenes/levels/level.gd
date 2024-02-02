extends Node2D

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade/grenade.tscn")

func _on_gate_player_entered_gate(body):
	print("Player has entered the gate")
	print(body)

func _on_player_laser(pos):
	var laser = laser_scene.instantiate()
	laser.position = pos
	$Projectiles.add_child(laser)

func _on_player_grenade(pos):
	var grenade = grenade_scene.instantiate()
	grenade.position = pos
	$Projectiles.add_child(grenade)
