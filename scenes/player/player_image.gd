extends Sprite2D
var current_speed: int = 10
const max_speed: int = 100
var player_scale: int = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	player_scale = 2
	scale = Vector2(player_scale, player_scale)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	##scale.x += 2
	##scale.y += 2
