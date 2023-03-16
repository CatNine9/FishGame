extends CharacterBody2D



@onready var sprite = $AreaBody/CollisionBody/EnemySprite
@onready var collision_shape = $AreaBody/CollisionBody
@onready var area_shape = $AreaBody
@onready var size_label = $SizeLabel
@onready var size_display_delay = $SizeDisplayDelay



@export var SPEED = 200



var spawn_side = null
var sprite_flipped = false



func _ready():
	if spawn_side == 0:
		position.x = 0
	elif spawn_side == 1:
		position.x = 3848
		sprite.flip_v = true

	if GlobalVariables.size_visibility == false:
		size_label.visible = false
	else:
		size_label.visible = true



func _physics_process(delta):
	if spawn_side == 0:
		velocity.x = 1 * SPEED
	elif spawn_side == 1:
		velocity.x = -1 * SPEED
	else:
		velocity.x = 0
	move_and_slide()
		
	if position.x < -200 or position.x > 4000:
		queue_free()



func _on_area_body_area_entered(area):
	var player = area.get_child(0, true)
	if collision_shape.scale.x < player.scale.x:
		queue_free()



func _on_size_display_delay_timeout():
	size_label.text = str(snapped(collision_shape.scale.x, 0.01))
