extends CharacterBody2D



@export var SPEED = 300.0

var spawn_side = null

func _ready():
	if spawn_side == 0:
		position.x = 0
	elif spawn_side == 1:
		position.x = 800
	else:
		print("Spawn side not ready.")

func _process(delta):
	if spawn_side == 0:
		velocity.x = 1 * SPEED
	elif spawn_side == 1:
		velocity.x = -1 * SPEED
	else:
		velocity.x = 0
	move_and_slide()

	
