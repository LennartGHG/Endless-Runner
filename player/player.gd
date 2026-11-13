extends CharacterBody2D


@export var jump_strenght = 350
@export var gravity =800
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var is_sliding: bool = false


func _physics_process(delta):
	# 1. Schwerkraft anwenden
	if not is_on_floor():
		velocity.y += gravity * delta
	
	# 2. Springen (bricht das Ducken/Rutschen bei Bedarf ab)
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_strenght
		is_sliding = false 
		
	# 3. Ducken / Rutschen starten
	if Input.is_action_just_pressed("move_down") and is_on_floor() and not is_sliding:
		is_sliding = true
		animation_player.play("Ducken")
	
	# 4. Animationen steuern (nur wenn wir NICHT gerade rutschen)
	if not is_sliding:
		if not is_on_floor():
			animation_player.play("Jump")
		else:
			animation_player.play("walk")

	move_and_slide()

# Diese Funktion wird aufgerufen, wenn eine Animation fertig ist
func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "Ducken":
		is_sliding = false


func _on_area_2d_area_entered(area):
	if area.is_in_group("dangerous"):
		var main = get_tree().get_current_scene()
		main.on_player_died()
	
	
	
