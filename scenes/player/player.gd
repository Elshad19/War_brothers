extends CharacterBody2D

#movement details
var player_current_speed: int = 10
const player_max_speed: int = 100

#laser properties
var can_laser: bool = true
signal laser_signal(selected_laser_marker, direction)
signal laser_particle_signal(selected_laser_marker, player_direction)
#grenade properties
var can_grenade: bool = true
signal grenade_signal(gun_marker, direction)

#flashlight settings
var flashlight_is_on: bool = false

func _ready():
	#flashlight settings
	$Flashlight.enabled = false
	pass

func _process(_delta):
	#input
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * 500
	move_and_slide()
	#player direction
	look_at(get_global_mouse_position())
	var player_direction = (get_global_mouse_position() - position).normalized()
	#player position
	Globals.player_position = position
	#laser
	if Input.is_action_pressed("primary_action") and can_laser and Globals.player_laser_amount > 0:
		#laser marker
		var selected_laser_marker = $Gun_markers.get_children()[3].global_position
		var _selected_laser_particle_marker = $Gun_markers.get_children()[3].global_position
		#laser cooldown
		can_laser = false
		$LaserTimer.start()
		laser_signal.emit(selected_laser_marker, player_direction)
		laser_particle_signal.emit(selected_laser_marker, player_direction)
		Globals.player_laser_amount -= 1
	#grenade
	if Input.is_action_just_pressed("secondary_action") and can_grenade and Globals.player_grenade_amount > 0:
		#grenade amount
		Globals.player_grenade_amount -= 1
		#grenade marker
		var gun_marker = $Gun_markers.get_children()[3].global_position
		grenade_signal.emit(gun_marker, player_direction)
		#grenade cooldown
		can_grenade = false
		$GrenadeTimer.start()
	if Globals.player_grenade_amount == Globals.player_max_grenade_amount or Globals.player_grenade_amount > Globals.player_max_grenade_amount:
		Globals.player_grenade_amount = 10
		pass
	#flashlight input
	if Input.is_action_just_pressed("Flashlight") and flashlight_is_on == false:
		$Flashlight.enabled = true
		flashlight_is_on = true
	elif Input.is_action_just_pressed("Flashlight") and flashlight_is_on == true:
		$Flashlight.enabled = false
		flashlight_is_on = false
#laser and grenade timers
func _on_timer_timeout():
	can_laser = true
func _on_grenade_timer_timeout():
	can_grenade = true
