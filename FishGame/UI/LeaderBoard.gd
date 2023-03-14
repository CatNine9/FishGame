extends Control





func _ready():
	if GlobalVariables.player_name == null:
		pass
	else:
		var new_entry_packed = load("res://UI/example_hbox.tscn")
		var new_entry = new_entry_packed.instantiate()
		get_child(1, true).get_child(0, true).add_child(new_entry)
		new_entry.name_label.text = GlobalVariables.player_name
		#new_entry.date_label.text = 
		new_entry.score_label.text = str(GlobalVariables.player_score)

func _on_back_button_button_up():
	GlobalVariables.player_alive = true
	GlobalVariables.player_name = null
	GlobalVariables.player_score = 0
	GlobalVariables.player_position = Vector2(400, 300)
	var main_menu = load("res://UI/MainMenu.tscn")
	get_tree().change_scene_to_packed(main_menu)
