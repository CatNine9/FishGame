extends Node



var loaded_species_name = ""
var loaded_species_sprite = null
var loaded_collision_shape = null
var loaded_species_theme_colour = Vector3(0, 0, 0)
var loaded_species_description = ""

var loaded_movement_mode = ""
var loaded_facing_mode = ""
var loaded_speed = 0



var species_1 = null
var species_2 = null



func _ready():
	var species_1_preload = preload("res://Species/species_1.tscn")
	var species_2_preload = preload("res://Species/species_2.tscn")
	
	
	species_1 = species_1_preload.instantiate()
	species_2 = species_2_preload.instantiate()
	
	
	add_child(species_1)
	add_child(species_2)



func find_species(species):
	if species == "Round":
		load_species_1()
	elif species == "Long":
		load_species_2()



func load_species_1():
	loaded_species_name = species_1.species_name
	loaded_species_sprite = species_1.sprite
	loaded_collision_shape = species_1.collision_vectors
	loaded_species_description = species_1.description
	loaded_species_theme_colour = species_1.theme_colour
	loaded_movement_mode = species_1.movement_mode
	loaded_facing_mode = species_1.facing_mode
	loaded_speed = species_1.speed

func load_species_2():
	loaded_species_name = species_2.species_name
	loaded_species_sprite = species_2.sprite
	loaded_collision_shape = species_2.collision_vectors
	loaded_species_description = species_2.description
	loaded_species_theme_colour = species_2.theme_colour
	loaded_movement_mode = species_2.movement_mode
	loaded_facing_mode = species_2.facing_mode
	loaded_speed = species_2.speed
