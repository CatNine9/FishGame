extends CharacterBody2D



@export var SPEED = 300.0

var spawn_side = null



func _process(delta):
	if spawn_side == "Left":
		velocity.x = 1 * SPEED
	else:
		velocity.x = -1 * SPEED
	move_and_slide()
