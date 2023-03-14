extends Node


var entry_slots_array = [GlobalVariables.entry_1, GlobalVariables.entry_2, GlobalVariables.entry_3, GlobalVariables.entry_4, GlobalVariables.entry_5, GlobalVariables.entry_6, GlobalVariables.entry_7, GlobalVariables.entry_8, GlobalVariables.entry_9, GlobalVariables.entry_10]
var entries_array = [["Cat9", "13/03/2023", 11],["", "", null], ["", "", null], ["", "", null], ["", "", null], ["", "", null], ["", "", null], ["", "", null], ["", "", null], ["", "", null]]


func _ready():
	var datetime_dict = Time.get_date_dict_from_system()
	var time_format = "%d/%d/%d"
	var time_string = time_format % [datetime_dict["day"], datetime_dict["month"], datetime_dict["year"]]

	if GlobalVariables.player_name == null:
		print("player name = null")
	else:
		var entry_to_replace = entries_array.find(["", "", null])
		entries_array[entry_to_replace] = [GlobalVariables.player_name, time_string, GlobalVariables.player_score]
		entries_array.sort_custom(sort_descending)
		print(entries_array)
		#if entries_array.size() > 10:
			#remove last entry
		GlobalVariables.entry_1 = entries_array[0]
		GlobalVariables.entry_2 = entries_array[1]
		GlobalVariables.entry_3 = entries_array[2]
		GlobalVariables.entry_4 = entries_array[3]
		GlobalVariables.entry_5 = entries_array[4]
		GlobalVariables.entry_6 = entries_array[5]
		GlobalVariables.entry_7 = entries_array[6]
		GlobalVariables.entry_8 = entries_array[7]
		GlobalVariables.entry_9 = entries_array[8]
		GlobalVariables.entry_10 = entries_array[9]
	load_entries()

func sort_descending(a, b):
	if a[2] == null or b[2] == null:
		pass
	else:
		return a[2] > b[2]



func _on_back_button_button_up():
	GlobalVariables.player_alive = true
	GlobalVariables.player_name = null
	GlobalVariables.player_score = 0
	GlobalVariables.player_position = Vector2(400, 300)
	var main_menu = load("res://UI/MainMenu.tscn")
	get_tree().change_scene_to_packed(main_menu)

func load_entries():
	var entry_1_packed = load("res://UI/example_hbox.tscn")
	var entry_1 = entry_1_packed.instantiate()
	get_child(1, true).get_child(0, true).add_child(entry_1)
	entry_1.name_label.text = GlobalVariables.entry_1[0]
	entry_1.date_label.text = GlobalVariables.entry_1[1]
	if GlobalVariables.entry_1[2] == null:
		entry_1.score_label.text = ""
	else:
		entry_1.score_label.text = str(GlobalVariables.entry_1[2])

	var entry_2_packed = load("res://UI/example_hbox.tscn")
	var entry_2 = entry_2_packed.instantiate()
	get_child(1, true).get_child(0, true).add_child(entry_2)
	entry_2.name_label.text = GlobalVariables.entry_2[0]
	entry_2.date_label.text = GlobalVariables.entry_2[1]
	if GlobalVariables.entry_2[2] == null:
		entry_2.score_label.text = ""
	else:
		entry_2.score_label.text = str(GlobalVariables.entry_2[2])

	var entry_3_packed = load("res://UI/example_hbox.tscn")
	var entry_3 = entry_3_packed.instantiate()
	get_child(1, true).get_child(0, true).add_child(entry_3)
	entry_3.name_label.text = GlobalVariables.entry_3[0]
	entry_3.date_label.text = GlobalVariables.entry_3[1]
	if GlobalVariables.entry_3[2] == null:
		entry_3.score_label.text = ""
	else:
		entry_3.score_label.text = str(GlobalVariables.entry_3[2])

	var entry_4_packed = load("res://UI/example_hbox.tscn")
	var entry_4 = entry_4_packed.instantiate()
	get_child(1, true).get_child(0, true).add_child(entry_4)
	entry_4.name_label.text = GlobalVariables.entry_4[0]
	entry_4.date_label.text = GlobalVariables.entry_4[1]
	if GlobalVariables.entry_4[2] == null:
		entry_4.score_label.text = ""
	else:
		entry_4.score_label.text = str(GlobalVariables.entry_4[2])
	
	var entry_5_packed = load("res://UI/example_hbox.tscn")
	var entry_5 = entry_5_packed.instantiate()
	get_child(1, true).get_child(0, true).add_child(entry_5)
	entry_5.name_label.text = GlobalVariables.entry_5[0]
	entry_5.date_label.text = GlobalVariables.entry_5[1]
	if GlobalVariables.entry_5[2] == null:
		entry_5.score_label.text = ""
	else:
		entry_5.score_label.text = str(GlobalVariables.entry_5[2])

	var entry_6_packed = load("res://UI/example_hbox.tscn")
	var entry_6 = entry_6_packed.instantiate()
	get_child(1, true).get_child(0, true).add_child(entry_6)
	entry_6.name_label.text = GlobalVariables.entry_6[0]
	entry_6.date_label.text = GlobalVariables.entry_6[1]
	if GlobalVariables.entry_6[2] == null:
		entry_6.score_label.text = ""
	else:
		entry_6.score_label.text = str(GlobalVariables.entry_6[2])

	var entry_7_packed = load("res://UI/example_hbox.tscn")
	var entry_7 = entry_7_packed.instantiate()
	get_child(1, true).get_child(0, true).add_child(entry_7)
	entry_7.name_label.text = GlobalVariables.entry_7[0]
	entry_7.date_label.text = GlobalVariables.entry_7[1]
	if GlobalVariables.entry_7[2] == null:
		entry_7.score_label.text = ""
	else:
		entry_7.score_label.text = str(GlobalVariables.entry_7[2])

	var entry_8_packed = load("res://UI/example_hbox.tscn")
	var entry_8 = entry_8_packed.instantiate()
	get_child(1, true).get_child(0, true).add_child(entry_8)
	entry_8.name_label.text = GlobalVariables.entry_8[0]
	entry_8.date_label.text = GlobalVariables.entry_8[1]
	if GlobalVariables.entry_8[2] == null:
		entry_8.score_label.text = ""
	else:
		entry_8.score_label.text = str(GlobalVariables.entry_8[2])

	var entry_9_packed = load("res://UI/example_hbox.tscn")
	var entry_9 = entry_9_packed.instantiate()
	get_child(1, true).get_child(0, true).add_child(entry_9)
	entry_9.name_label.text = GlobalVariables.entry_9[0]
	entry_9.date_label.text = GlobalVariables.entry_9[1]
	if GlobalVariables.entry_9[2] == null:
		entry_9.score_label.text = ""
	else:
		entry_9.score_label.text = str(GlobalVariables.entry_9[2])

	var entry_10_packed = load("res://UI/example_hbox.tscn")
	var entry_10 = entry_10_packed.instantiate()
	get_child(1, true).get_child(0, true).add_child(entry_10)
	entry_10.name_label.text = GlobalVariables.entry_10[0]
	entry_10.date_label.text = GlobalVariables.entry_10[1]
	if GlobalVariables.entry_10[2] == null:
		entry_10.score_label.text = ""
	else:
		entry_10.score_label.text = str(GlobalVariables.entry_10[2])
