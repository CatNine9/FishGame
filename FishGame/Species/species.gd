extends Node



@onready var species_1 = $Species1
@onready var species_2 = $Species2



var loaded_species_name = ""
var loaded_species_sprite = null



func load_species_1():
	loaded_species_name = species_1.species_name
	loaded_species_sprite = species_1.sprite

func load_species_2():
	loaded_species_name = species_2.species_name
	loaded_species_sprite = species_2.sprite
