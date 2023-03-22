extends CharacterBody2D



@onready var sprite = $AreaBody/CollisionBody/EnemySprite
@onready var collision_shape = $AreaBody/CollisionBody
@onready var physical_body = $PhysicalBody
@onready var area_shape = $AreaBody
@onready var size_label = $SizeLabel
@onready var size_display_delay = $SizeDisplayDelay
@onready var animations = $AreaBody/CollisionBody/EnemySprite/AnimationPlayer
@onready var feeding_timer = $EnemyFeedTime



@export var max_speed = 1
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



func _ready():
	print("Facing mode: ", facing_mode)
	if facing_mode == "Follow":
		facing_follow()

	if GlobalVariables.size_visibility == false:
		size_label.visible = false
	else:
		size_label.visible = true

	#print(spawn_side, position)



func _physics_process(delta):
	if is_stopped == false:
		if movement_mode == "Follow":
			movement_follow()

	if position.x < (left_boundary - 200) or position.x > (right_boundary + 200) or position.y < (up_boundary - 200) or position.y > (down_boundary + 200):
		queue_free()



func facing_follow():
	if spawn_side == 0:
		position = Vector2(0, random_height_value)
		animations.play("idle_right")
		print("Spawned left!")
	elif spawn_side == 1:
		position = Vector2(3848, random_height_value)
		animations.play("idle_left")
		print("Spawned right!")
	elif spawn_side == 2:
		position = Vector2(random_width_value, 0)
		animations.play("idle_up")
	elif spawn_side == 3:
		position = Vector2(random_width_value, 3832)
		animations.play("idle_down")

func resume_facing_default():
	if spawn_side == 0:
		animations.play("idle_right")
	elif spawn_side == 1:
		animations.play("idle_left")
	elif spawn_side == 2:
		animations.play("idle_up")
	elif spawn_side == 3:
		animations.play("idle_down")



func movement_follow():
	if spawn_side == 0:
		velocity.x = 1 * coasting_speed
	elif spawn_side == 1:
		velocity.x = -1 * coasting_speed
	elif spawn_side == 2:
		velocity.y = 1 * coasting_speed
	elif spawn_side == 3:
		velocity.y = -1 * coasting_speed
	else:
		velocity.x = 0
	move_and_slide()



func stop_moving_timer_start(player_position):
	feeding_timer.start()
	look_at(player_position)
	is_stopped = true



func _on_area_body_area_entered(area):
	var player = area.get_child(0, true)
	if collision_shape.scale.x < player.scale.x:
		queue_free()



func _on_size_display_delay_timeout():
	size_label.text = str(snapped(collision_shape.scale.x, 0.01))



func _on_enemy_feed_time_timeout():
	is_stopped = false
	if movement_mode == "Follow":
		rotation = 0
