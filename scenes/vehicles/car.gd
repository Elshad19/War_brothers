extends Node2D
var vehicle_pos: Vector2 = Vector2.ZERO
# Called when the node enters the scene tree for the first time.
func _ready():
	var _car_current_speed: int = 0
	const _car_max_speed: int = 120
	position = vehicle_pos