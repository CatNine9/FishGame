extends CharacterBody2D



@onready var sprite = $AreaBody/CollisionBody/EnemySprite
@onready var collision_shape = $AreaBody/CollisionBody
@onready var physical_body = $PhysicalBody
@onready var area_shape = $AreaBody
@onready var size_label = $SizeLabel
@onready var size_display_delay = $SizeDisplayDelay
@onready var animations = $AreaBody/CollisionBody/EnemySprite/AnimationPlayer
@onready var feeding_timer = $EnemyFeedTime



@export var MAX_SPEED = 300

@export var movement_mode = "Default"
@export var facing_mode = "Default"

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



func _ready():
	if movement_mode == "Default" or movement_mode == "Simple":
		facing_default()
	elif movement_mode == "Faster Horizontal":
		spawn_side %= 2
		facing_faster_h()

	if GlobalVariables.size_visibility == false:
		size_label.visible = false
	else:
		size_label.visible = true



func _physics_process(delta):
	if is_stopped == false:
		if movement_mode == "Default" or movement_mode == "Simple":
			facing_mode = "Default"
			movement_default()
		elif movement_mode == "Faster Horizontal":
			facing_mode = "Horizontal Only"
			spawn_side %= 2
			movement_faster_h()

	if position.x < (left_boundary - 200) or position.x > (right_boundary + 200) or position.y < (up_boundary - 200) or position.y > (down_boundary + 200):
		queue_free()



func facing_default():
	if spawn_side == 0:
		position = Vector2(0, random_height_value)
		animations.play("idle_right")
	elif spawn_side == 1:
		position = Vector2(3848, random_height_value)
		animations.play("idle_left")
	elif spawn_side == 2:
		position = Vector2(random_width_value, 0)
		animations.play("idle_up")
	elif spawn_side == 3:
		position = Vector2(random_width_value, 3832)
		animations.play("idle_down")



func facing_faster_h():
	if spawn_side == 0:
		position = Vector2(0, random_height_value)
		animations.play("idle_right")
	elif spawn_side == 1:
		position = Vector2(3848, random_height_value)
		animations.play("idle_left")



func movement_default():
	if spawn_side == 0:
		velocity.x = 1 * MAX_SPEED
	elif spawn_side == 1:
		velocity.x = -1 * MAX_SPEED
	elif spawn_side == 2:
		velocity.y = 1 * MAX_SPEED
	elif spawn_side == 3:
		velocity.y = -1 * MAX_SPEED
	else:
		velocity.x = 0
	move_and_slide()

func movement_faster_h():
	if spawn_side == 0:
		velocity.x = 1 * MAX_SPEED
	elif spawn_side == 1:
		velocity.x = -1 * MAX_SPEED
	else:
		velocity.x = 0
	move_and_slide()



func stop_moving_timer_start():
	feeding_timer.start()



func _on_area_body_area_entered(area):
	var player = area.get_child(0, true)
	if collision_shape.scale.x < player.scale.x:
		queue_free()



func _on_size_display_delay_timeout():
	size_label.text = str(snapped(collision_shape.scale.x, 0.01))



func _on_enemy_feed_time_timeout():
	is_stopped = false
