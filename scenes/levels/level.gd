extends Node2D
class_name ParentScene
var laser_scene: PackedScene = preload("res://scenes/Projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/Projectiles/grenade.tscn")
var laser_particle_scene: PackedScene = preload("res://scenes/Particles/laser_particle.tscn")
var item_scene:PackedScene = preload("res://scenes/Items/item.tscn")


	
func _on_container_opened(pos, object_direction):
	var item = item_scene.instantiate()
	item.position = pos
	item.direction = object_direction
	$Items.call_deferred("add_child", item)

func _process(_delta):
	$UI.update_health_bar()
	$UI.update_laser_text()
	$UI.update_grenade_text()

func _ready():
	for container in get_tree().get_nodes_in_group('Containers'):
		container.connect("open_object", _on_container_opened)
	for drone in get_tree().get_nodes_in_group("Drones"):
		drone.connect("laser_signal", _on_entity_laser_signal)
		drone.connect("laser_particle_signal", _on_entity_laser_signal)
#spawn laser on the level
func _on_player_laser_signal(selected_laser_marker, entity_direction):
	spawn_laser(selected_laser_marker, entity_direction)
	spawn_laser_particle(selected_laser_marker, entity_direction)

func _on_entity_laser_signal(selected_laser_marker, entity_direction):
	spawn_laser(selected_laser_marker, entity_direction)
	spawn_laser_particle(selected_laser_marker, entity_direction)
	
func spawn_laser(selected_laser_marker, entity_direction):
	var laser = laser_scene.instantiate() as Area2D
	laser.position = selected_laser_marker
	laser.rotation_degrees = rad_to_deg(entity_direction.angle()) + 90
	laser.direction = entity_direction
	$Projectiles.add_child(laser)
	$UI.update_laser_text()
#Spawn particle
func spawn_laser_particle(selected_laser_marker, entity_direction):
	var laser_particle = laser_particle_scene.instantiate()
	laser_particle.position = selected_laser_marker
	laser_particle.rotation_degrees = rad_to_deg(entity_direction.angle())
	laser_particle.direction = entity_direction
	$Projectiles.add_child(laser_particle)

#spawn grenade on the level
func _on_player_grenade_signal(pos, direction):
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.linear_velocity = direction * grenade.speed
	$Projectiles.add_child(grenade)
	$UI.update_grenade_text()
	
