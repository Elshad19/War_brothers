extends CanvasLayer

@onready var laser_label = $LaserPointer/VBoxContainer/Label
@onready var laser_picture = $LaserPointer/VBoxContainer/Ammo_pic
@onready var grenade_label = $GrenadePointer/VBoxContainer/Label
@onready var grenade_picture = $GrenadePointer/VBoxContainer/grenade_pic
@onready var player_health_ui = $Health_bar

func update_laser_text():
	laser_label.text = str(Globals.player_laser_amount)
	update_color(Globals.player_laser_amount, laser_label, laser_picture)
func update_grenade_text():
	grenade_label.text = str(Globals.player_grenade_amount)
	update_color(Globals.player_grenade_amount, grenade_label, grenade_picture)
func update_health_bar():
	$Health_bar.value = Globals.player_health
	$Health_bar.max_value = Globals.max_player_health
func update_color(amount: int, label: Label, icon: TextureRect) -> void:
	if amount == 0:
		label.modulate = Color(0.8, 0, 0, 1)
		icon.modulate = Color(0.8, 0, 0, 1)
	else:
		label.modulate = Color(10, 10, 10, 1)
		icon.modulate = Color(10, 10, 10, 1)
