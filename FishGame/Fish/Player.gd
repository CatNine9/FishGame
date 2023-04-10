extends CharacterBody2D



@onready var size_label = $Node2D/SizeLabel
@onready var size_rotation = $Node2D
@onready var collision_shape = $AreaBody/CollisionBody
@onready var physical_body = $PhysicalBody
@onready var area_shape = $AreaBody
@onready var mouth_shape = $AreaMouth/CollisionMouth
@onready var sprite = $PlayerSprite
@onready var attack_sprite = $AttackSprite

# Timers:
@onready var attack_cooldown = $AttackCooldownTime
@onready var attack_visibility_time = $AttackVisibleTime

# Stats:
var speed = 1
var max_health = 1
var health = 1
var phys_attack = 1

# Modes:
var movement_mode = "Default"
var facing_mode = "Default"

# Bools:
var is_rotated_90 = false
var can_attack = true

# Sensing the enmy:
var enemy_overlapping_mouth = null



func _ready():
	GlobalVariables.player_alive = true
	
	size_label.text = str(snapped(scale.x, 0.01))
	if GlobalVariables.size_visibility == false:
		size_label.visible = false
	else:
		size_label.visible = true
	refresh_species()



func _physics_process(delta):
	if GlobalVariables.player_alive == true:
		# Movement:
		if movement_mode == "Follow":
			follow_move(speed, delta)
		elif movement_mode == "Experimental":
			experimental_move(speed)
		# Facing:
		if facing_mode == "Follow":
			follow_facing()

	GlobalVariables.player_position = position
	GlobalVariables.player_rotation = rotation
	GlobalVariables.player_scale = scale

	size_rotation.global_rotation = 0



func follow_move(player_speed, _delta):
	if Input.is_action_pressed("ui_accept") == false:
		velocity = position.direction_to(get_global_mouse_position()) * player_speed
		move_and_slide()


func experimental_move(_speed):
	print(get_global_mouse_position())



func follow_facing():
	look_at(get_global_mouse_position())



func _on_area_body_area_entered(area):
	var enemy = area.get_parent()
	if enemy.size_tier == "Predator":
		# Enemy is Predator:
		player_dies(area)
	if enemy.size_tier == "Adversary":
		# Enemy is adversary - default bite attack:
		get_parent().lose_health(enemy.phys_attack)
		get_parent().adversary_mouth_overlaps_player(enemy)
		if health <= 0:
			player_dies(area)



func _on_area_mouth_area_entered(area):
	var enemy = area.get_parent()
	if enemy.size_tier == "Prey" and can_attack == true:
		can_attack = false
		attack_sprite.visible = true
		attack_cooldown.start()
		attack_visibility_time.start()
		scale += Vector2(0.1, 0.1)
		size_label.text = str(snapped(scale.x, 0.01))
		get_parent().increment_score()
		get_parent().player_changed_size()



func _on_area_body_area_exited(area):
	var enemy = area.get_parent()
	get_parent().adversary_mouth_exited(enemy)



func _on_attack_visible_time_timeout():
	attack_sprite.visible = false



func _on_attack_cooldown_time_timeout():
	can_attack = true
	get_parent().continue_damage_enemy(enemy_overlapping_mouth)



func refresh_species():
	Species.find_species(GlobalVariables.player_species)
	sprite.texture = Species.loaded_species_sprite
	
	var new_collision_points = PackedVector2Array()
	var new_mouth_points = PackedVector2Array()
	for each in Species.loaded_collision_shape:
		new_collision_points.append(each)
	for each in Species.loaded_mouth_shape:
		new_mouth_points.append(each)

	collision_shape.set_deferred("polygon", new_collision_points)
	mouth_shape.set_deferred("polygon", new_mouth_points)
	physical_body.set_deferred("polygon", new_collision_points)
	attack_sprite.position.x = Species.loaded_attack_graphic_xpos
	movement_mode = Species.loaded_movement_mode
	facing_mode = Species.loaded_facing_mode
	speed = Species.loaded_speed
	GlobalVariables.player_max_health = Species.loaded_species_max_health
	max_health = Species.loaded_species_max_health
	health = GlobalVariables.player_health
	phys_attack = Species.loaded_species_phys_attack



func player_dies(enemy_area):
	GlobalVariables.camera_position = position
	sprite.visible = false
	collision_shape.set_deferred("disabled", true)
	mouth_shape.set_deferred("disabled", true)
	physical_body.set_deferred("disabled", true)
	GlobalVariables.player_alive = false
	get_parent().death_window.visible = true
	var enemy_root_node = enemy_area.get_parent()
	get_parent().enemy_player_killed_by(enemy_root_node)
