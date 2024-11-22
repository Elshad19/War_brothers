extends ParentScene

func _on_area_2d_body_entered(_body):
	TransitionLayer.change_scene("res://scenes/levels/outside.tscn")
