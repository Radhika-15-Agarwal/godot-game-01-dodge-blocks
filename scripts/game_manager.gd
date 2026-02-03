extends Node


var is_game_over = false
var score = 0
var high_score = 0

func game_over():
	if is_game_over:
		return
	
	is_game_over = true
	print("Game Over")
	
	var ui_label = get_tree().get_first_node_in_group("game_over_label")
	if ui_label:
		ui_label.visible = true
		
	if score > high_score:
		high_score = score

func restart_game():
	score = 0
	is_game_over = false
	get_tree().reload_current_scene()
	
func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()
		
	if is_game_over and event.is_action_pressed("ui_accept"):
		restart_game()
		
func _process(delta: float) -> void:
	if not is_game_over:
		score += delta * 2	#points per second
		
	var score_label = get_tree().get_first_node_in_group("score_label")
	if score_label:
		score_label.text = "Score: " + str(int(score))
		
	var high_score_label = get_tree().get_first_node_in_group("high_score_label")
	if high_score_label:
		high_score_label.text = "High Score: " + str(int(high_score))
