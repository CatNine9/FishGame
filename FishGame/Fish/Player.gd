extends CharacterBody2D



@onready var size_label = $SizeLabel
@onready var collision_shape = $AreaBody/CollisionBody

@export var SPEED = 300.0



func _ready():
	var player_size_str = str(collision_shape.scale.x)
	size_label.text = player_size_str



func _physics_process(delta):
	var x_direction = Input.get_axis("ui_left", "ui_right")
	var y_direction = Input.get_axis("ui_up", "ui_down")
	if x_direction:
		velocity.x = x_direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if y_direction:
		velocity.y = y_direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()



func _on_area_body_area_entered(area):
	print("Touching enemy!")
	var enemy = area.get_child(0, true)
	if scale < enemy.scale:
		print("Dead!")
		queue_free()



#func _on_area_body_body_entered(body):
#	print("Touching!")
#	var enemy = body
#	if scale < enemy.scale:
#		print("Dead!")
#		queue_free()
