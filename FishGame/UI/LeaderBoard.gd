extends Node





func _ready():

	var entry_1_packed = load("res://UI/example_hbox.tscn")
	var entry_1 = entry_1_packed.instantiate()
	get_child(1, true).get_child(0, true).add_child(entry_1)
	entry_1.name_label.text = GlobalVariables.entry_1[0]
	entry_1.date_label.text = GlobalVariables.entry_1[1]
	entry_1.score_label.text = GlobalVariables.entry_1[2]

	var entry_2_packed = load("res://UI/example_hbox.tscn")
	var entry_2 = entry_2_packed.instantiate()
	get_child(1, true).get_child(0, true).add_child(entry_2)
	entry_2.name_label.text = GlobalVariables.entry_2[0]
	entry_2.date_label.text = GlobalVariables.entry_2[1]
	entry_2.score_label.text = GlobalVariables.entry_2[2]

	var entry_3_packed = load("res://UI/example_hbox.tscn")
	var entry_3 = entry_3_packed.instantiate()
	get_child(1, true).get_child(0, true).add_child(entry_3)
	entry_3.name_label.text = GlobalVariables.entry_3[0]
	entry_3.date_label.text = GlobalVariables.entry_3[1]
	entry_3.score_label.text = GlobalVariables.entry_3[2]

	var entry_4_packed = load("res://UI/example_hbox.tscn")
	var entry_4 = entry_4_packed.instantiate()
	get_child(1, true).get_child(0, true).add_child(entry_4)
	entry_4.name_label.text = GlobalVariables.entry_4[0]
	entry_4.date_label.text = GlobalVariables.entry_4[1]
	entry_4.score_label.text = GlobalVariables.entry_4[2]
	
	var entry_5_packed = load("res://UI/example_hbox.tscn")
	var entry_5 = entry_5_packed.instantiate()
	get_child(1, true).get_child(0, true).add_child(entry_5)
	entry_5.name_label.text = GlobalVariables.entry_5[0]
	entry_5.date_label.text = GlobalVariables.entry_5[1]
	entry_5.score_label.text = GlobalVariables.entry_5[2]

	var entry_6_packed = load("res://UI/example_hbox.tscn")
	var entry_6 = entry_6_packed.instantiate()
	get_child(1, true).get_child(0, true).add_child(entry_6)
	entry_6.name_label.text = GlobalVariables.entry_6[0]
	entry_6.date_label.text = GlobalVariables.entry_6[1]
	entry_6.score_label.text = GlobalVariables.entry_6[2]

	var entry_7_packed = load("res://UI/example_hbox.tscn")
	var entry_7 = entry_7_packed.instantiate()
	get_child(1, true).get_child(0, true).add_child(entry_7)
	entry_7.name_label.text = GlobalVariables.entry_7[0]
	entry_7.date_label.text = GlobalVariables.entry_7[1]
	entry_7.score_label.text = GlobalVariables.entry_7[2]

	var entry_8_packed = load("res://UI/example_hbox.tscn")
	var entry_8 = entry_8_packed.instantiate()
	get_child(1, true).get_child(0, true).add_child(entry_8)
	entry_8.name_label.text = GlobalVariables.entry_8[0]
	entry_8.date_label.text = GlobalVariables.entry_8[1]
	entry_8.score_label.text = GlobalVariables.entry_8[2]

	var entry_9_packed = load("res://UI/example_hbox.tscn")
	var entry_9 = entry_9_packed.instantiate()
	get_child(1, true).get_child(0, true).add_child(entry_9)
	entry_9.name_label.text = GlobalVariables.entry_9[0]
	entry_9.date_label.text = GlobalVariables.entry_9[1]
	entry_9.score_label.text = GlobalVariables.entry_9[2]

	var entry_10_packed = load("res://UI/example_hbox.tscn")
	var entry_10 = entry_10_packed.instantiate()
	get_child(1, true).get_child(0, true).add_child(entry_10)
	entry_10.name_label.text = GlobalVariables.entry_10[0]
	entry_10.date_label.text = GlobalVariables.entry_10[1]
	entry_10.score_label.text = GlobalVariables.entry_10[2]


	if GlobalVariables.player_name == null:
		pass
	else:
		pass
#		var new_entry_packed = load("res://UI/example_hbox.tscn")
#		var new_entry = new_entry_packed.instantiate()
#		get_child(1, true).get_child(0, true).add_child(new_entry)
#		new_entry.name_label.text = GlobalVariables.player_name
#		var datetime_dict = Time.get_date_dict_from_system()
#		var time_format = "%d/%d/%d"
#		var time_string = time_format % [datetime_dict["day"], datetime_dict["month"], datetime_dict["year"]]
#		new_entry.date_label.text = time_string
#		new_entry.score_label.text = str(GlobalVariables.player_score)

func _on_back_button_button_up():
	GlobalVariables.player_alive = true
	GlobalVariables.player_name = null
	GlobalVariables.player_score = 0
	GlobalVariables.player_position = Vector2(400, 300)
	var main_menu = load("res://UI/MainMenu.tscn")
	get_tree().change_scene_to_packed(main_menu)
