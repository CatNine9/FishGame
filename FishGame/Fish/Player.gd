extends CharacterBody2D



@onready var size_label = $SizeLabel
@onready var collision_shape = $AreaBody/CollisionBody
@onready var physical_body = $PhysicalBody
@onready var area_shape = $AreaBody
@onready var sprite = $AreaBody/CollisionBody/PlayerSprite
@onready var animation = $AreaBody/CollisionBody/PlayerSprite/AnimationPlayer

@export var SPEED = 300
@export var MAX_SPEED = 300
@export var FRICTION = 1000
@export var ACCELERATION = 1000

@export var movement_mode = "Default"
@export var facing_mode = "Default"

var axis = Vector2.ZERO



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
	animation.play("idle_up")





func _physics_process(delta):
	#velocity = Vector2.ZERO
	if GlobalVariables.player_alive == true:
		# Movement:
		if movement_mode == "Default":
			default_move(MAX_SPEED)
		# Simple movement mode gives 8 movement directions and slow drifting at a consistent
		# speed, no stopping.
		elif movement_mode == "Simple":
			simple_move(MAX_SPEED)
		# Faster horizontal is just like simple except it halves movement on the y axis.
		elif movement_mode == "Faster Horizontal":
			faster_horizontal(MAX_SPEED)
		elif movement_mode == "Experimental":
			experimental_move(MAX_SPEED)


		# Facing:
		if facing_mode == "Default":
			default_facing()

		if facing_mode == "H Forward Only":
			if Input.is_action_pressed("ui_right"):
				if Input.is_action_pressed("ui_up"):
					animation.play("idle_up_right")
				elif Input.is_action_pressed("ui_down"):
					animation.play("idle_down_right")
				else:
					animation.play("idle_right")
			elif Input.is_action_pressed("ui_left"):
				if Input.is_action_pressed("ui_up"):
					animation.play("idle_up_left")
				elif Input.is_action_pressed("ui_down"):
					animation.play("idle_down_left")
				else:
					animation.play("idle_left")

	GlobalVariables.player_position = position



func default_move(speed):
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if direction == Vector2.ZERO:
		velocity = Vector2.ZERO
	else:
		velocity = direction * speed
	move_and_slide()



func simple_move(speed):
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if direction != Vector2.ZERO:
		velocity = direction * speed
	move_and_slide()



func faster_horizontal(speed):
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if direction != Vector2.ZERO:
		velocity.y = direction.y * speed * 0.5
		velocity.x = direction.x * speed
	move_and_slide()



func experimental_move(speed):
	pass



func default_facing():
	if Input.is_action_pressed("ui_up"):
		if Input.is_action_pressed("ui_right"):
			animation.play("idle_up_right")
		elif Input.is_action_pressed("ui_left"):
			animation.play("idle_up_left")		
		else:
			animation.play("idle_up")
	elif Input.is_action_pressed("ui_down"):
		if Input.is_action_pressed("ui_right"):
			animation.play("idle_down_right")
		elif Input.is_action_pressed("ui_left"):
			animation.play("idle_down_left")
		else:
			animation.play("idle_down")
	elif Input.is_action_pressed("ui_right"):
		animation.play("idle_right")
	elif Input.is_action_pressed("ui_left"):
		animation.play("idle_left")


func _on_area_body_area_entered(area):
	var enemy = area.get_child(0, true)
	if collision_shape.scale.x < enemy.scale.x:
		GlobalVariables.camera_position = position
		sprite.visible = false
		collision_shape.set_deferred("disabled", true)
		GlobalVariables.player_alive = false
		get_parent().death_window.visible = true
	elif collision_shape.scale.x > enemy.scale.x:
		collision_shape.scale.x += 0.1
		collision_shape.scale.y += 0.1
		size_label.text = str(snapped(collision_shape.scale.x, 0.01))
		get_parent().increment_score()



func refresh_species():
	sprite.texture = Species.loaded_species_sprite
	
	var new_points = PackedVector2Array()
	for each in Species.loaded_collision_shape:
		new_points.append(each)
	collision_shape.polygon = new_points
	physical_body.polygon = new_points
	movement_mode = Species.loaded_movement_mode
	facing_mode = Species.loaded_facing_mode
	SPEED = Species.loaded_speed
	
