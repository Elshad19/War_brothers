extends CharacterBody2D
@export var turret_speed: int = 1
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	look_at(get_global_mouse_position())
	var _turret_direction = (get_global_mouse_position() - position).normalized()
