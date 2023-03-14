extends Control

@onready var size_vis_toggle = $CenterContainer/MenuVbox/HBoxContainer/Toggle

func _ready():
	if GlobalVariables.size_vis_toggle_setting == false:
		size_vis_toggle.button_pressed = false
	else:
		size_vis_toggle.button_pressed = true



func _on_toggle_button_down():
	if GlobalVariables.size_visibility == false:
		GlobalVariables.size_visibility = true
		GlobalVariables.size_vis_toggle_setting = true
	else:
		GlobalVariables.size_visibility = false
		GlobalVariables.size_vis_toggle_setting = false



func _on_back_button_button_up():
	if GlobalVariables.is_paused == false:
		var main_menu = load("res://UI/MainMenu.tscn")
		get_tree().change_scene_to_packed(main_menu)
	else:
		var back_to_game = load("res://Levels/Main.tscn")
		get_tree().change_scene_to_packed(back_to_game)



