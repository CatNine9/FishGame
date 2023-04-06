extends Control


func _input(event):
	if event.is_action_released("Pause") and GlobalVariables.player_alive == true:
		toggle_pause()



func _on_resume_button_button_up():
	toggle_pause()
	GlobalVariables.is_paused = false



func _on_settings_button_button_up():
	var settings_packed = load("res://UI/Settings.tscn")
	get_tree().change_scene_to_packed(settings_packed)



func _on_exit_button_button_up():
	get_tree().paused = false
	GlobalVariables.is_paused = false
	visible = false
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	var main_menu_packed = load("res://UI/MainMenu.tscn")
	get_tree().change_scene_to_packed(main_menu_packed)



func _on_quit_button_button_up():
	get_tree().quit()

 

func toggle_pause():
	if get_parent().get_parent().get_tree().paused == false:
		get_parent().get_parent().get_tree().paused = true
		visible = true
		GlobalVariables.is_paused = true
	else:
		get_parent().get_parent().get_tree().paused = false
		visible = false
		GlobalVariables.is_paused = false




func _on_visibility_changed():
	if visible == true:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	else:
		Input.mouse_mode = Input.MOUSE_MODE_CONFINED
