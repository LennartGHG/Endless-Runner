extends Node2D


const ENEMY_GROUND = preload("uid://dyxj0i846axxx")
const ENEMY_FLIGHT = preload("uid://vabhx0seyyx5")
const SPIKES = preload("uid://b5xxyf7yhqtcr")


const Ground_Y = 10
const Flyingg_min_y = -5
const Flyingg_max_y = -5



func spawn_object():
	var random_number = randi() % 100
	var packed : PackedScene
	
	
	if random_number <36:
		packed  = ENEMY_FLIGHT
	elif random_number < 81:
		packed = ENEMY_GROUND
	else:
		packed =SPIKES
		
		
	var inst = packed.instantiate()
	
	
	inst.position.x = get_viewport_rect().size.x + 20
	
	
	if packed == ENEMY_FLIGHT:
		inst.position.y = randf_range(Flyingg_min_y, Flyingg_max_y)
	elif packed==ENEMY_GROUND:
		inst.position.y = Ground_Y
	elif packed == SPIKES:
		inst.position.y = Ground_Y+15
	
	get_parent().add_child(inst)
	

func _on_spawn_timer_timeout():
	spawn_object()
