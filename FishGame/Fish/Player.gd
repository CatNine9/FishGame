extends CharacterBody2D



@onready var size_label = $SizeLabel
@onready var collision_shape = $AreaBody/CollisionBody
@onready var sprite = $AreaBody/CollisionBody/PlayerSprite

@export var SPEED = 300.0



func _ready():
	size_label.text = str(collision_shape.scale.x)



func _input(event):
	if event.is_action_pressed("ui_left"):
		sprite.flip_h = true
	elif event.is_action_pressed("ui_right"):
		sprite.flip_h = false



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
	var enemy = area.get_child(0, true)
	if collision_shape.scale.x < enemy.scale.x:
		queue_free()
	elif collision_shape.scale.x > enemy.scale.x:
		collision_shape.scale.x += 0.1
		collision_shape.scale.y += 0.1
		size_label.text = str(snapped(collision_shape.scale.x, 0.01))
		get_parent().increment_score()
