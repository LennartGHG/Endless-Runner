extends Node


var world_speed = 70
var max_world_speed = 500
var world_acceleration =2


var obj_speed = 70
var max_obj_speed = 500
var obj_acceleration = 2

var high_score = 0


func _ready():
	load_high_score()

func load_high_score():
	
	if FileAccess.file_exists("user://savegame.dat"):
		var file = FileAccess.open("user://savegame.dat", FileAccess.READ)
		high_score = file.get_var()
		file.close()
	else:
		high_score=0
	
	
func save_high_score():
	var file= FileAccess.open("user://savegame.dat", FileAccess.WRITE)
	file.store_var(high_score)
	file.close()
	
	
	
	
func reset_values():
	world_speed= 70
	obj_speed=70
	
func _wait():
	await get_tree().create_timer(6.0).timeout
