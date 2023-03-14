extends Control





func _ready():
	if GlobalVariables.player_name == null:
		pass
	else:
		pass

func _on_back_button_button_up():
	GlobalVariables.player_alive = true
	GlobalVariables.player_name = null
	GlobalVariables.player_score = 0
	GlobalVariables.player_position = Vector2(400, 300)
	var main_menu = load("res://UI/MainMenu.tscn")
	get_tree().change_scene_to_packed(main_menu)
