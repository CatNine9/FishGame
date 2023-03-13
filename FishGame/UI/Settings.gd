extends Control



func _on_toggle_toggled(button_pressed):
	if GlobalVariables.size_visibility == false:
		GlobalVariables.size_visibility = true
	else:
		GlobalVariables.size_visibility = false



func _on_back_button_button_up():
	var main_menu = load("res://UI/MainMenu.tscn")
	get_tree().change_scene_to_packed(main_menu)

