extends Control



@onready var page_1 = $CenterContainer/ColorRect
@onready var page_2 = $CenterContainer/ColorRect2



func _on_next_button_button_up():
	page_1.visible = false
	page_2.visible = true


func _on_no_button_button_up():
	var main_menu = load("res://UI/MainMenu.tscn")
	get_tree().change_scene_to_packed(main_menu)
