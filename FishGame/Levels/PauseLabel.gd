extends Label


func _input(event):
	if event.is_action_released("Pause"):
		print("Input detected")
		toggle_pause()

func toggle_pause():
	if get_parent().get_parent().get_tree().paused == false:
		print("Isn't paused. Pausing...")
		get_parent().get_parent().get_tree().paused = true
		visible = true
	else:
		print("Is paused. Unpausing...")
		get_parent().get_parent().get_tree().paused = false
		visible = false
		print("The script got past visible = false.")
