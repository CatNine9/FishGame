extends Node



@onready var species_1 = $Species1
@onready var species_2 = $Species2



var loaded_species_name = ""
var loaded_species_sprite = null
var loaded_species_theme_colour = Vector3(0, 0, 0)
var loaded_species_description = ""

func _ready():
	print(get_children())

func load_species_1():
	loaded_species_name = species_1.species_name
	loaded_species_sprite = species_1.sprite
	loaded_species_description = species_1.description
	loaded_species_theme_colour = species_1.theme_colour

func load_species_2():
	loaded_species_name = species_2.species_name
	loaded_species_sprite = species_2.sprite
	loaded_species_description = species_2.description
	loaded_species_theme_colour = species_2.theme_colour
