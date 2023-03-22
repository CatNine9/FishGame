extends Node



@export var species_name = "Long"
@export var sprite = load("res://Fish/CreatureSprites/SpaceCreature2.png")
@export var collision_vectors = [Vector2(-15, 24), Vector2(-12, -14), Vector2(-5, -32), Vector2(1, -33), Vector2(7, -32), Vector2(13, -15), Vector2(16, 24), Vector2(2, 37)]
@export var description = "A cuttlefish-shaped ambush predator. Not as agile, but can deal a lot of damage in one go."
@export var theme_colour = Vector3(28, 48, 35)

@export var movement_mode = "Follow"
@export var facing_mode = "Follow"

@export var speed = 0.5
@export var health_cap = 3
@export var food_cap = 3
@export var energy_cap = 7
@export var phys_attack = 5
