extends Control



@onready var page_1 = $CenterContainer/ColorRect
@onready var page_2 = $CenterContainer/ColorRect2
@onready var page_3 = $CenterContainer/ColorRect3

@onready var name_input_field = $CenterContainer/ColorRect2/VBoxContainer/NameInputLineEdit





func _on_next_button_button_up():
	page_1.visible = false
	page_2.visible = true
	name_input_field.max_length = 12



func _on_name_input_line_edit_text_submitted(new_text):
	GlobalVariables.player_name = new_text



func _on_yes_button_button_up():
	if GlobalVariables.player_name == null:
		page_2.visible = false
		page_3.visible = true
	else:
		var leader_board = load("res://UI/LeaderBoard.tscn")
		get_tree().change_scene_to_packed(leader_board)



func _on_no_button_button_up():
	GlobalVariables.player_alive = true
	GlobalVariables.player_name = null
	GlobalVariables.player_score = 0
	GlobalVariables.player_position = Vector2(400, 300)
	var main_menu = load("res://UI/MainMenu.tscn")
	get_tree().change_scene_to_packed(main_menu)


func _on_ok_button_button_up():
	page_3.visible = false
	page_2.visible = true
