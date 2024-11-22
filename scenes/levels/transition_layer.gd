extends CanvasLayer
func _ready():
	$ColorRect.visible = false
	pass
func change_scene(target: String) -> void:
	$ColorRect.visible = true
	$SceneAnimation.play("fade_to_black")
	await $SceneAnimation.animation_finished
	get_tree().change_scene_to_file(target)
	$SceneAnimation.play_backwards("fade_to_black")
	await $SceneAnimation.animation_finished
	$ColorRect.visible = false
