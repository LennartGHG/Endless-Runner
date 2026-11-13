extends ParallaxBackground

func _physics_process(delta):
	scroll_offset.x -= GameManager.obj_speed * delta
