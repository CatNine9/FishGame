extends Node



@export var species_name = "X-Sail"
@export var sprite = load("res://Fish/CreatureSprites/Bigrighted.png")
@export var collision_vectors = [Vector2(1, -25), Vector2(8, -14), Vector2(8, -7), Vector2(5, -3), Vector2(0, 2), Vector2(-4, 0), Vector2(-11, -6), Vector2(-11, -14), Vector2(-4, -25)]
@export var mouth_vectors = [Vector2(-6, -41), Vector2(2, -41), Vector2(1, -25), Vector2(-3, -25)]
@export var vision_vectors = [Vector2(-120, -120), Vector2(-80, -160), Vector2(-24, -176), Vector2(80, -160), Vector2(120, -120), Vector2(128, -80), Vector2(8, -16), Vector2(-128, -80)]
@export var description = "X-Sails can coast the cosmic winds with greater agility and control than any that has come before. Careful, they're fragile."
@export var theme_colour = Vector3(20, 60, 84)

@export var movement_mode = "Follow"
@export var facing_mode = "Follow"

@export var speed = 0.8
@export var coasting_speed = 500
@export var health_cap = 10
@export var food_cap = 10
@export var energy_cap = 10
@export var phys_attack = 5
