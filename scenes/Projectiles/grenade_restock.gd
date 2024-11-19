extends Area2D
var amount: int = 3
@onready var grenade_pickup_label = $Label

func _ready():
	grenade_pickup_label.text = " "
func _process(delta):
	$Grenades.rotate(90)
func update_grenade_pickup_text(amount):
	if amount == 1:
		grenade_pickup_label.text = ("+ " + str(amount) + " grenade")
	else:
		grenade_pickup_label.text = ("+ " + str(amount) + " grenades")
	$AnimationPlayer.play("Number fade")
func _on_body_entered(body):
	if Globals.player_grenade_amount <= Globals.player_max_grenade_amount - 3:
		print(str(amount) + " grenades picked.")
		Globals.player_grenade_amount += amount
		update_grenade_pickup_text(amount)
	elif Globals.player_grenade_amount == Globals.player_max_grenade_amount:
		print("Maximum grenade capacity!")
		@warning_ignore("standalone_expression")
		Globals.player_grenade_amount = Globals.player_max_grenade_amount
	elif Globals.player_max_grenade_amount - Globals.player_grenade_amount < amount:
		var excess_amount: int = Globals.player_max_grenade_amount - Globals.player_grenade_amount
		Globals.player_grenade_amount += excess_amount
		if excess_amount >= 2:
			print(str(excess_amount) + " grenades picked. Maximum grenade capacity!")
			update_grenade_pickup_text(excess_amount)
		else:
			print(str(excess_amount) + " grenade picked. Maximum grenade capacity!")
			update_grenade_pickup_text(excess_amount)
