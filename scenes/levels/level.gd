extends Node2D
class_name ParentScene
var laser_scene: PackedScene = preload("res://scenes/Projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/Projectiles/grenade.tscn")
var laser_particle_scene: PackedScene = preload("res://scenes/Particles/laser_particle.tscn")
var item_scene:PackedScene = preload("res://scenes/Items/item.tscn")

func _ready():
	for container in get_tree().get_nodes_in_group('Containers'):
		container.connect("open_object", _on_container_opened)
func _on_container_opened(pos, object_direction):
	var item = item_scene.instantiate()
	item.position = pos
	item.direction = object_direction
	$Items.call_deferred("add_child", item)

func _process(_delta):
	$UI.update_health_bar()
	$UI.update_laser_text()
	$UI.update_grenade_text()
#spawn laser on the level
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
#spawn grenade on the level
func _on_player_grenade_signal(pos, direction):
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.linear_velocity = direction * grenade.speed
	$Projectiles.add_child(grenade)
	$UI.update_grenade_text()
	
