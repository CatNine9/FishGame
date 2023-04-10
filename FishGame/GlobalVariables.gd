extends Node

# Settings:
var size_visibility = false
var fps_visibility = false
var debug_visibility = false

# UI:
var size_vis_toggle_setting = false
var fps_toggle_setting = false
var debug_toggle_setting = false

# Game:
var game_on = false
var is_paused = false
var camera_position = Vector2(0, 0)
var enemy_starter_species = ""
var current_level = 0

# Player:
var player_position = Vector2(400, 300)
var player_rotation = 0
var player_scale = 1
var player_evolution_points = 0
var player_alive = true
var player_name = null
var player_species = ""
var player_max_health = 1
var player_health = 1

# Leaderboard:
var entries = [["Cat9", "13/3/2023", 11],["", "", null], ["", "", null], ["", "", null], ["", "", null], ["", "", null], ["", "", null], ["", "", null], ["", "", null], ["", "", null]]
var entry_1 = ["Cat9", "13/3/2023", str(11)]
var entry_2 = ["","",""]
var entry_3 = ["","",""]
var entry_4 = ["","",""]
var entry_5 = ["","",""]
var entry_6 = ["","",""]
var entry_7 = ["","",""]
var entry_8 = ["","",""]
var entry_9 = ["","",""]
var entry_10 = ["","",""]
