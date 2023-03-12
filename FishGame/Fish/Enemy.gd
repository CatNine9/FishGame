extends CharacterBody2D



@onready var sprite = $AreaBody/CollisionBody/EnemySprite
@onready var collision_shape = $AreaBody/CollisionBody
@onready var size_label = $SizeLabel
@onready var size_display_delay = $SizeDisplayDelay



@export var SPEED = 300.0



var spawn_side = null
var sprite_flipped = false



func _ready():
	if spawn_side == 0:
		position.x = 0
	elif spawn_side == 1:
		position.x = 800
		sprite.flip_h = true
	else:
		print("Spawn side not ready.")
	print("Spawned at y ", position.y)



func _process(delta):
	if spawn_side == 0:
		velocity.x = 1 * SPEED
	elif spawn_side == 1:
		velocity.x = -1 * SPEED
	else:
		velocity.x = 0
	move_and_slide()
	
	if position.x < -200 or position.x > 1000:
		queue_free()



func _on_area_body_area_entered(area):
	print("Touching player!")
	var player = area.get_child(0, true)
	print("The enemy thinks the player is ", player.scale.x, "x", player.scale.y)
	print("The enemy thinks itself is ", collision_shape.scale.x, "x", collision_shape.scale.y)
	if collision_shape.scale.x < player.scale.x:
		print("Dead!")
		queue_free()



func _on_size_display_delay_timeout():
	var enemy_size_str = str(collision_shape.scale.x)
	size_label.text = enemy_size_str
