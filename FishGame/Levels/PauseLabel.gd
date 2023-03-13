extends Control


func _input(event):
	if event.is_action_released("Pause"):
		print("Input detected")
		toggle_pause()



func _on_resume_button_button_up():
	toggle_pause()
	GlobalVariables.is_paused = false



func _on_settings_button_button_up():
	var settings_packed = load("res://UI/Settings.tscn")
	get_tree().change_scene_to_packed(settings_packed)



func toggle_pause():
	if get_parent().get_parent().get_tree().paused == false:
		print("Isn't paused. Pausing...")
		get_parent().get_tree().paused = true
		visible = true
		GlobalVariables.is_paused = true
	else:
		print("Is paused. Unpausing...")
		get_parent().get_tree().paused = false
		visible = false
		print("The script got past visible = false.")
		GlobalVariables.is_paused = false
