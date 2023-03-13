extends Control



func _on_toggle_toggled(button_pressed):
	if GlobalVariables.size_visibility == false:
		GlobalVariables.size_visibility = true
	else:
		GlobalVariables.size_visibility = false



func _on_back_button_button_up():
	if GlobalVariables.is_paused == false:
		var main_menu = load("res://UI/MainMenu.tscn")
		get_tree().change_scene_to_packed(main_menu)
	else:
		var back_to_game = load("res://Levels/Main.tscn")
		get_tree().change_scene_to_packed(back_to_game)
		print("Input detected!")
