extends Node
signal update_ui_stats
#position
var player_position: Vector2
#health
var player_health: int = 50:
	set(value):
		player_health = value
		update_ui_stats.emit()
var max_player_health: int = 100
func _process(delta):
	if player_health <= 0:
		print("The player is dead!")
		pass
#laser
var player_laser_amount: int = 20:
	set(value):
		player_laser_amount = value
		update_ui_stats.emit()
#grenade
var player_grenade_amount: int = 7:
	set(value):
		player_grenade_amount = value
		update_ui_stats.emit()
const player_max_grenade_amount: int = 10
