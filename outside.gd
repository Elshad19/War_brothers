extends ParentScene

func _on_house_body_entered(_body):
	var interior_camera_entered = get_tree().create_tween()
	interior_camera_entered.tween_property($Player/PlayerSprite/Camera2D, "zoom", Vector2(0.6,0.6), 1 )

func _on_house_body_exited(_body):
	var interior_camera_left = get_tree().create_tween()
	interior_camera_left.tween_property($Player/PlayerSprite/Camera2D, "zoom", Vector2(0.4,0.4), 1 )


func _on_sherman_tank_can_enter_vehicle():
	if Input.is_action_just_pressed("Enter_vehicle"):
		print("Working")
	
