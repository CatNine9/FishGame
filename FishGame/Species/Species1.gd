extends Node



@export var species_name = "Round"
@export var sprite = load("res://Fish/CreatureSprites/SpaceCreature1.png")
@export var collision_vectors = [Vector2(9, -19), Vector2(16, -8), Vector2(17, 3), Vector2(16, 18), Vector2(0, 21), Vector2(-18, 18), Vector2(-19, 2), Vector2(-18, -8), Vector2(-10, -19)]
@export var description = "A spherical filter feeder. Greater maneouverability at the cost of lower attack damage."
@export var theme_colour = Vector3(49, 108, 125)

@export var movement_mode = "Simple"
@export var facing_mode = "Default"
@export var speed = 200
