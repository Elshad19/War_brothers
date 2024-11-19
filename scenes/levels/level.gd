extends Node2D
class_name ParentScene
var laser_scene: PackedScene = preload("res://scenes/Projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/Projectiles/grenade.tscn")
var laser_particle_scene: PackedScene = preload("res://scenes/Particles/laser_particle.tscn")
func _ready():
	pass
func _process(_delta):
	$UI.update_health_bar()
	$UI.update_laser_text()
	$UI.update_grenade_text()
func _on_player_laser_signal(selected_laser_marker, player_direction):
	var laser = laser_scene.instantiate() as Area2D
	var laser_particle = laser_particle_scene.instantiate()
	laser.position = selected_laser_marker
	laser_particle.position = selected_laser_marker
	laser.rotation_degrees = rad_to_deg(player_direction.angle()) + 90
	laser.direction = player_direction
	laser_particle.rotation_degrees = rad_to_deg(player_direction.angle())
	laser_particle.direction = player_direction
	$Projectiles.add_child(laser)
	$Projectiles.add_child(laser_particle)
	$UI.update_laser_text()
func _on_player_grenade_signal(pos, direction):
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.linear_velocity = direction * grenade.speed
	$Projectiles.add_child(grenade)
	$UI.update_grenade_text()
	
