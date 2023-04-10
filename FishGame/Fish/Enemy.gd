extends CharacterBody2D



@onready var sprite = $EnemySprite
@onready var collision_shape = $AreaBody/CollisionBody
@onready var physical_body = $PhysicalBody
@onready var area_shape = $AreaBody
@onready var mouth_shape = $AreaMouth/CollisionMouth
@onready var vision_shape = $AreaVision/CollisionVision
@onready var size_label = $Node2D/SizeLabel
@onready var debug_label = $Node2D/DebugInfoContainer
@onready var size_tier_label = $Node2D/DebugInfoContainer/Panel/VBoxContainer/HBoxContainer/SizeTierValueLabel
@onready var label_rotation = $Node2D
@onready var attack_sprite = $AttackSprite
@onready var health_bar_container = $Node2D/HealthBarConatiner
@onready var health_bar = $Node2D/HealthBarConatiner/HealthBar
@onready var health_value_label = $Node2D/HealthBarConatiner/HealthBar/HealthValueLabel

# Timers:
@onready var size_display_delay = $SizeDisplayDelay
@onready var feeding_timer = $EnemyFeedTime
@onready var flee_timer = $EnemyFleeTime
@onready var check_for_player_timer = $CheckForPlayerTime
@onready var attack_cooldown = $AttackCooldownTime
@onready var attack_visibility_time = $AttackVisibleTime

# Setup:
var left_boundary = 0
var right_boundary = 0
var up_boundary = 0
var down_boundary = 0
var random_height_value = 0
var random_width_value = 0
var self_identifier = null
var spawn_side = null
var sprite_flipped = false
var species = ""
var size_tier = ""

# Stats:
var speed = 1
var coasting_speed = 300
var max_health = 1
var health = 1
var health_points_format = "%d / %d"
var health_points_string = health_points_format % [health, max_health]
var phys_attack = 1

# Modes:
var movement_mode = "Default"
var facing_mode = "Default"

# Bools:
var is_stopped = false
var is_in_flee_sequence = false
var is_in_kill_sequence = false
var is_rotated = false
var is_checking = true
var can_attack = false

# Player sensing:
var sighted_player = null
var last_sighted_player_position = Vector2(0, 0)





func _ready():
	if facing_mode == "Follow":
		facing_follow_start_coast()

	if GlobalVariables.size_visibility == false:
		size_label.visible = false
	else:
		size_label.visible = true

	if GlobalVariables.debug_visibility == false:
		debug_label.visible = false
	else:
		debug_label.visible = true
	
	var scale_difference = 1 - scale.x
	label_rotation.scale += Vector2(scale_difference, scale_difference)
	
	if scale < (GlobalVariables.player_scale * 0.75):
		size_tier = "Prey"
	if scale <= (GlobalVariables.player_scale * 1.25) and scale >= (GlobalVariables.player_scale * 0.75):
		size_tier = "Adversary"
	if scale > (GlobalVariables.player_scale * 1.25):
		size_tier = "Predator"
	
	health_bar.max_value = max_health
	health_bar.value = max_health
	health_points_string = health_points_format % [health, max_health]
	health_value_label.text = health_points_string



func _physics_process(delta):
	if is_stopped == false:
		if movement_mode == "Follow":
			movement_follow(delta)
		if facing_mode == "Follow":
			facing_follow()

	if GlobalVariables.debug_visibility == true:
		size_tier_label.text = size_tier

	if position.x < (left_boundary - 200) or position.x > (right_boundary + 200) or position.y < (up_boundary - 200) or position.y > (down_boundary + 200):
		enemy_dies()

	label_rotation.global_rotation = 0



func facing_follow_start_coast():
	if sighted_player == null:
		if spawn_side == 0:
			position = Vector2(0, random_height_value)
			rotation = deg_to_rad(0)
		elif spawn_side == 1:
			position = Vector2(3848, random_height_value)
			rotation = deg_to_rad(180)
		elif spawn_side == 2:
			position = Vector2(random_width_value, 0)
			rotation = deg_to_rad(90)
		elif spawn_side == 3:
			position = Vector2(random_width_value, 3832)
			rotation = deg_to_rad(270)



