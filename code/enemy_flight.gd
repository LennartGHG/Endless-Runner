extends Area2D

var offscreen_x = -50

func _physics_process(delta):
	position.x -=GameManager.obj_speed * delta
	
	if position.x<offscreen_x:
		queue_free()

		
