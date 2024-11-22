extends ParentScene



func _on_area_2d_body_entered(body):
	TransitionLayer.change_scene("res://scenes/levels/outside.tscn")
