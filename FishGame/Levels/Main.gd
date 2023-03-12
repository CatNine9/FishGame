extends Node



@onready var enemy_spawn_delay = $EnemySpawnDelay
@onready var player = $Player
@onready var player_collision = $Player/AreaBody/CollisionBody
@onready var score_label = $ScoreLabel



var number_of_child_nodes = null
var enemies = []
var score = 0


signal score_incremented



func _ready():
	spawn_enemy()
	enemy_spawn_delay.start()
	score_label.text = str(score)



func _on_enemy_spawn_delay_timeout():
	if player == null:
		enemy_spawn_delay.stop()
	else:
		spawn_enemy()



func spawn_enemy():
	var random_side_value = randi() % 2
		
	var random_height_value = randi_range(0, 600)
	
	var random_size_value = randf_range(player_collision.scale.x * 0.75, player_collision.scale.x * 1.25)
	
	var enemy_preload = preload("res://Fish/Enemy.tscn")
	var enemy_spawn = enemy_preload.instantiate()
	enemy_spawn.spawn_side = random_side_value
	enemy_spawn.position.y = random_height_value
	add_child(enemy_spawn)
	enemies.append(enemy_spawn)
	
	enemy_spawn.collision_shape.scale *= random_size_value
	
func increment_score():
	score += 1
	score_label.text = str(score)
