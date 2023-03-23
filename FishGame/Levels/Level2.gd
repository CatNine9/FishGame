extends Node



@onready var enemy_spawn_delay = $EnemySpawnDelay
@onready var player = $Player
@onready var player_collision = $Player/Node2D/AreaBody/CollisionBody
@onready var player_area = $Player/Node2D/AreaBody
@onready var score_label = $Player/Camera2D/ScoreLabel
@onready var pause_menu = $Player/Camera2D/PauseControl
@onready var death_window = $Player/Camera2D/DeathControl
@onready var gameplay_camera = $Player/Camera2D
@onready var fps_label = $Player/Camera2D/FPSLabel
@onready var enemy_spawn_node = $Enemies



var number_of_child_nodes = null
var enemies = []
var score = 0
var score_format = "Score: %d"
var score_string = score_format % [score]


func _ready():
	enemy_spawn_delay.start()

	if GlobalVariables.fps_visibility == false:
		fps_label.visible = false
	else:
		fps_label.visible = true

	score_label.text = score_string
	
	if GlobalVariables.is_paused == true:
		pause_menu.visible = true
		player.position = GlobalVariables.player_position
		score = GlobalVariables.player_score
		score_string = score_format % [score]
		score_label.text = score_string
		fps_label.visible = GlobalVariables.fps_visibility
	else:
		Input.mouse_mode = 3


func _process(delta):
	var fps = Engine.get_frames_per_second()
	var fps_format = "FPS: %d"
	var fps_string = fps_format % [fps]
	fps_label.text = fps_string



func _on_enemy_spawn_delay_timeout():
	if player == null:
		enemy_spawn_delay.stop()
	else:
		spawn_enemy()



func spawn_enemy():
	var random_side_value = randi() % 4
	var random_height_value = randi_range(0, 3832)
	var random_width_value = randi_range(0, 3848)
	var random_size_value = randf_range(player_collision.scale.x * 0.75, player_collision.scale.x * 1.25)
	var enemy_preload = preload("res://Fish/Enemy.tscn")
	var enemy_spawn = enemy_preload.instantiate()
	enemy_spawn.spawn_side = random_side_value
	enemy_spawn.left_boundary = 0
	enemy_spawn.right_boundary = 3848
	enemy_spawn.up_boundary = 0
	enemy_spawn.down_boundary = 3832
	enemy_spawn.random_height_value = random_height_value
	enemy_spawn.random_width_value = random_width_value
	#Change this:
	if GlobalVariables.player_species == "Big":
		Species.find_species("")
		enemy_spawn.position.y = random_height_value
		enemy_spawn.species = ""
	elif GlobalVariables.player_species == "X-Sail":
		Species.find_species("")
		if random_side_value == 0 or random_side_value == 1:
			enemy_spawn.position.x = random_width_value
		elif random_side_value == 2 or random_side_value == 3:
			enemy_spawn.position.y = random_height_value
		enemy_spawn.species = ""
	elif GlobalVariables.player_species == "":
		pass
	elif GlobalVariables.player_species == "":
		pass
	enemy_spawn.movement_mode = Species.loaded_movement_mode
	enemy_spawn_node.add_child(enemy_spawn)
	enemies.append(enemy_spawn)
	enemy_spawn.collision_shape.scale *= random_size_value
	enemy_spawn.collision_shape.polygon = Species.loaded_collision_shape
	enemy_spawn.physical_body.polygon = Species.loaded_collision_shape
	enemy_spawn.sprite.texture = Species.loaded_species_sprite
	enemy_spawn.MAX_SPEED = Species.loaded_speed



func increment_score():
	score += 1
	score_string = score_format % [score]
	score_label.text = score_string
	GlobalVariables.player_score = score



func player_finished_loading():
	pass



func enemy_player_killed_by(enemy_predator):
	enemy_predator.is_stopped = true
	enemy_predator.stop_moving_timer_start(player.position)
