extends AnimatedSprite2D

func _process(delta: float) -> void:
	if not is_playing():
		play("default");
