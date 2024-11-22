extends Area2D
var amount: int = 3

func _on_body_entered(_body):
	if Globals.player_grenade_amount <= Globals.player_max_grenade_amount - 3:
		print(str(amount) + " grenades picked.")
		Globals.player_grenade_amount += amount
	elif Globals.player_grenade_amount == Globals.player_max_grenade_amount:
		print("Maximum grenade capacity!")
		@warning_ignore("standalone_expression")
		Globals.player_grenade_amount == Globals.player_max_grenade_amount
	elif Globals.player_max_grenade_amount - Globals.player_grenade_amount < amount:
		var excess_amount: int = Globals.player_max_grenade_amount - Globals.player_grenade_amount
		Globals.player_grenade_amount += excess_amount
		if excess_amount >= 2:
			print(str(excess_amount) + " grenades picked. Maximum grenade capacity!")
		else:
			print(str(excess_amount) + " grenade picked. Maximum grenade capacity!")
