extends Node



var number_of_child_nodes = null


func _ready():
	spawn_enemy()
	
func _process(delta):
	pass

func spawn_enemy():
	var random_side_value = randi() % 2
	if random_side_value == 0:
		print("Enemy spawning Left")
	elif random_side_value == 1:
		print("Enemy spawning Right")
	else:
		print("Invalid side value, side value is: ", random_side_value)
		
	var random_height_value = randi_range(0, 800)
	
	var enemy_preload = preload("res://Fish/Enemy.tscn")
	var enemy_spawn = enemy_preload.instantiate()
	enemy_spawn.spawn_side = random_side_value
	enemy_spawn.position.y = random_height_value
	add_child(enemy_spawn)
	


