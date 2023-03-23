extends CharacterBody2D


@onready var physical_node = $Node2D
@onready var size_label = $SizeLabel
@onready var collision_shape = $Node2D/AreaBody/CollisionBody
@onready var physical_body = $PhysicalBody
@onready var area_shape = $Node2D/AreaBody
@onready var sprite = $Node2D/AreaBody/CollisionBody/PlayerSprite
@onready var animation = $Node2D/AreaBody/CollisionBody/PlayerSprite/AnimationPlayer

@export var MAX_SPEED = 300
@export var FRICTION = 1000
@export var ACCELERATION = 1000

@export var movement_mode = "Default"
@export var facing_mode = "Default"

var axis = Vector2.ZERO

var is_rotated_90 = false



# Will be used for animating:
var directions_dict = {
	"Up": Vector2(0, -1),
	"Up_Right": Vector2(1, -1),
	"Right": Vector2(1, 0),
	"Down_Right": Vector2(1, 1),
	"Down": Vector2(0, 1),
	"Down_Left": Vector2(-1, 1),
	"Left": Vector2(-1, 0),
	"Up_Left": Vector2(-1, -1),
}



func _ready():
	GlobalVariables.player_alive = true
	
	size_label.text = str(collision_shape.scale.x)
	if GlobalVariables.size_visibility == false:
		size_label.visible = false
	else:
		size_label.visible = true
	refresh_species()

	if facing_mode == "Follow":
		return
	else:
		animation.play("idle_up")



func _physics_process(delta):
	#velocity = Vector2.ZERO
	if GlobalVariables.player_alive == true:
		# Movement:
		if movement_mode == "Follow":
			follow_move(MAX_SPEED, delta)
		elif movement_mode == "Experimental":
			experimental_move(MAX_SPEED)
		# Facing:
		if facing_mode == "Follow":
			follow_facing()

	GlobalVariables.player_position = position



func follow_move(speed, delta):
	var mouse_position = get_local_mouse_position()
	velocity = mouse_position * speed
	move_and_slide()



func experimental_move(speed):
	print(get_global_mouse_position())



func follow_facing():
	physical_node.look_at(get_global_mouse_position())
	var rotate_correct1 = deg_to_rad(270)
	var rotate_correct2 = deg_to_rad(90)
	area_shape.rotation = rotate_correct1
	physical_body.rotation = rotate_correct2


func _on_area_body_area_entered(area):
	var enemy = area.get_child(0, true)
	if collision_shape.scale.x < enemy.scale.x:
		GlobalVariables.camera_position = position
		sprite.visible = false
		collision_shape.set_deferred("disabled", true)
		GlobalVariables.player_alive = false
		get_parent().death_window.visible = true
		var enemy_root_node = area.get_parent()
		get_parent().enemy_player_killed_by(enemy_root_node)
	elif collision_shape.scale.x > enemy.scale.x:
		collision_shape.scale += Vector2(0.1, 0.1)
		physical_body.scale += Vector2(0.1, 0.1)
		size_label.text = str(snapped(collision_shape.scale.x, 0.01))
		get_parent().increment_score()



func refresh_species():
	sprite.texture = Species.loaded_species_sprite
	
	var new_points = PackedVector2Array()
	for each in Species.loaded_collision_shape:
		new_points.append(each)
	collision_shape.polygon = new_points
	physical_body.scale = Vector2(1.64, 1.64)
	movement_mode = Species.loaded_movement_mode
	facing_mode = Species.loaded_facing_mode
	MAX_SPEED = Species.loaded_speed
	
