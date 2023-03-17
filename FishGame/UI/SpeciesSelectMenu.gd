extends Control

@onready var selection_1_name = $Control2/HBoxContainer/TextureButton/Species1Vbox/SpeciesNameLabel
@onready var selection_2_name = $Control2/HBoxContainer/TextureButton2/Species2Vbox/SpeciesNameLabel

@onready var selection_1_sprite = $Control2/HBoxContainer/TextureButton/Species1Vbox/ColorRect/CenterContainer/Node2D/SpeciesSprite
@onready var selection_2_sprite = $Control2/HBoxContainer/TextureButton2/Species2Vbox/ColorRect/CenterContainer/Node2D/SpeciesSprite

@onready var selection_1_rect_colour = $Control2/HBoxContainer/TextureButton/Species1Vbox/ColorRect
@onready var selection_2_rect_colour = $Control2/HBoxContainer/TextureButton2/Species2Vbox/ColorRect

@onready var selection_1_desc = $Control2/HBoxContainer/TextureButton/Species1Vbox/SpeciesDescLabel
@onready var selection_2_desc = $Control2/HBoxContainer/TextureButton2/Species2Vbox/SpeciesDescLabel



func _ready():
	Species.load_species_1()
	selection_1_name.text = Species.loaded_species_name
	selection_1_sprite.texture = Species.loaded_species_sprite
	selection_1_rect_colour = Color(Species.loaded_species_theme_colour.x, Species.loaded_species_theme_colour.y, Species.loaded_species_theme_colour.z, 1)
	selection_1_desc.text = Species.loaded_species_description
	
	Species.load_species_2()
	selection_2_name.text = Species.loaded_species_name
	selection_2_sprite.texture = Species.loaded_species_sprite
	selection_2_rect_colour = Color(Species.loaded_species_theme_colour.x, Species.loaded_species_theme_colour.y, Species.loaded_species_theme_colour.z, 1)
	selection_2_desc.text = Species.loaded_species_description



func _on_texture_button_toggled(button_pressed):
	pass


func _on_texture_button_2_toggled(button_pressed):
	pass
