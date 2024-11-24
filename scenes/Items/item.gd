extends Area2D
@onready var pickup_label = $Label
var rotation_speed = 4
var available_options = ["health", "ammo", "grenade", "maxhealth"]
var chosen_option = available_options[randi()%len(available_options)]
var direction: Vector2
var distance: int = randi_range(150, 250)
var pickedup: bool = false
func _ready():
	pickup_label.text = " "
	if chosen_option == available_options[0]:
		$Sprite2D.modulate = Color(6, 0, 0)
	elif chosen_option == available_options[1]:
		$Sprite2D.modulate = Color(0, 0, 6)
	elif chosen_option == available_options[2]:
		$Sprite2D.modulate = Color(0, 6, 0)
	else:
		$Sprite2D.modulate = Color(10, 3, 3)
	
	#tween
	#var target_pos = position * direction * distance
	#var movement_tween = create_tween()
	#movement_tween.tween_property(self, "position", target_pos, 5.5)
func _process(delta):
	$Sprite2D.rotation += rotation_speed * delta

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
	if not pickedup:
		#health
		if chosen_option == available_options[0]:
			if Globals.player_health <= Globals.max_player_health - 25:
				Globals.player_health += 25
				pickedup = true
				pickup_label.text = ("25 health")
				$AnimationPlayer.play("Number fade")
				$AnimationPlayer2.play("item fade")
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
				pickedup = true
				print(str(amount) + " health. Maximum health!")
				pickup_label.text = ("+ " + str(amount) + " health. Max health!")
				$AnimationPlayer.play("Number fade")
				$AnimationPlayer2.play("item fade")
				await $AnimationPlayer.animation_finished
				queue_free()
		#ammo
		elif chosen_option == available_options[1]:
			Globals.player_laser_amount += 40
			pickedup = true
			update_pickup_text(40)
			$AnimationPlayer.play("Number fade")
			$AnimationPlayer2.play("item fade")
			await $AnimationPlayer.animation_finished
			queue_free()
		#grenade	
		elif chosen_option == available_options[2] :
			Globals.player_grenade_amount += 3
			pickedup = true
			update_pickup_text(3)
			$AnimationPlayer.play("Number fade")
			$AnimationPlayer2.play("item fade")
			await $AnimationPlayer.animation_finished
			queue_free()
		#max health
		elif chosen_option == available_options[3] :
			Globals.max_player_health += 10
			pickedup = true
			update_pickup_text(10)
			$AnimationPlayer.play("Number fade")
			$AnimationPlayer2.play("item fade")
			await $AnimationPlayer.animation_finished
			queue_free()
