extends Area2D
@export var speed: int = 4000
var direction: Vector2 = Vector2.UP
var laser_damage: int = 5
func _ready():
	$SelfDestructTimer.start()
func _process(delta):
	position += direction * speed * delta 

func _on_body_entered(body):
	if body.has_method("hit"):
		body.hit()
	if "health" in body:
		body.health = body.health - laser_damage
	queue_free()

func _on_self_destruct_timer_timeout():
	queue_free()
