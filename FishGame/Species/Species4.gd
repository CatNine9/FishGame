extends Node



@export var species_name = "X-Sail"
@export var sprite = load("res://Fish/CreatureSprites/SpaceCreature4.png")
@export var collision_vectors = [Vector2(-21, 10), Vector2(-21, -15), Vector2(-11, -28), Vector2(2, -26), Vector2(16, -29), Vector2(25, -16), Vector2(25, 9), Vector2(16, 24), Vector2(3, 28), Vector2(-9, 25)]
@export var description = "X-Sails can coast the cosmic winds with greater agility and control than any that has come before. Careful, they're fragile."
@export var theme_colour = Vector3(20, 60, 84)

#@export var movement_mode = "Follow"	# Follow will keep the object moving in the direction of a target.
										# For players this is the mouse.
										# For enemies this is the player (within a certain distance). They
										# meander randomly when not focused on a target.
#@export var facing_mode = "Follow"		# Follow facing mode will keep the player facing the mouse cursor.
										# For enemies this is the player (within a certain distance). They
										# face the direction of movement when not focused on a target.

# Temprary:
@export var movement_mode = "Follow"
@export var facing_mode = "Follow"

@export var speed = 300
@export var health_cap = 10
@export var food_cap = 10
@export var energy_cap = 10
@export var phys_attack = 5
