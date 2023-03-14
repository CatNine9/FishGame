extends Control


func _on_back_button_button_up():
	var back_to_game = load("res://Levels/Main.tscn")
	get_tree().change_scene_to_packed(back_to_game)
