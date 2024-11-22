extends parent_tank
signal can_enter_vehicle()
func _ready():
	$Aim/Aim_camera.enabled = false
func _process(_delta):
	$Turret.look_at(get_global_mouse_position())
	$Aim/Aim_camera.position = get_global_mouse_position()
	var _turret_direction = (get_global_mouse_position() - position).normalized()
	if Input.is_action_just_pressed("inspect") and $Camera2D.enabled == true:
		$Camera2D.enabled = false
		$Aim/Aim_camera.enabled = true
	elif Input.is_action_just_pressed("inspect") and $Aim/Aim_camera.enabled == true :
		$Camera2D.enabled = true
		$Aim/Aim_camera.enabled = false
	else :
		pass
		
func _on_tank_enter_body_entered(_body):
	can_enter_vehicle.emit()
	pass # Replace with function body.
