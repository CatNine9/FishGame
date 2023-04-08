extends Node



var loaded_species_name = ""
var loaded_species_sprite = null
var loaded_collision_shape = null
var loaded_mouth_shape = null
var loaded_attack_graphic_xpos = 0
var loaded_species_theme_colour = Vector3(0, 0, 0)
var loaded_species_description = ""
var loaded_species_max_health = 1
var loaded_species_phys_attack = 1

var loaded_movement_mode = ""
var loaded_facing_mode = ""

var loaded_speed = 0
var loaded_coasting_speed = 0


var species_1 = null
var species_2 = null
var species_3 = null
var species_4 = null



func _ready():
	var species_1_preload = preload("res://species/Species_1.tscn")
	var species_2_preload = preload("res://species/Species_2.tscn")
	var species_3_preload = preload("res://species/Species_3.tscn")
	var species_4_preload = preload("res://species/Species_4.tscn")
	
	species_1 = species_1_preload.instantiate()
	species_2 = species_2_preload.instantiate()
	species_3 = species_3_preload.instantiate()
	species_4 = species_4_preload.instantiate()
	
	add_child(species_1)
	add_child(species_2)
	add_child(species_3)
	add_child(species_4)



func find_species(species):
	if species == "Round":
		load_species(species_1)
	elif species == "Long":
		load_species(species_2)
	elif species == "Big":
		load_species(species_3)
	elif species == "X-Sail":
		load_species(species_4)



func load_species(species_node):
	loaded_species_name = species_node.species_name
	loaded_species_sprite = species_node.sprite
	loaded_collision_shape = species_node.collision_vectors
	loaded_mouth_shape = species_node.mouth_vectors
	loaded_attack_graphic_xpos = species_node.attack_graphic_x_pos
	loaded_species_description = species_node.description
	loaded_species_theme_colour = species_node.theme_colour
	loaded_movement_mode = species_node.movement_mode
	loaded_facing_mode = species_node.facing_mode
	loaded_speed = species_node.speed
	loaded_coasting_speed = species_node.coasting_speed
	loaded_species_max_health = species_node.health_cap
	loaded_species_phys_attack = species_node.phys_attack
