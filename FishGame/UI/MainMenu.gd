extends Control



@onready var start_button = $CenterContainer/MenuVbox/StartButton



func _on_start_button_button_up():
	var game_start = load("res://Levels/Main.tscn")
	get_tree().change_scene_to_packed(game_start)


func _on_settings_button_button_up():
	pass # Replace with function body.


func _on_leader_board_button_button_up():
	pass # Replace with function body.


func _on_quit_button_button_up():
	get_tree().quit()