func facing_follow():
	if sighted_player != null:
		if scale > (sighted_player.scale * 0.75):
			look_at(sighted_player.position)



func resume_facing_follow_coast():
	if spawn_side == 0:
		rotation = deg_to_rad(0)
	elif spawn_side == 1:
		rotation = deg_to_rad(180)
	elif spawn_side == 2:
		rotation = deg_to_rad(90)
	elif spawn_side == 3:
		rotation = deg_to_rad(270)



func movement_follow(_delta):
	if sighted_player == null and is_in_flee_sequence == false and is_stopped == false:
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
	elif sighted_player and is_in_flee_sequence == false and is_stopped == false:
		if size_tier == "Predator":
			velocity = position.direction_to(sighted_player.position) * speed
		elif size_tier == "Adversary":
			velocity = position.direction_to(sighted_player.position) * speed * 0.5
	move_and_slide()



func stop_moving_timer_start(player_position):
	look_at(player_position)
	attack_sprite.visible = true
	attack_cooldown.start()
	attack_visibility_time.start()
	feeding_timer.start()



func _on_area_vision_body_entered(body):
	sighted_player = body
	if size_tier == "Prey":
		is_in_flee_sequence = true
		turn_and_run()
	if is_checking == true:
		if check_for_player_timer.is_stopped() == false:
			turn_and_run()
			check_for_player_timer.stop()
			is_checking = false
			is_stopped = false



func _on_area_vision_body_exited(_body):
	sighted_player = null
	if is_in_flee_sequence == false and is_in_kill_sequence == false:
		resume_facing_follow_coast()



func _on_area_body_area_entered(area):
	var player = area.get_parent()
	if size_tier == "Prey":
		enemy_dies()
	elif size_tier == "Adversary":
		take_damage(player)
		get_parent().get_parent().player_mouth_overlaps_adversary(self_identifier)



func _on_area_body_area_exited(_area):
	get_parent().get_parent().player_mouth_exited()



func take_damage(player_ref):
	health -= player_ref.phys_attack
	health_bar.value = health
	health_points_string = health_points_format % [health, max_health]
	health_value_label.text = health_points_string
	if health <= 0:
		health = 0
		health_points_string = health_points_format % [health, max_health]
		health_value_label.text = health_points_string
		enemy_dies()


func _on_enemy_flee_time_timeout():
	is_stopped = true
	velocity = Vector2(0, 0)
	look_at(last_sighted_player_position)
	is_checking = true
	if sighted_player == null:
		check_for_player_timer.start()



func _on_check_for_player_time_timeout():
	is_stopped = false
	is_checking = false
	if sighted_player == null:	
		resume_facing_follow_coast()
		is_in_flee_sequence = false


func _on_size_display_delay_timeout():
	size_label.text = str(snapped(scale.x, 0.01))



func _on_enemy_feed_time_timeout():
	is_stopped = false
	is_in_kill_sequence = false
	resume_facing_follow_coast()



func turn_and_run():
	velocity = sighted_player.position.direction_to(position) * coasting_speed
	look_at(position - (sighted_player.position - position))
	last_sighted_player_position = sighted_player.position
	flee_timer.start()




func _on_attack_visible_time_timeout():
	attack_sprite.visible = false



func _on_attack_cooldown_time_timeout():
	if can_attack == true:
		get_parent().get_parent().lose_health(phys_attack)



func _on_health_bar_changed():
	if health < max_health:
#		health_bar_container.visible = true
		pass
	else:
#		health_bar_container.visible = false
		pass



func reassign_tier():
	if scale < (GlobalVariables.player_scale * 0.75):
		size_tier = "Prey"
	if scale <= (GlobalVariables.player_scale * 1.25) and scale >= (GlobalVariables.player_scale * 0.75):
		size_tier = "Adversary"
	if scale > (GlobalVariables.player_scale * 1.25):
		size_tier = "Predator"



func enemy_dies():
	get_parent().get_parent().enemies.erase(self_identifier)
	queue_free()



