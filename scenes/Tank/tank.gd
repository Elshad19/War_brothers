extends CharacterBody2D
class_name parent_tank
var vehicle_current_speed: int = 0
const vehicle_max_speed: int = 120
func _process(_delta):
	#movement
	if Input.is_action_pressed("left"):
		rotation_degrees -= 0.5
	if Input.is_action_pressed("right"):
		rotation_degrees += 0.5
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * 500
	move_and_slide()
	#turret_direction
	$Turret.look_at(get_global_mouse_position())
	var _turret_direction = (get_global_mouse_position() - position).normalized()
