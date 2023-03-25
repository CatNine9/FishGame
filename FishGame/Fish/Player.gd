extends CharacterBody2D



@onready var size_label = $SizeLabel
@onready var collision_shape = $AreaBody/CollisionBody
@onready var physical_body = $PhysicalBody
@onready var area_shape = $AreaBody
@onready var mouth_shape = $AreaMouth/CollisionMouth
@onready var sprite = $PlayerSprite

@export var speed = 1
@export var friction = 1000
@export var acceleration = 1000

@export var movement_mode = "Default"
@export var facing_mode = "Default"

var axis = Vector2.ZERO

var is_rotated_90 = false



func _ready():
	GlobalVariables.player_alive = true
	
	size_label.text = str(collision_shape.scale.x)
	if GlobalVariables.size_visibility == false:
		size_label.visible = false
	else:
		size_label.visible = true
	refresh_species()



func _physics_process(delta):
	#velocity = Vector2.ZERO
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



func follow_move(speed, _delta):
	var mouse_position = get_local_mouse_position()
	velocity = mouse_position * speed
	move_and_slide()



func experimental_move(_speed):
	print(get_global_mouse_position())



func follow_facing():
	look_at(get_global_mouse_position())
#	var rotate_correct = deg_to_rad(90)
#	area_shape.rotation = rotate_correct
#	mouth_shape.rotation = rotate_correct



func _on_area_body_area_entered(area):
	var enemy = area.get_child(0, true)
	if collision_shape.scale.x < enemy.scale.x:
		GlobalVariables.camera_position = position
		sprite.visible = false
		collision_shape.set_deferred("disabled", true)
		GlobalVariables.player_alive = false
		get_parent().death_window.visible = true
		var enemy_root_node = area.get_parent().get_parent()
		get_parent().enemy_player_killed_by(enemy_root_node)




func _on_area_mouth_area_entered(area):
	var enemy = area.get_child(0, true)
	if collision_shape.scale.x > enemy.scale.x:
		collision_shape.scale += Vector2(0.1, 0.1)
		physical_body.scale += Vector2(0.1, 0.1)
		mouth_shape.scale += Vector2(0.1, 0.1)
		size_label.text = str(snapped(collision_shape.scale.x, 0.01))
		get_parent().increment_score()



func refresh_species():
	sprite.texture = Species.loaded_species_sprite
	
	var new_collision_points = PackedVector2Array()
	var new_mouth_points = PackedVector2Array()
	for each in Species.loaded_collision_shape:
		new_collision_points.append(each)
	for each in Species.loaded_mouth_shape:
		new_mouth_points.append(each)
		
	collision_shape.polygon = new_collision_points
	mouth_shape.polygon = new_mouth_points
	physical_body.scale = Vector2(1.64, 1.64)
	movement_mode = Species.loaded_movement_mode
	facing_mode = Species.loaded_facing_mode
	speed = Species.loaded_speed
	
	



