extends Node



@export var species_name = "Big"
@export var sprite = load("res://Fish/CreatureSprites/SpaceCreature3.png")
@export var collision_vectors = [Vector2(-21, 10), Vector2(-21, -15), Vector2(-11, -28), Vector2(2, -26), Vector2(16, -29), Vector2(25, -16), Vector2(25, 9), Vector2(16, 24), Vector2(3, 28), Vector2(-9, 25)]
@export var description = "With a large body and large mouth, they have a lot of health and can sweep up many small foods and enemies. Their downside is that they are slow."
@export var theme_colour = Vector3(20, 60, 84)

@export var movement_mode = "Follow"
@export var facing_mode = "Follow"

@export var speed = 0.3
@export var health_cap = 10
@export var food_cap = 10
@export var energy_cap = 10
@export var phys_attack = 5
