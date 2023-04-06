extends Node



@export var species_name = "Round"
@export var sprite = load("res://Fish/CreatureSprites/SpaceCreature1righted.png")
@export var collision_vectors = [Vector2(13, -16), Vector2(16, -9), Vector2(16, 8), Vector2(14, 15), Vector2(-1, 18), Vector2(-17, 16), Vector2(-21, 0), Vector2(-17, -16), Vector2(-1, -19)]
@export var mouth_vectors = [Vector2(18, -10), Vector2(19, 9), Vector2(14, 6), Vector2(14, -7)]
@export var vision_vectors = [Vector2(11, -16), Vector2(56, -136), Vector2(120, -120), Vector2(160, -80), Vector2(176, -24), Vector2(176, 24), Vector2(160, 80), Vector2(120, 120), Vector2(56, 136), Vector2(12, 14)]
@export var description = "A spherical filter feeder. Greater maneouverability at the cost of lower attack damage."
@export var theme_colour = Vector3(49, 108, 125)

@export var movement_mode = "Follow"
@export var facing_mode = "Follow"

@export var speed = 200
@export var coasting_speed = (speed / 3) * 2
@export var health_cap = 5
@export var food_cap = 5
@export var energy_cap = 5
@export var phys_attack = 3
