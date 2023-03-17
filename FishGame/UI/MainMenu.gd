extends Control



@onready var start_button = $CenterContainer/MenuVbox/StartButton



func _on_start_button_button_up():
	var species_select = load("res://UI/SpeciesSelectMenu.tscn")
	get_tree().change_scene_to_packed(species_select)
#	var game_start = load("res://Levels/Main.tscn")
#	get_tree().change_scene_to_packed(game_start)


func _on_settings_button_button_up():
	var game_settings = load("res://UI/Settings.tscn")
	get_tree().change_scene_to_packed(game_settings)


func _on_leader_board_button_button_up():
	var leader_board = load("res://UI/LeaderBoard.tscn")
	get_tree().change_scene_to_packed(leader_board)


func _on_quit_button_button_up():
	get_tree().quit()
