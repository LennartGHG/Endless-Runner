extends CanvasLayer


@onready var label_recorde: Label = $Label_Recorde
@onready var label_score: Label = $Label_Score

func _ready():
	visible = false
	
	
func show_game_over(current_score:int, high_score : int):
	label_score.text = "Score:" +str(current_score)
	label_recorde.text = "Record:" +str(high_score)
	visible = true
	get_tree().paused=true
	
func _unhandled_input(event):
	if visible and event.is_action_pressed("jump"):
		get_tree().paused = false
		get_tree().reload_current_scene()
