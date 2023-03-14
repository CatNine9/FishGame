extends Control


func _on_back_button_button_up():
	GlobalVariables.player_alive = true
	var main_menu = load("res://UI/MainMenu.tscn")
	get_tree().change_scene_to_packed(main_menu)
