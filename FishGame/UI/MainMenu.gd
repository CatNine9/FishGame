extends Control



@onready var start_button = $CenterContainer/MenuVbox/StartButton


func _ready():
	GlobalVariables.game_on = false
	GlobalVariables.is_paused = false
	GlobalVariables.camera_position = Vector2(0, 0)
	GlobalVariables.enemy_starter_species = ""
	GlobalVariables.current_level = 0
	GlobalVariables.player_position = Vector2(400, 300)
#	GlobalVariables.player_score = 0
	GlobalVariables.player_evolution_points = 0
	GlobalVariables.player_health = 0
	GlobalVariables.player_alive = true
	GlobalVariables.player_name = null
	GlobalVariables.player_species = ""


func _on_start_button_button_up():
	var species_select = load("res://UI/SpeciesSelectMenu.tscn")
	get_tree().change_scene_to_packed(species_select)



func _on_settings_button_button_up():
	var game_settings = load("res://UI/Settings.tscn")
	get_tree().change_scene_to_packed(game_settings)


func _on_leader_board_button_button_up():
	var leader_board = load("res://UI/LeaderBoard.tscn")
	get_tree().change_scene_to_packed(leader_board)


func _on_quit_button_button_up():
	get_tree().quit()


