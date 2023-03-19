extends Node

const save_path =  "user://save_file.json" #"user://json"

var entry_slots_array = [GlobalVariables.entry_1, GlobalVariables.entry_2, GlobalVariables.entry_3, GlobalVariables.entry_4, GlobalVariables.entry_5, GlobalVariables.entry_6, GlobalVariables.entry_7, GlobalVariables.entry_8, GlobalVariables.entry_9, GlobalVariables.entry_10]


func _ready():
	var datetime_dict = Time.get_date_dict_from_system()
	var time_format = "%d/%d/%d"
	var time_string = time_format % [datetime_dict["day"], datetime_dict["month"], datetime_dict["year"]]

	if GlobalVariables.player_name == null:
		print("player name = null")
	else:
		var entry_to_replace = GlobalVariables.entries.find(["", "", null])
		GlobalVariables.entries[entry_to_replace] = [GlobalVariables.player_name, time_string, GlobalVariables.player_score]
		GlobalVariables.entries.sort_custom(sort_descending)
		GlobalVariables.entry_1 = GlobalVariables.entries[0]
		GlobalVariables.entry_2 = GlobalVariables.entries[1]
		GlobalVariables.entry_3 = GlobalVariables.entries[2]
		GlobalVariables.entry_4 = GlobalVariables.entries[3]
		GlobalVariables.entry_5 = GlobalVariables.entries[4]
		GlobalVariables.entry_6 = GlobalVariables.entries[5]
		GlobalVariables.entry_7 = GlobalVariables.entries[6]
		GlobalVariables.entry_8 = GlobalVariables.entries[7]
		GlobalVariables.entry_9 = GlobalVariables.entries[8]
		GlobalVariables.entry_10 = GlobalVariables.entries[9]
		save_scoreboard()
	load_scoreboard()
	load_entries()

func sort_descending(a, b):
	if a[2] == null or b[2] == null:
		pass
	else:
		return a[2] > b[2]



func _on_back_button_button_up():
	GlobalVariables.player_name = null
	GlobalVariables.player_score = 0
	GlobalVariables.player_position = Vector2(400, 300)
	var main_menu = load("res://UI/MainMenu.tscn")
	get_tree().change_scene_to_packed(main_menu)



func save_scoreboard():
	var save_dict := {
		"entries_array": GlobalVariables.entries,
		"entry_1": GlobalVariables.entry_1,
		"entry_2": GlobalVariables.entry_2,
		"entry_3": GlobalVariables.entry_3,
		"entry_4": GlobalVariables.entry_4,
		"entry_5": GlobalVariables.entry_5,
		"entry_6": GlobalVariables.entry_6,
		"entry_7": GlobalVariables.entry_7,
		"entry_8": GlobalVariables.entry_8,
		"entry_9": GlobalVariables.entry_9,
		"entry_10": GlobalVariables.entry_10,
	}
	var json = JSON.stringify(save_dict)
	var save_file = FileAccess.open(save_path, FileAccess.WRITE)
	save_file.store_line(json)
	save_file.close()


func load_scoreboard():
	if not FileAccess.file_exists(save_path):
		return
	var save_file = FileAccess.open(save_path, FileAccess.READ)
	var save_data = save_file.get_line()
	var json = JSON.parse_string(save_data)
	GlobalVariables.entries = json.entries_array
	GlobalVariables.entry_1 = json.entry_1
	GlobalVariables.entry_2 = json.entry_2
	GlobalVariables.entry_3 = json.entry_3
	GlobalVariables.entry_4 = json.entry_4
	GlobalVariables.entry_5 = json.entry_5
	GlobalVariables.entry_6 = json.entry_6
	GlobalVariables.entry_7 = json.entry_7
	GlobalVariables.entry_8 = json.entry_8
	GlobalVariables.entry_9 = json.entry_9
	GlobalVariables.entry_10 = json.entry_10



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
