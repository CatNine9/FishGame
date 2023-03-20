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
		load_species(species_1)
	elif species == "Long":
		load_species(species_2)



func load_species(species_node):
	loaded_species_name = species_node.species_name
	loaded_species_sprite = species_node.sprite
	loaded_collision_shape = species_node.collision_vectors
	loaded_species_description = species_node.description
	loaded_species_theme_colour = species_node.theme_colour
	loaded_movement_mode = species_node.movement_mode
	loaded_facing_mode = species_node.facing_mode
	loaded_speed = species_node.speed
