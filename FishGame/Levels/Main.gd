extends Node2D




func _ready():
	spawn_enemy()
	
func _process(delta):
	pass

func spawn_enemy():
	var random_side_value = randi() % 2
	if random_side_value == 0:
		print("Left")
	elif random_side_value == 1:
		print("Right")
	else:
		print("Invalid side value, side value is:")
		print(random_side_value)
