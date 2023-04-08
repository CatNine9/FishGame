extends Node



@onready var enemy_spawn_delay = $EnemySpawnDelay
@onready var player = $Player
@onready var player_collision = $Player/AreaBody/CollisionBody
@onready var player_area = $Player/AreaBody
@onready var evolution_bar = $CanvasLayer/UIControl/PlayerStatusControl/EvolutionBar
@onready var evolution_bar_value = $CanvasLayer/UIControl/PlayerStatusControl/EvolutionBar/EvolutionValueLabel
@onready var health_bar = $CanvasLayer/UIControl/PlayerStatusControl/HealthBar
@onready var health_bar_value = $CanvasLayer/UIControl/PlayerStatusControl/HealthBar/HealthValueLabel
@onready var pause_menu = $CanvasLayer/UIControl/PauseControl
@onready var death_window = $CanvasLayer/UIControl/DeathControl
@onready var gameplay_camera = $Player/Camera2D
@onready var fps_label = $CanvasLayer/UIControl/FPSControl/FPSLabel
@onready var fps_control = $CanvasLayer/UIControl/FPSControl
@onready var enemy_spawn_node = $Enemies
@onready var win_window = $CanvasLayer/UIControl/WinControl
@onready var ui_container = $CanvasLayer/UIControl 



var number_of_child_nodes = null
var enemies = []
var evolution_points = 0
var evo_points_format = "%d / 25"
var evo_points_string = evo_points_format % [evolution_points]
var health_points = 1
var max_health = 1
var health_points_format = "%d / %d"
var health_points_string = health_points_format % [health_points, max_health]


func _ready():
	enemy_spawn_delay.start()
	Species.find_species(GlobalVariables.player_species)
	player.refresh_species()

	if GlobalVariables.fps_visibility == false:
		fps_control.visible = false
	else:
		fps_control.visible = true

	evolution_bar.value = GlobalVariables.player_evolution_points
	evolution_bar_value.text = evo_points_string

	health_points = GlobalVariables.player_max_health
	max_health = health_points
	health_bar.max_value = GlobalVariables.player_max_health
	health_points_string = health_points_format % [health_points, max_health]
	health_bar_value.text = health_points_string

	if GlobalVariables.is_paused == true:
		# Information that should be saved between menu switches on pause:
		Species.find_species(GlobalVariables.player_species)
		player.refresh_species()
		pause_menu.visible = true
		player.position = GlobalVariables.player_position
		player.rotation = GlobalVariables.player_rotation
		health_bar.value = GlobalVariables.player_health
		health_bar.max_value = GlobalVariables.player_max_health
		health_points_string = health_points_format % [GlobalVariables.player_health, max_health]
		health_bar_value.text = health_points_string
		evolution_bar.value = GlobalVariables.player_evolution_points
		evo_points_string = evo_points_format % [GlobalVariables.player_evolution_points]
		evolution_bar_value.text = evo_points_string
		fps_control.visible = GlobalVariables.fps_visibility
	else:
		Input.mouse_mode = Input.MOUSE_MODE_CONFINED
		GlobalVariables.player_evolution_points = 0
		GlobalVariables.player_health = GlobalVariables.player_max_health



func _process(_delta):
	var fps = Engine.get_frames_per_second()
	var fps_format = "FPS: %d"
	var fps_string = fps_format % [fps]
	fps_label.text = fps_string
	if evolution_points == 25:
		win_window.visible = true
		get_tree().paused = true
	# To test levelling up:
	if Input.is_action_just_released("points_cheat"):
		increment_score()
	# To test player taking damage:
	if Input.is_action_just_released("health_decrement"):
		lose_health()



func _on_enemy_spawn_delay_timeout():
	if player == null:
		enemy_spawn_delay.stop()
	else:
		spawn_enemy()



func spawn_enemy():
	var random_side_value = randi() % 4
	var random_height_value = randi_range(0, 3832)
	var random_width_value = randi_range(0, 3848)
	var random_size_value = randf_range(player.scale.x * 0.5, player.scale.x * 1.5)
	var enemy_preload = preload("res://Fish/Enemy.tscn")
	var enemy_spawn = enemy_preload.instantiate()
	enemy_spawn.spawn_side = random_side_value
	enemy_spawn.left_boundary = 0
	enemy_spawn.right_boundary = 3848
	enemy_spawn.up_boundary = 0
	enemy_spawn.down_boundary = 3832
	enemy_spawn.random_height_value = random_height_value
	enemy_spawn.random_width_value = random_width_value
	if GlobalVariables.player_species == "Round":
		Species.find_species("Long")
		enemy_spawn.spawn_side = random_side_value % 2
		enemy_spawn.position.y = random_height_value
		enemy_spawn.species = "Long"
	elif GlobalVariables.player_species == "Long":
		Species.find_species("Round")
		if random_side_value == 0 or random_side_value == 1:
			enemy_spawn.position.x = random_width_value
		elif random_side_value == 2 or random_side_value == 3:
			enemy_spawn.position.y = random_height_value
		enemy_spawn.species = "Round"
	enemy_spawn.movement_mode = Species.loaded_movement_mode
	enemy_spawn.facing_mode = Species.loaded_facing_mode
	enemy_spawn.self_identifier = enemy_spawn
	enemy_spawn_node.add_child(enemy_spawn)
	enemy_spawn.scale *= random_size_value
	enemy_spawn.collision_shape.polygon = Species.loaded_collision_shape
	enemy_spawn.mouth_shape.polygon = Species.loaded_mouth_shape
	enemy_spawn.attack_sprite.position.x = Species.loaded_attack_graphic_xpos
	enemy_spawn.physical_body.scale = Vector2(random_size_value, random_size_value)
	enemy_spawn.sprite.texture = Species.loaded_species_sprite
	enemy_spawn.speed = Species.loaded_speed
	enemy_spawn.coasting_speed = Species.loaded_coasting_speed
	enemies.append(enemy_spawn)



func increment_score():
	evolution_points += 1
	evolution_bar.value = evolution_points
	evo_points_string = evo_points_format % [evolution_points]
	evolution_bar_value.text = evo_points_string
	GlobalVariables.player_evolution_points = evolution_points



func lose_health():
	health_points -= 1
	health_bar.value = health_points
	health_points_string = health_points_format % [health_points, max_health]
	health_bar_value.text = health_points_string
	GlobalVariables.player_health = health_points



func player_finished_loading():
	pass



func enemy_player_killed_by(enemy_predator):
	enemy_predator.is_in_attack_sequence = true
	enemy_predator.is_stopped = true
	enemy_predator.stop_moving_timer_start(player.global_position)
