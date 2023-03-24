extends Node



@export var species_name = "Long"
@export var sprite = load("res://Fish/CreatureSprites/SpaceCreature2.png")
@export var collision_vectors = [Vector2(-15, 24), Vector2(-12, -14), Vector2(-8, -21), Vector2(1, -24), Vector2(9, -21), Vector2(13, -15), Vector2(16, 24), Vector2(2, 37)]
@export var mouth_vectors = [Vector2(-5, -34), Vector2(6, -34), Vector2(8, -21), Vector2(-7, -21)]
@export var vision_vectors = [Vector2(-120, -120), Vector2(-80, -160), Vector2(-24, -176), Vector2(80, -160), Vector2(120, -120), Vector2(128, -80), Vector2(8, -16), Vector2(-128, -80)]
@export var description = "A cuttlefish-shaped ambush predator. Not as agile, but can deal a lot of damage in one go."
@export var theme_colour = Vector3(28, 48, 35)

@export var movement_mode = "Follow"
@export var facing_mode = "Follow"

@export var speed = 0.5
@export var coasting_speed = 300
@export var food_cap = 3
@export var energy_cap = 7
@export var phys_attack = 5
