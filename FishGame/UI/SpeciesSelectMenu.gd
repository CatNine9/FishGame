extends Control

@onready var selection_1_name = $Control2/HBoxContainer/TextureButton/Species1Vbox/SpeciesNameLabel
@onready var selection_2_name = $Control2/HBoxContainer/TextureButton2/Species2Vbox/SpeciesNameLabel

@onready var selection_1_sprite = $Control2/HBoxContainer/TextureButton/Species1Vbox/ColorRect/CenterContainer/Node2D/SpeciesSprite
@onready var selection_2_sprite = $Control2/HBoxContainer/TextureButton2/Species2Vbox/ColorRect/CenterContainer/Node2D/SpeciesSprite

@onready var selection_1_rect_colour = $Control2/HBoxContainer/TextureButton/Species1Vbox/ColorRect
@onready var selection_2_rect_colour = $Control2/HBoxContainer/TextureButton2/Species2Vbox/ColorRect

@onready var selection_1_desc = $Control2/HBoxContainer/TextureButton/Species1Vbox/SpeciesDescLabel
@onready var selection_2_desc = $Control2/HBoxContainer/TextureButton2/Species2Vbox/SpeciesDescLabel



var loaded_species_1 = ""
var loaded_species_2 = ""
var game_start = null


func _ready():
	print("Player alive: ", GlobalVariables.player_alive)
	if GlobalVariables.player_species == "":
		Species.find_species("Round")
		load_Selection_1()
		loaded_species_1 = "Round"
		Species.find_species("Long")
		load_selection_2()
		loaded_species_2 = "Long"
	elif GlobalVariables.player_species == "Round":
		Species.find_species("Big")
		load_Selection_1()
		Species.find_species("Big")
		load_selection_2()
	elif GlobalVariables.player_species == "Long":
		pass

func load_Selection_1():
	selection_1_name.text = Species.loaded_species_name
	selection_1_sprite.texture = Species.loaded_species_sprite
	selection_1_rect_colour = Color(Species.loaded_species_theme_colour.x, Species.loaded_species_theme_colour.y, Species.loaded_species_theme_colour.z, 1)
	selection_1_desc.text = Species.loaded_species_description

func load_selection_2():
	selection_2_name.text = Species.loaded_species_name
	selection_2_sprite.texture = Species.loaded_species_sprite
	selection_2_rect_colour = Color(Species.loaded_species_theme_colour.x, Species.loaded_species_theme_colour.y, Species.loaded_species_theme_colour.z, 1)
	selection_2_desc.text = Species.loaded_species_description



func _on_texture_button_button_up():
	Species.find_species(loaded_species_1)
	change_scene_to_game()



func _on_texture_button_2_button_up():
	Species.find_species(loaded_species_2)
	change_scene_to_game()


func change_scene_to_game():
	GlobalVariables.player_species = Species.loaded_species_name
	if GlobalVariables.current_level == 0:
		game_start = load("res://Levels/Main.tscn")
	elif GlobalVariables.current_level == 1:
		game_start = load("res://Levels/Level2.tscn")
	get_tree().change_scene_to_packed(game_start)
