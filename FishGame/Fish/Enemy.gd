extends CharacterBody2D



@onready var sprite = $Node2D/AreaBody/CollisionBody/EnemySprite
@onready var collision_shape = $Node2D/AreaBody/CollisionBody
@onready var physical_body = $PhysicalBody
@onready var physical_node = $Node2D
@onready var area_shape = $Node2D/AreaBody
@onready var mouth_shape = $Node2D/AreaMouth/CollisionMouth
@onready var vision_shape = $Node2D/AreaVision/CollisionVision
@onready var size_label = $SizeLabel
@onready var size_display_delay = $SizeDisplayDelay
@onready var feeding_timer = $EnemyFeedTime



@export var speed = 1
@export var coasting_speed = 300

@export var movement_mode = "Default"
@export var facing_mode = "Default"

var known_player_position = Vector2(0, 0)

var left_boundary = 0
var right_boundary = 0
var up_boundary = 0
var down_boundary = 0

var random_height_value = 0
var random_width_value = 0

var spawn_side = null
var sprite_flipped = false
var species = ""

var is_stopped = false

var sighted_player = null



func _ready():
	if facing_mode == "Follow":
		facing_follow_start()

	if GlobalVariables.size_visibility == false:
		size_label.visible = false
	else:
		size_label.visible = true



func _physics_process(delta):
	if is_stopped == false:
		if movement_mode == "Follow":
			movement_follow(delta)
		if facing_mode == "Follow":
			facing_follow()

	if position.x < (left_boundary - 200) or position.x > (right_boundary + 200) or position.y < (up_boundary - 200) or position.y > (down_boundary + 200):
		queue_free()



func facing_follow_start():
	if spawn_side == 0:
		position = Vector2(0, random_height_value)
		area_shape.rotation = deg_to_rad(90)
		mouth_shape.rotation = deg_to_rad(90)
		vision_shape.rotation = deg_to_rad(90)
	elif spawn_side == 1:
		position = Vector2(3848, random_height_value)
		area_shape.rotation = deg_to_rad(270)
		mouth_shape.rotation = deg_to_rad(270)
		vision_shape.rotation = deg_to_rad(270)
	elif spawn_side == 2:
		position = Vector2(random_width_value, 0)
		area_shape.rotation = deg_to_rad(180)
		mouth_shape.rotation = deg_to_rad(180)
		vision_shape.rotation = deg_to_rad(180)
	elif spawn_side == 3:
		position = Vector2(random_width_value, 3832)
		area_shape.rotation = deg_to_rad(0)
		mouth_shape.rotation = deg_to_rad(0)
		vision_shape.rotation = deg_to_rad(0)



func facing_follow():
	if sighted_player != null:
		physical_node.look_at(sighted_player.global_position)
	else:
		physical_node.rotation = 0



func resume_facing_follow():
	if spawn_side == 0:
		area_shape.rotation = deg_to_rad(90)
		mouth_shape.rotation = deg_to_rad(90)
		vision_shape.rotation = deg_to_rad(90)
	elif spawn_side == 1:
		area_shape.rotation = deg_to_rad(270)
		mouth_shape.rotation = deg_to_rad(270)
		vision_shape.rotation = deg_to_rad(270)
	elif spawn_side == 2:
		area_shape.rotation = deg_to_rad(180)
		mouth_shape.rotation = deg_to_rad(180)
		vision_shape.rotation = deg_to_rad(180)
	elif spawn_side == 3:
		area_shape.rotation = deg_to_rad(0)
		mouth_shape.rotation = deg_to_rad(0)
		vision_shape.rotation = deg_to_rad(0)



func movement_follow(delta):
	if sighted_player == null:
		if spawn_side == 0:
			velocity.x = 1 * coasting_speed
			velocity.y = 0
		elif spawn_side == 1:
			velocity.x = -1 * coasting_speed
			velocity.y = 0
		elif spawn_side == 2:
			velocity.y = 1 * coasting_speed
			velocity.x = 0
		elif spawn_side == 3:
			velocity.y = -1 * coasting_speed
			velocity.x = 0
		else:
			velocity.x = 0
		move_and_slide()
	else:
		position.x = move_toward(sighted_player.position.x, speed, delta)
		position.y = move_toward(sighted_player.position.y, speed, delta)



func stop_moving_timer_start(player_position):
	feeding_timer.start()
	physical_node.look_at(player_position)
	is_stopped = true



func _on_area_body_area_entered(area):
	var player = area.get_child(0, true)
	if collision_shape.scale.x < player.scale.x:
		queue_free()



func _on_size_display_delay_timeout():
	size_label.text = str(snapped(collision_shape.scale.x, 0.01))



func _on_enemy_feed_time_timeout():
	is_stopped = false
#	if movement_mode == "Follow":
#		rotation = 0
	resume_facing_follow()



func _on_area_vision_body_entered(body):
	sighted_player = body
	print("Player sighted")

func _on_area_vision_body_exited(body):
	sighted_player = null
	resume_facing_follow()
	print("Lost sight of player.")
