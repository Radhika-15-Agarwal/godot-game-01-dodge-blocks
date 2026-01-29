extends Node


var is_game_over = false

func game_over():
	if is_game_over:
		return
	
	is_game_over = true
	print("Game Over")

func restart_game():
	is_game_over = false
	get_tree().reload_current_scene()
	
func _unhandled_input(event):
	if is_game_over and event.is_action_pressed("ui_accept"):
		restart_game()
