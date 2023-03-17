extends Control


var selection_1_sprite = null
var selection_1_rect_colour = Vector3(0, 0, 0)
var selection_1_name = ""
var selection_1_desc = ""

var selection_2_sprite = null
var selection_2_rect_colour = Vector3(0, 0, 0)
var selection_2_name = ""
var selection_2_desc = ""



func _ready():
	Species.load_species_1()
	Species.loaded_species_name = selection_1_name
	Species.loaded_species_sprite = selection_1_sprite
	Species.loaded_species_theme_colour = selection_1_rect_colour
	Species.loaded_species_description = selection_1_desc

	Species.load_species_2()
	Species.loaded_species_name = selection_2_name
	Species.loaded_species_sprite = selection_2_sprite
	Species.loaded_species_theme_colour = selection_2_rect_colour
	Species.loaded_species_description = selection_2_desc



func _on_texture_button_toggled(button_pressed):
	pass


func _on_texture_button_2_toggled(button_pressed):
	pass
