extends Control



func _on_choose_button_button_up():
	get_tree().paused = false
	var select_menu = load("res://UI/SpeciesSelectMenu.tscn")
	get_tree().change_scene_to_packed(select_menu)
	


func _on_visibility_changed():
	if visible == true:
		Input.mouse_mode = 0

