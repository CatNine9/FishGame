extends Node



@export var species_name = "Big"
@export var sprite = load("res://Fish/CreatureSprites/SpaceCreature3.png")
@export var collision_vectors = [Vector2(13, -24), Vector2(22, -13), Vector2(22, 8), Vector2(13, 19), Vector2(3, 23), Vector2(-8, 20), Vector2(-19, 8), Vector2(-18, -12), Vector2(-10, -24)]
@export var mouth_vectors = [Vector2(-21, -39), Vector2(23, -40), Vector2(13, -23), Vector2(-10, -23)]
@export var description = "With a large body and large mouth, they have a lot of health and can sweep up many small foods and enemies. Their downside is that they are slow."
@export var theme_colour = Vector3(20, 60, 84)

@export var movement_mode = "Follow"
@export var facing_mode = "Follow"

@export var speed = 0.3
@export var health_cap = 10
@export var food_cap = 10
@export var energy_cap = 10
@export var phys_attack = 5
