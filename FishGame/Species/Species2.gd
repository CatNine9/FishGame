extends Node



@export var species_name = "Long"
@export var sprite = load("res://Fish/CreatureSprites/SpaceCreature2righted.png")
@export var collision_vectors = [Vector2(-24, -15), Vector2(14, -12), Vector2(21, -8), Vector2(24, 1), Vector2(21, 9), Vector2(15, 13), Vector2(-24, 16), Vector2(-37, 2)]
@export var mouth_vectors = [Vector2(21, -7), Vector2(34, -5), Vector2(34, 6), Vector2(21, 8)]
@export var vision_vectors = [Vector2(16, -8), Vector2(80, -128), Vector2(120, -120), Vector2(160, -80), Vector2(176, -24), Vector2(176, 24), Vector2(160, 80), Vector2(120, 120), Vector2(80, 120), Vector2(16, 8)]
@export var attack_graphic_x_pos = 40
@export var description = "A cuttlefish-shaped ambush predator. Not as agile, but can deal a lot of damage in one go."
@export var theme_colour = Vector3(28, 48, 35)

@export var movement_mode = "Follow"
@export var facing_mode = "Follow"

@export var speed = 300
@export var coasting_speed = (speed / 3) * 2
@export var food_cap = 3
@export var energy_cap = 7
@export var phys_attack = 5
