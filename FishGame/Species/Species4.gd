extends Node



@export var species_name = "X-Sail"
@export var sprite = load("res://Fish/CreatureSprites/Agilerighted.png")
@export var collision_vectors = [Vector2(6, -10), Vector2(14, -11), Vector2(23, -4), Vector2(23, 1), Vector2(15, 8), Vector2(6, 8), Vector2(0, 3), Vector2(-2, -1), Vector2(0, -4)]
@export var mouth_vectors = [Vector2(24, -3), Vector2(40, -6), Vector2(40, 2), Vector2(24, 1)]
@export var vision_vectors = [Vector2(22, -6), Vector2(120, -100), Vector2(150, -70), Vector2(170, -20), Vector2(170, 20), Vector2(150, 70), Vector2(120, 100), Vector2(22, 3)]
@export var attack_graphic_x_pos = 48
@export var description = "X-Sails can coast the cosmic winds with greater agility and control than any that has come before. Careful, they're fragile."
@export var theme_colour = Vector3(20, 60, 84)

@export var movement_mode = "Follow"
@export var facing_mode = "Follow"

@export var speed = 350
@export var coasting_speed = (speed / 3) * 2
@export var health_cap = 18
@export var food_cap = 10
@export var energy_cap = 10
@export var phys_attack = 4
