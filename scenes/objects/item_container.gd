extends StaticBody2D
class_name item_container
@onready var object_direction: Vector2 = Vector2.DOWN.rotated(rotation)
var opened: bool = false
signal open_object
func hit():
	$LidSprite.hide()
	

