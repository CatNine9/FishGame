extends CharacterBody2D

@export var SPEED = 300.0

var spawn_side = null



func _process(delta):
	if spawn_side == "Left":
		move_toward(velocity.x, 0, SPEED)
	else:
		move_toward(velocity.y, 0, SPEED)
	move_and_slide()
