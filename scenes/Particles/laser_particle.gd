extends GPUParticles2D
@export var speed: int = 6000
var direction: Vector2 = Vector2.UP

func _ready():
	$Timer.start()

func _on_timer_timeout():
	emitting = false
