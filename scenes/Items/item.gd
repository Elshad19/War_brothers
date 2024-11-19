extends Area2D
@onready var pickup_label = $Label
var rotation_speed = 4
var available_options = ["health", "ammo", "grenade", "maxhealth"]
var chosen_option = available_options[randi()%len(available_options)]
func _ready():
	pickup_label.text = " "
	$grenade.visible = false
func _process(delta):
	$Sprite2D.rotation += rotation_speed * delta
	if chosen_option == available_options[0]:
		$Sprite2D.modulate = Color(6, 0, 0)
	elif chosen_option == available_options[1]:
		$Sprite2D.modulate = Color(0, 0, 6)
	elif chosen_option == available_options[2]:
		$grenade.visible = true
		$Sprite2D.modulate = Color(0, 6, 0)
	else :
		$Sprite2D.modulate = Color(10, 3, 3)
func update_pickup_text(amount):
	if chosen_option == available_options[0]:
			pickup_label.text = ("+ " + str(amount) + " health")
	if chosen_option == available_options[1]:
			pickup_label.text = ("+ " + str(amount) + " ammo")
	if chosen_option == available_options[2]:
		if amount == 1:
			pickup_label.text = ("+ " + str(amount) + " grenade")
		else:
			pickup_label.text = ("+ " + str(amount) + " grenades")
	if chosen_option == available_options[3]:
		pickup_label.text = ("+ " + str(amount) + " max health")
func _on_body_entered(_body):
	#health
	if chosen_option == available_options[0]:
		if Globals.player_health <= Globals.max_player_health - 25:
			Globals.player_health += 25
			update_pickup_text(25)
			$AnimationPlayer.play("Number fade")
			await $AnimationPlayer.animation_finished
			#queue_free()
		elif Globals.player_health == Globals.max_player_health:
			pickup_label.text = ("Max health!")
			$AnimationPlayer.play("Number fade")
			await $AnimationPlayer.animation_finished
			pass
		elif Globals.max_player_health - Globals.player_health < 25:
			var amount: int = Globals.max_player_health - Globals.player_health
			Globals.player_health += amount
			print(str(amount) + " health. Maximum health!")
			pickup_label.text = ("+ " + str(amount) + " health. Max health!")
			$AnimationPlayer.play("Number fade")
			await $AnimationPlayer.animation_finished
			#queue_free()
	#ammo
	elif chosen_option == available_options[1]:
		Globals.player_laser_amount += 40
		update_pickup_text(40)
		$AnimationPlayer.play("Number fade")
		await $AnimationPlayer.animation_finished
		queue_free()
	#grenade	
	elif chosen_option == available_options[2] :
		Globals.player_grenade_amount += 3
		update_pickup_text(3)
		$AnimationPlayer.play("Number fade")
		await $AnimationPlayer.animation_finished
		queue_free()
	#max health
	elif chosen_option == available_options[3] :
		Globals.max_player_health += 10
		update_pickup_text(10)
		$AnimationPlayer.play("Number fade")
		await $AnimationPlayer.animation_finished
		queue_free()