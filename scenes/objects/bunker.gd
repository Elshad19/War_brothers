extends StaticBody2D


func _on_area_2d_body_entered(_body):
	TransitionLayer.change_scene("res://scenes/levels/inside.tscn")
