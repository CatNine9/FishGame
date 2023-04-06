extends Node



@export var species_name = "Big"
@export var sprite = load("res://Fish/CreatureSprites/Bigrighted.png")
@export var collision_vectors = [Vector2(-8, -19), Vector2(12, -19), Vector2(23, -11), Vector2(24, 14), Vector2(14, 22), Vector2(-7, 22), Vector2(-19, 14), Vector2(-24, 3), Vector2(-21, -8)]
@export var mouth_vectors = [Vector2(24, -8), Vector2(40, -22), Vector2(40, 23), Vector2(24, 11)]
@export var vision_vectors = [Vector2(16, -8), Vector2(80, -128), Vector2(120, -120), Vector2(160, -80), Vector2(176, -24), Vector2(176, 24), Vector2(160, 80), Vector2(120, 120), Vector2(80, 120), Vector2(16, 8)]
@export var description = "With a large body and large mouth, they have a lot of health and can sweep up many small foods and enemies. Their downside is that they are slow."
@export var theme_colour = Vector3(20, 60, 84)

@export var movement_mode = "Follow"
@export var facing_mode = "Follow"

@export var speed = 400
@export var coasting_speed = (speed / 3) * 2
@export var health_cap = 10
@export var food_cap = 10
@export var energy_cap = 10
@export var phys_attack = 5
